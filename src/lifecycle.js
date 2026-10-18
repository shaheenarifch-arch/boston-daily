/**
 * Story lifecycle and editorial rules.
 *
 * Pure rule functions (no I/O) are exported for tests; DB operations use them so
 * the same rules apply whether an editor, a cron job or an ingest adapter acts.
 */

export const STATES = [
  'DISCOVERED', 'RESEARCHING', 'VERIFYING', 'DRAFTING', 'EDITORIAL_REVIEW',
  'APPROVED', 'SCHEDULED', 'PUBLISHED', 'UPDATED', 'CORRECTED', 'REJECTED', 'ARCHIVED',
];

export const PUBLIC_STATES = ['PUBLISHED', 'UPDATED', 'CORRECTED'];

// Pipeline moves an editor (or the newsroom pod) can make with a plain transition.
// Approval, scheduling, publishing, updates and corrections have dedicated operations.
export const TRANSITIONS = {
  DISCOVERED: ['RESEARCHING', 'DRAFTING', 'ARCHIVED'],
  RESEARCHING: ['VERIFYING', 'DRAFTING', 'ARCHIVED'],
  VERIFYING: ['RESEARCHING', 'DRAFTING', 'ARCHIVED'],
  DRAFTING: ['EDITORIAL_REVIEW', 'ARCHIVED'],
  EDITORIAL_REVIEW: ['DRAFTING'],
  REJECTED: ['DRAFTING', 'ARCHIVED'],
  APPROVED: ['DRAFTING', 'ARCHIVED'],
  SCHEDULED: ['APPROVED', 'ARCHIVED'],
  PUBLISHED: ['ARCHIVED'],
  UPDATED: ['ARCHIVED'],
  CORRECTED: ['ARCHIVED'],
  ARCHIVED: [],
};

export const NEWSROOM_TYPES = ['news_story', 'analysis', 'opinion', 'feature'];
export const COMMERCE_TYPES = ['blog_post', 'product_feature', 'sponsored'];
export const DISCLOSURE_LABELS = ['Affiliate', 'Sponsored', 'Partner Content', 'Advertisement'];

export function canTransition(from, to) {
  return (TRANSITIONS[from] || []).includes(to);
}

/** Does this story always need a human approver? */
export function requiresHuman(story, section) {
  if (story.lane === 'newsroom') return true;
  if (section && section.always_human) return true;
  if (story.sensitive) return true;
  return false;
}

/**
 * Checks that must pass before a story can be approved or published.
 * Returns a list of human-readable problems (empty = OK).
 */
export function approvalProblems(story, section, sources, actor) {
  const problems = [];
  if (!section || !section.active) problems.push('Story must belong to an active section.');
  if (!story.headline || !story.headline.trim()) problems.push('Headline is required.');
  if (!story.body || story.body.trim().length < 40) problems.push('Body is too short to publish.');

  if (requiresHuman(story, section) && (!actor || actor.kind !== 'human')) {
    problems.push(
      story.lane === 'newsroom'
        ? 'Newsroom stories can only be approved by a human editor.'
        : 'This section or story is flagged for mandatory human approval.',
    );
  }

  if (story.hero_image_url && !story.hero_image_rights) {
    problems.push('Hero image has no recorded usage rights.');
  }

  if (story.lane === 'newsroom') {
    if (!NEWSROOM_TYPES.includes(story.type)) problems.push(`Type "${story.type}" is not allowed in the newsroom lane.`);
    if (story.type === 'opinion' && story.section_slug !== 'opinion') problems.push('Opinion pieces must be filed in the Opinion section.');
    if (story.disclosure_label === 'Sponsored' || story.sponsor_name) problems.push('Newsroom stories cannot carry sponsorship.');
    problems.push(...sourceProblems(sources, story.type));
  } else {
    problems.push(...commerceGateProblems(story, section));
  }
  return problems;
}

