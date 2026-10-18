/**
 * Google Search Console in the admin. Uses a Google Cloud service account:
 *   GSC_SERVICE_ACCOUNT  secret: the service account's JSON key (whole file contents)
 *   GSC_SITE             var or secret: the property, e.g. "sc-domain:bostondaily.us" or "https://bostondaily.us/"
 * Add the service account's email as a user (Restricted is enough) on the property in Search Console.
 */
const SCOPE = 'https://www.googleapis.com/auth/webmasters.readonly';
const CACHE_MS = 6 * 60 * 60 * 1000;

const b64url = (buf) => btoa(String.fromCharCode(...new Uint8Array(buf))).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
const b64urlStr = (s) => b64url(new TextEncoder().encode(s));

async function accessToken(sa) {
  const now = Math.floor(Date.now() / 1000);
  const unsigned = `${b64urlStr(JSON.stringify({ alg: 'RS256', typ: 'JWT' }))}.${b64urlStr(JSON.stringify({
    iss: sa.client_email, scope: SCOPE, aud: 'https://oauth2.googleapis.com/token', iat: now, exp: now + 3600,
  }))}`;
  const pem = sa.private_key.replace(/-----[^-]+-----/g, '').replace(/\s+/g, '');
  const der = Uint8Array.from(atob(pem), (c) => c.charCodeAt(0));
  const key = await crypto.subtle.importKey('pkcs8', der, { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' }, false, ['sign']);
  const sig = await crypto.subtle.sign('RSASSA-PKCS1-v1_5', key, new TextEncoder().encode(unsigned));
  const res = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST', headers: { 'content-type': 'application/x-www-form-urlencoded' },
    body: `grant_type=${encodeURIComponent('urn:ietf:params:oauth:grant-type:jwt-bearer')}&assertion=${unsigned}.${b64url(sig)}`,
  });
  const data = await res.json();
  if (!res.ok) throw new Error(`Google sign-in failed: ${data.error_description || data.error || res.status}`);
  return data.access_token;
}

async function query(token, site, body) {
  const res = await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(site)}/searchAnalytics/query`, {
    method: 'POST', headers: { authorization: `Bearer ${token}`, 'content-type': 'application/json' }, body: JSON.stringify(body),
  });
  const data = await res.json();
  if (!res.ok) throw new Error(`Search Console: ${data.error?.message || res.status}`);
  return data.rows || [];
}

const day = (offset) => new Date(Date.now() - offset * 86400000).toISOString().slice(0, 10);

export async function searchConsoleReport(env, { refresh = false } = {}) {
  if (!env.GSC_SERVICE_ACCOUNT || !env.GSC_SITE) return { configured: false };
  const db = env.DB;
  const cached = await db.prepare("SELECT body, fetched_at FROM gsc_cache WHERE key = 'report'").first();
  if (cached && !refresh && Date.now() - Date.parse(cached.fetched_at) < CACHE_MS) return { configured: true, ...JSON.parse(cached.body), fetched_at: cached.fetched_at };

  const sa = JSON.parse(env.GSC_SERVICE_ACCOUNT);
  const token = await accessToken(sa);
  // Search Console data lags ~2-3 days; report the 28 days ending 3 days ago, and compare with the 28 before.
  const range = { startDate: day(30), endDate: day(3) };
  const prev = { startDate: day(58), endDate: day(31) };
  const [totals, prevTotals, daily, queries, pages, countries, devices] = await Promise.all([
    query(token, env.GSC_SITE, { ...range }),
    query(token, env.GSC_SITE, { ...prev }),
    query(token, env.GSC_SITE, { ...range, dimensions: ['date'] }),
    query(token, env.GSC_SITE, { ...range, dimensions: ['query'], rowLimit: 15 }),
    query(token, env.GSC_SITE, { ...range, dimensions: ['page'], rowLimit: 15 }),
    query(token, env.GSC_SITE, { ...range, dimensions: ['country'], rowLimit: 5 }),
    query(token, env.GSC_SITE, { ...range, dimensions: ['device'] }),
  ]);
  const pick = (r) => (r ? { clicks: r.clicks, impressions: r.impressions, ctr: r.ctr, position: r.position } : { clicks: 0, impressions: 0, ctr: 0, position: 0 });
  const rows = (list) => list.map((r) => ({ key: r.keys[0], ...pick(r) }));
  const body = { range, totals: pick(totals[0]), previous: pick(prevTotals[0]), daily: rows(daily), queries: rows(queries), pages: rows(pages), countries: rows(countries), devices: rows(devices) };
  const ts = new Date().toISOString();
  await db.prepare("INSERT INTO gsc_cache (key, body, fetched_at) VALUES ('report', ?, ?) ON CONFLICT(key) DO UPDATE SET body = excluded.body, fetched_at = excluded.fetched_at").bind(JSON.stringify(body), ts).run();
  return { configured: true, ...body, fetched_at: ts };
}
