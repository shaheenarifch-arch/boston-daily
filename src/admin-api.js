/**
 * Newsroom command center API. Every route requires an authenticated human editor.
 * Responses expose safe operational status only — no model reasoning is stored or shown.
 */
import { uid, nowIso, slugify, isHttpUrl, json, errorJson, readJson, localDate } from './util.js';
import {
  STATES, TRANSITIONS, PUBLIC_STATES, NEWSROOM_TYPES, COMMERCE_TYPES, DISCLOSURE_LABELS,
  approvalProblems, requiresHuman, loadStoryContext, transition, approve, reject, schedule, publish, revisePublished, LifecycleError,
} from './lifecycle.js';
import { buildEdition, curateEdition } from './editions.js';
import { checkProductLinks, checkBusinessHealth } from './maintenance.js';

const EDITABLE = ['headline', 'dek', 'body', 'section_slug', 'type', 'byline', 'credited_reviewer', 'hero_image_url', 'hero_image_credit',
  'hero_image_rights', 'disclosure_label', 'disclosure_text', 'sponsor_name', 'sensitive', 'priority', 'is_lead_candidate', 'slug'];
const RIGHTS = ['LICENSED_REPUBLISH', 'PERMITTED_RELEASE', 'PUBLIC_DOMAIN', 'PRIMARY_SOURCE', 'ATTRIBUTED_REPORT', 'DISCOVERY_ONLY', 'ORIGINAL'];

function lifecycleResponse(err) {
  if (err instanceof LifecycleError) return errorJson(err.message, err.status, { problems: err.problems });
  console.error(err);
  return errorJson(err.message || 'Server error', 500);
}

