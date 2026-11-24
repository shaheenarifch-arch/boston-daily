/**
 * Boston Speakers' Corner events board: freedom of assembly on the 1st Amendment Page.
 * Readers post rallies, vigils, town halls, know-your-rights trainings and interfaith gatherings anywhere
 * in the US. Events go live at once (like the podium). Reports reach the editor; three serious reports
 * (threat, doxxing, illegal, private home) hide an event until the editor decides in the console.
 *
 * Public API (JSON, never cached):
 *   GET  /api/corner/events?when=upcoming|past&state=MA&kind=&tag=&focus=
 *   POST /api/corner/events                     { kind, title, date, start, end, online, online_url, venue, address, town, state, organizer, link, tag, body, public_place }
 *   POST /api/corner/events/:id/edit            same fields + key (the organiser's browser key)
 *   POST /api/corner/events/:id/delete          { key }
 *   POST /api/corner/events/:id/going           { vid }   → toggles "I'm going"
 *   POST /api/corner/events/:id/report          { reason, note, vid }
 *   GET  /api/corner/events/:id/calendar.ics    calendar file (Apple Calendar, Outlook)
 */
import { json, errorJson, esc, uid, nowIso, ipHash, readJson, isHttpUrl } from './util.js';
import { checkText, cleanLine, cleanText, cleanTag, tagLabel } from './corner-filter.js';

export const EVENT_KINDS = [
  ['rally', 'Rally, protest or march'],
  ['vigil', 'Vigil'],
  ['townhall', 'Town hall or public meeting'],
  ['training', 'Know-your-rights training'],
  ['interfaith', 'Interfaith gathering'],
  ['other', 'Other gathering'],
];
const KIND_SET = new Set(EVENT_KINDS.map(([k]) => k));
export const kindLabel = (k) => (EVENT_KINDS.find(([x]) => x === k) || [null, 'Gathering'])[1];

// Each state's main time zone (a few states span two; organisers in those areas can note it in the description).
export const STATES = [
  ['AL', 'Alabama', 'America/Chicago'], ['AK', 'Alaska', 'America/Anchorage'], ['AZ', 'Arizona', 'America/Phoenix'], ['AR', 'Arkansas', 'America/Chicago'],
  ['CA', 'California', 'America/Los_Angeles'], ['CO', 'Colorado', 'America/Denver'], ['CT', 'Connecticut', 'America/New_York'], ['DE', 'Delaware', 'America/New_York'],
  ['DC', 'District of Columbia', 'America/New_York'], ['FL', 'Florida', 'America/New_York'], ['GA', 'Georgia', 'America/New_York'], ['HI', 'Hawaii', 'Pacific/Honolulu'],
  ['ID', 'Idaho', 'America/Boise'], ['IL', 'Illinois', 'America/Chicago'], ['IN', 'Indiana', 'America/Indiana/Indianapolis'], ['IA', 'Iowa', 'America/Chicago'],
  ['KS', 'Kansas', 'America/Chicago'], ['KY', 'Kentucky', 'America/New_York'], ['LA', 'Louisiana', 'America/Chicago'], ['ME', 'Maine', 'America/New_York'],
  ['MD', 'Maryland', 'America/New_York'], ['MA', 'Massachusetts', 'America/New_York'], ['MI', 'Michigan', 'America/Detroit'], ['MN', 'Minnesota', 'America/Chicago'],
  ['MS', 'Mississippi', 'America/Chicago'], ['MO', 'Missouri', 'America/Chicago'], ['MT', 'Montana', 'America/Denver'], ['NE', 'Nebraska', 'America/Chicago'],
  ['NV', 'Nevada', 'America/Los_Angeles'], ['NH', 'New Hampshire', 'America/New_York'], ['NJ', 'New Jersey', 'America/New_York'], ['NM', 'New Mexico', 'America/Denver'],
  ['NY', 'New York', 'America/New_York'], ['NC', 'North Carolina', 'America/New_York'], ['ND', 'North Dakota', 'America/Chicago'], ['OH', 'Ohio', 'America/New_York'],
  ['OK', 'Oklahoma', 'America/Chicago'], ['OR', 'Oregon', 'America/Los_Angeles'], ['PA', 'Pennsylvania', 'America/New_York'], ['PR', 'Puerto Rico', 'America/Puerto_Rico'],
  ['RI', 'Rhode Island', 'America/New_York'], ['SC', 'South Carolina', 'America/New_York'], ['SD', 'South Dakota', 'America/Chicago'], ['TN', 'Tennessee', 'America/Chicago'],
  ['TX', 'Texas', 'America/Chicago'], ['UT', 'Utah', 'America/Denver'], ['VT', 'Vermont', 'America/New_York'], ['VA', 'Virginia', 'America/New_York'],
  ['WA', 'Washington', 'America/Los_Angeles'], ['WV', 'West Virginia', 'America/New_York'], ['WI', 'Wisconsin', 'America/Chicago'], ['WY', 'Wyoming', 'America/Denver'],
];
const STATE_TZ = new Map(STATES.map(([c, , tz]) => [c, tz]));

