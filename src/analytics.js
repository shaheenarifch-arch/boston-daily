/**
 * Unique visitors and page views without cookies. A visitor is a salted SHA-256 of
 * day + IP + user agent, so nothing personal is stored and IDs change every day.
 * Bots, admin and API traffic are ignored.
 */
import { localDate } from './util.js';

const BOT = /bot|crawl|spider|slurp|preview|monitor|curl|wget|python|headless|lighthouse|facebookexternalhit|embedly/i;

async function sha(text) {
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text));
  return [...new Uint8Array(buf)].slice(0, 12).map((b) => b.toString(16).padStart(2, '0')).join('');
}

export function trackVisit(request, response, env, ctx) {
  try {
    if (request.method !== 'GET' || response.status !== 200) return;
    const url = new URL(request.url);
    if (url.pathname.startsWith('/admin') || url.pathname.startsWith('/api/') || url.pathname.startsWith('/go/')) return;
    if (!(response.headers.get('content-type') || '').includes('text/html')) return;
    const ua = request.headers.get('user-agent') || '';
    if (!ua || BOT.test(ua)) return;
    const ip = request.headers.get('cf-connecting-ip') || '';
    const day = localDate(new Date(), env.TIMEZONE || 'America/New_York');
    ctx.waitUntil((async () => {
      const vid = await sha(`${day}|${ip}|${ua}|${env.INGEST_SECRET || 'boston-daily'}`);
      await env.DB.batch([
        env.DB.prepare('INSERT OR IGNORE INTO visits (day, vid) VALUES (?, ?)').bind(day, vid),
        env.DB.prepare('INSERT INTO pageviews (day, n) VALUES (?, 1) ON CONFLICT(day) DO UPDATE SET n = n + 1').bind(day),
      ]);
    })().catch((e) => console.error('trackVisit', e)));
  } catch (e) { console.error('trackVisit', e); }
}

export async function visitorStats(db, tz = 'America/New_York') {
  const { results } = await db.prepare(`SELECT p.day, p.n AS pageviews, (SELECT COUNT(*) FROM visits v WHERE v.day = p.day) AS visitors
    FROM pageviews p ORDER BY p.day DESC LIMIT 30`).all();
  const today = localDate(new Date(), tz);
  const sum = (days, key) => results.slice(0, days).reduce((a, r) => a + (r[key] || 0), 0);
  return {
    today: results.find((r) => r.day === today) || { day: today, pageviews: 0, visitors: 0 },
    last7: { visitors: sum(7, 'visitors'), pageviews: sum(7, 'pageviews') },
    last30: { visitors: sum(30, 'visitors'), pageviews: sum(30, 'pageviews') },
    days: results,
  };
}

// ── Login guard: 10 wrong passwords from one IP locks it out for 15 minutes. ──
const WINDOW_MS = 15 * 60 * 1000;
const MAX_FAILS = 10;

export async function loginLocked(db, ip) {
  if (!ip) return false;
  const row = await db.prepare('SELECT window_start, n FROM auth_failures WHERE ip = ?').bind(ip).first();
  return !!row && Date.now() - Date.parse(row.window_start) < WINDOW_MS && row.n >= MAX_FAILS;
}

export async function recordLoginFailure(db, ip) {
  if (!ip) return;
  const now = new Date().toISOString();
  const cutoff = new Date(Date.now() - WINDOW_MS).toISOString();
  await db.prepare(`INSERT INTO auth_failures (ip, window_start, n) VALUES (?, ?, 1)
    ON CONFLICT(ip) DO UPDATE SET n = CASE WHEN window_start < ? THEN 1 ELSE n + 1 END,
      window_start = CASE WHEN window_start < ? THEN excluded.window_start ELSE window_start END`).bind(ip, now, cutoff, cutoff).run();
}
