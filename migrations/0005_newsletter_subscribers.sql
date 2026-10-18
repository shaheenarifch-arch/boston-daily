-- Email newsletters: the free daily paper and the weekly edition.
CREATE TABLE IF NOT EXISTS subscribers (
  id               TEXT PRIMARY KEY,
  email            TEXT NOT NULL UNIQUE,
  daily            INTEGER NOT NULL DEFAULT 1,
  weekly           INTEGER NOT NULL DEFAULT 0,
  status           TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','unsubscribed')),
  token            TEXT NOT NULL UNIQUE,
  source           TEXT,
  created_at       TEXT NOT NULL,
  updated_at       TEXT NOT NULL,
  last_daily_at    TEXT,
  last_weekly_at   TEXT
);
CREATE TABLE IF NOT EXISTS newsletter_sends (
  id          TEXT PRIMARY KEY,
  kind        TEXT NOT NULL,
  send_date   TEXT NOT NULL,
  recipients  INTEGER NOT NULL DEFAULT 0,
  status      TEXT NOT NULL,
  note        TEXT,
  created_at  TEXT NOT NULL,
  UNIQUE (kind, send_date)
);