export async function handleAdmin(request, env, url, editor) {
  const db = env.DB;
  const path = url.pathname.replace(/^\/api\/admin/, '') || '/';
  const method = request.method;
  const seg = path.split('/').filter(Boolean);

  try {
    if (path === '/me') return json({ ok: true, editor: editor.name });

    if (path === '/overview' && method === 'GET') return json(await overview(env));

    // ── Newsletter subscribers ──
    if (path === '/subscribers' && method === 'GET') {
      const counts = await db.prepare(`SELECT SUM(status = 'active' AND daily = 1) AS daily, SUM(status = 'active' AND weekly = 1) AS weekly,
        SUM(status = 'active') AS active, SUM(status = 'unsubscribed') AS unsubscribed FROM subscribers`).first();
      const { results: sends } = await db.prepare('SELECT kind, send_date, recipients, status, note FROM newsletter_sends ORDER BY created_at DESC LIMIT 20').all();
      return json({ ok: true, counts, sends, email_configured: !!(env.RESEND_API_KEY && env.NEWSLETTER_FROM) });
    }
    if (path === '/subscribers.csv' && method === 'GET') {
      const { results } = await db.prepare('SELECT email, daily, weekly, status, created_at FROM subscribers ORDER BY created_at').all();
      const csv = ['email,daily,weekly,status,created_at', ...results.map((r) => [r.email, r.daily, r.weekly, r.status, r.created_at].map((v) => `"${String(v ?? '').replace(/"/g, '""')}"`).join(','))].join('\n');
      return new Response(csv, { headers: { 'content-type': 'text/csv; charset=utf-8', 'content-disposition': 'attachment; filename="subscribers.csv"' } });
    }

    if (path === '/meta' && method === 'GET') {
      const { results: sections } = await db.prepare('SELECT * FROM sections ORDER BY sort_order').all();
      return json({ ok: true, states: STATES, transitions: TRANSITIONS, newsroom_types: NEWSROOM_TYPES, commerce_types: COMMERCE_TYPES,
        disclosure_labels: DISCLOSURE_LABELS, rights_types: RIGHTS, sections });
    }

    // ── Stories ──
    if (seg[0] === 'stories' && seg.length === 1) {
      if (method === 'GET') return json(await listStories(db, url.searchParams));
      if (method === 'POST') return createStory(db, await readJson(request), editor);
    }
    if (seg[0] === 'stories' && seg[1]) {
      const id = seg[1];
      const action = seg[2];
      const body = method === 'GET' ? null : (await readJson(request)) || {};
      if (!action && method === 'GET') return storyDetail(db, id, editor);
      if (!action && method === 'PATCH') return editStory(db, id, body, editor);
      if (method === 'POST') {
        switch (action) {
          case 'transition': return json({ ok: true, story: await transition(db, id, body.to, editor, body.note) });
          case 'approve': return json({ ok: true, story: await approve(db, id, editor, body.note) });
          case 'reject': return json({ ok: true, story: await reject(db, id, editor, body.note) });
          case 'schedule': return json({ ok: true, story: await schedule(db, id, body.at, editor) });
          case 'publish': return json({ ok: true, story: await publish(db, id, editor) });
          case 'update': return json({ ok: true, story: await revisePublished(db, id, 'update', body, body.note, editor) });
          case 'correct': return json({ ok: true, story: await revisePublished(db, id, 'correction', body, body.note, editor) });
          case 'sources': return addSource(db, id, body, editor);
          default: break;
        }
      }
    }
    if (seg[0] === 'sources' && seg[1]) {
      const src = await db.prepare('SELECT s.*, st.status AS story_status FROM story_sources s JOIN stories st ON st.id = s.story_id WHERE s.id = ?').bind(seg[1]).first();
      if (!src) return errorJson('Source not found', 404);
      if (method === 'PATCH') {
        const b = (await readJson(request)) || {};
        await db.prepare('UPDATE story_sources SET verified = COALESCE(?, verified), public = COALESCE(?, public), notes = COALESCE(?, notes) WHERE id = ?')
          .bind(b.verified === undefined ? null : (b.verified ? 1 : 0), b.public === undefined ? null : (b.public ? 1 : 0), b.notes ?? null, seg[1]).run();
        await event(db, src.story_id, src.story_status, `Source ${b.verified ? 'verified' : 'updated'}: ${src.title}`, editor);
        return json({ ok: true });
      }
      if (method === 'DELETE') {
        if (PUBLIC_STATES.includes(src.story_status)) return errorJson('Sources on a published story are part of its record; mark them non-public instead.', 409);
        await db.prepare('DELETE FROM story_sources WHERE id = ?').bind(seg[1]).run();
        return json({ ok: true });
      }
    }

    // ── Editions ──
    if (seg[0] === 'editions') {
      if (seg.length === 1 && method === 'GET') {
        const { results } = await db.prepare('SELECT e.*, (SELECT COUNT(*) FROM edition_items i WHERE i.edition_id = e.id) AS items FROM editions e ORDER BY edition_date DESC LIMIT 60').all();
        return json({ ok: true, editions: results, today: localDate(new Date(), env.TIMEZONE) });
      }
      if (seg[1] === 'build' && method === 'POST') {
        const b = (await readJson(request)) || {};
        const r = await buildEdition(db, env, { date: b.date, rebuild: !!b.rebuild, actor: editor.name });
        return json({ ok: true, ...r });
      }
      if (seg[1] && seg[2] === 'curate' && method === 'POST') {
        const b = (await readJson(request)) || {};
        await curateEdition(db, seg[1], b.op, b.story_id, b.slot);
        return json({ ok: true });
      }
      if (seg[1] && method === 'GET') {
        const edition = await db.prepare('SELECT * FROM editions WHERE edition_date = ? OR id = ?').bind(seg[1], seg[1]).first();
        if (!edition) return errorJson('Edition not found', 404);
        const { results } = await db.prepare(`SELECT ei.slot, ei.position, s.id, s.headline, s.section_slug, s.status, s.published_at
          FROM edition_items ei JOIN stories s ON s.id = ei.story_id WHERE ei.edition_id = ?
          ORDER BY CASE ei.slot WHEN 'lead' THEN 0 WHEN 'top' THEN 1 WHEN 'editors_selection' THEN 2 ELSE 3 END, ei.position`).bind(edition.id).all();
        return json({ ok: true, edition, items: results });
      }
    }

    // ── Commerce ──
    if (path === '/commerce' && method === 'GET') {
      const { results: merchants } = await db.prepare(`SELECT m.*,
          (SELECT COUNT(*) FROM products p WHERE p.merchant_id = m.id AND p.status = 'active') AS active_products,
          (SELECT COUNT(*) FROM products p WHERE p.merchant_id = m.id AND p.status = 'broken_link') AS broken_products,
          (SELECT COALESCE(SUM(clicks),0) FROM products p WHERE p.merchant_id = m.id) AS clicks
        FROM merchants m ORDER BY m.status, m.name`).all();
      const { results: broken } = await db.prepare("SELECT p.id, p.name, p.deep_link, p.last_verified_at, m.name AS merchant FROM products p JOIN merchants m ON m.id = p.merchant_id WHERE p.status = 'broken_link' ORDER BY p.updated_at DESC LIMIT 50").all();
      const { results: log } = await db.prepare('SELECT * FROM ingest_log ORDER BY created_at DESC LIMIT 50').all();
      return json({ ok: true, merchants, broken, log });
    }
    if (seg[0] === 'products' && seg[1] && method === 'PATCH') {
      const b = (await readJson(request)) || {};
      if (!['active', 'inactive'].includes(b.status)) return errorJson('status must be active or inactive');
      await db.prepare('UPDATE products SET status = ?, updated_at = ? WHERE id = ?').bind(b.status, nowIso(), seg[1]).run();
      return json({ ok: true });
    }

    // ── Businesses ──
    if (seg[0] === 'businesses') {
      if (seg.length === 1 && method === 'GET') {
        const { results } = await db.prepare('SELECT * FROM businesses ORDER BY paid_listing, sort_order, name').all();
        return json({ ok: true, businesses: results });
      }
      if (seg[1] && method === 'PATCH') {
        const b = (await readJson(request)) || {};
        await db.prepare(`UPDATE businesses SET featured = COALESCE(?, featured), status = COALESCE(?, status), sort_order = COALESCE(?, sort_order),
            short_description = COALESCE(?, short_description), long_description = COALESCE(?, long_description), section_slug = COALESCE(?, section_slug), updated_at = ? WHERE id = ?`)
          .bind(b.featured === undefined ? null : (b.featured ? 1 : 0), ['active', 'hidden', 'unverified'].includes(b.status) ? b.status : null,
            Number.isFinite(b.sort_order) ? b.sort_order : null, b.short_description ?? null, b.long_description ?? null, b.section_slug ?? null, nowIso(), seg[1]).run();
        return json({ ok: true });
      }
    }

    // ── Comments (pre-moderated) ──
    if (seg[0] === 'comments') {
      if (seg.length === 1 && method === 'GET') {
        const status = ['pending', 'approved', 'rejected'].includes(url.searchParams.get('status')) ? url.searchParams.get('status') : 'pending';
        const { results } = await db.prepare(`SELECT c.id, c.name, c.body, c.status, c.created_at, c.moderated_by, s.headline, s.slug, s.id AS story_id
          FROM comments c JOIN stories s ON s.id = c.story_id WHERE c.status = ? ORDER BY c.created_at DESC LIMIT 200`).bind(status).all();
        return json({ ok: true, comments: results });
      }
      if (seg[1] && method === 'PATCH') {
        const b = (await readJson(request)) || {};
        if (!['approved', 'rejected'].includes(b.status)) return errorJson('status must be approved or rejected');
        await db.prepare('UPDATE comments SET status = ?, moderated_by = ?, moderated_at = ? WHERE id = ?').bind(b.status, editor.name, nowIso(), seg[1]).run();
        return json({ ok: true });
      }
    }

    if (path === '/courses' && method === 'GET') {
      const { results } = await db.prepare('SELECT * FROM courses ORDER BY status, title').all();
      return json({ ok: true, courses: results });
    }

    // ── Inquiries ──
    if (seg[0] === 'inquiries') {
      if (seg.length === 1 && method === 'GET') {
        const { results } = await db.prepare('SELECT * FROM inquiries ORDER BY created_at DESC LIMIT 200').all();
        return json({ ok: true, inquiries: results });
      }
      if (seg[1] && method === 'PATCH') {
        const b = (await readJson(request)) || {};
        if (!['new', 'responded', 'negotiating', 'won', 'declined'].includes(b.status)) return errorJson('Invalid status');
        await db.prepare('UPDATE inquiries SET status = ? WHERE id = ?').bind(b.status, seg[1]).run();
        return json({ ok: true });
      }
    }

    if (path === '/maintenance/link-check' && method === 'POST') {
      return json({ ok: true, products: await checkProductLinks(db, 25), businesses: await checkBusinessHealth(db, 15) });
    }

    return errorJson('Not found', 404);
  } catch (err) {
    return lifecycleResponse(err);
  }
}

