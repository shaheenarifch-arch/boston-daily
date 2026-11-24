/**
 * Boston Speakers' Corner: the open podium on the 1st Amendment Page (/section/opinion).
 *
 * Anyone can speak (voice recording), write (text), share a YouTube video, or sing (record or upload audio),
 * with no account and no approval queue. Posts go live at once, like Hyde Park's Speakers' Corner.
 * Only threats, doxxing, spam and illegal content are stopped (src/corner-filter.js). Readers can
 * report a post; three reports for a threat, doxxing or illegal content hide it until the editor looks.
 * The editor manages everything in the newsroom console under "Speakers' Corner".
 *
 * Public API (all JSON, never cached):
 *   GET  /api/corner/feed?sort=new|top&kind=&tag=&before=&focus=   posts + editor columns
 *   POST /api/corner/post            multipart form: kind, name, town, tag, body, youtube, audio, duration
 *   POST /api/corner/:id/stand       { vid }                → toggles "Stand with"
 *   GET  /api/corner/:id/replies
 *   POST /api/corner/:id/reply       { name, body }
 *   POST /api/corner/:id/report      { reason, note, reply_id, vid }
 *   POST /api/corner/:id/delete      { key }                → the poster removes their own post
 *   GET  /api/corner/audio/:id       audio bytes (supports Range for iPhone playback)
 */
import Anthropic from '@anthropic-ai/sdk';
import { json, errorJson, esc, uid, nowIso, ipHash, readJson } from './util.js';
import { checkText, cleanName, cleanLine, cleanText, cleanTag, tagLabel, youtubeId, audioMime, LIMITS, REPORT_SET, TAGS, REPORT_REASONS } from './corner-filter.js';
import { AI_MODEL } from './advertise.js';
import { eventsAdmin, EVENT_KINDS, EVENT_REPORT_REASONS, STATES } from './corner-events.js';

const PAGE_SIZE = 15;
const CHUNK = 512 * 1024;
const AUTO_HIDE_REPORTS = 3;
const SERIOUS = ['threat', 'doxxing', 'illegal'];
const RATE = { post: 10, reply: 30, report: 20, stand: 300, ai: 20 };
const AI_DAILY_CAP = 400; // borderline-post checks per day across the whole site (keeps the Claude bill to cents)

async function bump(env, vid, kind, limit, hourly = true) {
  const hour = hourly ? new Date().toISOString().slice(0, 13) : new Date().toISOString().slice(0, 10);
  try {
    const row = await env.DB.prepare(`INSERT INTO corner_usage (vid, kind, hour, n) VALUES (?, ?, ?, 1)
      ON CONFLICT (vid, kind, hour) DO UPDATE SET n = n + 1 RETURNING n`).bind(vid, kind, hour).first();
    return (row?.n || 0) <= limit;
  } catch (e) {
    console.error('corner usage', e);
    return true;
  }
}

async function overLimit(db, table, ip, limit) {
  const row = await db.prepare(`SELECT COUNT(*) AS n FROM ${table} WHERE ip_hash = ? AND created_at >= ?`).bind(ip, new Date(Date.now() - 3600000).toISOString()).first();
  return (row?.n || 0) >= limit;
}

async function sha(text) {
  const d = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(String(text)));
  return [...new Uint8Array(d)].slice(0, 16).map((b) => b.toString(16).padStart(2, '0')).join('');
}

/** A visitor id: the browser's random id when sent, else the hashed IP. Never stored raw. */
async function visitorId(request, env, clientVid) {
  const v = String(clientVid || '').trim();
  return /^[A-Za-z0-9-]{16,64}$/.test(v) ? sha(`v|${v}`) : ipHash(request, env);
}

function publicPost(p, replies = []) {
  return {
    id: p.id, kind: p.kind, name: p.name, town: p.town || '', tag: p.tag || '', tag_label: p.tag ? tagLabel(p.tag) : '',
    body: p.body || '', youtube_id: p.youtube_id || '', audio_url: p.audio_id ? `/api/corner/audio/${p.audio_id}` : '',
    duration_s: p.duration_s || 0, stand_count: p.stand_count, reply_count: p.reply_count, created_at: p.created_at,
    replies: replies.map((r) => ({ id: r.id, name: r.name, body: r.body, created_at: r.created_at })),
  };
}

// ───────────── Feed ─────────────

export async function cornerFeed(env, url) {
  const db = env.DB;
  const sort = url.searchParams.get('sort') === 'top' ? 'top' : 'new';
  const kind = ['text', 'voice', 'song', 'video'].includes(url.searchParams.get('kind')) ? url.searchParams.get('kind') : null;
  const tag = cleanTag(url.searchParams.get('tag'));
  const before = /^\d{4}-\d{2}-\d{2}T[\d:.]+Z$/.test(url.searchParams.get('before') || '') ? url.searchParams.get('before') : null;
  const offset = Math.max(0, Math.min(500, parseInt(url.searchParams.get('offset') || '0', 10) || 0));
  const focus = /^[a-f0-9-]{36}$/.test(url.searchParams.get('focus') || '') ? url.searchParams.get('focus') : null;

  const where = ["status = 'live'"];
  const args = [];
  if (kind) { where.push('kind = ?'); args.push(kind); }
  if (tag) { where.push('tag = ?'); args.push(tag); }
  if (sort === 'new' && before) { where.push('created_at < ?'); args.push(before); }
  const order = sort === 'top' ? 'ORDER BY (stand_count * 2 + reply_count) DESC, created_at DESC LIMIT ? OFFSET ?' : 'ORDER BY created_at DESC LIMIT ?';
  const { results } = await db.prepare(`SELECT * FROM corner_posts WHERE ${where.join(' AND ')} ${order}`)
    .bind(...args, PAGE_SIZE + 1, ...(sort === 'top' ? [offset] : [])).all();
  const more = results.length > PAGE_SIZE;
  const posts = results.slice(0, PAGE_SIZE);

  // A shared link (#v-<id>) opens with that post on top, even if it is older than the first page.
  if (focus && !posts.some((p) => p.id === focus) && !before && !offset) {
    const f = await db.prepare("SELECT * FROM corner_posts WHERE id = ? AND status = 'live'").bind(focus).first();
    if (f) posts.unshift(f);
  }

  // Latest two replies for each post, in one query.
  const ids = posts.map((p) => p.id);
  const byPost = new Map();
  if (ids.length) {
    const { results: reps } = await db.prepare(`SELECT * FROM (
        SELECT r.*, ROW_NUMBER() OVER (PARTITION BY post_id ORDER BY created_at DESC) AS rn FROM corner_replies r
        WHERE status = 'live' AND post_id IN (${ids.map(() => '?').join(',')})) WHERE rn <= 2 ORDER BY created_at`).bind(...ids).all();
    for (const r of reps) (byPost.get(r.post_id) || byPost.set(r.post_id, []).get(r.post_id)).push(r);
  }
  // Reader posts only. The editor's columns are listed once, in the page's "Columns" section,
  // so they are not repeated in this feed.
  const items = posts.map((p) => ({ type: 'post', ...publicPost(p, byPost.get(p.id) || []) }));

  const next = more ? (sort === 'top' ? { offset: offset + PAGE_SIZE } : { before: posts[posts.length - 1].created_at }) : null;
  const stats = await db.prepare("SELECT COUNT(*) AS posts, COALESCE(SUM(stand_count),0) AS stands, COUNT(DISTINCT ip_hash) AS speakers FROM corner_posts WHERE status = 'live'").first();
  return json({ ok: true, items, next, stats: { posts: stats?.posts || 0, stands: stats?.stands || 0, speakers: stats?.speakers || 0 } });
}

