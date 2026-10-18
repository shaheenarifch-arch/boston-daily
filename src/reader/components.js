import { esc, formatDateLong, formatDateTime, timeAgo, money } from '../util.js';
import { excerpt } from '../markdown.js';
import { campaignFor, productAdsFor } from '../ads.js';

export const SITE = (env) => ({
  name: env.SITE_NAME || 'Boston Daily',
  tagline: env.SITE_TAGLINE || 'A GetServices.ai publication',
  url: (env.SITE_URL || '').replace(/\/$/, ''),
  tz: env.TIMEZONE || 'America/New_York',
  email: env.CONTACT_EMAIL || 'agents@getservices.ai',
  phone: env.CONTACT_PHONE || '',
  network: env.NETWORK_NAME || 'GetServices.ai',
});

/** Commercial modules never appear on politics, opinion or sensitive pages. */
export function commerceAllowed(section, story) {
  if (!section) return false;
  if (!section.commerce_allowed) return false;
  if (section.parent && !section.parent.commerce_allowed) return false;
  if (story && story.sensitive) return false;
  return true;
}

const TYPE_LABEL = { analysis: 'Analysis', opinion: 'Opinion', feature: 'Feature' };

/** "Updated 2 hr ago" / "Corrected Oct 17" / "Oct 17, 2026" */
export function storyStamp(s, tz) {
  if (s.status === 'CORRECTED' && s.corrected_at) return `<span class="stamp stamp-corrected">Corrected ${esc(timeAgo(s.corrected_at))}</span>`;
  if (s.status === 'UPDATED' && s.last_updated_at) return `<span class="stamp stamp-updated">Updated ${esc(timeAgo(s.last_updated_at))}</span>`;
  if (s.published_at) {
    const age = Date.now() - new Date(s.published_at).getTime();
    return `<span class="stamp">${esc(age < 86400000 ? timeAgo(s.published_at) : formatDateLong(s.published_at, tz).replace(/^\w+, /, ''))}</span>`;
  }
  return '';
}

export function storyCard(s, { size = 'm', tz, showSection = true, showDek = true } = {}) {
  const commercial = s.lane === 'partner_commerce';
  const kicker = commercial
    ? `<span class="label label-commerce">${esc(s.disclosure_label || 'Partner Content')}</span>`
    : TYPE_LABEL[s.type] ? `<span class="label label-type">${TYPE_LABEL[s.type]}</span>` : '';
  const section = showSection && s.section_name ? `<a class="card-section" href="/section/${esc(s.section_slug)}">${esc(s.section_name)}</a>` : '';
  // Every story card carries its image when the story has one with recorded rights.
  const hasImg = s.hero_image_url && s.hero_image_rights;
  const img = !hasImg ? ''
    : size === 's' ? `<a class="card-thumb" href="/story/${esc(s.slug)}" tabindex="-1" aria-hidden="true"><img src="${esc(s.hero_image_url)}" alt="" loading="lazy" decoding="async"></a>`
    : `<figure class="card-figure"><img src="${esc(s.hero_image_url)}" alt="" loading="${size === 'lead' ? 'eager' : 'lazy'}" decoding="async"></figure>`;
  const dek = showDek && (s.dek || s.body) ? `<p class="card-dek">${esc(s.dek || excerpt(s.body, size === 'lead' ? 260 : 150))}</p>` : '';
  return `<article class="card card-${size}${commercial ? ' card-commercial' : ''}">
    ${img}
    <div class="card-meta">${section}${kicker}</div>
    <h3 class="card-headline"><a href="/story/${esc(s.slug)}">${esc(s.headline)}</a></h3>
    ${dek}
    <div class="card-foot">${storyStamp(s, tz)}</div>
  </article>`;
}

export function productCard(p) {
  const showBrand = p.display_name_allowed !== 0;
  const img = p.image_url && p.image_rights_ok
    ? `<img src="${esc(p.image_url)}" alt="${esc(p.name)}" loading="lazy" decoding="async">`
    : `<span class="product-noimg" aria-hidden="true">${esc((p.name || '?').slice(0, 1))}</span>`;
  return `<li class="product">
    <a class="product-link" href="/go/p/${esc(p.id)}" rel="sponsored nofollow noopener" target="_blank">
      <span class="product-img">${img}</span>
      <span class="product-name">${esc(p.name)}</span>
      ${showBrand && p.merchant_name ? `<span class="product-merchant">${esc(p.merchant_name)}</span>` : ''}
      ${p.price != null ? `<span class="product-price">${esc(money(p.price, p.currency))}</span>` : ''}
      <span class="product-cta">View deal</span>
    </a>
  </li>`;
}

