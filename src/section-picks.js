import { esc } from './util.js';

// "Special Picks": one or two hand-picked cards per section, kept small on purpose.
// An item is either an affiliate product (by id, linked through /go/p) or a site in the
// GetServices.ai network (house placement, linked directly). Real images only.
const UTM = 'utm_source=bostondaily&utm_medium=special_picks';
// GetServices.ai products shown beside ATLAS on Technology and AI. Images are real screenshots of each site.
function getservicesFamily(campaign) {
  const q = `${UTM}&utm_campaign=${campaign}`;
  return [
    { house: { name: 'GetServices AI Studio', url: `https://studio.getservices.ai/?${q}`, image: '/img/picks/studio.webp',
      desc: 'ROMEO builds apps and websites, runs ATLAS AEO, writes content and automates daily work.', cta: 'Open Studio' } },
    { house: { name: 'BLACK', url: `https://black.getservices.ai/?${q}`, image: '/img/picks/black.webp',
      desc: 'Executive AI that routes one prompt across GPT, Claude, Gemini, Grok and Perplexity.', cta: 'Unlock BLACK' } },
    { house: { name: 'itsmPRO', url: `https://itsm.getservices.ai/?${q}`, image: '/img/picks/itsm.webp',
      desc: 'AI-native IT service management you run by words, built for small and regulated teams.', cta: 'Request early access' } },
    { house: { name: 'AI Pods', url: `https://getservices.ai/ai-pods?${q}`, image: '/img/picks/ai-pods.webp',
      desc: 'Subscribe to outcomes: tax, marketing, scheduling, customer success and security pods.', cta: 'View all pods' } },
  ];
}
const MAX_CARDS = { technology: 5, ai: 5 }; // other sections stay at 2
export const SECTION_PICKS = {
  business: [
    { house: { name: 'BusinessBuy', url: `https://businessbuy.site/?${UTM}&utm_campaign=business`, image: 'https://businessbuy.site/hero-businesses.webp',
      desc: 'Businesses for sale, valuation help and step-by-step acquisition guides.', cta: 'Visit BusinessBuy' } },
  ],
  technology: [
    { house: { name: 'ATLAS AEO', url: `https://app.getservices.ai/?${UTM}&utm_campaign=technology`, image: 'https://app.getservices.ai/og-image.jpg',
      desc: 'Free AI search visibility scan: see whether ChatGPT, Perplexity and Google AI cite your business.', cta: 'Run a free scan' } },
    ...getservicesFamily('technology'),
  ],
  ai: [
    { house: { name: 'ATLAS AEO', url: `https://app.getservices.ai/?${UTM}&utm_campaign=ai`, image: 'https://app.getservices.ai/og-image.jpg',
      desc: 'Answer-engine optimization from GetServices.ai: audits, competitor tracking and AI writing tools.', cta: 'Run a free scan' } },
    ...getservicesFamily('ai'),
  ],
  lifestyle: [
    { product: 'p-40882-fb227d310d' }, // Bedsure 6-Piece Washed Cotton Sheet Set (home)
    { product: 'p-95201-8c8424bdef' }, // Giftlab Custom Name Necklace (lifestyle)
  ],
  auto: [
    { house: { name: 'DriveZone Nexus', url: `https://drivezone.nexus/?${UTM}&utm_campaign=auto`, image: 'https://drivezone.nexus/drivezone-hero.jpg',
      desc: 'CarPlay, Android Auto and in-car electronics, with buying guides.', cta: 'Visit DriveZone' } },
    { product: 'p-32471-21de833194' }, // Eonon 10.1-inch CarPlay stereo
  ],
};

export async function sectionPicksProducts(db, slug) {
  const ids = (SECTION_PICKS[slug] || []).filter((i) => i.product).map((i) => i.product);
  if (!ids.length) return new Map();
  const { results } = await db.prepare(`SELECT p.*, m.name AS merchant_name FROM products p JOIN merchants m ON m.id = p.merchant_id
    WHERE p.status = 'active' AND m.status = 'active' AND p.image_rights_ok = 1 AND p.id IN (${ids.map(() => '?').join(',')})`).bind(...ids).all();
  return new Map(results.map((p) => [p.id, p]));
}

export function sectionPicks(slug, byId) {
  const cards = (SECTION_PICKS[slug] || []).map((i) => {
    if (i.house) return { ...i.house, href: i.house.url, rel: 'sponsored noopener' };
    const p = byId.get(i.product);
    return p && p.image_url ? { name: p.name, desc: p.description || p.merchant_name, image: p.image_url, href: `/go/p/${p.id}`, rel: 'sponsored nofollow noopener', cta: 'See offer' } : null;
  }).filter(Boolean).slice(0, MAX_CARDS[slug] || 2);
  if (!cards.length) return '';
  return `<section class="special-picks" aria-label="Special Picks">
    <header class="sp-head"><h2 class="sp-title">Special Picks</h2><span class="label label-ad">Sponsored</span></header>
    <ul class="sp-grid">${cards.map((c) => `<li><a class="sp-card" href="${esc(c.href)}" rel="${c.rel}" target="_blank">
      <span class="sp-img"><img src="${esc(c.image)}" alt="${esc(c.name)}" loading="lazy" decoding="async"></span>
      <span class="sp-body"><span class="sp-name">${esc(c.name)}</span>${c.desc ? `<span class="sp-desc">${esc(c.desc)}</span>` : ''}<span class="sp-cta">${esc(c.cta)} →</span></span>
    </a></li>`).join('')}</ul>
    <p class="sp-note">Sponsored placements and affiliate links; we may earn a commission. <a href="/standards">How we label advertising</a></p>
  </section>`;
}
