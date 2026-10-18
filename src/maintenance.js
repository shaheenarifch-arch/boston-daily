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
    return res.status < 400 || res.status === 403 || res.status === 405 || res.status === 429; // bot walls ≠ dead links
  } catch {
    return false;
  }
}
