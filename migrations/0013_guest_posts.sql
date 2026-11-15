-- Guest posts: submissions from /write-for-us. A submission becomes a normal Opinion story only when
-- Shaheen accepts it, and that story still needs Shaheen's approval before it can publish.
CREATE TABLE IF NOT EXISTS guest_posts (
  id               TEXT PRIMARY KEY,
  ref              TEXT NOT NULL UNIQUE,            -- public reference, e.g. GP-24817
  token            TEXT NOT NULL,                   -- private status-link token
  status           TEXT NOT NULL DEFAULT 'received' CHECK (status IN ('received','in_review','changes_requested','accepted','live','declined')),
  author_name      TEXT NOT NULL,
  author_email     TEXT NOT NULL,
  author_bio       TEXT NOT NULL,
  author_website   TEXT,
  section_slug     TEXT NOT NULL,
  headline         TEXT NOT NULL,
  dek              TEXT,
  body             TEXT NOT NULL,
  hero_image_url   TEXT NOT NULL,
  hero_image_credit TEXT NOT NULL,
  sources          TEXT,                            -- one URL or reference per line
  editor_note      TEXT,                            -- latest note sent to the author
  story_id         TEXT,                            -- set when accepted
  ip_hash          TEXT,
  live_emailed_at  TEXT,
  created_at       TEXT NOT NULL,
  updated_at       TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_guest_posts_status ON guest_posts(status, created_at);
CREATE INDEX IF NOT EXISTS idx_guest_posts_email ON guest_posts(author_email, created_at);
CREATE INDEX IF NOT EXISTS idx_guest_posts_story ON guest_posts(story_id);

-- History of each submission: status changes and emails sent.
CREATE TABLE IF NOT EXISTS guest_post_events (
  id             TEXT PRIMARY KEY,
  guest_post_id  TEXT NOT NULL,
  kind           TEXT NOT NULL,
  note           TEXT,
  actor          TEXT NOT NULL,
  created_at     TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_guest_post_events ON guest_post_events(guest_post_id, created_at);