/** Provenance / rights rules for newsroom stories. */
export function sourceProblems(sources, type) {
  const problems = [];
  const list = sources || [];
  if (type === 'opinion') {
    // Opinion still needs provenance for factual claims, but an ORIGINAL author record is enough.
    if (!list.length) problems.push('Add at least one source (ORIGINAL author record is acceptable for opinion).');
    return problems;
  }
  const usable = list.filter((s) => s.rights_type !== 'DISCOVERY_ONLY');
  if (!list.length) problems.push('No sources recorded. Every story needs provenance.');
  else if (!usable.length) problems.push('Only DISCOVERY_ONLY sources: report from primary, licensed or original sources before publishing.');
  const unverified = usable.filter((s) => !s.verified);
  if (unverified.length) problems.push(`${unverified.length} source(s) not yet verified.`);
  // Attributed reporting needs corroboration: with no primary, licensed or original source,
  // at least two verified reports from different publishers are required.
  const strong = usable.filter((s) => s.rights_type !== 'ATTRIBUTED_REPORT' && s.verified);
  if (usable.length && !strong.length) {
    const publishers = new Set(usable.filter((s) => s.rights_type === 'ATTRIBUTED_REPORT' && s.verified).map((s) => (s.publisher || s.url || s.title).toLowerCase()));
    if (publishers.size < 2) problems.push('Attributed reporting needs two verified reports from different publishers, or a primary source.');
  }
  return problems;
}

/** Mandatory policy gates for the partner/commerce lane. */
export function commerceGateProblems(story, section) {
  const problems = [];
  if (!COMMERCE_TYPES.includes(story.type)) problems.push(`Type "${story.type}" is not allowed in the partner lane.`);
  if (section && !section.commerce_allowed) problems.push(`Commercial content is not allowed in ${section.name}.`);
  if (!story.disclosure_label || !DISCLOSURE_LABELS.includes(story.disclosure_label)) problems.push('A disclosure label (Affiliate, Sponsored, Partner Content, Advertisement) is required.');
  if (!story.disclosure_text || story.disclosure_text.trim().length < 20) problems.push('A disclosure line is required.');
  if (story.type === 'sponsored' && !story.sponsor_name) problems.push('Sponsored content must name the sponsor.');
  if (story.byline && /boston daily|staff|newsroom/i.test(story.byline)) problems.push('Commercial content cannot carry a newsroom byline.');
  if (/\b(breaking|exclusive report|reporters? (say|said|confirm))\b/i.test(`${story.headline} ${story.dek || ''}`)) problems.push('Commercial content cannot be framed as news reporting.');
  if (/\b(cures?|guaranteed (results|income|returns)|risk[- ]free returns|doctor[- ]approved)\b/i.test(story.body || '')) problems.push('Contains medical or financial claims that need editor review.');
  const linkProblems = commerceLinkProblems(story.body || '');
  problems.push(...linkProblems);
  return problems;
}

export function commerceLinkProblems(body) {
  const problems = [];
  const links = [...String(body).matchAll(/\[([^\]]+)\]\(([^)\s]+)\)/g)].map((m) => m[2]);
  const bad = links.filter((u) => !/^https?:\/\//i.test(u));
  if (bad.length) problems.push(`${bad.length} link(s) are not valid http(s) URLs.`);
  return problems;
}

// ───────────────────────────── DB operations ─────────────────────────────

import { uid, nowIso } from './util.js';

const VERSION_COLS = ['id', 'story_id', 'version', 'change_type', 'headline', 'dek', 'body', 'note', 'editor', 'created_at'];

export async function loadStoryContext(db, storyId) {
  const story = await db.prepare('SELECT * FROM stories WHERE id = ?').bind(storyId).first();
  if (!story) return null;
  const section = await db.prepare('SELECT * FROM sections WHERE slug = ?').bind(story.section_slug).first();
  const { results: sources } = await db.prepare('SELECT * FROM story_sources WHERE story_id = ? ORDER BY created_at').bind(storyId).all();
  return { story, section, sources };
}

class LifecycleError extends Error {
  constructor(message, problems = [], status = 409) {
    super(message);
    this.problems = problems;
    this.status = status;
  }
}
export { LifecycleError };

/**
 * Insert that only lands if the guarded status change in the same batch succeeded
 * (story now has the target status and this exact updated_at).
 */
function guardedInsert(db, table, cols, values, guard) {
  const placeholders = cols.map(() => '?').join(',');
  return db
    .prepare(`INSERT INTO ${table} (${cols.join(',')}) SELECT ${placeholders} WHERE EXISTS (SELECT 1 FROM stories WHERE id = ? AND status = ? AND updated_at = ?)`)
    .bind(...values, guard.storyId, guard.toStatus, guard.ts);
}

/**
 * Optimistic, status-guarded change. All writes go in one atomic D1 batch; dependent inserts
 * only land if the guarded UPDATE matched. Returns the fresh row only if the DB confirms it.
 * extraInserts: array of [table, cols, values].
 */
