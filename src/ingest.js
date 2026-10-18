/**
 * Ingestion adapters. All callers are automated systems authenticated by HMAC
 * (X-Signature: sha256=<hmac of raw body>). They can create and update records,
 * but they can never approve newsroom content.
 */
import { uid, nowIso, slugify, isHttpUrl, json, errorJson } from './util.js';
import { htmlToMarkdown, excerpt } from './markdown.js';
import { approve, publish, approvalProblems, requiresHuman, loadStoryContext } from './lifecycle.js';

const SYSTEM_GATES = { name: 'system:commerce-gates', kind: 'system' };
const DEFAULT_AFFILIATE_DISCLOSURE =
  'This article contains affiliate links. Boston Daily and the GetServices.ai network may earn a commission if you buy through them, at no extra cost to you.';

async function log(db, source, ref, result, detail) {
  await db.prepare('INSERT INTO ingest_log (id, source, ref, result, detail, created_at) VALUES (?,?,?,?,?,?)')
    .bind(uid(), source, ref || null, result, detail ? String(detail).slice(0, 2000) : null, nowIso()).run();
}

async function uniqueSlug(db, base) {
  let slug = slugify(base);
  for (let i = 0; i < 20; i++) {
    const candidate = i === 0 ? slug : `${slug}-${i + 1}`;
    const hit = await db.prepare('SELECT 1 FROM stories WHERE slug = ?').bind(candidate).first();
    if (!hit) return candidate;
  }
  return `${slug}-${uid().slice(0, 8)}`;
}