// ───────────── Posting ─────────────

/** Optional second look at borderline words (they mention violence) by Claude. Fails open: errors never block a post. */
async function aiThreatCheck(env, vid, text, client = null) {
  if (!env.ANTHROPIC_API_KEY && !client) return null;
  if (!(await bump(env, vid, 'ai', RATE.ai))) return null;
  if (!(await bump(env, 'site', 'ai-day', AI_DAILY_CAP, false))) return null;
  try {
    const anthropic = client || new Anthropic({ apiKey: env.ANTHROPIC_API_KEY, maxRetries: 0, timeout: 8000 });
    const res = await anthropic.messages.create({
      model: AI_MODEL,
      max_tokens: 60,
      system: `You screen posts for an open free-speech forum modeled on Hyde Park's Speakers' Corner. Almost everything is allowed: anger, profanity, insults, harsh criticism of ICE, police, politicians or anyone in power, reporting or describing violence that happened, calls for prosecution, protest, arrest or lawsuits, and political idioms ("kill the bill").
Block ONLY: (1) a true threat, where the writer threatens to hurt or kill a person or group or damage a place; (2) a call or incitement for others to commit violence against people or places; (3) a person's private details (home address, phone, email, ID numbers).
Reply with exactly one line of JSON: {"verdict":"allow"} or {"verdict":"block","why":"threat"|"incitement"|"doxxing"}.`,
      messages: [{ role: 'user', content: `Post:\n"""${text.slice(0, 3000)}"""` }],
    });
    const out = res.content?.map((c) => c.text || '').join('') || '';
    const m = out.match(/\{[^}]*\}/);
    const v = m ? JSON.parse(m[0]) : null;
    return v && v.verdict === 'block' ? { block: true, why: v.why || 'threat' } : { block: false };
  } catch (e) {
    console.error('corner ai check', e?.message);
    return null;
  }
}

const BLOCK_MESSAGE = {
  threat: 'This reads as a threat of violence, which isn’t protected speech. Say how angry you are, criticise anyone you like, but don’t threaten to hurt people.',
  incitement: 'This reads as a call for violence against people, which isn’t protected speech. Call for protest, prosecution or change instead.',
  doxxing: 'This seems to share someone’s private details. Take those out and post again.',
};

async function storeAudio(db, file, mime) {
  const buf = new Uint8Array(await file.arrayBuffer());
  const id = uid();
  const chunks = Math.ceil(buf.length / CHUNK);
  const stmts = [db.prepare('INSERT INTO corner_audio (id, mime, size, chunks, created_at) VALUES (?,?,?,?,?)').bind(id, mime, buf.length, chunks, nowIso())];
  for (let i = 0; i < chunks; i++) {
    stmts.push(db.prepare('INSERT INTO corner_audio_chunks (audio_id, seq, bytes) VALUES (?,?,?)').bind(id, i, buf.slice(i * CHUNK, (i + 1) * CHUNK).buffer));
  }
  // Small batches keep each request to D1 modest.
  for (let i = 0; i < stmts.length; i += 4) await db.batch(stmts.slice(i, i + 4));
  return { id, size: buf.length };
}

export async function cornerPost(env, request, { aiClient = null } = {}) {
  const db = env.DB;
  let form;
  try { form = await request.formData(); } catch { return errorJson('Your post didn’t arrive. Please try again.', 400); }
  // Bots fill the hidden field or submit instantly.
  if (String(form.get('website') || '').trim()) return json({ ok: true, post: null });
  const opened = Number(form.get('t') || 0);
  if (opened && Date.now() - opened < 1500) return errorJson('That was very fast. Wait a second and post again.', 429);

  const ip = await ipHash(request, env);
  // Only posts that went live count toward the hourly limit (a rejected draft can be fixed and resent).
  if (await overLimit(env.DB, 'corner_posts', ip, RATE.post)) return errorJson('You’ve posted a lot this hour. Take a breather and come back in a little while.', 429);

  const kind = String(form.get('kind') || '');
  if (!['text', 'voice', 'song', 'video'].includes(kind)) return errorJson('Choose Speak, Write, YouTube or Sing.', 400);
  const nm = cleanName(form.get('name'));
  if (!nm.ok) return errorJson(nm.message, 400, { field: 'name' });
  const town = cleanLine(form.get('town'), LIMITS.townMax);
  const townCheck = checkText(town, { allowEmpty: true });
  if (!townCheck.ok) return errorJson(townCheck.message, 400, { field: 'town' });
  const tag = cleanTag(form.get('tag'));
  const body = cleanText(form.get('body'), kind === 'text' ? LIMITS.textMax : LIMITS.captionMax);

  const check = checkText(body, { allowEmpty: kind !== 'text' });
  if (!check.ok) return errorJson(check.message, 400, { field: 'body', code: check.code });
  if (kind === 'text' && body.length < 3) return errorJson('Write a few words first.', 400, { field: 'body' });

  let ytId = null;
  if (kind === 'video') {
    ytId = youtubeId(form.get('youtube'));
    if (!ytId) return errorJson('Paste a YouTube link, like https://www.youtube.com/watch?v=… or https://youtu.be/…', 400, { field: 'youtube' });
  }

  let file = null;
  let mime = null;
  if (kind === 'voice' || kind === 'song') {
    file = form.get('audio');
    if (!file || typeof file === 'string' || !file.size) return errorJson(kind === 'voice' ? 'Record your voice first.' : 'Record or choose an audio file first.', 400, { field: 'audio' });
    if (file.size > LIMITS.audioMaxBytes) return errorJson('That audio is over 8 MB. Trim it or record a shorter take (about 3 minutes for a high-quality MP3).', 400, { field: 'audio' });
    mime = audioMime(file.type) || audioMime(String(form.get('audio_type') || ''));
    if (!mime) return errorJson('That file type isn’t supported. Use MP3, M4A, WAV, OGG or WEBM audio.', 400, { field: 'audio' });
  }

  // Duplicate text from the same person within a day is spam.
  if (body && body.length > 20) {
    const dup = await db.prepare('SELECT id FROM corner_posts WHERE ip_hash = ? AND body = ? AND created_at >= ? LIMIT 1')
      .bind(ip, body, new Date(Date.now() - 86400000).toISOString()).first();
    if (dup) return errorJson('You already posted those exact words today.', 409, { field: 'body' });
  }

  let aiChecked = 0;
  if (check.borderline) {
    const ai = await aiThreatCheck(env, ip, body, aiClient);
    if (ai) aiChecked = 1;
    if (ai?.block) return errorJson(BLOCK_MESSAGE[ai.why] || BLOCK_MESSAGE.threat, 400, { field: 'body', code: ai.why || 'threat' });
  }

  let audioId = null;
  if (file) audioId = (await storeAudio(db, file, mime)).id;
  const duration = Math.max(0, Math.min(LIMITS.audioMaxSeconds, Math.round(Number(form.get('duration') || 0)) || 0));
  const id = uid();
  const key = uid();
  const createdAt = nowIso();
  await db.prepare(`INSERT INTO corner_posts (id, kind, name, town, tag, body, youtube_id, audio_id, duration_s, status, ip_hash, owner_key_hash, ai_checked, created_at)
    VALUES (?,?,?,?,?,?,?,?,?,'live',?,?,?,?)`)
    .bind(id, kind, nm.value, town || null, tag, body || null, ytId, audioId, file ? duration : null, ip, await sha(`k|${key}`), aiChecked, createdAt).run();
  const row = await db.prepare('SELECT * FROM corner_posts WHERE id = ?').bind(id).first();
  return json({ ok: true, post: { type: 'post', ...publicPost(row) }, delete_key: key });
}