async function guardedStatusChange(db, storyId, fromStatus, toStatus, setSql, setParams, actor, note, extraInserts = []) {
  const ts = nowIso();
  const guard = { storyId, toStatus, ts };
  const update = db
    .prepare(`UPDATE stories SET status = ?, updated_at = ?${setSql ? `, ${setSql}` : ''} WHERE id = ? AND status = ?`)
    .bind(toStatus, ts, ...setParams, storyId, fromStatus);
  const inserts = extraInserts.map(([table, cols, values]) => guardedInsert(db, table, cols, values, guard));
  inserts.push(guardedInsert(db, 'story_events', ['id', 'story_id', 'from_status', 'to_status', 'actor', 'note', 'created_at'],
    [uid(), storyId, fromStatus, toStatus, actor.name, note || null, ts], guard));
  const results = await db.batch([update, ...inserts]);
  if (!results[0].meta || results[0].meta.changes !== 1) {
    throw new LifecycleError('Story changed state concurrently; reload and try again.', [], 409);
  }
  const fresh = await db.prepare('SELECT * FROM stories WHERE id = ?').bind(storyId).first();
  if (!fresh || fresh.status !== toStatus || fresh.updated_at !== ts) throw new LifecycleError('Database did not confirm the change.', [], 500);
  return fresh;
}

export async function transition(db, storyId, to, actor, note) {
  const ctx = await loadStoryContext(db, storyId);
  if (!ctx) throw new LifecycleError('Story not found', [], 404);
  const { story } = ctx;
  if (!canTransition(story.status, to)) throw new LifecycleError(`Cannot move from ${story.status} to ${to}.`);
  const set = to === 'ARCHIVED' ? 'archived_at = ?' : '';
  const params = to === 'ARCHIVED' ? [nowIso()] : [];
  return guardedStatusChange(db, storyId, story.status, to, set, params, actor, note);
}

export async function approve(db, storyId, actor, note) {
  const ctx = await loadStoryContext(db, storyId);
  if (!ctx) throw new LifecycleError('Story not found', [], 404);
  const { story, section, sources } = ctx;
  if (story.status !== 'EDITORIAL_REVIEW') throw new LifecycleError(`Only stories in EDITORIAL_REVIEW can be approved (current: ${story.status}).`);
  const problems = approvalProblems(story, section, sources, actor);
  if (problems.length) throw new LifecycleError('Approval blocked', problems, 422);
  return guardedStatusChange(db, storyId, 'EDITORIAL_REVIEW', 'APPROVED', 'approved_by = ?, approved_at = ?', [actor.name, nowIso()], actor, note);
}

export async function reject(db, storyId, actor, note) {
  if (!note || !note.trim()) throw new LifecycleError('A rejection reason is required.', [], 422);
  const story = await db.prepare('SELECT status FROM stories WHERE id = ?').bind(storyId).first();
  if (!story) throw new LifecycleError('Story not found', [], 404);
  if (!['EDITORIAL_REVIEW', 'APPROVED', 'SCHEDULED'].includes(story.status)) throw new LifecycleError(`Cannot reject a story in ${story.status}.`);
  return guardedStatusChange(db, storyId, story.status, 'REJECTED', 'approved_by = NULL, approved_at = NULL, scheduled_at = NULL', [], actor, note);
}

export async function schedule(db, storyId, whenIso, actor) {
  const when = new Date(whenIso);
  if (Number.isNaN(when.getTime())) throw new LifecycleError('Invalid schedule time.', [], 422);
  if (when.getTime() < Date.now() - 60_000) throw new LifecycleError('Schedule time is in the past.', [], 422);
  const story = await db.prepare('SELECT status FROM stories WHERE id = ?').bind(storyId).first();
  if (!story) throw new LifecycleError('Story not found', [], 404);
  if (story.status !== 'APPROVED') throw new LifecycleError('Only approved stories can be scheduled.');
  return guardedStatusChange(db, storyId, 'APPROVED', 'SCHEDULED', 'scheduled_at = ?', [when.toISOString()], actor, `Scheduled for ${when.toISOString()}`);
}

/**
 * Publish. Re-checks every gate (content may have changed since approval), writes the
 * version snapshot atomically with the status change, then reads back to confirm.
 * Only a confirmed row is reported as PUBLISHED.
 */