export const EVENT_REPORT_REASONS = [
  ['private_home', 'It’s at someone’s private home'],
  ['threat', 'Threat or call for violence'],
  ['doxxing', 'Shares someone’s private details'],
  ['fake', 'Fake or misleading event'],
  ['spam', 'Spam or advertising'],
  ['illegal', 'Illegal content'],
  ['other', 'Something else'],
];
const EVENT_REPORT_SET = new Set(EVENT_REPORT_REASONS.map(([k]) => k));
const SERIOUS = ['private_home', 'threat', 'doxxing', 'illegal'];
const AUTO_HIDE = 3;
const EVENTS_PER_HOUR = 5;

/** Offset (ms) of a time zone from UTC at a given instant. */
function tzOffset(ms, tz) {
  const parts = Object.fromEntries(new Intl.DateTimeFormat('en-US', { timeZone: tz, hourCycle: 'h23', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' })
    .formatToParts(new Date(ms)).filter((p) => p.type !== 'literal').map((p) => [p.type, Number(p.value)]));
  return Date.UTC(parts.year, parts.month - 1, parts.day, parts.hour, parts.minute, parts.second) - ms;
}

/** "2026-11-29T14:00" in America/New_York → UTC ISO string. Handles daylight saving. */
export function zonedToUtc(local, tz) {
  const m = String(local).match(/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})$/);
  if (!m) return null;
  const guess = Date.UTC(+m[1], +m[2] - 1, +m[3], +m[4], +m[5]);
  let utc = guess - tzOffset(guess, tz);
  utc = guess - tzOffset(utc, tz);
  return new Date(utc).toISOString();
}

const RESIDENCE = /\b(?:apt|apartment|unit|residence|home\s+of|(?:his|her|their|my)\s+(?:house|home))\b|(?:^|\s)#\s*\d/i;

