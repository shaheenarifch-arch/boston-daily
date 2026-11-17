/**
 * Newsletters: the free daily paper by email and the weekly edition.
 * Sign-ups are stored in D1. Sending uses Resend (https://resend.com) when RESEND_API_KEY and
 * NEWSLETTER_FROM are set; without them sign-ups still work and nothing is sent.
 */
import { esc, html, nowIso, uid, localDate, formatDateLong } from './util.js';
import { layout, loadChrome } from './reader/layout.js';
import { SITE } from './reader/components.js';

export const DAILY_NAME = 'Boston Daily';
export const WEEKLY_NAME = 'The Boston Week';
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;
const PUBLIC = "('PUBLISHED','UPDATED','CORRECTED')";

export function subscribeBox({ compact = false } = {}) {
  return `<aside class="module module-newsletter" aria-label="Newsletters">
    <h2 class="module-title">Get the morning edition by email</h2>
    <p class="nl-copy">${compact ? 'Free. Unsubscribe anytime.' : 'The morning edition in your inbox every day, and the week’s best stories every Sunday. Free. Unsubscribe anytime.'}</p>
    <form class="nl-form" method="post" action="/subscribe">
      <label class="sr" for="nl-email${compact ? '-c' : ''}">Email address</label>
      <input id="nl-email${compact ? '-c' : ''}" type="email" name="email" required placeholder="you@example.com" autocomplete="email">
      <label class="check"><input type="checkbox" name="daily" value="1" checked> The morning edition, daily <span class="nl-tag">Free</span></label>
      <label class="check"><input type="checkbox" name="weekly" value="1" checked> ${esc(WEEKLY_NAME)}, every Sunday <span class="nl-tag">Free</span></label>
      <input type="text" name="company_site" class="hp" tabindex="-1" autocomplete="off" aria-hidden="true">
      <button class="button" type="submit">Subscribe</button>
    </form>
  </aside>`;
}

export async function subscribe(env, request) {
  const form = await request.formData();
  const back = (q) => Response.redirect(new URL(`/newsletters?${q}`, request.url), 303);
  if (String(form.get('company_site') || '')) return back('sent=1'); // honeypot
  const email = String(form.get('email') || '').trim().toLowerCase().slice(0, 200);
  if (!EMAIL_RE.test(email)) return back('error=email');
  const daily = form.get('daily') ? 1 : 0;
  const weekly = form.get('weekly') ? 1 : 0;
  if (!daily && !weekly) return back('error=choose');
  const ts = nowIso();
  await env.DB.prepare(`INSERT INTO subscribers (id, email, daily, weekly, status, token, source, created_at, updated_at)
    VALUES (?,?,?,?, 'active', ?, ?, ?, ?)
    ON CONFLICT(email) DO UPDATE SET daily = MAX(daily, excluded.daily), weekly = MAX(weekly, excluded.weekly), status = 'active', updated_at = excluded.updated_at`)
    .bind(uid(), email, daily, weekly, uid().replace(/-/g, ''), (request.headers.get('referer') || '').slice(0, 200), ts, ts).run();
  return back('sent=1');
}

export async function unsubscribe(env, url) {
  const token = url.searchParams.get('token') || '';
  const list = url.searchParams.get('list');
  if (token) {
    if (list === 'daily' || list === 'weekly') {
      await env.DB.prepare(`UPDATE subscribers SET ${list} = 0, updated_at = ? WHERE token = ?`).bind(nowIso(), token).run();
      await env.DB.prepare("UPDATE subscribers SET status = 'unsubscribed' WHERE token = ? AND daily = 0 AND weekly = 0").bind(token).run();
    } else {
      await env.DB.prepare("UPDATE subscribers SET status = 'unsubscribed', daily = 0, weekly = 0, updated_at = ? WHERE token = ?").bind(nowIso(), token).run();
    }
  }
  return newslettersPage(env, new URL('/newsletters?unsubscribed=1', url));
}

export async function newslettersPage(env, url) {
  const chrome = await loadChrome(env);
  const p = url.searchParams;
  const msg = p.get('sent') ? '<p class="notice notice-update">Thanks. You’re subscribed. Look for your first email tomorrow morning.</p>'
    : p.get('unsubscribed') ? '<p class="notice notice-update">You’ve been unsubscribed.</p>'
    : p.get('error') === 'email' ? '<p class="notice notice-correction">Please enter a valid email address.</p>'
    : p.get('error') === 'choose' ? '<p class="notice notice-correction">Choose at least one newsletter.</p>' : '';
  const body = `<div class="page-head"><h1>Newsletters</h1><p class="page-sub">Both are free.</p></div>
    ${msg}
    <div class="columns"><div class="col-main prose">
      <h2>${esc(DAILY_NAME)}, every morning</h2>
      <p>Each day’s edition: the lead story, top headlines from every section, and what to watch today. Arrives around 6 a.m. Boston time.</p>
      <h2>${esc(WEEKLY_NAME)}, every Sunday</h2>
      <p>The week’s most important and most read stories in one email, with sports results and the week ahead.</p>
      <p>We never sell your email address. Every email has a one-click unsubscribe link.</p>
    </div><aside class="col-rail">${subscribeBox()}</aside></div>`;
  return html(layout(env, chrome, { title: 'Newsletters', description: `Subscribe free to ${DAILY_NAME} by email and ${WEEKLY_NAME}.`, canonical: '/newsletters', body }));
}