export async function publish(db, storyId, actor, { approverActor } = {}) {
  const ctx = await loadStoryContext(db, storyId);
  if (!ctx) throw new LifecycleError('Story not found', [], 404);
  const { story, section, sources } = ctx;
  if (!['APPROVED', 'SCHEDULED'].includes(story.status)) throw new LifecycleError(`Only approved or scheduled stories can be published (current: ${story.status}).`);
  // Gate re-check uses the original approver's authority (a cron publishing a scheduled story acts on their approval).
  const authority = approverActor || (story.approved_by ? { name: story.approved_by, kind: story.approved_by.startsWith('system:') ? 'system' : 'human' } : actor);
  const problems = approvalProblems(story, section, sources, authority);
  if (problems.length) throw new LifecycleError('Publish blocked', problems, 422);
  const ts = nowIso();
  const versionRow = ['story_versions', VERSION_COLS, [uid(), storyId, story.version, 'publish', story.headline, story.dek, story.body, null, actor.name, ts]];
  return guardedStatusChange(db, storyId, story.status, 'PUBLISHED', 'published_at = COALESCE(published_at, ?)', [ts], actor, null, [versionRow]);
}

/**
 * Update (new information) or Correction (fixing an error) on a live story.
 * Both keep the previous text in story_versions and add a public notice.
 */
export async function revisePublished(db, storyId, kind, changes, note, actor) {
  if (!['update', 'correction'].includes(kind)) throw new LifecycleError('Unknown revision kind.', [], 400);
  if (!note || note.trim().length < 10) throw new LifecycleError(`A public ${kind} note is required.`, [], 422);
  if (!actor || actor.kind !== 'human') throw new LifecycleError('Only editors can update or correct published stories.', [], 403);
  const ctx = await loadStoryContext(db, storyId);
  if (!ctx) throw new LifecycleError('Story not found', [], 404);
  const { story, section, sources } = ctx;
  if (!PUBLIC_STATES.includes(story.status)) throw new LifecycleError('Only published stories can be updated or corrected.');
  const next = {
    ...story,
    headline: changes.headline ?? story.headline,
    dek: changes.dek ?? story.dek,
    body: changes.body ?? story.body,
  };
  const problems = approvalProblems(next, section, sources, actor);
  if (problems.length) throw new LifecycleError(`${kind === 'update' ? 'Update' : 'Correction'} blocked`, problems, 422);
  const ts = nowIso();
  const toStatus = kind === 'update' ? 'UPDATED' : 'CORRECTED';
  const version = story.version + 1;
  const extra = [
    ['story_versions', VERSION_COLS, [uid(), storyId, version, kind, next.headline, next.dek, next.body, note, actor.name, ts]],
    ['story_notices', ['id', 'story_id', 'kind', 'note', 'editor', 'created_at'], [uid(), storyId, kind, note.trim(), actor.name, ts]],
  ];
  const tsCol = kind === 'update' ? 'last_updated_at' : 'corrected_at';
  // Corrected outranks Updated for the visible status: an update after a correction keeps CORRECTED visible.
  const finalStatus = story.status === 'CORRECTED' && kind === 'update' ? 'CORRECTED' : toStatus;
  return guardedStatusChange(
    db, storyId, story.status, finalStatus,
    `headline = ?, dek = ?, body = ?, version = ?, ${tsCol} = ?`,
    [next.headline, next.dek, next.body, version, ts],
    actor, note, extra,
  );
}

/** Cron: publish scheduled stories whose time has come. */
export async function publishDueScheduled(db) {
  const { results } = await db.prepare("SELECT id, approved_by FROM stories WHERE status = 'SCHEDULED' AND scheduled_at <= ?").bind(nowIso()).all();
  const outcome = { published: [], failed: [] };
  for (const row of results) {
    try {
      await publish(db, row.id, { name: 'system:scheduler', kind: 'system' });
      outcome.published.push(row.id);
    } catch (err) {
      outcome.failed.push({ id: row.id, error: err.message, problems: err.problems || [] });
      // Leave it SCHEDULED so it surfaces in the console as overdue; record why.
      await db.prepare('INSERT INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES (?,?,?,?,?,?,?)')
        .bind(uid(), row.id, 'SCHEDULED', 'SCHEDULED', 'system:scheduler', `Publish failed: ${err.message} ${(err.problems || []).join(' ')}`.trim(), nowIso()).run();
    }
  }
  return outcome;
}
