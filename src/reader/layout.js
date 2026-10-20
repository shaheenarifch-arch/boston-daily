import { esc, formatDateLong, formatClock, localDate } from '../util.js';
import { SITE } from './components.js';
import { PACKAGES, NO_AD_SECTIONS } from '../advertise.js';

/** When a live newsroom story was last updated with new developments (the masthead's "Updated" time). */
export async function latestUpdateAt(db) {
  const row = await db.prepare("SELECT MAX(last_updated_at) AS at FROM stories WHERE lane = 'newsroom' AND status IN ('PUBLISHED','UPDATED','CORRECTED') AND last_updated_at IS NOT NULL").first();
  return row?.at || null;
}

/** "Updated 9:14 AM ET" (today) or "Updated Oct 19, 9:14 AM ET". Mirrored by the page script for live refreshes. */
export function mastheadUpdated(iso, tz) {
  if (!iso) return '';
  const day = localDate(new Date(iso), tz) === localDate(new Date(), tz) ? ''
    : `${new Intl.DateTimeFormat('en-US', { timeZone: tz, month: 'short', day: 'numeric' }).format(new Date(iso))}, `;
  return `${day}${formatClock(iso, tz)} ET`;
}

/** Loads nav data once per request (sections + featured network businesses for the footer). */
export async function loadChrome(env) {
  const db = env.DB;
  const [{ results: sections }, { results: network }, edition, updatedAt] = await Promise.all([
    db.prepare('SELECT slug, name, kind, parent_slug, in_nav, commerce_allowed, always_human, partner_offers, offer_tags FROM sections WHERE active = 1 ORDER BY sort_order').all(),
    db.prepare("SELECT slug, name FROM businesses WHERE status = 'active' AND owned_by_network = 1 AND (health_ok IS NULL OR health_ok = 1) ORDER BY featured DESC, sort_order LIMIT 12").all(),
    db.prepare("SELECT edition_number, edition_date FROM editions WHERE status = 'published' ORDER BY edition_date DESC LIMIT 1").first(),
    latestUpdateAt(db),
  ]);
  return { sections, network, edition, updatedAt };
}

