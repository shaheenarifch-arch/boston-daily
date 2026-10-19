import { esc, formatDateLong, localDate } from '../util.js';
import { SITE } from './components.js';

/** Loads nav data once per request (sections + featured network businesses for the footer). */
export async function loadChrome(env) {
  const db = env.DB;
  const [{ results: sections }, { results: network }, edition] = await Promise.all([
    db.prepare('SELECT slug, name, kind, parent_slug, in_nav, commerce_allowed, always_human, partner_offers, offer_tags FROM sections WHERE active = 1 ORDER BY sort_order').all(),
    db.prepare("SELECT slug, name FROM businesses WHERE status = 'active' AND owned_by_network = 1 AND (health_ok IS NULL OR health_ok = 1) ORDER BY featured DESC, sort_order LIMIT 12").all(),
    db.prepare("SELECT edition_number, edition_date FROM editions WHERE status = 'published' ORDER BY edition_date DESC LIMIT 1").first(),
  ]);
  return { sections, network, edition };
}

export function layout(env, chrome, { title, description = '', canonical = '', body, jsonLd = null, ogType = 'website', image = '', active = '', noindex = false }) {
  const site = SITE(env);
  const today = localDate(new Date(), site.tz);
  const news = chrome.sections.filter((s) => s.in_nav && s.kind === 'news');
  const niche = chrome.sections.filter((s) => s.in_nav && s.kind === 'niche');
  const fullTitle = title ? `${title} | ${site.name}` : `${site.name}: news for Boston and the nation`;
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
<meta name="description" content="${esc(description)}">
${canon ? `<link rel="canonical" href="${esc(canon)}">` : ''}
${noindex ? '<meta name="robots" content="noindex">' : ''}
<meta property="og:site_name" content="${esc(site.name)}">
<meta property="og:title" content="${esc(title || site.name)}">
<meta property="og:description" content="${esc(description)}">
<meta property="og:type" content="${esc(ogType)}">
${canon ? `<meta property="og:url" content="${esc(canon)}">` : ''}
${(() => { const ogImage = image || `${site.url || ''}/og-default.png`; return `<meta property="og:image" content="${esc(ogImage)}"><meta name="twitter:card" content="summary_large_image">`; })()}
<meta name="theme-color" content="#ffffff">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="alternate" type="application/rss+xml" title="${esc(site.name)}" href="/feed.xml">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,650;1,6..72,400&amp;family=Public+Sans:wght@400;500;600&amp;display=swap" media="print" onload="this.media='all'">
<noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,650;1,6..72,400&amp;family=Public+Sans:wght@400;500;600&amp;display=swap"></noscript>
<link rel="stylesheet" href="/css/reader.css?v=12">
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
    <p class="masthead-date">${esc(formatDateLong(today, site.tz))}<br><a href="/editions">${esc(editionLine === 'Past editions' ? "Today\u2019s edition" : editionLine)}</a></p>
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
  <div class="wrap footer-grid">
    <div>
      <p class="footer-brand">${esc(site.name)}</p>
      <p class="footer-tag">${esc(site.tagline)}</p>
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
      ${news.map((s) => `<p><a href="/section/${esc(s.slug)}">${esc(s.name)}</a></p>`).join('')}
    </div>
    <div>
      <p class="footer-h">Guides</p>
      ${chrome.sections.filter((s) => s.in_nav && s.kind === 'niche').slice(0, 8).map((s) => `<p><a href="/section/${esc(s.slug)}">${esc(s.name)}</a></p>`).join('')}
    </div>
    <div>
      <p class="footer-h">Work with us</p>
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
