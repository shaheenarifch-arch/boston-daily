/**
 * Product catalog queries and the single upsert used by every feed (ingest API, Awin feeds, sync jobs).
 * Only data supplied by a feed/partner is stored and shown: no invented prices, discounts, ratings or stock.
 */
import { isHttpUrl, uid } from '../util.js';
import { guessSubcategory } from './taxonomy.js';

export const SOURCE_TYPES = ['affiliate', 'owned_inventory', 'partner_promotion', 'sponsored'];
export const PRODUCT_SELECT = 'p.*, m.name AS merchant_name, m.display_name_allowed, m.network';
const ACTIVE = "p.status = 'active' AND m.status = 'active'";

/** Verified discount: only when the feed supplied a previous price above the current price. */
export function discountOf(p) {
  if (p.price == null || p.previous_price == null || !(p.previous_price > p.price)) return null;
  return { previous: p.previous_price, pct: Math.round(((p.previous_price - p.price) / p.previous_price) * 100) };
}

export async function listProducts(db, f = {}) {
  const where = [ACTIVE];
  const binds = [];
  const inList = (col, list) => { where.push(`${col} IN (${list.map(() => '?').join(',')})`); binds.push(...list); };
  if (f.ids?.length) inList('p.id', f.ids);
  if (f.sections?.length) {
    const ph = f.sections.map(() => '?').join(',');
    where.push(`(p.section_slug IN (${ph}) OR (p.section_slug IS NULL AND m.section_slug IN (${ph})))`);
    binds.push(...f.sections, ...f.sections);
  }
  if (f.subcategory) { where.push('p.subcategory = ?'); binds.push(f.subcategory); }
  if (f.sourceTypes?.length) inList('p.source_type', f.sourceTypes);
  if (f.merchant) { where.push('m.id = ?'); binds.push(f.merchant); }
  if (f.deal) where.push('(p.is_deal = 1 OR (p.previous_price IS NOT NULL AND p.price IS NOT NULL AND p.previous_price > p.price))');
  if (f.editorsPick) where.push('p.editors_pick = 1');
  if (f.minPrice != null) { where.push('p.price >= ?'); binds.push(f.minPrice); }
  if (f.maxPrice != null) { where.push('p.price IS NOT NULL AND p.price <= ?'); binds.push(f.maxPrice); }
  if (f.withImage) where.push('p.image_url IS NOT NULL AND p.image_rights_ok = 1');
  if (f.terms?.length) {
    const parts = f.terms.map(() => "(LOWER(p.name) LIKE ? OR LOWER(COALESCE(p.brand,'')) LIKE ? OR LOWER(COALESCE(p.description,'')) LIKE ? OR LOWER(COALESCE(p.category,'')) LIKE ? OR LOWER(COALESCE(p.subcategory,'')) LIKE ?)");
    where.push(`(${parts.join(f.anyTerm ? ' OR ' : ' AND ')})`);
    for (const t of f.terms) { const like = `%${t.toLowerCase()}%`; binds.push(like, like, like, like, like); }
  }
  const order = {
    price_asc: 'p.price IS NULL, p.price ASC',
    price_desc: 'p.price DESC',
    rating: 'p.rating IS NULL, p.rating DESC, p.rating_count DESC',
    deal: '(CASE WHEN p.previous_price > p.price THEN (p.previous_price - p.price) / p.previous_price ELSE 0 END) DESC, p.is_deal DESC, p.updated_at DESC',
  }[f.sort] || 'p.editors_pick DESC, p.is_deal DESC, p.updated_at DESC';
  const { results } = await db.prepare(`SELECT ${PRODUCT_SELECT} FROM products p JOIN merchants m ON m.id = p.merchant_id
    WHERE ${where.join(' AND ')} ORDER BY ${order} LIMIT ?`).bind(...binds, Math.min(f.limit || 24, 120)).all();
  return results;
}

