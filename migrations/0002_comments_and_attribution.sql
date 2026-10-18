-- Reader comments (pre-moderated) and an attributed-reporting rights type.

CREATE TABLE IF NOT EXISTS comments (
  id            TEXT PRIMARY KEY,
  story_id      TEXT NOT NULL REFERENCES stories(id),
  name          TEXT NOT NULL,
  body          TEXT NOT NULL,
  status        TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','approved','rejected')),
  ip_hash       TEXT,
  moderated_by  TEXT,
  moderated_at  TEXT,
  created_at    TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_comments_story ON comments(story_id, status, created_at);
CREATE INDEX IF NOT EXISTS idx_comments_status ON comments(status, created_at);

-- Share clicks, a light engagement signal alongside view_count.
ALTER TABLE stories ADD COLUMN share_count INTEGER NOT NULL DEFAULT 0;

-- Rebuild story_sources to allow ATTRIBUTED_REPORT: facts reported by a named news organization,
-- restated in our own words with attribution. Never republished; two independent reports are
-- required when a story has no primary, licensed or original source.
CREATE TABLE story_sources_new (
  id           TEXT PRIMARY KEY,
  story_id     TEXT NOT NULL REFERENCES stories(id),
  title        TEXT NOT NULL,
  url          TEXT,
  publisher    TEXT,
  channel      TEXT,
  rights_type  TEXT NOT NULL CHECK (rights_type IN ('LICENSED_REPUBLISH','PERMITTED_RELEASE','PUBLIC_DOMAIN','PRIMARY_SOURCE','ATTRIBUTED_REPORT','DISCOVERY_ONLY','ORIGINAL')),
  license_ref  TEXT,
  verified     INTEGER NOT NULL DEFAULT 0,
  public       INTEGER NOT NULL DEFAULT 1,
  retrieved_at TEXT,
  notes        TEXT,
  added_by     TEXT NOT NULL,
  created_at   TEXT NOT NULL
);
INSERT INTO story_sources_new SELECT id, story_id, title, url, publisher, channel, rights_type, license_ref, verified, public, retrieved_at, notes, added_by, created_at FROM story_sources;
DROP TABLE story_sources;
ALTER TABLE story_sources_new RENAME TO story_sources;
CREATE INDEX IF NOT EXISTS idx_sources_story ON story_sources(story_id);

-- Tracks which dated content packages (newsroom drafts) have been loaded.
CREATE TABLE IF NOT EXISTS content_imports (
  name        TEXT PRIMARY KEY,
  applied_at  TEXT NOT NULL
);
