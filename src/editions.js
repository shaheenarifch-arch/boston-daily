import { uid, nowIso, localDate } from './util.js';

const PUBLIC = "('PUBLISHED','UPDATED','CORRECTED')";

/**
 * Build (or rebuild) the edition for a date. Editions only hold newsroom stories;
 * commercial modules are composed separately at render time and always labeled.
 */
export async function buildEdition(db, env, { date, actor = 'system:edition-builder', rebuild = false, publish = true } = {}) {
  const editionDate = date || localDate(new Date(), env.TIMEZONE || 'America/New_York');
  let edition = await db.prepare('SELECT * FROM editions WHERE edition_date = ?').bind(editionDate).first();

  if (edition && !rebuild) return { edition, created: false };

  const since = new Date(Date.now() - 36 * 3600 * 1000).toISOString();
  const { results: fresh } = await db.prepare(
    `SELECT id, type, priority, is_lead_candidate, published_at FROM stories
     WHERE lane = 'newsroom' AND status IN ${PUBLIC} AND published_at >= ?
     ORDER BY is_lead_candidate DESC, priority DESC, published_at DESC LIMIT 60`,
  ).bind(since).all();

  const weekAgo = new Date(Date.now() - 7 * 86400 * 1000).toISOString();
  const { results: selection } = await db.prepare(
    `SELECT id FROM stories WHERE lane = 'newsroom' AND status IN ${PUBLIC}
     AND type IN ('analysis','feature') AND published_at >= ?
     ORDER BY priority DESC, published_at DESC LIMIT 4`,
  ).bind(weekAgo).all();

  const stmts = [];
  if (!edition) {
    const max = await db.prepare('SELECT COALESCE(MAX(edition_number), 0) AS n FROM editions').first();
    edition = {
      id: uid(), edition_date: editionDate, edition_number: (max?.n || 0) + 1,
      status: publish ? 'published' : 'draft', published_at: publish ? nowIso() : null, built_by: actor, created_at: nowIso(),
    };
    stmts.push(db.prepare('INSERT INTO editions (id, edition_date, edition_number, status, published_at, built_by, created_at) VALUES (?,?,?,?,?,?,?)')
      .bind(edition.id, edition.edition_date, edition.edition_number, edition.status, edition.published_at, edition.built_by, edition.created_at));
  } else {
    stmts.push(db.prepare('DELETE FROM edition_items WHERE edition_id = ?').bind(edition.id));
    stmts.push(db.prepare('UPDATE editions SET built_by = ?, status = ?, published_at = COALESCE(published_at, ?) WHERE id = ?')
      .bind(actor, publish ? 'published' : edition.status, publish ? nowIso() : null, edition.id));
  }

  const placed = new Set();
  const add = (storyId, slot, position) => {
    if (placed.has(storyId)) return;
    placed.add(storyId);
    stmts.push(db.prepare('INSERT INTO edition_items (edition_id, story_id, slot, position) VALUES (?,?,?,?)').bind(edition.id, storyId, slot, position));
  };

  if (fresh.length) add(fresh[0].id, 'lead', 0);
  fresh.slice(1, 9).forEach((s, i) => add(s.id, 'top', i));
  selection.forEach((s, i) => add(s.id, 'editors_selection', i));
  fresh.slice(9).forEach((s, i) => add(s.id, 'section', i));

  await db.batch(stmts);
  const saved = await db.prepare('SELECT * FROM editions WHERE id = ?').bind(edition.id).first();
  return { edition: saved, created: true, placed: placed.size };
}

export async function getEditionWithItems(db, editionDate) {
  const edition = editionDate
    ? await db.prepare("SELECT * FROM editions WHERE edition_date = ? AND status = 'published'").bind(editionDate).first()
    : await db.prepare("SELECT * FROM editions WHERE status = 'published' ORDER BY edition_date DESC LIMIT 1").first();
  if (!edition) return null;
  const { results } = await db.prepare(
    `SELECT ei.slot, ei.position, s.* FROM edition_items ei JOIN stories s ON s.id = ei.story_id
     WHERE ei.edition_id = ? AND s.status IN ${PUBLIC}
     ORDER BY CASE ei.slot WHEN 'lead' THEN 0 WHEN 'top' THEN 1 WHEN 'editors_selection' THEN 2 ELSE 3 END, ei.position`,
  ).bind(edition.id).all();
  return { edition, items: results };
}

/** Editor curation: set the lead, add or remove a story. */
export async function curateEdition(db, editionId, op, storyId, slot = 'top') {
  const story = await db.prepare(`SELECT id, lane, status FROM stories WHERE id = ?`).bind(storyId).first();
  if (!story) throw new Error('Story not found');
  if (op !== 'remove') {
    if (story.lane !== 'newsroom') throw new Error('Only newsroom stories can be placed in an edition.');
    if (!['PUBLISHED', 'UPDATED', 'CORRECTED'].includes(story.status)) throw new Error('Only published stories can be placed in an edition.');
  }
  if (op === 'remove') {
    await db.prepare('DELETE FROM edition_items WHERE edition_id = ? AND story_id = ?').bind(editionId, storyId).run();
  } else if (op === 'lead') {
    await db.batch([
      db.prepare("UPDATE edition_items SET slot = 'top', position = 99 WHERE edition_id = ? AND slot = 'lead'").bind(editionId),
      db.prepare("INSERT INTO edition_items (edition_id, story_id, slot, position) VALUES (?,?, 'lead', 0) ON CONFLICT(edition_id, story_id) DO UPDATE SET slot = 'lead', position = 0").bind(editionId, storyId),
    ]);
  } else if (op === 'add') {
    const allowed = ['top', 'editors_selection', 'section'];
    const s = allowed.includes(slot) ? slot : 'top';
    await db.prepare('INSERT INTO edition_items (edition_id, story_id, slot, position) VALUES (?,?,?, 50) ON CONFLICT(edition_id, story_id) DO UPDATE SET slot = excluded.slot').bind(editionId, storyId, s).run();
  } else {
    throw new Error('Unknown edition operation');
  }
}
