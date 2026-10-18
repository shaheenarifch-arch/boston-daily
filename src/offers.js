/**
 * Partner Offers: products from every affiliate merchant, chosen for the category, topic and
 * region of the current page. Relevance decides the order, never commission.
 *
 * Scoring (per product):
 *   exact subcategory +100 · primary category +70 · each matching approved tag +15
 *   region match +20 · in stock +15 · active promotion +10 · editorially featured +10
 * Excluded: expired promotion, out of stock, no image or link, region not eligible,
 * and anything on a sensitive page unless an editor picked it for that page and approved it
 * for sensitive pages. Products that only match on flags never fill the module.
 */

/** Product keywords per category (the brief's mappings). A section's own offer_tags override these. */
export const CATEGORY_TAGS = {
  technology: ['phones', 'phone', 'laptops', 'laptop', 'accessories', 'software', 'cybersecurity', 'tech', 'gadgets', 'electronics'],
  ai: ['software', 'ai', 'laptops', 'productivity', 'tech'],
  science: ['books', 'telescopes', 'learning', 'stem'],
  business: ['business software', 'accounting', 'office', 'productivity', 'business'],
  travel: ['luggage', 'travel accessories', 'travel insurance', 'insurance', 'booking', 'travel', 'passes', 'flights', 'hotels'],
  'health-wellness': ['fitness equipment', 'fitness', 'treadmill', 'wellness', 'health services', 'sleep'],
  'home-living': ['appliances', 'furniture', 'tools', 'smart home', 'home', 'decor'],
  garden: ['garden', 'seeds', 'tools', 'outdoor'],
  auto: ['vehicle accessories', 'car accessories', 'car', 'maintenance tools', 'breakdown cover', 'automotive', 'car tech'],
  'education-careers': ['books', 'courses', 'stationery', 'learning technology', 'education', 'learning'],
  'us-sports': ['sports equipment', 'apparel', 'fitness accessories', 'sports', 'fitness', 'outdoor'],
  outdoor: ['outdoor', 'camping', 'hiking', 'bike racks', 'cargo carriers', 'kayak', 'sports equipment'],
  entertainment: ['streaming', 'books', 'games', 'audio', 'headphones', 'speakers'],
  'beauty-hair': ['beauty', 'skincare', 'hair', 'wigs', 'hair care', 'makeup'],
  'fashion-style': ['fashion', 'apparel', 'clothing', 'shoes', 'jewelry', 'accessories'],
  'food-culture': ['food', 'kitchen', 'cookware', 'groceries'],
  pets: ['pets', 'pet supplies', 'dog', 'cat'],
  lifestyle: ['home', 'fashion', 'beauty', 'gifts', 'lifestyle'],
  deals: ['deals'],
  uk: ['uk'],
};

// Never targeted automatically, whatever their commerce setting (the brief's sensitive list).
const SENSITIVE_SECTIONS = new Set(['us-politics', 'white-house', 'congress', 'courts', 'elections', 'states', 'policy', 'opinion', 'columns', 'crime', 'emergencies', 'obituaries']);
const UK_SECTIONS = new Set(['uk']);
export const OFFER_LIMIT = 4; // desktop; CSS shows 3 on tablet and 2 on mobile

const list = (v) => String(v || '').split(',').map((x) => x.trim().toLowerCase()).filter(Boolean);
const STOP = new Set('the a an and or of to in on for with at by from is are was were be this that these those it its as into over after before new how why what your you our we they he she his her their about more most best'.split(' '));
export const keywordsOf = (...texts) => new Set(texts.join(' ').toLowerCase().replace(/[^a-z0-9\s-]/g, ' ').split(/\s+/).filter((w) => w.length > 2 && !STOP.has(w)));

/**
 * The page the module sits on.
 * section: { slug, parent?: { slug }, commerce_allowed, partner_offers, offer_tags }
 * story (optional): { sensitive, partner_offers, partner_offer_ids, headline, dek }
 */
export function pageContext(section, story = null) {
  const slug = section?.slug || null;
  const parent = section?.parent?.slug || section?.parent_slug || null;
  const sensitive = !section || !section.commerce_allowed || (section.parent && !section.parent.commerce_allowed)
    || SENSITIVE_SECTIONS.has(slug) || SENSITIVE_SECTIONS.has(parent) || Boolean(story?.sensitive);
  const disabled = section?.partner_offers === 0 || section?.parent?.partner_offers === 0 || story?.partner_offers === 0;
  const tags = new Set([...(section?.offer_tags ? list(section.offer_tags) : CATEGORY_TAGS[slug] || []), ...(parent ? (section?.parent?.offer_tags ? list(section.parent.offer_tags) : CATEGORY_TAGS[parent] || []) : [])]);
  const region = UK_SECTIONS.has(slug) || UK_SECTIONS.has(parent) ? 'UK' : 'US';
  const regional = UK_SECTIONS.has(slug) || UK_SECTIONS.has(parent);
  return { slug, parent, sensitive, disabled, tags, words: story ? keywordsOf(story.headline || '', story.dek || '') : new Set(), region, regional, picked: list(story?.partner_offer_ids) };
}

const today = (now) => now.toISOString().slice(0, 10);
const promoActive = (p, now) => Boolean(p.promo_label || p.promo_end) && (!p.promo_start || p.promo_start <= today(now)) && (!p.promo_end || p.promo_end >= today(now));