// ───────────── Reactions, replies, reports ─────────────

export async function cornerStand(env, request, postId) {
  const b = (await readJson(request)) || {};
  const ip = await ipHash(request, env);
  if (!(await bump(env, ip, 'stand', RATE.stand))) return errorJson('Slow down a little.', 429);
  const post = await env.DB.prepare("SELECT id FROM corner_posts WHERE id = ? AND status = 'live'").bind(postId).first();
  if (!post) return errorJson('That post is no longer up.', 404);
  const vid = await visitorId(request, env, b.vid);
  const had = await env.DB.prepare('SELECT 1 AS x FROM corner_stands WHERE post_id = ? AND vid = ?').bind(postId, vid).first();
  if (had) {
    await env.DB.batch([
      env.DB.prepare('DELETE FROM corner_stands WHERE post_id = ? AND vid = ?').bind(postId, vid),
      env.DB.prepare('UPDATE corner_posts SET stand_count = MAX(0, stand_count - 1) WHERE id = ?').bind(postId),
    ]);
  } else {
    await env.DB.batch([
      env.DB.prepare('INSERT OR IGNORE INTO corner_stands (post_id, vid, created_at) VALUES (?,?,?)').bind(postId, vid, nowIso()),
      env.DB.prepare('UPDATE corner_posts SET stand_count = stand_count + 1 WHERE id = ?').bind(postId),
    ]);
  }
  const row = await env.DB.prepare('SELECT stand_count FROM corner_posts WHERE id = ?').bind(postId).first();
  return json({ ok: true, standing: !had, stand_count: row?.stand_count || 0 });
}

export async function cornerReplies(env, postId) {
  const { results } = await env.DB.prepare("SELECT id, name, body, created_at FROM corner_replies WHERE post_id = ? AND status = 'live' ORDER BY created_at LIMIT 300").bind(postId).all();
  return json({ ok: true, replies: results });
}

export async function cornerReply(env, request, postId, { aiClient = null } = {}) {
  const b = (await readJson(request)) || {};
  if (String(b.website || '').trim()) return json({ ok: true, reply: null });
  const ip = await ipHash(request, env);
  if (await overLimit(env.DB, 'corner_replies', ip, RATE.reply)) return errorJson('You’ve replied a lot this hour. Come back in a little while.', 429);
  const post = await env.DB.prepare("SELECT id FROM corner_posts WHERE id = ? AND status = 'live'").bind(postId).first();
  if (!post) return errorJson('That post is no longer up.', 404);
  const nm = cleanName(b.name);
  if (!nm.ok) return errorJson(nm.message, 400, { field: 'name' });
  const body = cleanText(b.body, LIMITS.replyMax);
  if (body.length < 2) return errorJson('Write a reply first.', 400, { field: 'body' });
  const check = checkText(body);
  if (!check.ok) return errorJson(check.message, 400, { field: 'body', code: check.code });
  if (check.borderline) {
    const ai = await aiThreatCheck(env, ip, body, aiClient);
    if (ai?.block) return errorJson(BLOCK_MESSAGE[ai.why] || BLOCK_MESSAGE.threat, 400, { field: 'body', code: ai.why || 'threat' });
  }
  const id = uid();
  const created = nowIso();
  await env.DB.batch([
    env.DB.prepare("INSERT INTO corner_replies (id, post_id, name, body, status, ip_hash, created_at) VALUES (?,?,?,?,'live',?,?)").bind(id, postId, nm.value, body, ip, created),
    env.DB.prepare("UPDATE corner_posts SET reply_count = (SELECT COUNT(*) FROM corner_replies WHERE post_id = ? AND status = 'live') WHERE id = ?").bind(postId, postId),
  ]);
  return json({ ok: true, reply: { id, name: nm.value, body, created_at: created } });
}

async function notifyEditor(env, subject, htmlBody) {
  if (!env.RESEND_API_KEY || !env.NEWSLETTER_FROM) return false;
  const to = env.EDITOR_EMAIL || env.CONTACT_EMAIL;
  if (!to) return false;
  try {
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST', headers: { authorization: `Bearer ${env.RESEND_API_KEY}`, 'content-type': 'application/json' },
      body: JSON.stringify({ from: env.NEWSLETTER_FROM, to: [to], subject, html: htmlBody }),
    });
    return res.ok;
  } catch (e) {
    console.error('corner notify', e?.message);
    return false;
  }
}

