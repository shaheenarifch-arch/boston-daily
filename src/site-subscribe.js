/**
 * One newsletter list for all of Shaheen's websites.
 * Each site's sign-up form posts here (POST /api/subscribe) with a hidden `site` field; sign-ups are stored
 * in D1 (site_subscribers), tagged by site. Forms that submit with fetch and Accept: application/json get
 * {success:true} back (the shape the sites' existing form script expects); plain form posts get a short
 * thank-you page that links back to the site.
 */
import { esc, html, json, nowIso, uid } from './util.js';

/** Sites allowed to post sign-ups. The key is the `site` value the form sends; it must match the page's host. */
export const SITES = {
  'businessbuy.site': 'BusinessBuy',
  'buybeststore.com': 'BuyBestStore',
  'buybeststores.uk': 'BuyBestStores UK',
  'costumescout.store': 'CostumeScout',
  'coupondepots.info': 'CouponDepots',
  'curated4her.com': 'Curated4Her',
  'desi.markets': 'Desi Markets',
  'drivezone.nexus': 'DriveZone Nexus',
  'ezpass.uk': 'EasyPass',
  'firearmsafety.us': 'FirearmSafety.us',
  'flowerofheaven.store': 'Flower of Heaven',
  'flyhorizons.online': 'FlyHorizons',
  'glowsculpt.site': 'GlowSculpt',
  'hairstyle.company': 'Hairstyle Company',
  'homewellnessdeals.com': 'Home Wellness Deals',
  'jewllery.store': 'Maison Aurelia',
  'lensloop.site': 'LensLoop',
  'luxurytravel.party': 'Luxury Travel Party',
  'medicalsupplie.com': 'MedicalSupplie',
  'needed.men': 'Needed.men',
  'outdoorhaulers.site': 'OutdoorHaulers',
  'outdoorsports.fun': 'OutdoorSports Fun',
  'petscoolstuff.trade': 'PetsCoolStuff',
  'realskillset.com': 'RealSkillSet',
  'bedbathbuy.trade': 'BedBathBuy',
  'ticktes.online': 'Ticktes',
  'womenstyle.win': 'WomenStyle',
  'getservices.ai': 'GetServices.ai',
  'authenticpakusa.com': 'Authentic Pak USA',
};

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;

/** Host of a URL without "www.", or '' if it isn't a URL. */
export function hostOf(value) {
  try { return new URL(value).hostname.toLowerCase().replace(/^www\./, ''); } catch { return ''; }
}

/** Cloudflare Pages project host for a site: hairstyle.company -> hairstyle-company.pages.dev */
export function pagesHostOf(site) {
  return `${site.replace(/\./g, '-')}.pages.dev`;
}

/**
 * True when `host` is the site itself or one of its subdomains, or the site's own Cloudflare Pages
 * project (production *.pages.dev host or a branch/commit preview like my-branch.hairstyle-company.pages.dev),
 * so sign-up forms also work while a change is being previewed.
 */
export function hostMatchesSite(host, site) {
  if (!host || !site) return false;
  if (host === site || host.endsWith(`.${site}`)) return true;
  const pages = pagesHostOf(site);
  return host === pages || host.endsWith(`.${pages}`);
}

/** Validate a sign-up. Returns { ok, site, email, sourcePage } or { ok:false, error }. */
export function checkSignup({ site, email, origin, referer, botcheck, sourcePage }) {
  site = String(site || '').trim().toLowerCase().replace(/^www\./, '');
  if (!SITES[site]) return { ok: false, error: 'unknown_site' };
  // The request must come from that site's own pages (Origin on fetch, Referer on a plain post).
  const from = hostOf(origin) || hostOf(referer);
  if (!hostMatchesSite(from, site)) return { ok: false, error: 'wrong_origin' };
  if (botcheck) return { ok: true, spam: true, site };
  email = String(email || '').trim().toLowerCase().slice(0, 200);
  if (!EMAIL_RE.test(email)) return { ok: false, error: 'email', site };
  return { ok: true, site, email, sourcePage: String(sourcePage || '').slice(0, 300) };
}

