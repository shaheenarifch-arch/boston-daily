/**
 * Self-managing database setup, run once per Worker isolate:
 * 1. An empty database gets the base schema + seed data.
 * 2. Schema migrations not yet recorded in d1_migrations are applied (same table wrangler uses).
 * 3. Dated content packages (newsroom drafts) not yet in content_imports are loaded.
 * So every GitHub push that adds a migration or a content package deploys itself.
 */
import m0001 from '../migrations/0001_init.sql';
import m0002 from '../migrations/0002_comments_and_attribution.sql';
import seedSql from '../seed/seed.sql';
import { CONTENT_PACKAGES } from '../content/index.js';

const MIGRATIONS = [
  ['0001_init.sql', m0001],
  ['0002_comments_and_attribution.sql', m0002],
];

let ready = null;

export function ensureDatabase(db) {
  if (!ready) ready = setup(db).catch((err) => { ready = null; throw err; });
  return ready;
}

async function setup(db) {
  await db.prepare('CREATE TABLE IF NOT EXISTS d1_migrations (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT UNIQUE, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL)').run();
  const hasBase = await db.prepare("SELECT name FROM sqlite_master WHERE type = 'table' AND name = 'sections'").first();
  if (hasBase) {
    // Databases set up by hand before tracking existed: record the base migration.
    await db.prepare("INSERT OR IGNORE INTO d1_migrations (name) VALUES ('0001_init.sql')").run();
  }
  const { results } = await db.prepare('SELECT name FROM d1_migrations').all();
  const applied = new Set(results.map((r) => r.name));

  for (const [name, sql] of MIGRATIONS) {
    if (applied.has(name)) continue;
    const statements = [...splitSql(sql), `INSERT OR IGNORE INTO d1_migrations (name) VALUES ('${name}')`];
    if (name === '0001_init.sql') statements.push(...splitSql(seedSql));
    await db.batch(statements.map((s) => db.prepare(s)));
    console.log(`Boston Daily: applied ${name}`);
  }

  const { results: loaded } = await db.prepare('SELECT name FROM content_imports').all();
  const done = new Set(loaded.map((r) => r.name));
  for (const [name, sql] of CONTENT_PACKAGES) {
    if (done.has(name)) continue;
    const statements = [...splitSql(sql), `INSERT OR IGNORE INTO content_imports (name, applied_at) VALUES ('${name}', '${new Date().toISOString()}')`];
    await db.batch(statements.map((s) => db.prepare(s)));
    console.log(`Boston Daily: loaded content ${name}`);
  }
}

/** Split SQL into statements on semicolons outside quotes; drops -- comments. */
export function splitSql(sql) {
  const out = [];
  let cur = '';
  let quote = null;
  for (let i = 0; i < sql.length; i++) {
    const ch = sql[i];
    if (quote) {
      cur += ch;
      if (ch === quote) {
        if (sql[i + 1] === quote) { cur += sql[++i]; } else { quote = null; }
      }
      continue;
    }
    if (ch === '-' && sql[i + 1] === '-') {
      while (i < sql.length && sql[i] !== '\n') i++;
      cur += '\n';
      continue;
    }
    if (ch === "'" || ch === '"') { quote = ch; cur += ch; continue; }
    if (ch === ';') {
      if (cur.trim()) out.push(cur.trim());
      cur = '';
      continue;
    }
    cur += ch;
  }
  if (cur.trim()) out.push(cur.trim());
  return out;
}