export async function cornerReport(env, request, postId, ctx = null) {
  const db = env.DB;
  const b = (await readJson(request)) || {};
  const ip = await ipHash(request, env);
  if (!(await bump(env, ip, 'report', RATE.report))) return errorJson('Too many reports this hour.', 429);
  const reason = REPORT_SET.has(b.reason) ? b.reason : null;
  if (!reason) return errorJson('Choose a reason.', 400, { field: 'reason' });
  const post = await db.prepare("SELECT * FROM corner_posts WHERE id = ? AND status = 'live'").bind(postId).first();
  if (!post) return json({ ok: true, hidden: true });
  const replyId = b.reply_id && /^[a-f0-9-]{36}$/.test(b.reply_id) ? b.reply_id : null;
  if (replyId && !(await db.prepare("SELECT id FROM corner_replies WHERE id = ? AND post_id = ? AND status = 'live'").bind(replyId, postId).first())) {
    return json({ ok: true, hidden: true });
  }
  const vid = await visitorId(request, env, b.vid);
  const ins = await db.prepare('INSERT OR IGNORE INTO corner_reports (id, post_id, reply_id, reason, note, vid, created_at) VALUES (?,?,?,?,?,?,?)')
    .bind(uid(), postId, replyId, reason, cleanLine(b.note, 300) || null, vid, nowIso()).run();
  if (!ins.meta?.changes) return json({ ok: true, already: true });

  const table = replyId ? 'corner_replies' : 'corner_posts';
  const target = replyId || postId;
  await db.prepare(`UPDATE ${table} SET report_count = report_count + 1 WHERE id = ?`).bind(target).run();
  const serious = await db.prepare(`SELECT COUNT(*) AS n FROM corner_reports WHERE post_id = ? AND COALESCE(reply_id,'') = ? AND resolved = 0 AND reason IN (${SERIOUS.map(() => '?').join(',')})`)
    .bind(postId, replyId || '', ...SERIOUS).first();
  let hidden = false;
  if ((serious?.n || 0) >= AUTO_HIDE_REPORTS) {
    await db.prepare(`UPDATE ${table} SET status = 'hidden'${replyId ? '' : ", status_reason = 'Hidden after reader reports, waiting for the editor'"} WHERE id = ? AND status = 'live'`).bind(target).run();
    if (replyId) await db.prepare("UPDATE corner_posts SET reply_count = (SELECT COUNT(*) FROM corner_replies WHERE post_id = ? AND status = 'live') WHERE id = ?").bind(postId, postId).run();
    hidden = true;
  }
  const base = (env.SITE_URL || '').replace(/\/$/, '');
  const what = replyId ? 'A reply on a Speakers’ Corner post' : `A ${post.kind} post by ${post.name}`;
  const send = notifyEditor(env, `${hidden ? '[Hidden] ' : ''}Speakers’ Corner report: ${REPORT_REASONS.find(([k]) => k === reason)[1]}`,
    `<p>${esc(what)} was reported as <strong>${esc(reason)}</strong>${hidden ? ' and is now <strong>hidden</strong> after several reports' : ''}.</p>
     ${post.body ? `<blockquote style="border-left:3px solid #14324a;margin:0;padding:6px 12px">${esc(post.body.slice(0, 600))}</blockquote>` : ''}
     <p><a href="${esc(base)}/admin/#/corner">Review it in the newsroom console</a> · <a href="${esc(base)}/section/opinion#v-${esc(postId)}">See it on the page</a></p>`);
  if (ctx?.waitUntil) ctx.waitUntil(send); else await send;
  return json({ ok: true, hidden });
}

export async function cornerDelete(env, request, postId) {
  const b = (await readJson(request)) || {};
  if (!b.key) return errorJson('Only the person who posted this can delete it, from the same browser.', 403);
  const hash = await sha(`k|${b.key}`);
  const r = await env.DB.prepare("UPDATE corner_posts SET status = 'removed', status_reason = 'Deleted by the poster', moderated_by = 'poster', moderated_at = ? WHERE id = ? AND owner_key_hash = ? AND status != 'removed'")
    .bind(nowIso(), postId, hash).run();
  if (!r.meta?.changes) return errorJson('Only the person who posted this can delete it, from the same browser.', 403);
  return json({ ok: true });
}

// ───────────── Audio ─────────────

export async function cornerAudio(env, request, audioId, ctx = null) {
  const cache = typeof caches !== 'undefined' ? caches.default : null;
  const cacheKey = new Request(new URL(`/api/corner/audio/${audioId}`, request.url).toString());
  let full = cache ? await cache.match(cacheKey).catch(() => null) : null;
  let mime;
  let bytes;
  if (full) {
    mime = full.headers.get('content-type');
    bytes = new Uint8Array(await full.arrayBuffer());
  } else {
    // Audio of a removed post is no longer served.
    const meta = await env.DB.prepare(`SELECT a.* FROM corner_audio a JOIN corner_posts p ON p.audio_id = a.id WHERE a.id = ? AND p.status = 'live'`).bind(audioId).first();
    if (!meta) return new Response('Not found', { status: 404 });
    const { results } = await env.DB.prepare('SELECT bytes FROM corner_audio_chunks WHERE audio_id = ? ORDER BY seq').bind(audioId).all();
    bytes = new Uint8Array(meta.size);
    let at = 0;
    for (const r of results) {
      const part = new Uint8Array(r.bytes);
      bytes.set(part, at);
      at += part.length;
    }
    mime = meta.mime;
    if (cache) {
      const stored = new Response(bytes, { headers: { 'content-type': mime, 'cache-control': 'public, max-age=3600' } });
      const put = cache.put(cacheKey, stored).catch(() => {});
      if (ctx?.waitUntil) ctx.waitUntil(put);
    }
  }
  const headers = { 'content-type': mime, 'accept-ranges': 'bytes', 'cache-control': 'public, max-age=3600', 'x-robots-tag': 'noindex', 'x-content-type-options': 'nosniff' };
  const range = request.headers.get('range');
  const m = range && range.match(/^bytes=(\d*)-(\d*)$/);
  if (m && (m[1] || m[2])) {
    let start = m[1] ? Number(m[1]) : Math.max(0, bytes.length - Number(m[2]));
    let end = m[1] && m[2] ? Math.min(Number(m[2]), bytes.length - 1) : bytes.length - 1;
    if (start >= bytes.length || start > end) return new Response(null, { status: 416, headers: { ...headers, 'content-range': `bytes */${bytes.length}` } });
    return new Response(bytes.slice(start, end + 1), { status: 206, headers: { ...headers, 'content-range': `bytes ${start}-${end}/${bytes.length}`, 'content-length': String(end - start + 1) } });
  }
  return new Response(request.method === 'HEAD' ? null : bytes, { headers: { ...headers, 'content-length': String(bytes.length) } });
}