/** Validates and cleans a submitted event. Returns { ok: true, value } or { ok: false, field, message }. */
export function validateEvent(b, now = Date.now()) {
  const bad = (field, message) => ({ ok: false, field, message });
  const kind = KIND_SET.has(b.kind) ? b.kind : null;
  if (!kind) return bad('kind', 'Choose what kind of gathering it is.');
  const title = cleanLine(b.title, 120);
  if (title.length < 4) return bad('title', 'Give the event a name (at least 4 characters).');
  const state = String(b.state || '').toUpperCase();
  const tz = STATE_TZ.get(state);
  if (!tz) return bad('state', 'Choose the state.');
  const date = String(b.date || '');
  const start = String(b.start || '');
  if (!/^\d{4}-\d{2}-\d{2}$/.test(date)) return bad('date', 'Choose the date.');
  if (!/^\d{2}:\d{2}$/.test(start)) return bad('start', 'Choose the start time.');
  const startsLocal = `${date}T${start}`;
  const startsAt = zonedToUtc(startsLocal, tz);
  if (!startsAt) return bad('date', 'That date or time isn’t valid.');
  if (Date.parse(startsAt) < now - 3600000) return bad('date', 'That time has already passed. Choose a future date and time.');
  if (Date.parse(startsAt) > now + 366 * 86400000) return bad('date', 'Events can be posted up to a year ahead.');
  let endsLocal = null;
  let endsAt = new Date(Date.parse(startsAt) + 2 * 3600000).toISOString();
  if (b.end) {
    if (!/^\d{2}:\d{2}$/.test(String(b.end))) return bad('end', 'That end time isn’t valid.');
    // An end time earlier than the start means it runs past midnight.
    let e = zonedToUtc(`${date}T${b.end}`, tz);
    if (Date.parse(e) <= Date.parse(startsAt)) e = new Date(Date.parse(e) + 86400000).toISOString();
    if (Date.parse(e) - Date.parse(startsAt) > 24 * 3600000) return bad('end', 'Events can run up to 24 hours.');
    endsLocal = String(b.end);
    endsAt = e;
  }
  const online = b.online === true || b.online === 'true' || b.online === 'on' || b.online === '1';
  const onlineUrl = online ? String(b.online_url || '').trim().slice(0, 500) : '';
  if (online && !isHttpUrl(onlineUrl)) return bad('online_url', 'Add the link people use to join (Zoom, Google Meet, YouTube Live…).');
  const venue = cleanLine(b.venue, 120);
  const address = cleanLine(b.address, 160);
  const town = cleanLine(b.town, 60);
  if (!online) {
    if (!venue) return bad('venue', 'Name the place, like “Boston Common, Parkman Bandstand” or “Old South Meeting House”.');
    if (!town) return bad('town', 'Add the town or city.');
    if (!(b.public_place === true || b.public_place === 'true' || b.public_place === 'on')) return bad('public_place', 'Confirm the event is in a public place or a venue open to the public, not someone’s home.');
    if (RESIDENCE.test(`${venue} ${address}`)) return bad('address', 'That looks like a private home or apartment. Events must be held in public places or public venues.');
  }
  const organizer = cleanLine(b.organizer, 80);
  if (organizer.length < 2) return bad('organizer', 'Add who’s organising it (a group name, or your first name).');
  const link = String(b.link || '').trim().slice(0, 500);
  if (link && !isHttpUrl(link)) return bad('link', 'The event link must start with https://');
  const body = cleanText(b.body, 2000);
  const tag = cleanTag(b.tag);

  // The podium rules apply to every field: no threats, contact details, spam or illegal content.
  for (const [field, text, opts] of [['title', title, {}], ['body', body, { allowEmpty: true, allowAddress: true }], ['organizer', organizer, {}], ['venue', venue, { allowEmpty: true, allowAddress: true }], ['town', town, { allowEmpty: true }]]) {
    const c = checkText(text, opts);
    if (!c.ok) return bad(field, c.message);
  }
  return {
    ok: true,
    value: { kind, title, body: body || null, starts_local: startsLocal, ends_local: endsLocal, tz, starts_at: startsAt, ends_at: endsAt, online: online ? 1 : 0, online_url: onlineUrl || null,
      venue: online ? (venue || null) : venue, address: online ? null : (address || null), town: town || null, state, organizer, link: link || null, tag },
  };
}

function publicEvent(e) {
  return {
    id: e.id, kind: e.kind, kind_label: kindLabel(e.kind), title: e.title, body: e.body || '', starts_at: e.starts_at, ends_at: e.ends_at,
    has_end: !!e.ends_local, tz: e.tz, online: !!e.online, online_url: e.online_url || '', venue: e.venue || '', address: e.address || '', town: e.town || '',
    state: e.state, organizer: e.organizer, link: e.link || '', tag: e.tag || '', tag_label: e.tag ? tagLabel(e.tag) : '', going_count: e.going_count,
  };
}

async function sha(text) {
  const d = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(String(text)));
  return [...new Uint8Array(d)].slice(0, 16).map((b) => b.toString(16).padStart(2, '0')).join('');
}
async function visitorId(request, env, clientVid) {
  const v = String(clientVid || '').trim();
  return /^[A-Za-z0-9-]{16,64}$/.test(v) ? sha(`v|${v}`) : ipHash(request, env);
}

export async function eventsList(env, url) {
  const db = env.DB;
  const when = url.searchParams.get('when') === 'past' ? 'past' : 'upcoming';
  const state = STATE_TZ.has((url.searchParams.get('state') || '').toUpperCase()) ? url.searchParams.get('state').toUpperCase() : null;
  const kind = KIND_SET.has(url.searchParams.get('kind')) ? url.searchParams.get('kind') : null;
  const tag = cleanTag(url.searchParams.get('tag'));
  const focus = /^[a-f0-9-]{36}$/.test(url.searchParams.get('focus') || '') ? url.searchParams.get('focus') : null;
  const now = nowIso();
  const where = ["status = 'live'", when === 'past' ? 'ends_at < ?' : 'ends_at >= ?'];
  const args = [now];
  if (state) { where.push('state = ?'); args.push(state); }
  if (kind) { where.push('kind = ?'); args.push(kind); }
  if (tag) { where.push('tag = ?'); args.push(tag); }
  const { results } = await db.prepare(`SELECT * FROM corner_events WHERE ${where.join(' AND ')} ORDER BY starts_at ${when === 'past' ? 'DESC' : 'ASC'} LIMIT 60`).bind(...args).all();
  const events = results.map(publicEvent);
  if (focus && !events.some((e) => e.id === focus)) {
    const f = await db.prepare("SELECT * FROM corner_events WHERE id = ? AND status = 'live'").bind(focus).first();
    if (f) events.unshift(publicEvent(f));
  }
  const { results: counts } = await db.prepare("SELECT state, COUNT(*) AS n FROM corner_events WHERE status = 'live' AND ends_at >= ? GROUP BY state").bind(now).all();
  return json({ ok: true, when, events, upcoming_by_state: Object.fromEntries(counts.map((c) => [c.state, c.n])) });
}