async function event(db, storyId, status, note, editor) {
  await db.prepare('INSERT INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES (?,?,?,?,?,?,?)')
    .bind(uid(), storyId, status, status, editor.name, note, nowIso()).run();
}

async function overview(env) {
  const db = env.DB;
  const { results: counts } = await db.prepare('SELECT lane, status, COUNT(*) AS n FROM stories GROUP BY lane, status').all();
  const byLane = { newsroom: {}, partner_commerce: {} };
  for (const r of counts) byLane[r.lane][r.status] = r.n;
  const sourcesPending = await db.prepare(`SELECT COUNT(*) AS n FROM story_sources ss JOIN stories s ON s.id = ss.story_id
    WHERE ss.verified = 0 AND ss.rights_type != 'DISCOVERY_ONLY' AND s.status NOT IN ('ARCHIVED','PUBLISHED','UPDATED','CORRECTED')`).first();
  const politicsQueue = await db.prepare(`SELECT COUNT(*) AS n FROM stories s JOIN sections sec ON sec.slug = s.section_slug
    WHERE (sec.slug = 'us-politics' OR sec.parent_slug = 'us-politics') AND s.status = 'EDITORIAL_REVIEW'`).first();
  const overdue = await db.prepare("SELECT COUNT(*) AS n FROM stories WHERE status = 'SCHEDULED' AND scheduled_at < ?").bind(new Date(Date.now() - 10 * 60000).toISOString()).first();
  const since = new Date(Date.now() - 86400000).toISOString();
  const published24 = await db.prepare("SELECT COUNT(*) AS n FROM story_events WHERE to_status = 'PUBLISHED' AND from_status != 'PUBLISHED' AND created_at >= ?").bind(since).first();
  const { results: activity } = await db.prepare(`SELECT e.created_at, e.from_status, e.to_status, e.actor, e.note, s.headline, s.id AS story_id, s.lane
    FROM story_events e JOIN stories s ON s.id = e.story_id ORDER BY e.created_at DESC LIMIT 40`).all();
  const commerce = await db.prepare(`SELECT
      (SELECT COUNT(*) FROM merchants WHERE status = 'active') AS merchants,
      (SELECT COUNT(*) FROM products WHERE status = 'active') AS products,
      (SELECT COUNT(*) FROM products WHERE status = 'broken_link') AS broken,
      (SELECT COALESCE(SUM(clicks),0) FROM products) AS product_clicks,
      (SELECT COUNT(*) FROM businesses WHERE status = 'active') AS businesses,
      (SELECT COALESCE(SUM(clicks),0) FROM businesses) AS business_clicks,
      (SELECT COUNT(*) FROM courses WHERE status = 'active') AS courses,
      (SELECT COUNT(*) FROM inquiries WHERE status = 'new') AS new_inquiries,
      (SELECT COUNT(*) FROM comments WHERE status = 'pending') AS pending_comments`).first();
  const today = localDate(new Date(), env.TIMEZONE);
  const edition = await db.prepare('SELECT e.*, (SELECT COUNT(*) FROM edition_items i WHERE i.edition_id = e.id) AS items FROM editions e WHERE edition_date = ?').bind(today).first();
  return {
    ok: true,
    newsroom: byLane.newsroom,
    commerce_lane: byLane.partner_commerce,
    sources_pending: sourcesPending?.n || 0,
    politics_queue: politicsQueue?.n || 0,
    overdue_scheduled: overdue?.n || 0,
    published_24h: published24?.n || 0,
    activity,
    commerce,
    edition: edition || null,
    today,
  };
}