export function partnerPicks(products, { title = 'Partner picks', more = '/shop' } = {}) {
  if (!products || !products.length) return '';
  return `<aside class="module module-commerce" aria-label="${esc(title)}">
    <header class="module-head">
      <h2 class="module-title">${esc(title)}</h2>
      <span class="label label-commerce">Affiliate</span>
    </header>
    <p class="module-disclosure">We may earn a commission when you buy through these links. Partners never influence our news coverage.</p>
    <ul class="product-grid">${products.map(productCard).join('')}</ul>
    <a class="module-more" href="${esc(more)}">See all partner picks</a>
  </aside>`;
}

/**
 * Front-page "Shop" band: a print-style advertising strip. Products only (no business names
 * beyond the merchant when allowed), always labeled Advertisement with an affiliate disclosure.
 */
export function shopBand(products, { title = 'Shop the day' } = {}) {
  const list = (products || []).filter((p) => p.image_url && p.image_rights_ok).slice(0, 6);
  if (list.length < 3) return '';
  return `<section class="shop-band" aria-label="Advertisement">
    <header class="shop-head"><span class="label label-ad">Advertisement</span><h2 class="shop-title">${esc(title)}</h2>
      <p class="shop-disclosure">Affiliate links. We may earn a commission; partners never influence our news coverage.</p></header>
    <ul class="shop-row">${list.map((p) => `<li class="shop-item">
      <a href="/go/p/${esc(p.id)}" rel="sponsored nofollow noopener" target="_blank">
        <span class="shop-img"><img src="${esc(p.image_url)}" alt="${esc(p.name)}" loading="lazy" decoding="async"></span>
        <span class="shop-name">${esc(p.name)}</span>
        ${p.price != null ? `<span class="shop-price">${esc(money(p.price, p.currency))}</span>` : ''}
        <span class="shop-cta">Shop now</span>
      </a></li>`).join('')}</ul>
    <a class="shop-more" href="/shop">More partner picks</a>
  </section>`;
}

/** Front-page premium showcase: large product images from paid campaigns, magazine-style. */
export function premiumAds(placement = 'home') {
  const items = productAdsFor(placement).flatMap((ad) => ad.items.filter((it) => it.image).slice(0, 2).map((it) => ({ ...it, ad })));
  if (items.length < 2) return '';
  return `<section class="premium" aria-label="Paid advertisement">
    <header class="premium-head"><span class="label label-ad">Paid advertisement</span><h2 class="premium-title">Premium partners</h2></header>
    <ul class="premium-grid">${items.slice(0, 4).map((it) => `<li class="premium-item">
      <a href="${esc(it.url)}" rel="sponsored noopener" target="_blank">
        <span class="premium-img"><img src="${esc(it.image)}" alt="${esc(it.name)}" loading="lazy" decoding="async"></span>
        <span class="premium-brand">${esc(it.ad.advertiser)}</span>
        <span class="premium-name">${esc(it.name)}</span>
        ${it.note ? `<span class="premium-note">${esc(it.note)}</span>` : ''}
        <span class="premium-cta">${esc(it.cta || `Shop at ${it.ad.domain}`)} →</span>
      </a></li>`).join('')}</ul>
    <p class="premium-disclosure">Advertisements from partners. Advertisers do not influence Boston Daily's news coverage.</p>
  </section>`;
}

/** Paid product advertisements for a section (see src/ads.js). Same print look as the Shop band. */
export function paidProductAds(placement) {
  return productAdsFor(placement).map((ad) => `<section class="shop-band paid-ad" aria-label="Paid advertisement" data-campaign="${esc(ad.id)}">
    <header class="shop-head"><span class="label label-ad">Paid advertisement</span><h2 class="shop-title">${esc(ad.title)}</h2>
      <p class="shop-disclosure">From ${esc(ad.advertiser)} (${esc(ad.domain)}). Advertisers do not influence Boston Daily's news coverage.</p></header>
    <ul class="shop-row ${ad.items.length === 2 ? 'shop-row-2' : 'shop-row-3'}">${ad.items.map((it) => `<li class="shop-item">
      <a href="${esc(it.url)}" rel="sponsored noopener" target="_blank">
        ${it.image ? `<span class="shop-img"><img src="${esc(it.image)}" alt="${esc(it.name)}" loading="lazy" decoding="async"></span>` : ''}
        <span class="shop-name${it.image ? '' : ' shop-name-lg'}">${esc(it.name)}</span>
        ${it.note ? `<span class="${it.image ? 'shop-price' : 'shop-note'}">${esc(it.note)}</span>` : ''}
        <span class="shop-cta">${esc(it.cta || `Visit ${ad.domain}`)}</span>
      </a></li>`).join('')}</ul>
  </section>`).join('');
}