export async function eventCreate(env, request) {
  const db = env.DB;
  const b = (await readJson(request)) || {};
  if (String(b.website || '').trim()) return json({ ok: true, event: null });
  const ip = await ipHash(request, env);
  const recent = await db.prepare('SELECT COUNT(*) AS n FROM corner_events WHERE ip_hash = ? AND created_at >= ?').bind(ip, new Date(Date.now() - 3600000).toISOString()).first();
  if ((recent?.n || 0) >= EVENTS_PER_HOUR) return errorJson('You’ve posted several events this hour. Come back in a little while.', 429);
  const v = validateEvent(b);
  if (!v.ok) return errorJson(v.message, 400, { field: v.field });
  const dup = await db.prepare("SELECT id FROM corner_events WHERE status = 'live' AND lower(title) = lower(?) AND starts_at = ? AND state = ?").bind(v.value.title, v.value.starts_at, v.value.state).first();
  if (dup) return errorJson('That event is already on the board.', 409, { field: 'title', id: dup.id });
  const id = uid();
  const key = uid();
  const at = nowIso();
  const x = v.value;
  await db.prepare(`INSERT INTO corner_events (id, kind, title, body, starts_local, ends_local, tz, starts_at, ends_at, online, online_url, venue, address, town, state, organizer, link, tag, status, ip_hash, owner_key_hash, created_at, updated_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'live',?,?,?,?)`)
    .bind(id, x.kind, x.title, x.body, x.starts_local, x.ends_local, x.tz, x.starts_at, x.ends_at, x.online, x.online_url, x.venue, x.address, x.town, x.state, x.organizer, x.link, x.tag, ip, await sha(`k|${key}`), at, at).run();
  const row = await db.prepare('SELECT * FROM corner_events WHERE id = ?').bind(id).first();
  return json({ ok: true, event: publicEvent(row), key });
}

async function ownedEvent(env, id, key) {
  if (!key) return null;
  return env.DB.prepare("SELECT * FROM corner_events WHERE id = ? AND owner_key_hash = ? AND status != 'removed'").bind(id, await sha(`k|${key}`)).first();
}

export async function eventEdit(env, request, id) {
  const b = (await readJson(request)) || {};
  const ev = await ownedEvent(env, id, b.key);
  if (!ev) return errorJson('Only the organiser who posted this event can edit it, from the same browser.', 403);
  const v = validateEvent(b);
  if (!v.ok) return errorJson(v.message, 400, { field: v.field });
  const x = v.value;
  await env.DB.prepare(`UPDATE corner_events SET kind=?, title=?, body=?, starts_local=?, ends_local=?, tz=?, starts_at=?, ends_at=?, online=?, online_url=?, venue=?, address=?, town=?, state=?, organizer=?, link=?, tag=?, updated_at=? WHERE id = ?`)
    .bind(x.kind, x.title, x.body, x.starts_local, x.ends_local, x.tz, x.starts_at, x.ends_at, x.online, x.online_url, x.venue, x.address, x.town, x.state, x.organizer, x.link, x.tag, nowIso(), id).run();
  const row = await env.DB.prepare('SELECT * FROM corner_events WHERE id = ?').bind(id).first();
  return json({ ok: true, event: publicEvent(row) });
}

export async function eventDelete(env, request, id) {
  const b = (await readJson(request)) || {};
  const ev = await ownedEvent(env, id, b.key);
  if (!ev) return errorJson('Only the organiser who posted this event can delete it, from the same browser.', 403);
  await env.DB.prepare("UPDATE corner_events SET status = 'removed', status_reason = 'Deleted by the organiser', moderated_by = 'organiser', moderated_at = ? WHERE id = ?").bind(nowIso(), id).run();
  return json({ ok: true });
}