// ───────────── Newsroom console (editor only) ─────────────

export async function cornerAdmin(env, request, url, editor, seg) {
  const db = env.DB;
  const method = request.method;
  if (seg[1] === 'events') return eventsAdmin(env, request, url, editor, seg);
  if (seg.length === 1 && method === 'GET') {
    const view = ['reported', 'hidden', 'live', 'removed'].includes(url.searchParams.get('view')) ? url.searchParams.get('view') : 'reported';
    const q = {
      reported: `SELECT p.*, (SELECT GROUP_CONCAT(reason) FROM corner_reports r WHERE r.post_id = p.id AND r.resolved = 0) AS reasons FROM corner_posts p
        WHERE p.status != 'removed' AND EXISTS (SELECT 1 FROM corner_reports r WHERE r.post_id = p.id AND r.resolved = 0) ORDER BY p.created_at DESC LIMIT 200`,
      hidden: "SELECT p.*, NULL AS reasons FROM corner_posts p WHERE p.status = 'hidden' ORDER BY p.created_at DESC LIMIT 200",
      live: "SELECT p.*, NULL AS reasons FROM corner_posts p WHERE p.status = 'live' ORDER BY p.created_at DESC LIMIT 200",
      removed: "SELECT p.*, NULL AS reasons FROM corner_posts p WHERE p.status = 'removed' ORDER BY p.created_at DESC LIMIT 200",
    }[view];
    const { results } = await db.prepare(q).all();
    const { results: replies } = await db.prepare(`SELECT r.*, (SELECT GROUP_CONCAT(reason) FROM corner_reports x WHERE x.reply_id = r.id AND x.resolved = 0) AS reasons FROM corner_replies r
      WHERE r.status != 'removed' AND EXISTS (SELECT 1 FROM corner_reports x WHERE x.reply_id = r.id AND x.resolved = 0) ORDER BY r.created_at DESC LIMIT 100`).all();
    return json({
      ok: true, view,
      posts: results.map((p) => ({ ...publicPost(p), status: p.status, status_reason: p.status_reason, report_count: p.report_count, reasons: p.reasons || '', moderated_by: p.moderated_by })),
      replies: view === 'reported' ? replies.map((r) => ({ id: r.id, post_id: r.post_id, name: r.name, body: r.body, status: r.status, reasons: r.reasons || '', created_at: r.created_at })) : [],
    });
  }
  if (seg[1] === 'reply' && seg[2] && method === 'PATCH') {
    const b = (await readJson(request)) || {};
    if (!['live', 'removed'].includes(b.status)) return errorJson('status must be live or removed');
    const r = await db.prepare('SELECT post_id FROM corner_replies WHERE id = ?').bind(seg[2]).first();
    if (!r) return errorJson('Reply not found', 404);
    await db.batch([
      db.prepare('UPDATE corner_replies SET status = ? WHERE id = ?').bind(b.status, seg[2]),
      db.prepare('UPDATE corner_reports SET resolved = 1 WHERE reply_id = ?').bind(seg[2]),
      db.prepare("UPDATE corner_posts SET reply_count = (SELECT COUNT(*) FROM corner_replies WHERE post_id = ? AND status = 'live') WHERE id = ?").bind(r.post_id, r.post_id),
    ]);
    return json({ ok: true });
  }
  if (seg[1] && seg.length === 2 && method === 'PATCH') {
    const b = (await readJson(request)) || {};
    if (!['live', 'removed'].includes(b.status)) return errorJson('status must be live (keep it up) or removed (take it down)');
    const reason = b.status === 'removed' ? cleanLine(b.reason, 200) || 'Removed by the editor' : null;
    await db.batch([
      db.prepare('UPDATE corner_posts SET status = ?, status_reason = ?, moderated_by = ?, moderated_at = ? WHERE id = ?').bind(b.status, reason, editor.name, nowIso(), seg[1]),
      db.prepare('UPDATE corner_reports SET resolved = 1 WHERE post_id = ? AND reply_id IS NULL').bind(seg[1]),
    ]);
    return json({ ok: true });
  }
  return errorJson('Unknown Speakers’ Corner action', 404);
}

export async function cornerCounts(db) {
  return db.prepare(`SELECT
      (SELECT COUNT(DISTINCT post_id) FROM corner_reports WHERE resolved = 0) AS reported,
      (SELECT COUNT(*) FROM corner_posts WHERE status = 'hidden') AS hidden`).first().catch(() => ({ reported: 0, hidden: 0 }));
}

// ───────────── Page fragments (rendered on /section/opinion) ─────────────

// Speakers' Corner, Hyde Park, 1959. Fortepan / Ofner Károly, CC BY-SA 3.0 (Wikimedia Commons).
const HERO_IMG = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Hyde_Park%2C_Speakers%27_Corner_%28Sz%C3%B3nokok_Sarka%29._Fortepan_28399.jpg/1280px-Hyde_Park%2C_Speakers%27_Corner_%28Sz%C3%B3nokok_Sarka%29._Fortepan_28399.jpg';
const HERO_PAGE = 'https://commons.wikimedia.org/wiki/File:Hyde_Park,_Speakers%27_Corner_(Sz%C3%B3nokok_Sarka)._Fortepan_28399.jpg';

export function cornerHero() {
  return `<section class="sc-hero" aria-labelledby="sc-title">
    <figure class="sc-hero-fig"><img src="${HERO_IMG}" alt="A speaker on a raised podium addresses a crowd at Speakers' Corner in London's Hyde Park, 1959" width="1280" height="779" fetchpriority="high">
      <figcaption>Speakers’ Corner, Hyde Park, London, 1959. Photo: Fortepan / Ofner Károly, <a href="${HERO_PAGE}" target="_blank" rel="noopener">CC BY-SA 3.0</a></figcaption></figure>
    <div class="sc-hero-text">
      <p class="sc-kicker">Boston Speakers’ Corner</p>
      <h2 id="sc-title" class="sc-title">Step up to the podium. Say it out loud.</h2>
      <p class="sc-lede">For more than 150 years, anyone has been able to climb onto a box in Hyde Park and speak their mind to whoever would listen. This is Boston’s version: speak, write, share a video or sing, with no sign-up and no waiting. Your post goes up the moment you share it.</p>
      <button type="button" class="sc-podium-btn" data-open="text"><span aria-hidden="true">🎤</span> Step up to the podium</button>
      <p class="sc-voice-line"><strong>Become a voice for the marginalised.</strong> Immigrants, workers, faith communities, disabled people, LGBTQ+ neighbours, veterans: if you aren’t heard elsewhere, you’re heard here. <a href="#sc-rights-title">Know your rights</a></p>
    </div>
  </section>`;
}