export async function getProduct(db, id) {
  return db.prepare(`SELECT ${PRODUCT_SELECT} FROM products p JOIN merchants m ON m.id = p.merchant_id WHERE p.id = ?`).bind(id).first();
}

export async function listPromotions(db, { sections = null, limit = 6 } = {}) {
  const now = new Date().toISOString();
  const where = ["status = 'active'", '(expires_at IS NULL OR expires_at > ?)', '(starts_at IS NULL OR starts_at <= ?)'];
  const binds = [now, now];
  if (sections?.length) { where.push(`(section_slug IN (${sections.map(() => '?').join(',')}) OR section_slug IS NULL)`); binds.push(...sections); }
  const { results } = await db.prepare(`SELECT * FROM promotions WHERE ${where.join(' AND ')} ORDER BY sponsored DESC, updated_at DESC LIMIT ?`).bind(...binds, limit).all();
  return results;
}

/** Facets for filters, computed from real data only. */
export async function productFacets(db, f = {}) {
  const base = f.deal ? " AND (p.is_deal = 1 OR (p.previous_price IS NOT NULL AND p.price IS NOT NULL AND p.previous_price > p.price))" : '';
  const [{ results: sections }, { results: merchants }, { results: types }] = await Promise.all([
    db.prepare(`SELECT COALESCE(p.section_slug, m.section_slug) AS slug, COUNT(*) AS n FROM products p JOIN merchants m ON m.id = p.merchant_id WHERE ${ACTIVE}${base} GROUP BY slug HAVING slug IS NOT NULL ORDER BY n DESC`).all(),
    db.prepare(`SELECT m.id, m.name, m.display_name_allowed, COUNT(*) AS n FROM products p JOIN merchants m ON m.id = p.merchant_id WHERE ${ACTIVE}${base} GROUP BY m.id ORDER BY m.name`).all(),
    db.prepare(`SELECT p.source_type AS type, COUNT(*) AS n FROM products p JOIN merchants m ON m.id = p.merchant_id WHERE ${ACTIVE}${base} GROUP BY p.source_type`).all(),
  ]);
  return { sections, merchants: merchants.filter((m) => m.display_name_allowed), types };
}

const num = (v) => (v == null || v === '' || Number.isNaN(Number(v)) ? null : Number(v));