// ── Sending ──

function emailHtml(site, kind, stories, sub) {
  const title = kind === 'daily' ? `${DAILY_NAME}: ${formatDateLong(new Date().toISOString(), site.tz)}` : `${WEEKLY_NAME}: the week’s top stories`;
  const base = site.url || 'https://bostondaily.us';
  const items = stories.map((s) => `<tr><td style="padding:12px 0;border-bottom:1px solid #dfe3e7">
      <div style="font:600 12px Arial,sans-serif;color:#a8432e">${esc(s.section_name || '')}</div>
      <a href="${base}/story/${esc(s.slug)}" style="font:700 19px Georgia,serif;color:#1b2733;text-decoration:none">${esc(s.headline)}</a>
      ${s.dek ? `<div style="font:15px/1.45 Georgia,serif;color:#4a5663;margin-top:4px">${esc(s.dek)}</div>` : ''}</td></tr>`).join('');
  const unsub = `${base}/unsubscribe?token=${encodeURIComponent(sub.token)}&list=${kind}`;
  return { subject: title, unsub, html: `<!doctype html><html><body style="margin:0;background:#f3f5f6">
    <table width="100%" cellpadding="0" cellspacing="0"><tr><td align="center"><table width="600" cellpadding="0" cellspacing="0" style="background:#fff;padding:24px">
    <tr><td style="text-align:center;border-bottom:3px double #1b2733;padding-bottom:12px"><div style="font:700 34px Georgia,serif;color:#1b2733">${esc(kind === 'daily' ? DAILY_NAME : WEEKLY_NAME)}</div>
    <div style="font:12px Arial,sans-serif;color:#6b7480">${esc(title)}</div></td></tr>
    ${items}
    <tr><td style="padding-top:18px;font:12px Arial,sans-serif;color:#6b7480">You’re receiving this because you subscribed at ${esc(base.replace(/^https?:\/\//, ''))}.
      <a href="${unsub}" style="color:#1d4f73">Unsubscribe</a>${site.mailingAddress ? `<br>${esc(site.name)}, ${esc(site.mailingAddress)}` : ''}</td></tr></table></td></tr></table></body></html>` };
}

async function storiesFor(db, kind) {
  const since = new Date(Date.now() - (kind === 'daily' ? 1 : 7) * 86400000).toISOString();
  const order = kind === 'daily' ? 's.is_lead_candidate DESC, s.priority DESC, s.published_at DESC' : 's.view_count DESC, s.priority DESC, s.published_at DESC';
  const { results } = await db.prepare(`SELECT s.slug, s.headline, s.dek, sec.name AS section_name FROM stories s JOIN sections sec ON sec.slug = s.section_slug
    WHERE s.lane = 'newsroom' AND s.status IN ${PUBLIC} AND s.published_at >= ? ORDER BY ${order} LIMIT ?`).bind(since, kind === 'daily' ? 12 : 15).all();
  return results;
}

/** Send one newsletter kind once per day. Returns a short status string. */
export async function sendNewsletter(env, kind) {
  const db = env.DB;
  const site = SITE(env);
  const today = localDate(new Date(), site.tz);
  const already = await db.prepare('SELECT id FROM newsletter_sends WHERE kind = ? AND send_date = ?').bind(kind, today).first();
  if (already) return `${kind}: already sent today`;
  const stories = await storiesFor(db, kind);
  const { results: subs } = await db.prepare(`SELECT email, token FROM subscribers WHERE status = 'active' AND ${kind} = 1`).all();
  const record = (status, n, note) => db.prepare('INSERT OR IGNORE INTO newsletter_sends (id, kind, send_date, recipients, status, note, created_at) VALUES (?,?,?,?,?,?,?)')
    .bind(uid(), kind, today, n, status, note, nowIso()).run();
  if (!stories.length) { await record('skipped', 0, 'No new stories'); return `${kind}: no stories`; }
  if (!env.RESEND_API_KEY || !env.NEWSLETTER_FROM) return `${kind}: email not configured (${subs.length} subscribers waiting)`;
  let sent = 0;
  for (let i = 0; i < subs.length; i += 100) {
    const batch = subs.slice(i, i + 100).map((sub) => {
      const m = emailHtml(site, kind, stories, sub);
      return { from: env.NEWSLETTER_FROM, to: [sub.email], subject: m.subject, html: m.html,
        headers: { 'List-Unsubscribe': `<${m.unsub}>`, 'List-Unsubscribe-Post': 'List-Unsubscribe=One-Click' } };
    });
    const res = await fetch('https://api.resend.com/emails/batch', {
      method: 'POST', headers: { authorization: `Bearer ${env.RESEND_API_KEY}`, 'content-type': 'application/json' }, body: JSON.stringify(batch),
    });
    if (res.ok) sent += batch.length; else console.error('Newsletter batch failed', res.status, await res.text());
  }
  await db.prepare(`UPDATE subscribers SET last_${kind}_at = ? WHERE status = 'active' AND ${kind} = 1`).bind(nowIso()).run();
  await record(sent === subs.length ? 'sent' : 'partial', sent, null);
  return `${kind}: sent ${sent}/${subs.length}`;
}