async function sectionFor(db, payload) {
  if (payload.section) {
    const s = await db.prepare('SELECT slug FROM sections WHERE slug = ? AND active = 1').bind(payload.section).first();
    if (s) return s.slug;
  }
  if (payload.site) {
    const domain = String(payload.site).replace(/^https?:\/\//, '').replace(/\/.*$/, '').toLowerCase();
    const b = await db.prepare('SELECT section_slug FROM businesses WHERE lower(domain) = ? AND section_slug IS NOT NULL').bind(domain).first();
    if (b) return b.section_slug;
  }
  return 'deals';
}

/**
 * Blog bot (seo-controller) → partner lane.
 * Payload: { site, repo, path, sha, title, dek?, body_markdown? | body_html?, section?,
 *            hero_image_url?, hero_image_rights?, author?, reviewer?, disclosure_text?, sensitive? }
 */
export async function ingestBlogPost(env, payload) {
  const db = env.DB;
  const ref = [payload.repo, payload.path].filter(Boolean).join('/') + (payload.sha ? `@${payload.sha}` : '');
  if (!payload.title || !(payload.body_markdown || payload.body_html)) {
    await log(db, 'seo-controller', ref, 'rejected', 'Missing title or body');
    return errorJson('title and body_markdown or body_html are required', 422);
  }
  const refKey = [payload.repo, payload.path].filter(Boolean).join('/');
  if (refKey) {
    const dup = await db.prepare("SELECT id, status FROM stories WHERE source_system = 'seo-controller' AND (source_ref = ? OR substr(source_ref, 1, ?) = ?)").bind(refKey, refKey.length + 1, `${refKey}@`).first();
    if (dup) {
      await log(db, 'seo-controller', ref, 'duplicate', `Already ingested as ${dup.id} (${dup.status})`);
      return json({ ok: true, duplicate: true, id: dup.id, status: dup.status });
    }
  }

  const body = payload.body_markdown ? String(payload.body_markdown) : htmlToMarkdown(payload.body_html);
  const section = await sectionFor(db, payload);
  let heroUrl = isHttpUrl(payload.hero_image_url) ? payload.hero_image_url : null;
  const allowedRights = ['licensed', 'owned', 'public_domain', 'permitted_release'];
  let heroRights = allowedRights.includes(payload.hero_image_rights) ? payload.hero_image_rights : null;
  const notes = [];
  if (heroUrl && !heroRights) { notes.push('Hero image dropped: no usage rights declared.'); heroUrl = null; }

  const id = uid();
  const ts = nowIso();
  const slug = await uniqueSlug(db, payload.title);
  const author = payload.author && !/boston daily|staff|newsroom/i.test(payload.author) ? payload.author : `${payload.site || 'Partner'} editors`;

  await db.batch([
    db.prepare(`INSERT INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, credited_reviewer,
        hero_image_url, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, created_by, created_at, updated_at)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`)
      .bind(id, slug, 'partner_commerce', 'blog_post', section, 'EDITORIAL_REVIEW', payload.sensitive ? 1 : 0,
        String(payload.title).slice(0, 220), payload.dek ? String(payload.dek).slice(0, 400) : excerpt(body, 200), body, author,
        payload.reviewer || null, heroUrl, heroRights, 'Affiliate', payload.disclosure_text || DEFAULT_AFFILIATE_DISCLOSURE,
        'seo-controller', ref || null, 'system:seo-controller', ts, ts),
    db.prepare('INSERT INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES (?,?,?,?,?,?,?)')
      .bind(uid(), id, null, 'EDITORIAL_REVIEW', 'system:seo-controller', `Ingested from ${payload.site || 'blog bot'}`, ts),
  ]);

  return gateAndMaybePublish(env, id, 'seo-controller', ref, notes);
}

/** Run the mandatory gates; auto-publish only when allowed and every gate passes. */
async function gateAndMaybePublish(env, id, source, ref, notes = []) {
  const db = env.DB;
  const ctx = await loadStoryContext(db, id);
  const problems = approvalProblems(ctx.story, ctx.section, ctx.sources, SYSTEM_GATES);
  const autoOn = String(env.AUTO_PUBLISH_COMMERCE || 'false') === 'true';
  const humanNeeded = requiresHuman(ctx.story, ctx.section);

  if (!autoOn || humanNeeded || problems.length) {
    const reason = !autoOn ? 'Auto-publish is off.' : humanNeeded ? 'Section or story needs human approval.' : 'Policy gates failed.';
    await log(db, source, ref, 'queued', [reason, ...problems, ...notes].join(' '));
    return json({ ok: true, id, status: 'EDITORIAL_REVIEW', queued: true, reason, problems, notes });
  }
  try {
    await approve(db, id, SYSTEM_GATES, 'All commerce policy gates passed');
    const published = await publish(db, id, SYSTEM_GATES, { approverActor: SYSTEM_GATES });
    await log(db, source, ref, 'published', notes.join(' ') || null);
    return json({ ok: true, id, slug: published.slug, status: published.status, notes });
  } catch (err) {
    await log(db, source, ref, 'queued', `${err.message} ${(err.problems || []).join(' ')}`);
    return json({ ok: true, id, status: 'EDITORIAL_REVIEW', queued: true, reason: err.message, problems: err.problems || [] });
  }
}

/**
 * Merchant + product sync from the master affiliate database.
 * Payload: { full_sync?: bool, merchants: [...], products: [...] }
 * merchants: { network, network_merchant_id, name, publisher_account_id?, display_name_allowed?, category?, section?, website?, status? }
 * products:  { network, network_merchant_id, external_id, name, deep_link, description?, image_url?, image_rights_ok?,
 *              price?, currency?, availability?, category?, section?, is_deal? }
 */
export async function ingestProducts(env, payload) {
  const db = env.DB;
  const ts = nowIso();
  const merchants = Array.isArray(payload.merchants) ? payload.merchants : [];
  const products = Array.isArray(payload.products) ? payload.products : [];
  const { results: sectionRows } = await db.prepare('SELECT slug, commerce_allowed FROM sections WHERE active = 1').all();
  const commerceSections = new Set(sectionRows.filter((s) => s.commerce_allowed).map((s) => s.slug));
  const pickSection = (s) => (s && commerceSections.has(s) ? s : null);

  const merchantIds = new Map(); // key network|nmid -> id
  const errors = [];
  const stmts = [];

  for (const m of merchants) {
    if (!m.name || !m.network_merchant_id) { errors.push(`Merchant missing name or network_merchant_id: ${JSON.stringify(m).slice(0, 120)}`); continue; }
    const network = (m.network || 'awin').toLowerCase();
    const key = `${network}|${m.network_merchant_id}`;
    const existing = await db.prepare('SELECT id FROM merchants WHERE network = ? AND network_merchant_id = ?').bind(network, String(m.network_merchant_id)).first();
    const id = existing?.id || uid();
    merchantIds.set(key, id);
    const status = ['active', 'paused', 'removed'].includes(m.status) ? m.status : 'active';
    stmts.push(db.prepare(`INSERT INTO merchants (id, name, network, network_merchant_id, publisher_account_id, display_name_allowed, category, section_slug, website, status, created_at, updated_at)
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
      ON CONFLICT(id) DO UPDATE SET name=excluded.name, publisher_account_id=excluded.publisher_account_id, display_name_allowed=excluded.display_name_allowed,
        category=excluded.category, section_slug=excluded.section_slug, website=excluded.website, status=excluded.status, updated_at=excluded.updated_at`)
      .bind(id, String(m.name).slice(0, 160), network, String(m.network_merchant_id), m.publisher_account_id ? String(m.publisher_account_id) : null,
        m.display_name_allowed === false || m.display_name_allowed === 0 ? 0 : 1, m.category || null, pickSection(m.section), isHttpUrl(m.website) ? m.website : null, status, ts, ts));
  }
  if (stmts.length) await db.batch(stmts);

  let upserted = 0;
  const seen = new Map(); // merchantId -> Set(external_id)
  const productStmts = [];
  for (const p of products) {
    const network = (p.network || 'awin').toLowerCase();
    const key = `${network}|${p.network_merchant_id}`;
    let merchantId = merchantIds.get(key);
    if (!merchantId) {
      const row = await db.prepare('SELECT id FROM merchants WHERE network = ? AND network_merchant_id = ?').bind(network, String(p.network_merchant_id)).first();
      merchantId = row?.id;
    }
    if (!merchantId) { errors.push(`Unknown merchant for product ${p.external_id}`); continue; }
    if (!p.external_id || !p.name) { errors.push(`Product missing external_id or name (merchant ${p.network_merchant_id})`); continue; }
    if (!isHttpUrl(p.deep_link)) { errors.push(`Product ${p.external_id}: deep_link is not a valid URL`); continue; }
    if (!seen.has(merchantId)) seen.set(merchantId, new Set());
    seen.get(merchantId).add(String(p.external_id));
    const availability = p.availability || 'in_stock';
    productStmts.push(db.prepare(`INSERT INTO products (id, merchant_id, external_id, name, description, image_url, image_rights_ok, price, currency, availability, deep_link, category, section_slug, is_deal, status, created_at, updated_at)
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      ON CONFLICT(merchant_id, external_id) DO UPDATE SET name=excluded.name, description=excluded.description, image_url=excluded.image_url,
        image_rights_ok=excluded.image_rights_ok, price=excluded.price, currency=excluded.currency, availability=excluded.availability,
        deep_link=excluded.deep_link, category=excluded.category, section_slug=excluded.section_slug, is_deal=excluded.is_deal,
        status=CASE WHEN excluded.status = 'inactive' THEN 'inactive' WHEN products.status = 'broken_link' AND products.deep_link = excluded.deep_link THEN 'broken_link' ELSE 'active' END,
        updated_at=excluded.updated_at`)
      .bind(uid(), merchantId, String(p.external_id), String(p.name).slice(0, 200), p.description ? String(p.description).slice(0, 1200) : null,
        isHttpUrl(p.image_url) ? p.image_url : null, p.image_rights_ok ? 1 : 0, p.price != null && p.price !== '' ? Number(p.price) : null,
        p.currency || 'USD', availability, p.deep_link, p.category || null, pickSection(p.section), p.is_deal ? 1 : 0,
        availability === 'out_of_stock' ? 'inactive' : 'active', ts, ts));
    upserted++;
  }
  for (let i = 0; i < productStmts.length; i += 50) await db.batch(productStmts.slice(i, i + 50));

  let deactivated = 0;
  if (payload.full_sync) {
    // Merchants absent from a full sync are removed; their products go inactive.
    const presentMerchants = [...merchantIds.values()];
    const placeholders = presentMerchants.map(() => '?').join(',') || "''";
    const r1 = await db.prepare(`UPDATE merchants SET status = 'removed', updated_at = ? WHERE status != 'removed' AND id NOT IN (${placeholders})`).bind(ts, ...presentMerchants).run();
    await db.prepare("UPDATE products SET status = 'inactive', updated_at = ? WHERE merchant_id IN (SELECT id FROM merchants WHERE status != 'active') AND status != 'inactive'").bind(ts).run();
    for (const [merchantId, ids] of seen) {
      const list = [...ids];
      const ph = list.map(() => '?').join(',');
      const r = await db.prepare(`UPDATE products SET status = 'inactive', updated_at = ? WHERE merchant_id = ? AND status = 'active' AND external_id NOT IN (${ph})`).bind(ts, merchantId, ...list).run();
      deactivated += r.meta?.changes || 0;
    }
    deactivated += r1.meta?.changes || 0;
  }

  await log(db, 'merchant-sync', payload.sync_id || null, errors.length ? 'upserted_with_errors' : 'upserted',
    `${merchantIds.size} merchants, ${upserted} products, ${deactivated} deactivated${errors.length ? `; errors: ${errors.slice(0, 10).join(' | ')}` : ''}`);
  return json({ ok: true, merchants: merchantIds.size, products: upserted, deactivated, errors });
}

/** Business registry upsert. Payload: { businesses: [{ slug, name, domain, group, section, short_description, ... }] } */
export async function ingestBusinesses(env, payload) {
  const db = env.DB;
  const ts = nowIso();
  const list = Array.isArray(payload.businesses) ? payload.businesses : [];
  const stmts = [];
  const errors = [];
  for (const b of list) {
    if (!b.name) { errors.push('Business missing name'); continue; }
    const slug = slugify(b.slug || b.name);
    stmts.push(db.prepare(`INSERT INTO businesses (id, slug, name, domain, logo_url, grp, section_slug, short_description, long_description, owned_by_network, paid_listing, featured, sort_order, status, created_at, updated_at)
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      ON CONFLICT(slug) DO UPDATE SET name=excluded.name, domain=excluded.domain, logo_url=COALESCE(excluded.logo_url, businesses.logo_url), grp=excluded.grp,
        section_slug=excluded.section_slug, short_description=excluded.short_description, long_description=COALESCE(excluded.long_description, businesses.long_description),
        owned_by_network=excluded.owned_by_network, paid_listing=excluded.paid_listing, updated_at=excluded.updated_at`)
      .bind(uid(), slug, String(b.name).slice(0, 120), b.domain || null, isHttpUrl(b.logo_url) ? b.logo_url : null, b.group || null, b.section || null,
        b.short_description || null, b.long_description || null, b.owned_by_network === false ? 0 : 1, b.paid_listing ? 1 : 0, b.featured ? 1 : 0,
        Number.isFinite(b.sort_order) ? b.sort_order : 100, ['active', 'hidden', 'unverified'].includes(b.status) ? b.status : 'active', ts, ts));
  }
  if (stmts.length) await db.batch(stmts);
  await log(db, 'registry-sync', null, 'upserted', `${stmts.length} businesses${errors.length ? `; ${errors.join(' | ')}` : ''}`);
  return json({ ok: true, upserted: stmts.length, errors });
}

/** RealSkillSet course catalog upsert. Payload: { courses: [{ slug?, title, type, url, ... }] } */
export async function ingestCourses(env, payload) {
  const db = env.DB;
  const ts = nowIso();
  const list = Array.isArray(payload.courses) ? payload.courses : [];
  const stmts = [];
  const errors = [];
  for (const c of list) {
    if (!c.title || !isHttpUrl(c.url) || !['owned', 'affiliate'].includes(c.type)) { errors.push(`Course invalid: ${c.title || '(no title)'}`); continue; }
    stmts.push(db.prepare(`INSERT INTO courses (id, slug, title, type, provider, category, section_slug, level, duration, format, price, currency, url, description, status, created_at, updated_at)
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      ON CONFLICT(slug) DO UPDATE SET title=excluded.title, type=excluded.type, provider=excluded.provider, category=excluded.category, section_slug=excluded.section_slug,
        level=excluded.level, duration=excluded.duration, format=excluded.format, price=excluded.price, currency=excluded.currency, url=excluded.url,
        description=excluded.description, status=excluded.status, updated_at=excluded.updated_at`)
      .bind(uid(), slugify(c.slug || c.title), String(c.title).slice(0, 200), c.type, c.provider || 'RealSkillSet', c.category || null, c.section || null,
        c.level || null, c.duration || null, c.format || null, c.price != null ? Number(c.price) : null, c.currency || 'USD', c.url,
        c.description ? String(c.description).slice(0, 1500) : null, ['active', 'draft', 'inactive'].includes(c.status) ? c.status : 'active', ts, ts));
  }
  if (stmts.length) await db.batch(stmts);
  await log(db, 'course-sync', null, 'upserted', `${stmts.length} courses${errors.length ? `; ${errors.join(' | ')}` : ''}`);
  return json({ ok: true, upserted: stmts.length, errors });
}