export async function eventGoing(env, request, id) {
  const b = (await readJson(request)) || {};
  const ev = await env.DB.prepare("SELECT id FROM corner_events WHERE id = ? AND status = 'live'").bind(id).first();
  if (!ev) return errorJson('That event is no longer on the board.', 404);
  const vid = await visitorId(request, env, b.vid);
  const had = await env.DB.prepare('SELECT 1 AS x FROM corner_event_going WHERE event_id = ? AND vid = ?').bind(id, vid).first();
  await env.DB.batch(had ? [
    env.DB.prepare('DELETE FROM corner_event_going WHERE event_id = ? AND vid = ?').bind(id, vid),
    env.DB.prepare('UPDATE corner_events SET going_count = MAX(0, going_count - 1) WHERE id = ?').bind(id),
  ] : [
    env.DB.prepare('INSERT OR IGNORE INTO corner_event_going (event_id, vid, created_at) VALUES (?,?,?)').bind(id, vid, nowIso()),
    env.DB.prepare('UPDATE corner_events SET going_count = going_count + 1 WHERE id = ?').bind(id),
  ]);
  const row = await env.DB.prepare('SELECT going_count FROM corner_events WHERE id = ?').bind(id).first();
  return json({ ok: true, going: !had, going_count: row?.going_count || 0 });
}

export async function eventReport(env, request, id, ctx = null) {
  const db = env.DB;
  const b = (await readJson(request)) || {};
  const reason = EVENT_REPORT_SET.has(b.reason) ? b.reason : null;
  if (!reason) return errorJson('Choose a reason.', 400, { field: 'reason' });
  const ev = await db.prepare("SELECT * FROM corner_events WHERE id = ? AND status = 'live'").bind(id).first();
  if (!ev) return json({ ok: true, hidden: true });
  const vid = await visitorId(request, env, b.vid);
  const ins = await db.prepare('INSERT OR IGNORE INTO corner_event_reports (id, event_id, reason, note, vid, created_at) VALUES (?,?,?,?,?,?)')
    .bind(uid(), id, reason, cleanLine(b.note, 300) || null, vid, nowIso()).run();
  if (!ins.meta?.changes) return json({ ok: true, already: true });
  await db.prepare('UPDATE corner_events SET report_count = report_count + 1 WHERE id = ?').bind(id).run();
  const serious = await db.prepare(`SELECT COUNT(*) AS n FROM corner_event_reports WHERE event_id = ? AND resolved = 0 AND reason IN (${SERIOUS.map(() => '?').join(',')})`).bind(id, ...SERIOUS).first();
  let hidden = false;
  if ((serious?.n || 0) >= AUTO_HIDE) {
    await db.prepare("UPDATE corner_events SET status = 'hidden', status_reason = 'Hidden after reader reports, waiting for the editor' WHERE id = ? AND status = 'live'").bind(id).run();
    hidden = true;
  }
  if (env.RESEND_API_KEY && env.NEWSLETTER_FROM && (env.EDITOR_EMAIL || env.CONTACT_EMAIL)) {
    const base = (env.SITE_URL || '').replace(/\/$/, '');
    const send = fetch('https://api.resend.com/emails', {
      method: 'POST', headers: { authorization: `Bearer ${env.RESEND_API_KEY}`, 'content-type': 'application/json' },
      body: JSON.stringify({ from: env.NEWSLETTER_FROM, to: [env.EDITOR_EMAIL || env.CONTACT_EMAIL], subject: `${hidden ? '[Hidden] ' : ''}Event reported: ${EVENT_REPORT_REASONS.find(([k]) => k === reason)[1]}`,
        html: `<p>The event <strong>${esc(ev.title)}</strong> (${esc(ev.town || 'online')}, ${esc(ev.state)}) was reported as <strong>${esc(reason)}</strong>${hidden ? ' and is now hidden' : ''}.</p><p><a href="${esc(base)}/admin/#/corner?view=events">Review it in the newsroom console</a></p>` }),
    }).catch((e) => console.error('event report email', e?.message));
    if (ctx?.waitUntil) ctx.waitUntil(send); else await send;
  }
  return json({ ok: true, hidden });
}

const icsText = (s) => String(s || '').replace(/\\/g, '\\\\').replace(/\n/g, '\\n').replace(/([,;])/g, '\\$1');
const icsTime = (iso) => iso.replace(/[-:]/g, '').replace(/\.\d{3}/, '');
/** Folds lines to 75 octets as the calendar standard (RFC 5545) asks. */
function fold(line) {
  const out = [];
  let rest = line;
  while (new TextEncoder().encode(rest).length > 75) {
    let n = 74;
    while (new TextEncoder().encode(rest.slice(0, n)).length > 74) n--;
    out.push(rest.slice(0, n));
    rest = ` ${rest.slice(n)}`;
  }
  out.push(rest);
  return out.join('\r\n');
}

