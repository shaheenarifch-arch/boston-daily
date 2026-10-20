export const uid = () => crypto.randomUUID();
export const nowIso = () => new Date().toISOString();

export function json(data, status = 200, headers = {}) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json; charset=utf-8', 'cache-control': 'no-store', ...headers },
  });
}

export const errorJson = (message, status = 400, extra = {}) => json({ ok: false, error: message, ...extra }, status);

export function html(body, status = 200, headers = {}) {
  return new Response(body, {
    status,
    headers: {
      'content-type': 'text/html; charset=utf-8',
      'cache-control': 'public, max-age=60',
      'x-content-type-options': 'nosniff',
      'referrer-policy': 'strict-origin-when-cross-origin',
      ...headers,
    },
  });
}

export function esc(value) {
  if (value === null || value === undefined) return '';
  return String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

export function slugify(text) {
  return String(text || '')
    .toLowerCase()
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 90) || 'story';
}

export function isHttpUrl(value) {
  try {
    const u = new URL(value);
    return u.protocol === 'https:' || u.protocol === 'http:';
  } catch {
    return false;
  }
}

/** YYYY-MM-DD for a Date in the given IANA time zone. */
export function localDate(date = new Date(), timeZone = 'America/New_York') {
  const parts = new Intl.DateTimeFormat('en-CA', { timeZone, year: 'numeric', month: '2-digit', day: '2-digit' }).formatToParts(date);
  const get = (t) => parts.find((p) => p.type === t).value;
  return `${get('year')}-${get('month')}-${get('day')}`;
}

export function formatDateLong(iso, timeZone = 'America/New_York') {
  if (!iso) return '';
  const d = iso.length === 10 ? new Date(`${iso}T12:00:00Z`) : new Date(iso);
  return new Intl.DateTimeFormat('en-US', { timeZone, weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }).format(d);
}

export function formatDateTime(iso, timeZone = 'America/New_York') {
  if (!iso) return '';
  return new Intl.DateTimeFormat('en-US', { timeZone, month: 'short', day: 'numeric', year: 'numeric', hour: 'numeric', minute: '2-digit', timeZoneName: 'short' }).format(new Date(iso));
}

export function timeAgo(iso) {
  if (!iso) return '';
  const s = Math.max(0, (Date.now() - new Date(iso).getTime()) / 1000);
  if (s < 90) return 'just now';
  if (s < 3600) return `${Math.round(s / 60)} min ago`;
  if (s < 86400) return `${Math.round(s / 3600)} hr ago`;
  return `${Math.round(s / 86400)} d ago`;
}

/** "9:14 AM" in the newsroom's time zone. */
export function formatClock(iso, timeZone = 'America/New_York') {
  if (!iso) return '';
  return new Intl.DateTimeFormat('en-US', { timeZone, hour: 'numeric', minute: '2-digit' }).format(new Date(iso));
}

/**
 * Card stamp wording: "just now", "12 min ago", "3 hr ago", then "Oct 17" after a day.
 * The reader page script (layout.js) repeats this rule so stamps keep ticking without a reload.
 */
export function relativeStamp(iso, timeZone = 'America/New_York', now = Date.now()) {
  if (!iso) return '';
  const s = Math.max(0, (now - new Date(iso).getTime()) / 1000);
  if (s < 90) return 'just now';
  if (s < 3600) return `${Math.round(s / 60)} min ago`;
  if (s < 86400) return `${Math.round(s / 3600)} hr ago`;
  return new Intl.DateTimeFormat('en-US', { timeZone, month: 'short', day: 'numeric' }).format(new Date(iso));
}

export async function readJson(request) {
  try {
    return await request.json();
  } catch {
    return null;
  }
}

export function money(price, currency = 'USD') {
  if (price === null || price === undefined || price === '') return '';
  try {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: currency || 'USD' }).format(Number(price));
  } catch {
    return `${price} ${currency || ''}`.trim();
  }
}

/** Salted, truncated hash of the visitor's IP (never stored raw). */
export async function ipHash(request, env) {
  const ip = request.headers.get('cf-connecting-ip') || 'unknown';
  const data = new TextEncoder().encode(`${ip}|${env.INGEST_SECRET || env.SITE_NAME || 'bd'}`);
  const digest = await crypto.subtle.digest('SHA-256', data);
  return [...new Uint8Array(digest)].slice(0, 12).map((b) => b.toString(16).padStart(2, '0')).join('');
}