export function cornerApp() {
  const tags = TAGS.map(([k, l]) => `<option value="${k}">${esc(l)}</option>`).join('');
  const states = STATES.map(([c, n]) => `<option value="${c}">${esc(n)}</option>`).join('');
  const kinds = EVENT_KINDS.map(([k, l]) => `<option value="${k}">${esc(l)}</option>`).join('');
  return `<section id="corner" class="sc" aria-label="Boston Speakers’ Corner" data-tags='${esc(JSON.stringify(TAGS))}' data-reasons='${esc(JSON.stringify(REPORT_REASONS))}' data-ereasons='${esc(JSON.stringify(EVENT_REPORT_REASONS))}'>
    <button type="button" class="sc-today" id="sc-today" hidden></button>
    <div class="sc-switch" role="tablist" aria-label="Speakers’ Corner sections">
      <button type="button" role="tab" id="sc-tab-podium" aria-controls="sc-panel-podium" aria-selected="true" data-tab="podium">🎤 Podium</button>
      <button type="button" role="tab" id="sc-tab-events" aria-controls="sc-panel-events" aria-selected="false" data-tab="events">📅 Events <span class="sc-badge" id="sc-events-count" hidden></span></button>
    </div>
    <div id="sc-panel-podium" role="tabpanel" aria-labelledby="sc-tab-podium">
    <div class="sc-composer" id="sc-composer">
      <div class="sc-composer-top">
        <span class="sc-avatar sc-avatar-you" aria-hidden="true">You</span>
        <button type="button" class="sc-fake-input" data-open="text">What do you want Boston to hear?</button>
      </div>
      <div class="sc-tools" role="group" aria-label="Ways to speak">
        <button type="button" class="sc-tool" data-open="voice"><span class="sc-ico sc-ico-voice" aria-hidden="true">🎙️</span>Speak</button>
        <button type="button" class="sc-tool" data-open="text"><span class="sc-ico sc-ico-text" aria-hidden="true">✍️</span>Write</button>
        <button type="button" class="sc-tool" data-open="video"><span class="sc-ico sc-ico-video" aria-hidden="true">▶️</span>YouTube</button>
        <button type="button" class="sc-tool" data-open="song"><span class="sc-ico sc-ico-song" aria-hidden="true">🎵</span>Sing</button>
      </div>
      <form class="sc-form" id="sc-form" hidden novalidate>
        <div class="sc-tabs" role="tablist" aria-label="Post type">
          <button type="button" role="tab" data-kind="voice">🎙️ Speak</button>
          <button type="button" role="tab" data-kind="text">✍️ Write</button>
          <button type="button" role="tab" data-kind="video">▶️ YouTube</button>
          <button type="button" role="tab" data-kind="song">🎵 Sing</button>
        </div>
        <p class="sc-help" data-help></p>

        <div class="sc-pane" data-pane="voice song">
          <div class="sc-rec">
            <button type="button" class="sc-rec-btn" id="sc-rec"><span class="sc-rec-dot" aria-hidden="true"></span><span data-rec-label>Start recording</span></button>
            <span class="sc-rec-time" id="sc-rec-time" aria-live="polite">0:00 / 3:00</span>
            <span class="sc-or" data-pane="song">or</span>
            <label class="sc-file" data-pane="song">Upload a file<input type="file" id="sc-file" accept="audio/*,.mp3,.m4a,.wav,.ogg,.webm"></label>
          </div>
          <audio id="sc-preview" controls hidden></audio>
          <p class="sc-note" data-pane="song">Original songs, poems and performances only. A cover of someone else’s song can be taken down under copyright law. <a href="/terms" target="_blank">Terms</a></p>
        </div>

        <div class="sc-pane" data-pane="video">
          <label class="sc-label" for="sc-yt">YouTube link</label>
          <input id="sc-yt" name="youtube" type="url" inputmode="url" placeholder="https://www.youtube.com/watch?v=…" autocomplete="off">
          <div class="sc-yt-preview" id="sc-yt-preview" hidden></div>
          <p class="sc-note">Your video stays on YouTube; we show it here. To get the link, open the video on YouTube, tap <strong>Share</strong>, then <strong>Copy link</strong>. <a href="https://www.youtube.com/upload" target="_blank" rel="noopener">Upload a new video to YouTube</a></p>
        </div>

        <label class="sc-label" for="sc-body" data-body-label>Your words</label>
        <textarea id="sc-body" name="body" rows="4" maxlength="${LIMITS.textMax}" placeholder="Say what you came to say."></textarea>
        <p class="sc-count" id="sc-count" aria-live="polite"></p>

        <div class="sc-row">
          <div><label class="sc-label" for="sc-name">Name <span class="sc-opt">(optional)</span></label>
            <input id="sc-name" name="name" maxlength="${LIMITS.nameMax}" placeholder="Anonymous" autocomplete="nickname"></div>
          <div><label class="sc-label" for="sc-town">Town <span class="sc-opt">(optional)</span></label>
            <input id="sc-town" name="town" maxlength="${LIMITS.townMax}" placeholder="Dorchester" autocomplete="address-level2"></div>
          <div><label class="sc-label" for="sc-tag">Speaking for <span class="sc-opt">(optional)</span></label>
            <select id="sc-tag" name="tag"><option value="">Choose a community</option>${tags}</select></div>
        </div>
        <input type="text" name="website" class="sc-hp" tabindex="-1" autocomplete="off" aria-hidden="true">
        <p class="sc-error" id="sc-error" role="alert" hidden></p>
        <div class="sc-actions">
          <button type="submit" class="sc-submit" id="sc-submit">Post to the podium</button>
          <button type="button" class="sc-cancel" id="sc-cancel">Cancel</button>
        </div>
        <details class="sc-rules"><summary>Podium rules (there are only four)</summary>
          <p>Say anything: anger, swearing, harsh criticism of ICE, police, politicians or this newspaper are all welcome. Four things are taken down:</p>
          <ol><li><strong>Threats of violence</strong> or calls for others to commit violence.</li><li><strong>Doxxing:</strong> anyone’s home address, phone number, email or ID numbers.</li><li><strong>Spam</strong> and scams.</li><li><strong>Illegal content.</strong></li></ol>
          <p>Posts are public and stay up. You can delete your own post from this browser. Speakers stay anonymous: we never show your IP address. <a href="/privacy" target="_blank">Privacy</a> · <a href="/terms" target="_blank">Terms</a> · <a href="#sc-rights-title">Know your rights</a></p>
        </details>
      </form>
    </div>

    <div class="sc-podium" id="sc-podium" hidden>
      <p class="sc-podium-label"><span class="sc-live-dot" aria-hidden="true"></span> On the podium now</p>
      <div id="sc-podium-post"></div>
    </div>

    <div class="sc-bar">
      <div class="sc-filters" role="group" aria-label="Filter the feed">
        <select id="sc-sort" aria-label="Sort"><option value="new">Newest</option><option value="top">Most support</option></select>
        <select id="sc-kind" aria-label="Type"><option value="">All posts</option><option value="voice">Voices</option><option value="text">Writing</option><option value="video">Videos</option><option value="song">Songs</option></select>
        <select id="sc-filter-tag" aria-label="Community"><option value="">All communities</option>${tags}</select>
      </div>
      <button type="button" class="sc-listen" id="sc-listen" aria-pressed="false">🎧 Listen to the crowd</button>
    </div>
    <p class="sc-stats" id="sc-stats" aria-live="polite"></p>
    <button type="button" class="sc-new" id="sc-new" hidden></button>
    <div class="sc-feed" id="sc-feed" aria-live="polite"><p class="sc-loading">Gathering the crowd…</p></div>
    <button type="button" class="sc-more" id="sc-more" hidden>Show more voices</button>
    </div>

    <div id="sc-panel-events" role="tabpanel" aria-labelledby="sc-tab-events" hidden>
      <div class="sc-composer sc-ev-head">
        <h3 class="sc-ev-title">Assemble</h3>
        <p class="sc-ev-lede">The First Amendment protects “the right of the people peaceably to assemble.” Find a rally, vigil, town hall or know-your-rights training, or post your own. Events go on the board right away.</p>
        <button type="button" class="sc-submit" id="sc-ev-new">＋ Post an event</button>
        <form class="sc-form" id="sc-ev-form" hidden novalidate>
          <p class="sc-help" id="sc-ev-form-help">Fill in what, when and where. Public places only: a park, a plaza, a church hall, a library, a meeting house, or online. Never someone’s home.</p>
          <div class="sc-row">
            <div><label class="sc-label" for="ev-kind">What kind of gathering</label><select id="ev-kind" name="kind">${kinds}</select></div>
            <div class="sc-span2"><label class="sc-label" for="ev-title">Event name</label><input id="ev-title" name="title" maxlength="120" placeholder="Vigil for families separated by ICE"></div>
          </div>
          <div class="sc-row">
            <div><label class="sc-label" for="ev-date">Date</label><input id="ev-date" name="date" type="date"></div>
            <div><label class="sc-label" for="ev-start">Starts</label><input id="ev-start" name="start" type="time" step="900"></div>
            <div><label class="sc-label" for="ev-end">Ends <span class="sc-opt">(optional)</span></label><input id="ev-end" name="end" type="time" step="900"></div>
          </div>
          <p class="sc-note">Times are local to the event’s state.</p>
          <label class="sc-check"><input type="checkbox" id="ev-online" name="online"> It’s online (Zoom, Google Meet, YouTube Live…)</label>
          <div data-ev="online" hidden><label class="sc-label" for="ev-online-url">Link to join</label><input id="ev-online-url" name="online_url" type="url" placeholder="https://zoom.us/j/…"></div>
          <div data-ev="place">
            <label class="sc-label" for="ev-venue">Place</label><input id="ev-venue" name="venue" maxlength="120" placeholder="Boston Common, Parkman Bandstand">
            <label class="sc-label" for="ev-address">Street address <span class="sc-opt">(optional, public venues only)</span></label><input id="ev-address" name="address" maxlength="160" placeholder="139 Tremont St">
          </div>
          <div class="sc-row">
            <div data-ev="place"><label class="sc-label" for="ev-town">Town or city</label><input id="ev-town" name="town" maxlength="60" placeholder="Boston"></div>
            <div><label class="sc-label" for="ev-state">State</label><select id="ev-state" name="state">${states}</select></div>
            <div><label class="sc-label" for="ev-tag">Speaking for <span class="sc-opt">(optional)</span></label><select id="ev-tag" name="tag"><option value="">Choose a community</option>${tags}</select></div>
          </div>
          <div class="sc-row">
            <div><label class="sc-label" for="ev-organizer">Organised by</label><input id="ev-organizer" name="organizer" maxlength="80" placeholder="Group name, or your first name"></div>
            <div class="sc-span2"><label class="sc-label" for="ev-link">Event page or sign-up link <span class="sc-opt">(optional)</span></label><input id="ev-link" name="link" type="url" placeholder="https://www.eventbrite.com/e/…"></div>
          </div>
          <label class="sc-label" for="ev-body">What to know <span class="sc-opt">(optional)</span></label>
          <textarea id="ev-body" name="body" rows="3" maxlength="2000" placeholder="What it’s about, what to bring, accessibility, who’s speaking."></textarea>
          <label class="sc-check" data-ev="place"><input type="checkbox" id="ev-public" name="public_place"> This is a public place or a venue open to the public, not someone’s home.</label>
          <input type="text" name="website" class="sc-hp" tabindex="-1" autocomplete="off" aria-hidden="true">
          <p class="sc-error" id="sc-ev-error" role="alert" hidden></p>
          <div class="sc-actions"><button type="submit" class="sc-submit" id="sc-ev-submit">Post the event</button><button type="button" class="sc-cancel" id="sc-ev-cancel">Cancel</button></div>
        </form>
      </div>
      <details class="sc-before"><summary>Before you go: protest tips</summary>
        <ul>
          <li>Peaceful assembly on public sidewalks and in parks is protected. Marches that take over a street may need a city permit, so check with the organiser or your city’s website.</li>
          <li>You can record officers doing their jobs in public. Keep a safe distance and don’t interfere. <a href="https://aclum.org/en/cases/glik-v-cunniffe" target="_blank" rel="noopener">Your right to record</a></li>
          <li>Carry ID if you can, write a lawyer’s number on your arm, and go with a friend.</li>
          <li>Know your rights if you’re stopped: <a href="https://www.aclu.org/know-your-rights/immigrants-rights" target="_blank" rel="noopener">ACLU guide</a> · free legal help: <a href="https://www.masslegalhelp.org" target="_blank" rel="noopener">MassLegalHelp</a></li>
        </ul>
      </details>
      <div class="sc-bar">
        <div class="sc-filters" role="group" aria-label="Filter events">
          <select id="sc-ev-state" aria-label="State"><option value="">All states</option>${states}</select>
          <select id="sc-ev-kind" aria-label="Kind"><option value="">All gatherings</option>${kinds}</select>
        </div>
        <div class="sc-seg" role="group" aria-label="When"><button type="button" data-when="upcoming" aria-pressed="true">Upcoming</button><button type="button" data-when="past" aria-pressed="false">Past</button></div>
      </div>
      <div class="sc-feed" id="sc-events" aria-live="polite"><p class="sc-loading">Checking the calendar…</p></div>
    </div>
    <noscript><p class="sc-note">Turn on JavaScript to see and join Boston Speakers’ Corner.</p></noscript>

    <dialog class="sc-dialog" id="sc-report">
      <form method="dialog" id="sc-report-form">
        <h3>Report this post</h3>
        <p class="sc-note">Reports go to the editor. Disagreement isn’t a reason to report: only threats, private details, spam, illegal content or your copyrighted work.</p>
        <div id="sc-report-reasons"></div>
        <label class="sc-label" for="sc-report-note">Anything else? <span class="sc-opt">(optional)</span></label>
        <input id="sc-report-note" maxlength="300">
        <p class="sc-error" id="sc-report-error" role="alert" hidden></p>
        <div class="sc-actions"><button type="submit" value="send" class="sc-submit">Send report</button><button type="submit" value="cancel" class="sc-cancel" formnovalidate>Cancel</button></div>
        <p class="sc-note">Copyright owners can also use our <a href="/terms#copyright" target="_blank">DMCA notice process</a>.</p>
      </form>
    </dialog>
    <dialog class="sc-dialog" id="sc-ereport">
      <form method="dialog" id="sc-ereport-form">
        <h3>Report this event</h3>
        <p class="sc-note">Reports go to the editor. Events at someone’s home, threats, private details, fake events and spam come down.</p>
        <div id="sc-ereport-reasons"></div>
        <label class="sc-label" for="sc-ereport-note">Anything else? <span class="sc-opt">(optional)</span></label>
        <input id="sc-ereport-note" maxlength="300">
        <p class="sc-error" id="sc-ereport-error" role="alert" hidden></p>
        <div class="sc-actions"><button type="submit" value="send" class="sc-submit">Send report</button><button type="submit" value="cancel" class="sc-cancel" formnovalidate>Cancel</button></div>
      </form>
    </dialog>
  </section>
  <script src="/js/corner.js?v=3" defer></script>`;
}