/** Score one product for a page; null when it must not appear. */
export function scoreProduct(p, ctx, now = new Date()) {
  if (!p.image_url || !p.image_rights_ok || !p.deep_link) return null;
  if (p.availability && /out[_\s-]?of[_\s-]?stock|unavailable|discontinued/i.test(p.availability)) return null;
  if (p.promo_end && p.promo_end < today(now)) return null;
  const regions = list(p.regions).map((r) => r.toUpperCase());
  if (regions.length && !regions.includes(ctx.region) && !regions.includes('ALL')) return null;
  const manual = ctx.picked.includes(String(p.id).toLowerCase());
  if (ctx.sensitive && !(manual && p.sensitive_ok)) return null;

  const sections = new Set([p.section_slug, ...list(p.extra_sections)].filter(Boolean));
  const merchantSection = p.merchant_section || null;
  let relevance = 0;
  const page = [ctx.slug, ctx.parent].filter(Boolean);
  if (ctx.parent && sections.has(ctx.slug)) relevance += 100;                          // exact subcategory
  else if (page.some((x) => sections.has(x)) || (!sections.size && merchantSection && page.includes(merchantSection))) relevance += 70; // primary category
  // Regional pages (UK): offers made available for that region are the page's own category.
  if (!relevance && ctx.regional && regions.includes(ctx.region)) relevance += 70;
  const ptags = new Set([...list(p.tags), ...list(p.category)]);
  let tagHits = 0;
  for (const t of ptags) if (ctx.tags.has(t) || ctx.words.has(t)) tagHits++;
  relevance += 15 * tagHits;
  // Approved site-wide products (editor-featured, no category) may appear when nothing more specific fits.
  const siteWide = !relevance && p.featured && !sections.size && !merchantSection;
  if (!relevance && !siteWide && !manual) return null;

  let score = relevance;
  if (regions.length && regions.includes(ctx.region)) score += 20;
  if (!p.availability || /in[_\s-]?stock|available/i.test(p.availability)) score += 15;
  if (promoActive(p, now)) score += 10;
  if (p.featured) score += 10;
  if (manual) score += 1000; // the editor's choice for this page comes first
  return { score, relevance, siteWide, manual };
}

/** Choose the products for a page: relevance first; featured and recency only break ties. */
export function selectOffers(products, ctx, now = new Date(), limit = OFFER_LIMIT) {
  if (ctx.disabled) return [];
  if (ctx.sensitive && !ctx.picked.length) return [];
  const seen = new Set();
  const scored = [];
  for (const p of products) {
    if (seen.has(p.id)) continue;
    seen.add(p.id);
    const s = scoreProduct(p, ctx, now);
    if (s) scored.push({ ...p, _score: s.score, _relevance: s.relevance, _siteWide: s.siteWide, _manual: s.manual });
  }
  // Site-wide products only fill in when there are not enough category matches.
  const specific = scored.filter((p) => !p._siteWide);
  const pool = specific.length >= 2 ? specific : scored;
  pool.sort((a, b) => b._score - a._score || (b.featured || 0) - (a.featured || 0) || String(b.updated_at || '').localeCompare(String(a.updated_at || '')));
  const top = pool.slice(0, limit);
  // Fewer than two: show one only if it is a strong category match; otherwise hide.
  // An editor's pick for this page counts as a strong match.
  if (top.length < 2) return top.length && (top[0]._relevance >= 70 || top[0]._manual) ? top : [];
  return top;
}

/** Candidate products for a page: every active product from every active merchant. */
export async function offerCandidates(db, limit = 400) {
  const { results } = await db.prepare(`SELECT p.*, m.name AS merchant_name, m.display_name_allowed, m.section_slug AS merchant_section
    FROM products p JOIN merchants m ON m.id = p.merchant_id
    WHERE p.status = 'active' AND m.status = 'active' AND p.image_url IS NOT NULL AND p.image_rights_ok = 1
    ORDER BY p.featured DESC, p.updated_at DESC LIMIT ?`).bind(limit).all();
  return results || [];
}

// Small per-isolate cache: candidates change with the merchant sync, not per request.
let cache = { at: 0, rows: null };
export async function cachedCandidates(db, ttlMs = 5 * 60 * 1000) {
  if (cache.rows && Date.now() - cache.at < ttlMs) return cache.rows;
  const rows = await offerCandidates(db);
  cache = { at: Date.now(), rows };
  return rows;
}
export function clearOfferCache() { cache = { at: 0, rows: null }; }

/** Count impressions for the shown products (page category only). */
export function recordImpressions(db, ctx, offers, waitUntil) {
  if (!offers.length || !waitUntil) return;
  const day = new Date().toISOString().slice(0, 10);
  const section = ctx.slug || 'unknown';
  waitUntil(db.batch(offers.map((p) => db.prepare(
    `INSERT INTO offer_stats (day, page_section, product_id, impressions) VALUES (?, ?, ?, 1)
     ON CONFLICT(day, page_section, product_id) DO UPDATE SET impressions = impressions + 1`).bind(day, section, p.id))).catch(() => {}));
}

/** Count a click from a Partner Offers card (from /go/p/:id?po=<section>). */
export function recordClick(db, productId, section, waitUntil) {
  if (!waitUntil || !/^[a-z0-9-]{1,60}$/.test(section || '')) return;
  const day = new Date().toISOString().slice(0, 10);
  waitUntil(db.prepare(`INSERT INTO offer_stats (day, page_section, product_id, clicks) VALUES (?, ?, ?, 1)
    ON CONFLICT(day, page_section, product_id) DO UPDATE SET clicks = clicks + 1`).bind(day, section, productId).run().catch(() => {}));
}