export function icsFor(e, siteUrl = '') {
  const where = e.online ? (e.online_url || 'Online') : [e.venue, e.address, e.town, e.state].filter(Boolean).join(', ');
  const page = `${siteUrl.replace(/\/$/, '')}/section/opinion#e-${e.id}`;
  const desc = [e.body, `Organised by ${e.organizer}.`, e.link ? `More: ${e.link}` : '', `On Boston Daily: ${page}`].filter(Boolean).join('\n\n');
  return ['BEGIN:VCALENDAR', 'VERSION:2.0', 'PRODID:-//Boston Daily//Speakers Corner Events//EN', 'CALSCALE:GREGORIAN', 'METHOD:PUBLISH', 'BEGIN:VEVENT',
    `UID:${e.id}@bostondaily.us`, `DTSTAMP:${icsTime(new Date().toISOString())}`, `DTSTART:${icsTime(e.starts_at)}`, `DTEND:${icsTime(e.ends_at)}`,
    `SUMMARY:${icsText(e.title)}`, `LOCATION:${icsText(where)}`, `DESCRIPTION:${icsText(desc)}`, `URL:${e.link || page}`, 'END:VEVENT', 'END:VCALENDAR']
    .map(fold).join('\r\n') + '\r\n';
}

export async function eventIcs(env, id) {
  const e = await env.DB.prepare("SELECT * FROM corner_events WHERE id = ? AND status = 'live'").bind(id).first();
  if (!e) return new Response('Not found', { status: 404 });
  const name = (e.title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '') || 'event').slice(0, 60);
  return new Response(icsFor(e, env.SITE_URL || ''), { headers: { 'content-type': 'text/calendar; charset=utf-8', 'content-disposition': `attachment; filename="${name}.ics"`, 'cache-control': 'no-store', 'x-robots-tag': 'noindex' } });
}

// ── Newsroom console ──
export async function eventsAdmin(env, request, url, editor, seg) {
  const db = env.DB;
  if (seg.length === 2 && request.method === 'GET') {
    const view = ['reported', 'hidden', 'upcoming', 'removed'].includes(url.searchParams.get('view')) ? url.searchParams.get('view') : 'reported';
    const q = {
      reported: `SELECT e.*, (SELECT GROUP_CONCAT(reason) FROM corner_event_reports r WHERE r.event_id = e.id AND r.resolved = 0) AS reasons FROM corner_events e
        WHERE e.status != 'removed' AND EXISTS (SELECT 1 FROM corner_event_reports r WHERE r.event_id = e.id AND r.resolved = 0) ORDER BY e.starts_at LIMIT 200`,
      hidden: "SELECT e.*, NULL AS reasons FROM corner_events e WHERE status = 'hidden' ORDER BY starts_at LIMIT 200",
      upcoming: `SELECT e.*, NULL AS reasons FROM corner_events e WHERE status = 'live' AND ends_at >= '${nowIso()}' ORDER BY starts_at LIMIT 200`,
      removed: "SELECT e.*, NULL AS reasons FROM corner_events e WHERE status = 'removed' ORDER BY updated_at DESC LIMIT 200",
    }[view];
    const { results } = await db.prepare(q).all();
    return json({ ok: true, view, events: results.map((e) => ({ ...publicEvent(e), status: e.status, status_reason: e.status_reason, reasons: e.reasons || '', created_at: e.created_at })) });
  }
  if (seg.length === 3 && request.method === 'PATCH') {
    const b = (await readJson(request)) || {};
    if (!['live', 'removed'].includes(b.status)) return errorJson('status must be live (keep it up) or removed (take it down)');
    await db.batch([
      db.prepare('UPDATE corner_events SET status = ?, status_reason = ?, moderated_by = ?, moderated_at = ?, updated_at = ? WHERE id = ?')
        .bind(b.status, b.status === 'removed' ? (cleanLine(b.reason, 200) || 'Removed by the editor') : null, editor.name, nowIso(), nowIso(), seg[2]),
      db.prepare('UPDATE corner_event_reports SET resolved = 1 WHERE event_id = ?').bind(seg[2]),
    ]);
    return json({ ok: true });
  }
  return errorJson('Unknown events action', 404);
}