async function listStories(db, params) {
  const where = [];
  const binds = [];
  if (params.get('status')) { where.push('s.status = ?'); binds.push(params.get('status')); }
  if (params.get('lane')) { where.push('s.lane = ?'); binds.push(params.get('lane')); }
  if (params.get('section')) { where.push('(s.section_slug = ? OR sec.parent_slug = ?)'); binds.push(params.get('section'), params.get('section')); }
  if (params.get('q')) { const t = params.get('q').toLowerCase().slice(0, 100); where.push('(instr(lower(s.headline), ?) > 0 OR instr(lower(s.body), ?) > 0)'); binds.push(t, t); }
  const limit = Math.min(Number(params.get('limit')) || 100, 300);
  const { results } = await db.prepare(`SELECT s.id, s.slug, s.lane, s.type, s.section_slug, sec.name AS section_name, sec.always_human, s.status, s.sensitive,
      s.headline, s.priority, s.source_system, s.updated_at, s.published_at, s.scheduled_at, s.approved_by,
      (SELECT COUNT(*) FROM story_sources ss WHERE ss.story_id = s.id) AS source_count
    FROM stories s JOIN sections sec ON sec.slug = s.section_slug
    ${where.length ? `WHERE ${where.join(' AND ')}` : ''} ORDER BY s.updated_at DESC LIMIT ?`).bind(...binds, limit).all();
  return { ok: true, stories: results };
}