/** One prepared upsert for a product row from any feed. */
export function productUpsert(db, merchantId, p, ts, sectionOk) {
  const availability = ['in_stock', 'out_of_stock', 'preorder', 'limited'].includes(p.availability) ? p.availability : 'in_stock';
  const sourceType = SOURCE_TYPES.includes(p.source_type) ? p.source_type : 'affiliate';
  const section = sectionOk(p.section);
  const price = num(p.price);
  const prev = num(p.previous_price);
  return db.prepare(`INSERT INTO products (id, merchant_id, external_id, name, description, image_url, image_rights_ok, price, currency, availability, deep_link, category, section_slug, is_deal, status,
      source_type, brand, product_url, previous_price, rating, rating_count, rating_source, subcategory, editorial_note, editors_pick, sponsor_name, stock_qty, variants, delivery_info, promotion, source, last_verified_at, created_at, updated_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
    ON CONFLICT(merchant_id, external_id) DO UPDATE SET name=excluded.name, description=excluded.description, image_url=excluded.image_url,
      image_rights_ok=excluded.image_rights_ok, price=excluded.price, currency=excluded.currency, availability=excluded.availability,
      deep_link=excluded.deep_link, category=excluded.category, section_slug=excluded.section_slug, is_deal=excluded.is_deal,
      source_type=excluded.source_type, brand=excluded.brand, product_url=excluded.product_url, previous_price=excluded.previous_price,
      rating=excluded.rating, rating_count=excluded.rating_count, rating_source=excluded.rating_source, subcategory=excluded.subcategory,
      editorial_note=COALESCE(excluded.editorial_note, products.editorial_note), editors_pick=MAX(products.editors_pick, excluded.editors_pick),
      sponsor_name=excluded.sponsor_name, stock_qty=excluded.stock_qty, variants=excluded.variants, delivery_info=excluded.delivery_info,
      promotion=excluded.promotion, source=excluded.source, last_verified_at=excluded.last_verified_at,
      status=CASE WHEN excluded.status = 'inactive' THEN 'inactive' WHEN products.status = 'broken_link' AND products.deep_link = excluded.deep_link THEN 'broken_link' ELSE 'active' END,
      updated_at=excluded.updated_at`)
    .bind(uid(), merchantId, String(p.external_id), String(p.name).slice(0, 200), p.description ? String(p.description).slice(0, 1500) : null,
      isHttpUrl(p.image_url) ? p.image_url : null, p.image_rights_ok ? 1 : 0, price, p.currency || 'USD', availability,
      p.deep_link, p.category || null, section, p.is_deal ? 1 : 0, availability === 'out_of_stock' && sourceType !== 'owned_inventory' ? 'inactive' : 'active',
      sourceType, p.brand ? String(p.brand).slice(0, 80) : null, isHttpUrl(p.product_url) ? p.product_url : null,
      prev != null && price != null && prev > price ? prev : null,
      p.rating_source ? num(p.rating) : null, p.rating_source ? num(p.rating_count) : null, p.rating_source ? String(p.rating_source).slice(0, 80) : null,
      p.subcategory || guessSubcategory(section, `${p.name} ${p.category || ''}`), p.editorial_note ? String(p.editorial_note).slice(0, 600) : null,
      p.editors_pick ? 1 : 0, sourceType === 'sponsored' ? (p.sponsor_name || null) : null, num(p.stock_qty),
      p.variants ? JSON.stringify(p.variants).slice(0, 2000) : null, p.delivery_info ? String(p.delivery_info).slice(0, 300) : null,
      p.promotion ? String(p.promotion).slice(0, 300) : null, p.source || null, ts, ts, ts);
}

export function promotionUpsert(db, pr, ts, sectionOk) {
  const id = pr.id || `promo-${String(pr.partner).toLowerCase().replace(/[^a-z0-9]+/g, '-')}-${String(pr.title).toLowerCase().replace(/[^a-z0-9]+/g, '-')}`.slice(0, 120);
  return db.prepare(`INSERT INTO promotions (id, partner, merchant_id, title, offer, terms, url, image_url, image_rights_ok, section_slug, sponsored, starts_at, expires_at, source, status, created_at, updated_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
    ON CONFLICT(id) DO UPDATE SET partner=excluded.partner, title=excluded.title, offer=excluded.offer, terms=excluded.terms, url=excluded.url,
      image_url=excluded.image_url, image_rights_ok=excluded.image_rights_ok, section_slug=excluded.section_slug, sponsored=excluded.sponsored,
      starts_at=excluded.starts_at, expires_at=excluded.expires_at, source=excluded.source, status=excluded.status, updated_at=excluded.updated_at`)
    .bind(id, String(pr.partner).slice(0, 120), pr.merchant_id || null, String(pr.title).slice(0, 200), pr.offer ? String(pr.offer).slice(0, 300) : null,
      pr.terms ? String(pr.terms).slice(0, 1000) : null, pr.url, isHttpUrl(pr.image_url) ? pr.image_url : null, pr.image_rights_ok ? 1 : 0,
      sectionOk(pr.section), pr.sponsored ? 1 : 0, pr.starts_at || null, pr.expires_at || null, pr.source || null,
      ['active', 'paused', 'expired'].includes(pr.status) ? pr.status : 'active', ts, ts);
}

export async function recordClick(db, itemType, itemId, placement, page) {
  await db.prepare('INSERT INTO commerce_clicks (id, item_type, item_id, placement, page, created_at) VALUES (?,?,?,?,?,?)')
    .bind(uid(), itemType, itemId, placement ? String(placement).slice(0, 60) : null, page ? String(page).slice(0, 200) : null, new Date().toISOString()).run();
}
