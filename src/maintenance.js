import { uid, nowIso } from './util.js';

/**
 * Daily link check on affiliate deep links (oldest-verified first, capped per run to stay
 * inside Worker subrequest limits). Redirects count as healthy: affiliate links redirect.
 */
export async function checkProductLinks(db, limit = 40) {
  const { results } = await db.prepare(
    "SELECT id, deep_link, status FROM products WHERE status IN ('active','broken_link') ORDER BY COALESCE(last_verified_at, '') ASC LIMIT ?",
  ).bind(limit).all();
  let broken = 0;
  let healthy = 0;
  for (const p of results) {
    const ok = await probe(p.deep_link);
    const status = ok ? 'active' : 'broken_link';
    if (ok) healthy++; else broken++;
    await db.prepare('UPDATE products SET status = ?, last_verified_at = ?, updated_at = ? WHERE id = ?').bind(status, nowIso(), nowIso(), p.id).run();
  }
  await db.prepare('INSERT INTO ingest_log (id, source, ref, result, detail, created_at) VALUES (?,?,?,?,?,?)')
    .bind(uid(), 'link-check', null, 'checked', `${results.length} checked, ${healthy} healthy, ${broken} broken`, nowIso()).run();
  return { checked: results.length, healthy, broken };
}

/** Business registry health: domain reachable. Dead sites are hidden from readers automatically. */
export async function checkBusinessHealth(db, limit = 40) {
  const { results } = await db.prepare(
    "SELECT id, domain FROM businesses WHERE domain IS NOT NULL AND status != 'hidden' ORDER BY COALESCE(last_health_check, '') ASC LIMIT ?",
  ).bind(limit).all();
  for (const b of results) {
    const ok = await probe(`https://${b.domain}/`);
    await db.prepare('UPDATE businesses SET health_ok = ?, last_health_check = ? WHERE id = ?').bind(ok ? 1 : 0, nowIso(), b.id).run();
  }
  return { checked: results.length };
}

async function probe(url) {
  try {
    const res = await fetch(url, { method: 'GET', redirect: 'manual', headers: { 'user-agent': 'BostonDailyLinkCheck/1.0' }, signal: AbortSignal.timeout(8000) });
    // Body is not needed; release it.
    res.body?.cancel?.();
    // Amazon answers automated checks with 503; that is a bot wall, not a dead affiliate link.
    if (res.status === 503 && /(^|\.)amazon\.com$/.test(new URL(url).hostname)) return true;
    return res.status < 400 || res.status === 403 || res.status === 405 || res.status === 429; // bot walls ≠ dead links
  } catch {
    return false;
  }
}

const IMG_UA = 'BostonDailyImageCheck/1.0 (https://bostondaily.us; agents@getservices.ai)';

/** true = loads as an image; false = definitely broken (4xx / not an image); null = could not tell (network), try later. */
async function imageOk(url) {
  try {
    const res = await fetch(url, { method: 'GET', headers: { 'user-agent': IMG_UA }, signal: AbortSignal.timeout(10000) });
    const type = res.headers.get('content-type') || '';
    res.body?.cancel?.();
    if (res.ok && type.startsWith('image/')) return true;
    // 403 is a bot wall (loc.gov refuses automated checks), not a dead photo: never remove a photo for it.
    if (res.status === 403) return true;
    if ([400, 404, 410].includes(res.status) || (res.ok && !type.startsWith('image/'))) return false;
    return null;
  } catch { return null; }
}

/** For a Wikimedia thumbnail URL, the original file URL (used when the thumbnail size is not available). */
function wikimediaOriginal(url) {
  const m = url.match(/^(https:\/\/upload\.wikimedia\.org\/wikipedia\/commons)\/thumb\/([0-9a-f]\/[0-9a-f]{2}\/[^/]+)\/[^/]+$/);
  return m ? `${m[1]}/${m[2]}` : null;
}

/**
 * Check story hero images. Working images are kept; a Wikimedia thumbnail that fails falls back to
 * the original file (or a smaller thumbnail); anything still broken is removed so readers never see a broken picture.
 */
export async function checkStoryImages(db, limit = 12) {
  const { results } = await db.prepare(`SELECT id, hero_image_url FROM stories WHERE hero_image_url IS NOT NULL AND image_checked_at IS NULL
    ORDER BY CASE WHEN status IN ('PUBLISHED','UPDATED','CORRECTED') THEN 0 ELSE 1 END, created_at DESC LIMIT ?`).bind(limit).all();
  let ok = 0, repaired = 0, removed = 0;
  for (const s of results) {
    const ts = nowIso();
    const first = await imageOk(s.hero_image_url);
    if (first === null) continue; // network problem: leave it for the next run
    if (first) { ok++; await db.prepare('UPDATE stories SET image_checked_at = ? WHERE id = ?').bind(ts, s.id).run(); continue; }
    const original = wikimediaOriginal(s.hero_image_url);
    const smaller = original && !/lossy-page1/.test(s.hero_image_url) ? s.hero_image_url.replace(/\/1280px-/, '/800px-') : null;
    let fixed = null;
    let unsure = false;
    for (const alt of [smaller, original].filter(Boolean)) { const r = await imageOk(alt); if (r) { fixed = alt; break; } if (r === null) unsure = true; }
    if (!fixed && unsure) continue;
    if (fixed) {
      repaired++;
      await db.prepare('UPDATE stories SET hero_image_url = ?, image_checked_at = ? WHERE id = ?').bind(fixed, ts, s.id).run();
    } else {
      removed++;
      await db.prepare('UPDATE stories SET hero_image_url = NULL, hero_image_credit = NULL, hero_image_rights = NULL, image_checked_at = ? WHERE id = ?').bind(ts, s.id).run();
    }
  }
  if (results.length) {
    await db.prepare('INSERT INTO ingest_log (id, source, ref, result, detail, created_at) VALUES (?,?,?,?,?,?)')
      .bind(uid(), 'image-check', null, 'checked', `${results.length} checked, ${ok} ok, ${repaired} repaired, ${removed} removed`, nowIso()).run();
  }
  return { checked: results.length, ok, repaired, removed };
}
