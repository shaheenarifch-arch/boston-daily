/**
 * Affiliate provider adapters. Each provider turns a partner feed into normalized product rows
 * that go through the same productUpsert as the ingest API. Configure feeds with the
 * AFFILIATE_FEEDS secret (JSON array), for example:
 *   [{"network":"awin","url":"https://productdata.awin.com/datafeed/download/apikey/.../fid/123/format/csv/...",
 *     "section":"home-living","source_type":"affiliate"}]
 * Awin feed URLs contain your API key, so keep them in a secret, never in the repo.
 */
import { isHttpUrl, nowIso, uid } from '../util.js';
import { productUpsert } from './catalog.js';

/** RFC 4180 CSV parser (handles quotes, commas and newlines inside fields). */
export function parseCsv(text) {
  const rows = [];
  let row = [];
  let field = '';
  let q = false;
  for (let i = 0; i < text.length; i++) {
    const c = text[i];
    if (q) {
      if (c === '"') { if (text[i + 1] === '"') { field += '"'; i++; } else q = false; } else field += c;
    } else if (c === '"') q = true;
    else if (c === ',') { row.push(field); field = ''; }
    else if (c === '\n' || c === '\r') { if (c === '\r' && text[i + 1] === '\n') i++; row.push(field); rows.push(row); row = []; field = ''; }
    else field += c;
  }
  if (field || row.length) { row.push(field); rows.push(row); }
  const [head, ...data] = rows.filter((r) => r.length > 1 || r[0]);
  if (!head) return [];
  const keys = head.map((h) => h.trim().toLowerCase());
  return data.map((r) => Object.fromEntries(keys.map((k, i) => [k, (r[i] ?? '').trim()])));
}

const n = (v) => (v === '' || v == null || Number.isNaN(Number(v)) ? null : Number(v));

export const PROVIDERS = {
  /** Awin "Create-a-Feed" CSV. Previous price uses rrp/store price only when the feed supplies it above the current price. */
  awin: {
    toProducts(rows, feed) {
      return rows.map((r) => {
        const price = n(r.search_price) ?? n(r.store_price);
        const prev = [n(r.rrp_price), n(r.product_price_old), n(r.store_price)].find((v) => v != null && price != null && v > price) ?? null;
        return {
          network: 'awin',
          network_merchant_id: r.merchant_id,
          merchant_name: r.merchant_name,
          external_id: r.aw_product_id || r.merchant_product_id,
          name: r.product_name,
          description: r.description || r.product_short_description || null,
          brand: r.brand_name || null,
          image_url: r.merchant_image_url || r.aw_image_url || r.large_image || null,
          image_rights_ok: true, // affiliate programmes license product imagery for promotion
          price,
          previous_price: prev,
          currency: r.currency || 'USD',
          availability: /^(0|no|false|out)/i.test(r.in_stock || '') ? 'out_of_stock' : 'in_stock',
          deep_link: r.aw_deep_link,
          product_url: r.merchant_deep_link || null,
          category: r.merchant_category || r.category_name || null,
          section: feed.section || null,
          source_type: feed.source_type || 'affiliate',
          delivery_info: r.delivery_cost ? `Delivery: ${r.delivery_cost} ${r.currency || ''}`.trim() : null,
          promotion: r.promotional_text || null,
          source: `awin-feed:${feed.name || feed.section || 'default'}`,
        };
      }).filter((p) => p.external_id && p.name && isHttpUrl(p.deep_link) && p.network_merchant_id);
    },
  },
};

async function fetchText(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Feed ${res.status}`);
  const gz = /gzip/.test(res.headers.get('content-type') || '') || /\.gz(\?|$)|compression\/gzip/.test(url);
  if (gz && typeof DecompressionStream !== 'undefined') return new Response(res.body.pipeThrough(new DecompressionStream('gzip'))).text();
  return res.text();
}

/** Pull every configured feed and upsert merchants + products. Returns a summary. */
export async function syncAffiliateFeeds(env, { maxPerFeed = 2000 } = {}) {
  if (!env.AFFILIATE_FEEDS) return { configured: false };
  const db = env.DB;
  const feeds = JSON.parse(env.AFFILIATE_FEEDS);
  const { results: sectionRows } = await db.prepare('SELECT slug, commerce_allowed FROM sections WHERE active = 1').all();
  const ok = new Set(sectionRows.filter((s) => s.commerce_allowed).map((s) => s.slug));
  const pick = (x) => (x && ok.has(x) ? x : null);
  const summary = [];
  for (const feed of feeds) {
    const provider = PROVIDERS[feed.network || 'awin'];
    if (!provider || !isHttpUrl(feed.url)) { summary.push({ feed: feed.name, error: 'unknown provider or bad url' }); continue; }
    try {
      const products = provider.toProducts(parseCsv(await fetchText(feed.url)), feed).slice(0, maxPerFeed);
      const ts = nowIso();
      const merchantIds = new Map();
      for (const p of products) {
        const key = `${p.network}|${p.network_merchant_id}`;
        if (merchantIds.has(key)) continue;
        const existing = await db.prepare('SELECT id FROM merchants WHERE network = ? AND network_merchant_id = ?').bind(p.network, String(p.network_merchant_id)).first();
        const id = existing?.id || uid();
        if (!existing) {
          await db.prepare(`INSERT INTO merchants (id, name, network, network_merchant_id, display_name_allowed, section_slug, status, created_at, updated_at) VALUES (?,?,?,?,1,?,'active',?,?)`)
            .bind(id, p.merchant_name || `Merchant ${p.network_merchant_id}`, p.network, String(p.network_merchant_id), pick(feed.section), ts, ts).run();
        }
        merchantIds.set(key, id);
      }
      const stmts = products.map((p) => productUpsert(db, merchantIds.get(`${p.network}|${p.network_merchant_id}`), p, ts, pick));
      for (let i = 0; i < stmts.length; i += 50) await db.batch(stmts.slice(i, i + 50));
      summary.push({ feed: feed.name || feed.section, products: stmts.length });
    } catch (e) {
      summary.push({ feed: feed.name || feed.section, error: e.message });
    }
  }
  await db.prepare('INSERT INTO ingest_log (id, source, ref, status, detail, created_at) VALUES (?,?,?,?,?,?)')
    .bind(uid(), 'affiliate-feeds', null, 'synced', JSON.stringify(summary).slice(0, 1000), nowIso()).run().catch(() => {});
  return { configured: true, summary };
}