async function createStory(db, body, editor) {
  if (!body || !body.headline) return errorJson('headline is required', 422);
  const lane = body.lane === 'partner_commerce' ? 'partner_commerce' : 'newsroom';
  const type = body.type || (lane === 'newsroom' ? 'news_story' : 'blog_post');
  const allowedTypes = lane === 'newsroom' ? NEWSROOM_TYPES : COMMERCE_TYPES;
  if (!allowedTypes.includes(type)) return errorJson(`Type ${type} is not allowed in the ${lane} lane`, 422);
  const section = await db.prepare('SELECT * FROM sections WHERE slug = ? AND active = 1').bind(body.section_slug).first();
  if (!section) return errorJson('Unknown section', 422);
  if (lane === 'partner_commerce' && !section.commerce_allowed) return errorJson(`Commercial content is not allowed in ${section.name}`, 422);
  const status = ['DISCOVERED', 'RESEARCHING', 'DRAFTING'].includes(body.status) ? body.status : 'DISCOVERED';
  let slug = slugify(body.slug || body.headline);
  if (await db.prepare('SELECT 1 FROM stories WHERE slug = ?').bind(slug).first()) slug = `${slug}-${uid().slice(0, 6)}`;
  const id = uid();
  const ts = nowIso();
  await db.batch([
    db.prepare(`INSERT INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, disclosure_label, disclosure_text, sponsor_name, priority, source_system, created_by, created_at, updated_at)
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`)
      .bind(id, slug, lane, type, section.slug, status, body.sensitive ? 1 : 0, String(body.headline).slice(0, 220), body.dek || null, body.body || '',
        body.byline || (lane === 'newsroom' ? 'Boston Daily Staff' : null), body.disclosure_label || null, body.disclosure_text || null, body.sponsor_name || null,
        Number(body.priority) || 0, lane === 'newsroom' ? 'newsroom' : 'manual', editor.name, ts, ts),
    db.prepare('INSERT INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES (?,?,?,?,?,?,?)')
      .bind(uid(), id, null, status, editor.name, 'Story created', ts),
  ]);
  return json({ ok: true, id, slug }, 201);
}

async function storyDetail(db, id, editor) {
  const ctx = await loadStoryContext(db, id);
  if (!ctx) return errorJson('Story not found', 404);
  const { story, section, sources } = ctx;
  const [{ results: events }, { results: versions }, { results: notices }] = await Promise.all([
    db.prepare('SELECT * FROM story_events WHERE story_id = ? ORDER BY created_at DESC LIMIT 100').bind(id).all(),
    db.prepare('SELECT id, version, change_type, headline, note, editor, created_at FROM story_versions WHERE story_id = ? ORDER BY version DESC').bind(id).all(),
    db.prepare('SELECT * FROM story_notices WHERE story_id = ? ORDER BY created_at DESC').bind(id).all(),
  ]);
  return json({
    ok: true, story, section, sources, events, versions, notices,
    problems: approvalProblems(story, section, sources, editor),
    requires_human: requiresHuman(story, section),
    transitions: TRANSITIONS[story.status] || [],
  });
}

