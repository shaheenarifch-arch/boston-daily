/**
 * First-run setup: if the D1 database is empty, create the schema and load the seed data.
 * Runs once per Worker isolate (one cheap check), so a fresh deploy from GitHub needs no
 * manual console step. Records the migration the same way `wrangler d1 migrations` does,
 * so later wrangler migrations stay in sync.
 */
import schemaSql from '../migrations/0001_init.sql';
import seedSql from '../seed/seed.sql';

let ready = null;

export function ensureDatabase(db) {
  if (!ready) ready = setup(db).catch((err) => { ready = null; throw err; });
  return ready;
}

async function setup(db) {
  const hit = await db.prepare("SELECT name FROM sqlite_master WHERE type = 'table' AND name = 'sections'").first();
  if (hit) return;
  const statements = [
    'CREATE TABLE IF NOT EXISTS d1_migrations (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT UNIQUE, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL)',
    ...splitSql(schemaSql),
    "INSERT OR IGNORE INTO d1_migrations (name) VALUES ('0001_init.sql')",
    ...splitSql(seedSql),
  ];
  await db.batch(statements.map((sql) => db.prepare(sql)));
  console.log(`Boston Daily: database initialized (${statements.length} statements)`);
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