function cors(origin, site) {
  return hostMatchesSite(hostOf(origin), site) ? { 'access-control-allow-origin': origin, vary: 'Origin' } : {};
}

function thanksPage(siteName, backUrl, ok) {
  const back = backUrl ? `<p><a href="${esc(backUrl)}">Back to ${esc(siteName)}</a></p>` : '';
  const refresh = ok && backUrl ? `<meta http-equiv="refresh" content="4;url=${esc(backUrl)}">` : '';
  return `<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="robots" content="noindex">${refresh}<title>${ok ? 'You are subscribed' : 'Please try again'}</title>
<style>body{font:17px/1.5 system-ui,sans-serif;max-width:520px;margin:12vh auto;padding:0 16px;color:#1b2733}a{color:#1d4f73}</style></head>
<body><h1>${ok ? 'Thanks. You are subscribed.' : 'That did not go through.'}</h1>
<p>${ok ? `You will get new picks and deals from ${esc(siteName)} by email. Every email has an unsubscribe link.` : 'Please go back and enter a valid email address.'}</p>${back}</body></html>`;
}

/** POST /api/subscribe */
export async function siteSubscribe(env, request) {
  const origin = request.headers.get('origin') || '';
  const referer = request.headers.get('referer') || '';
  const wantsJson = (request.headers.get('accept') || '').includes('application/json');
  let form;
  try { form = await request.formData(); } catch { return json({ success: false, error: 'bad_request' }, 400); }
  const c = checkSignup({
    site: form.get('site'), email: form.get('email'), origin, referer,
    botcheck: form.get('botcheck') || form.get('company_site'), sourcePage: form.get('source_page') || referer,
  });
  const headers = cors(origin, c.site);
  const siteName = SITES[c.site] || 'the site';
  const backUrl = hostMatchesSite(hostOf(referer), c.site) ? referer : (SITES[c.site] ? `https://${c.site}/` : '');

  if (!c.ok) {
    const status = c.error === 'email' ? 400 : 403;
    return wantsJson ? json({ success: false, error: c.error }, status, headers) : html(thanksPage(siteName, backUrl, false), status);
  }
  if (!c.spam) {
    const ts = nowIso();
    await env.DB.prepare(`INSERT INTO site_subscribers (id, site, email, status, token, source_page, created_at, updated_at)
      VALUES (?,?,?, 'active', ?, ?, ?, ?)
      ON CONFLICT(site, email) DO UPDATE SET status = 'active', updated_at = excluded.updated_at`)
      .bind(uid(), c.site, c.email, uid().replace(/-/g, ''), c.sourcePage, ts, ts).run();
  }
  return wantsJson ? json({ success: true }, 200, headers) : html(thanksPage(siteName, backUrl, true));
}

/** GET /api/unsubscribe?token=… (link for future site newsletters) */
export async function siteUnsubscribe(env, url) {
  const token = url.searchParams.get('token') || '';
  let site = '';
  if (token) {
    const row = await env.DB.prepare('SELECT site FROM site_subscribers WHERE token = ?').bind(token).first();
    if (row) {
      site = row.site;
      await env.DB.prepare("UPDATE site_subscribers SET status = 'unsubscribed', updated_at = ? WHERE token = ?").bind(nowIso(), token).run();
    }
  }
  const name = SITES[site] || 'this site';
  return html(`<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="robots" content="noindex">
<title>Unsubscribed</title><style>body{font:17px/1.5 system-ui,sans-serif;max-width:520px;margin:12vh auto;padding:0 16px;color:#1b2733}</style></head>
<body><h1>${site ? 'You have been unsubscribed.' : 'Link not recognized.'}</h1><p>${site ? `You will not get more emails from ${esc(name)}.` : 'If you keep getting emails, reply to one and we will remove you.'}</p></body></html>`);
}