async function editStory(db, id, body, editor) {
  const story = await db.prepare('SELECT * FROM stories WHERE id = ?').bind(id).first();
  if (!story) return errorJson('Story not found', 404);
  if (PUBLIC_STATES.includes(story.status)) return errorJson('Published stories change only through Update or Correct, so readers see the history.', 409);
  if (story.status === 'ARCHIVED') return errorJson('Archived stories are read-only.', 409);
  const sets = [];
  const binds = [];
  for (const key of EDITABLE) {
    if (body[key] === undefined) continue;
    let value = body[key];
    if (key === 'section_slug') {
      const sec = await db.prepare('SELECT * FROM sections WHERE slug = ? AND active = 1').bind(value).first();
      if (!sec) return errorJson('Unknown section', 422);
      if (story.lane === 'partner_commerce' && !sec.commerce_allowed) return errorJson(`Commercial content is not allowed in ${sec.name}`, 422);
    }
    if (key === 'type') {
      const allowed = story.lane === 'newsroom' ? NEWSROOM_TYPES : COMMERCE_TYPES;
      if (!allowed.includes(value)) return errorJson(`Type ${value} is not allowed in this lane`, 422);
    }
    if (key === 'hero_image_url' && value && !isHttpUrl(value)) return errorJson('Hero image must be an http(s) URL', 422);
    if (key === 'slug') {
      value = slugify(value);
      const clash = await db.prepare('SELECT 1 FROM stories WHERE slug = ? AND id != ?').bind(value, id).first();
      if (clash) return errorJson('Slug already in use', 409);
    }
    if (['sensitive', 'is_lead_candidate'].includes(key)) value = value ? 1 : 0;
    if (key === 'priority') value = Number(value) || 0;
    if (value === '') value = null;
    sets.push(`${key} = ?`);
    binds.push(value);
  }
  if (!sets.length) return errorJson('Nothing to change', 400);
  const ts = nowIso();
  // Editing approved content invalidates the approval: it must be reviewed again.
  const invalidates = ['APPROVED', 'SCHEDULED'].includes(story.status);
  const stmts = [];
  if (invalidates) {
    sets.push("status = 'EDITORIAL_REVIEW'", 'approved_by = NULL', 'approved_at = NULL', 'scheduled_at = NULL');
    stmts.push(db.prepare('INSERT INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES (?,?,?,?,?,?,?)')
      .bind(uid(), id, story.status, 'EDITORIAL_REVIEW', editor.name, 'Edited after approval — returned to review', ts));
  }
  stmts.unshift(db.prepare(`UPDATE stories SET ${sets.join(', ')}, updated_at = ? WHERE id = ?`).bind(...binds, ts, id));
  await db.batch(stmts);
  return json({ ok: true, returned_to_review: invalidates });
}

async function addSource(db, storyId, b, editor) {
  const story = await db.prepare('SELECT status FROM stories WHERE id = ?').bind(storyId).first();
  if (!story) return errorJson('Story not found', 404);
  if (!b.title) return errorJson('Source title is required', 422);
  if (!RIGHTS.includes(b.rights_type)) return errorJson(`rights_type must be one of ${RIGHTS.join(', ')}`, 422);
  if (b.url && !isHttpUrl(b.url)) return errorJson('Source URL must be http(s)', 422);
  if (b.rights_type === 'LICENSED_REPUBLISH' && !b.license_ref) return errorJson('Licensed sources need a license reference', 422);
  const id = uid();
  await db.prepare(`INSERT INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, license_ref, verified, public, retrieved_at, notes, added_by, created_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)`)
    .bind(id, storyId, String(b.title).slice(0, 300), b.url || null, b.publisher || null, b.channel || null, b.rights_type, b.license_ref || null,
      b.verified ? 1 : 0, b.public === false ? 0 : 1, b.retrieved_at || nowIso(), b.notes || null, editor.name, nowIso()).run();
  await event(db, storyId, story.status, `Source added (${b.rights_type}): ${b.title}`, editor);
  return json({ ok: true, id }, 201);
}