export function layout(env, chrome, { title, description = '', canonical = '', body, jsonLd = null, ogType = 'website', image = '', active = '', noindex = false }) {
  const site = SITE(env);
  const today = localDate(new Date(), site.tz);
  const news = chrome.sections.filter((s) => s.in_nav && s.kind === 'news');
  const niche = chrome.sections.filter((s) => s.in_nav && s.kind === 'niche');
  const suffixed = title ? `${title} | ${site.name}` : '';
  // Keep titles within ~60 characters: long headlines drop the brand suffix.
  const fullTitle = title ? (suffixed.length <= 60 ? suffixed : title) : `${site.name}: Boston News, Politics, Sports & Business`;
  // Meta descriptions are capped at 160 characters on a word boundary.
  const metaDesc = description.length > 160 ? `${description.slice(0, 157).replace(/\s+\S*$/, '')}…` : description;
  const editionLine = chrome.edition && chrome.edition.edition_date === today
    ? `Edition ${chrome.edition.edition_number}` : 'Past editions';
  const navLink = (s) => `<a href="/section/${esc(s.slug)}"${active === s.slug ? ' aria-current="page"' : ''}>${esc(s.name)}</a>`;
  const canon = canonical && site.url ? `${site.url}${canonical}` : '';

  return `<!doctype html>
<html lang="en-US">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${esc(fullTitle)}</title>
<meta name="description" content="${esc(metaDesc)}">
${canon ? `<link rel="canonical" href="${esc(canon)}">` : ''}
${noindex ? '<meta name="robots" content="noindex">' : ''}
<meta property="og:site_name" content="${esc(site.name)}">
<meta property="og:title" content="${esc(title || site.name)}">
<meta property="og:description" content="${esc(metaDesc)}">
<meta property="og:type" content="${esc(ogType)}">
${canon ? `<meta property="og:url" content="${esc(canon)}">` : ''}
${(() => { const ogImage = image || `${site.url || ''}/og-default.png`; return `<meta property="og:image" content="${esc(ogImage)}"><meta name="twitter:card" content="summary_large_image"><meta name="twitter:title" content="${esc(title || site.name)}"><meta name="twitter:description" content="${esc(metaDesc)}"><meta name="twitter:image" content="${esc(ogImage)}">`; })()}
<meta name="theme-color" content="#ffffff">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="alternate" type="application/rss+xml" title="${esc(site.name)}" href="/feed.xml">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,650;1,6..72,400&amp;family=Public+Sans:wght@400;500;600&amp;display=swap" media="print" onload="this.media='all'">
<noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,650;1,6..72,400&amp;family=Public+Sans:wght@400;500;600&amp;display=swap"></noscript>
<link rel="stylesheet" href="/css/reader.css?v=16">
${jsonLd ? `<script type="application/ld+json">${JSON.stringify(jsonLd).replace(/</g, '\\u003c')}</script>` : ''}
</head>
<body>
<a class="skip" href="#main">Skip to content</a>
<header class="masthead">
  <div class="masthead-top wrap">
    <form class="search" action="/search" method="get" role="search">
      <label class="sr" for="q">Search</label>
      <input id="q" name="q" type="search" placeholder="Search" autocomplete="off">
    </form>
    <p class="masthead-util"><a href="/advertise">Advertise</a></p>
  </div>
  <div class="wrap masthead-brand">
    <p class="masthead-date">${esc(formatDateLong(today, site.tz))}<br><a href="/editions">${esc(editionLine === 'Past editions' ? "Today\u2019s edition" : editionLine)}</a>${chrome.updatedAt ? `<br><span class="masthead-updated" data-tz="${esc(site.tz)}">Updated <time datetime="${esc(chrome.updatedAt)}">${esc(mastheadUpdated(chrome.updatedAt, site.tz))}</time></span>` : ''}</p>
    <a class="brand" href="/" aria-label="${esc(site.name)} home">${esc(site.name)}</a>
    <p class="masthead-tag">${esc(site.tagline)}</p>
  </div>
  <nav class="nav nav-news" aria-label="News sections"><div class="wrap nav-scroll">
    ${news.map(navLink).join('')}
  </div></nav>
  <nav class="nav nav-niche" aria-label="More sections"><div class="wrap nav-scroll">
    ${niche.map(navLink).join('')}
    <a href="/shop"${active === 'shop' ? ' aria-current="page"' : ''}>Partner picks</a>
    <a href="/courses"${active === 'courses' ? ' aria-current="page"' : ''}>Skill Center</a>
  </div></nav>
</header>
<main id="main" class="wrap">
${body}
</main>
<footer class="footer">
  <div class="wrap footer-top">
    <a class="footer-brand" href="/">${esc(site.name)}</a>
    <p class="footer-tag">${esc(site.tagline)}</p>
  </div>
  <div class="wrap footer-grid">
    <div>
      <p class="footer-h">About</p>
      <p><a href="/editor">About the editor</a></p>
      <p><a href="/standards">Editorial standards</a></p>
      <p><a href="/corrections">Corrections</a></p>
      <p><a href="/contact">Contact us</a></p>
      <p><a href="/privacy">Privacy policy</a></p>
      <p><a href="/editions">Past editions</a></p>
      <p><a href="/feed.xml">RSS</a></p>
    </div>
    <div>
      <p class="footer-h">News</p>
      ${news.slice(0, 8).map((s) => `<p><a href="/section/${esc(s.slug)}">${esc(s.name)}</a></p>`).join('')}
    </div>
    <div>
      <p class="footer-h">Guides</p>
      ${niche.slice(0, 6).map((s) => `<p><a href="/section/${esc(s.slug)}">${esc(s.name)}</a></p>`).join('')}
      <p><a href="/shop">Partner picks</a></p>
      <p><a href="/courses">Skill Center</a></p>
    </div>
    <div>
      <p class="footer-h">Work with us</p>
      <p><a href="https://getservices.ai/marketplace/listings?utm_source=bostondaily&amp;utm_medium=network&amp;utm_campaign=marketplace_footer" target="_blank" rel="noopener"><strong>AI tools &amp; agencies directory</strong></a></p>
      <p><a href="/newsletters">Free newsletters</a></p>
      <p><a href="/advertise">Advertise with us</a></p>
      <p><a href="mailto:${esc(site.email)}?subject=${encodeURIComponent('[LISTING] Business listing')}">Get your business listed</a></p>
      <p><a href="mailto:${esc(site.email)}?subject=${encodeURIComponent('[SPONSORED] Sponsored content')}">Sponsored content</a></p>
      <p><a href="mailto:${esc(site.email)}">${esc(site.email)}</a></p>
      ${site.phone ? `<p>${esc(site.phone)}</p>` : ''}
    </div>
  </div>
  <div class="wrap footer-legal">
    <p>Some links on this website are partner links. We may receive a commission from qualifying purchases. Advertisers and partners never buy, edit or approve our news coverage. <a href="/standards#commercial">How we label commercial content</a>.</p>
    <p>© ${new Date().getFullYear()} ${esc(site.name)}, ${esc(site.network)}.</p>
  </div>
</footer>
<div id="site-toast" class="site-toast" role="status" aria-live="polite" hidden></div>
<script type="application/json" id="advertise-config">${JSON.stringify({
    site: site.name,
    email: site.email,
    packages: [...new Map(PACKAGES.map(([type, name, desc]) => [name, { type, name, desc }])).values()],
    sections: chrome.sections.filter((s) => s.commerce_allowed && !s.parent_slug && !NO_AD_SECTIONS.includes(s.slug)).map((s) => ({ slug: s.slug, name: s.name })),
  }).replace(/</g, '\\u003c')}</script>
<script src="/js/advertise.js?v=1" defer></script>
<script>
(() => {
  // Live timestamps: "12 min ago" stamps tick every 30 s; the masthead "Updated" time follows the newest update.
  const tz = ${JSON.stringify(site.tz)};
  const day = (d) => new Intl.DateTimeFormat('en-CA', { timeZone: tz, year: 'numeric', month: '2-digit', day: '2-digit' }).format(d);
  const rel = (iso) => {
    const s = Math.max(0, (Date.now() - new Date(iso).getTime()) / 1000);
    if (s < 90) return 'just now';
    if (s < 3600) return Math.round(s / 60) + ' min ago';
    if (s < 86400) return Math.round(s / 3600) + ' hr ago';
    return new Intl.DateTimeFormat('en-US', { timeZone: tz, month: 'short', day: 'numeric' }).format(new Date(iso));
  };
  const clock = (iso) => {
    const d = new Date(iso);
    const pre = day(d) === day(new Date()) ? '' : new Intl.DateTimeFormat('en-US', { timeZone: tz, month: 'short', day: 'numeric' }).format(d) + ', ';
    return pre + new Intl.DateTimeFormat('en-US', { timeZone: tz, hour: 'numeric', minute: '2-digit' }).format(d) + ' ET';
  };
  const tick = () => document.querySelectorAll('time[data-ago]').forEach((t) => { t.textContent = rel(t.dateTime); });
  const mast = document.querySelector('.masthead-updated time');
  const poll = () => {
    if (document.hidden) return;
    fetch('/api/updated').then((r) => r.ok ? r.json() : null).then((j) => {
      if (j && j.updated_at && mast && j.updated_at > mast.dateTime) mast.dateTime = j.updated_at;
      if (mast) mast.textContent = clock(mast.dateTime);
    }).catch(() => {});
  };
  tick();
  setInterval(tick, 30000);
  if (mast) setInterval(poll, 60000);
  document.addEventListener('visibilitychange', () => { if (!document.hidden) { tick(); if (mast) poll(); } });
})();
</script>
<script>
(() => {
  // Every form shows it is working the moment it is submitted.
  document.addEventListener('submit', (e) => {
    const f = e.target;
    if (!(f instanceof HTMLFormElement) || f.method.toLowerCase() !== 'post') return;
    const b = f.querySelector('button[type=submit], button:not([type])');
    if (b) { b.dataset.label = b.textContent; b.textContent = 'Sending…'; b.disabled = true; b.setAttribute('aria-busy', 'true'); }
  });
  window.addEventListener('pageshow', () => document.querySelectorAll('button[aria-busy]').forEach((b) => { b.disabled = false; b.removeAttribute('aria-busy'); if (b.dataset.label) b.textContent = b.dataset.label; }));
  // A picture that fails to load is swapped for a neat section plate (cards) or removed, never a broken icon.
  window.addEventListener('error', (e) => {
    const img = e.target;
    if (!(img instanceof HTMLImageElement)) return;
    const fig = img.closest('.card-figure, .card-thumb, .story-figure, .shop-img, .premium-img');
    if (!fig) return;
    if (fig.classList.contains('card-figure')) {
      const card = fig.closest('.card');
      const label = card?.querySelector('.card-section')?.textContent || 'Boston Daily';
      fig.className = 'card-figure card-figure-empty'; fig.innerHTML = '<span></span>'; fig.firstChild.textContent = label;
    } else if (fig.classList.contains('shop-img') || fig.classList.contains('premium-img')) {
      img.style.visibility = 'hidden';
    } else fig.remove();
  }, true);
  document.querySelectorAll('.card-figure img, .card-thumb img, .story-figure img').forEach((img) => {
    if (img.complete && img.naturalWidth === 0 && img.getAttribute('src')) img.dispatchEvent(new Event('error'));
  });
  // Confirmation after any submission, on every page.
  const p = new URLSearchParams(location.search);
  const msgs = {
    sent: p.get('sent') === '1' && (location.pathname.startsWith('/advertise')
      ? 'Thank you. Your inquiry was received and saved. Our partnerships team will reply by email.'
      : 'Thank you. You are subscribed. Look for your first email tomorrow morning.'),
    comment: { sent: 'Thank you. Your comment was received and will appear once an editor approves it.', error: 'Your comment was not sent: add your name and at least 10 characters.', slow: 'Your comment was not sent: please wait a few minutes and try again.' }[p.get('comment')],
    unsubscribed: p.get('unsubscribed') && 'You have been unsubscribed.',
    error: p.get('error') && ({ email: 'Not sent: please enter a valid email address.', choose: 'Not sent: choose at least one newsletter.' }[p.get('error')] || 'Not sent: ' + p.get('error')),
  };
  const key = Object.keys(msgs).find((k) => msgs[k]);
  if (!key) return;
  const t = document.getElementById('site-toast');
  const bad = key === 'error' || (key === 'comment' && p.get('comment') !== 'sent');
  t.textContent = msgs[key];
  t.className = 'site-toast ' + (bad ? 'site-toast-err' : 'site-toast-ok');
  t.hidden = false;
  const close = document.createElement('button'); close.type = 'button'; close.textContent = '×'; close.setAttribute('aria-label', 'Dismiss'); close.onclick = () => { t.hidden = true; }; t.append(close);
  setTimeout(() => { t.hidden = true; }, 10000);
  const inPage = document.querySelector('form .flash, #comments .flash') || document.querySelector('.flash');
  if (inPage) inPage.scrollIntoView({ block: 'center' });
  // Clean the address bar so a refresh does not repeat the message.
  ['sent', 'comment', 'unsubscribed', 'error'].forEach((k) => p.delete(k));
  history.replaceState(null, '', location.pathname + (p.toString() ? '?' + p : '') + location.hash);
})();
</script>
</body>
</html>`;
}