export function networkModule(businesses, network, { title = 'From our network' } = {}) {
  if (!businesses || !businesses.length) return '';
  return `<aside class="module module-network" aria-label="${esc(title)}">
    <header class="module-head"><h2 class="module-title">${esc(title)}</h2></header>
    <p class="module-disclosure">These businesses are part of the ${esc(network)} network.</p>
    <ul class="biz-list">${businesses.map((b) => `<li>
      <a href="/businesses/${esc(b.slug)}"><strong>${esc(b.name)}</strong></a>
      <span>${esc(b.short_description || '')}</span>
    </li>`).join('')}</ul>
    <a class="module-more" href="/businesses">All recommended businesses</a>
  </aside>`;
}

export function courseModule(courses, network, { title = 'Skill Center' } = {}) {
  if (!courses || !courses.length) return '';
  return `<aside class="module module-courses" aria-label="${esc(title)}">
    <header class="module-head"><h2 class="module-title">${esc(title)}</h2></header>
    <p class="module-disclosure">RealSkillSet is part of the ${esc(network)} network. Some courses are affiliate partners.</p>
    <ul class="course-list">${courses.map(courseItem).join('')}</ul>
    <a class="module-more" href="/courses">Visit the Skill Center</a>
  </aside>`;
}

export function courseItem(c) {
  const meta = [c.level, c.duration, c.format].filter(Boolean).map(esc).join(', ');
  return `<li class="course">
    <a href="/go/c/${esc(c.slug)}" rel="${c.type === 'affiliate' ? 'sponsored nofollow noopener' : 'noopener'}" target="_blank">
      <strong>${esc(c.title)}</strong>
      ${meta ? `<span class="course-meta">${meta}</span>` : ''}
      <span class="course-price">${c.price ? esc(money(c.price, c.currency)) : 'Free to start'}${c.type === 'affiliate' ? ' <span class="label label-commerce">Affiliate</span>' : ''}</span>
    </a>
  </li>`;
}

export function houseAd(site, kind = 'ADS', placement = null) {
  const ad = placement ? campaignFor(placement) : null;
  if (ad) {
    return `<aside class="module module-ad" aria-label="Advertisement" data-campaign="${esc(ad.id)}">
    <span class="label label-ad">Advertisement</span>
    <p class="ad-copy"><strong>${esc(ad.headline)}</strong><br>${esc(ad.copy)}</p>
    <a class="button" href="${esc(ad.url)}" rel="sponsored noopener" target="_blank">${esc(ad.cta)}</a>
    <p class="ad-copy" style="margin:.5rem 0 0;font-size:.75rem">From ${esc(ad.advertiser)}</p>
  </aside>`;
  }
  const subject = encodeURIComponent(`[${kind}] Advertising with ${site.name}`);
  return `<aside class="module module-ad" aria-label="Advertisement">
    <span class="label label-ad">Advertisement</span>
    <p class="ad-copy">Reach Boston Daily readers. Display, front-page, section and newsletter sponsorships.</p>
    <a class="button" href="mailto:${esc(site.email)}?subject=${subject}">Email us about advertising</a>
  </aside>`;
}

export function sourcesBlock(sources) {
  const pub = (sources || []).filter((s) => s.public && s.rights_type !== 'DISCOVERY_ONLY');
  if (!pub.length) return '';
  return `<section class="sources" aria-labelledby="sources-h">
    <h2 id="sources-h">Sources</h2>
    <ul>${pub.map((s) => `<li>${s.url ? `<a href="${esc(s.url)}" rel="noopener" target="_blank">${esc(s.title)}</a>` : esc(s.title)}${s.publisher ? `, ${esc(s.publisher)}` : ''}</li>`).join('')}</ul>
  </section>`;
}

export function noticesBlock(notices, tz) {
  if (!notices || !notices.length) return '';
  return `<section class="notices" aria-label="Updates and corrections">
    ${notices.map((n) => `<p class="notice notice-${esc(n.kind)}"><strong>${n.kind === 'correction' ? 'Correction' : 'Update'}, ${esc(formatDateTime(n.created_at, tz))}:</strong> ${esc(n.note)}</p>`).join('')}
  </section>`;
}

export function emptyState(message, action = '') {
  return `<div class="empty"><p>${esc(message)}</p>${action}</div>`;
}