/** Side box: the next few gatherings, filled in by /js/corner.js. */
export function eventsRail() {
  return `<aside class="module sc-coming" aria-labelledby="sc-coming-title" hidden>
    <p class="module-title" id="sc-coming-title">Coming up: gatherings</p>
    <ol class="sc-coming-list" id="sc-coming-list"></ol>
    <button type="button" class="sc-link" data-goto-events>See all events, or post one</button>
  </aside>`;
}

/** Side card: First Amendment rights and the legal routes for holding ICE agents to account. Facts checked Nov 2026. */
export function rightsCard() {
  const a = (href, label) => `<a href="${href}" target="_blank" rel="noopener">${label}</a>`;
  return `<aside class="module sc-rights" aria-labelledby="sc-rights-title">
    <p class="module-title" id="sc-rights-title">Know your rights</p>
    <h3 class="sc-rights-h">Speaking up, recording, and holding ICE to account</h3>
    <details open><summary>Your right to speak and protest</summary>
      <p>The First Amendment protects your speech, peaceful protest and petitions to the government, including harsh criticism of officials and agencies. It doesn’t protect true threats, or physically blocking officers. ${a('https://www.aclu.org/know-your-rights/immigrants-rights', 'ACLU: know your rights')}</p></details>
    <details><summary>Your right to record officers</summary>
      <p>In <em>Glik v. Cunniffe</em> (2011), a case that began on Boston Common, the federal appeals court covering Massachusetts held that people have a First Amendment right to record police doing their jobs in public. Several other federal appeals courts agree. Keep a safe distance and don’t interfere. ${a('https://aclum.org/en/cases/glik-v-cunniffe', 'ACLU of Massachusetts on Glik')}</p></details>
    <details><summary>File a complaint</summary>
      <p>Complaints about ICE or any DHS officer go to the DHS Office for Civil Rights and Civil Liberties, and misconduct can be reported to the DHS Inspector General. ${a('https://www.dhs.gov/file-civil-rights-complaint', 'File a DHS civil rights complaint')} · ${a('https://www.oig.dhs.gov/hotline', 'DHS Inspector General hotline')}</p></details>
    <details><summary>Sue the government (FTCA)</summary>
      <p>Under the Federal Tort Claims Act, people hurt by federal agents can claim damages from the United States. You must first file an administrative claim with the agency within two years. The government often argues its “discretionary function” exception. ${a('https://browngold.com/blog/are-ice-agents-above-the-law-seeking-accountability-through-the-ftca/', 'How FTCA claims work')}</p></details>
    <details><summary>Sue the agent personally (Bivens)</summary>
      <p>Congress lets people sue state and local officials who violate their rights, but there is no such law for federal officers. The court-made substitute, <em>Bivens</em>, has been narrowed sharply: in <em>Egbert v. Boule</em> (2022), a Border Patrol case, the Supreme Court refused to extend it. Some states now let people sue federal officers under state civil-rights law. ${a('https://www.themarshallproject.org/2026/09/08/maine-ice-arrest-bivens-lawsuit', 'The Marshall Project on these lawsuits')}</p></details>
    <details><summary>Criminal charges against agents</summary>
      <p><strong>Federal:</strong> 18 U.S.C. § 242 makes it a crime for any official, federal officers included, to willfully deprive someone of their constitutional rights. The Justice Department decides whether to charge. ${a('https://www.justice.gov/crt/deprivation-rights-under-color-law', 'DOJ on § 242')}</p>
      <p><strong>State:</strong> states can prosecute federal agents who break state law, but agents can claim “Supremacy Clause immunity,” which covers only acts authorized by federal law and reasonably necessary. It is not absolute. In 2026, Hennepin County, Minn., prosecutors charged an ICE officer with assault over a January shooting. ${a('https://www.politifact.com/factchecks/2025/oct/29/stephen-miller/ICE-agent-immigration-raids-legal-immunity/', 'PolitiFact on agent immunity')} · ${a('https://law.stanford.edu/2026/06/22/federalism-and-state-responses-to-ice/', 'Stanford Law on state responses')}</p></details>
    <details><summary>Get legal help</summary>
      <p>${a('https://www.masslegalhelp.org', 'MassLegalHelp')} lists free and low-cost legal help in Massachusetts. ${a('https://www.aclum.org', 'ACLU of Massachusetts')} takes civil-liberties cases.</p></details>
    <p class="sc-rights-note">General information, not legal advice. For your own situation, talk to a lawyer.</p>
  </aside>`;
}
