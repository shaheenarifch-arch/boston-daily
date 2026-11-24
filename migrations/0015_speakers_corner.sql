-- Boston Speakers' Corner (on the 1st Amendment Page, /section/opinion): an open podium where anyone can
-- speak (voice), write (text), share a YouTube video or sing (audio). Posts go live at once. Only threats,
-- doxxing, spam and illegal content are blocked or taken down. Reports reach the editor.

CREATE TABLE IF NOT EXISTS corner_posts (
  id            TEXT PRIMARY KEY,
  kind          TEXT NOT NULL CHECK (kind IN ('text','voice','song','video')),
  name          TEXT NOT NULL,                    -- display name, or "Anonymous"
  town          TEXT,
  tag           TEXT,                             -- immigrants, workers, faith, disabled, lgbtq, veterans, other
  body          TEXT,                             -- the words (text posts) or a caption (voice/song/video)
  youtube_id    TEXT,
  audio_id      TEXT,
  duration_s    INTEGER,
  status        TEXT NOT NULL DEFAULT 'live' CHECK (status IN ('live','hidden','removed')),
  status_reason TEXT,                             -- why it was hidden or removed
  stand_count   INTEGER NOT NULL DEFAULT 0,       -- "Stand with" reactions
  reply_count   INTEGER NOT NULL DEFAULT 0,
  report_count  INTEGER NOT NULL DEFAULT 0,
  ip_hash       TEXT,
  owner_key_hash TEXT,                            -- lets the poster delete their own post from the same browser
  ai_checked    INTEGER NOT NULL DEFAULT 0,
  moderated_by  TEXT,
  moderated_at  TEXT,
  created_at    TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_corner_posts_feed ON corner_posts(status, created_at);
CREATE INDEX IF NOT EXISTS idx_corner_posts_ip ON corner_posts(ip_hash, created_at);

-- Recorded or uploaded audio, stored in chunks (each D1 row stays well under the 2 MB row limit).
CREATE TABLE IF NOT EXISTS corner_audio (
  id          TEXT PRIMARY KEY,
  mime        TEXT NOT NULL,
  size        INTEGER NOT NULL,
  chunks      INTEGER NOT NULL,
  created_at  TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS corner_audio_chunks (
  audio_id  TEXT NOT NULL,
  seq       INTEGER NOT NULL,
  bytes     BLOB NOT NULL,
  PRIMARY KEY (audio_id, seq)
);

CREATE TABLE IF NOT EXISTS corner_replies (
  id          TEXT PRIMARY KEY,
  post_id     TEXT NOT NULL,
  name        TEXT NOT NULL,
  body        TEXT NOT NULL,
  status      TEXT NOT NULL DEFAULT 'live' CHECK (status IN ('live','hidden','removed')),
  report_count INTEGER NOT NULL DEFAULT 0,
  ip_hash     TEXT,
  created_at  TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_corner_replies_post ON corner_replies(post_id, status, created_at);

-- One "Stand with" per visitor per post.
CREATE TABLE IF NOT EXISTS corner_stands (
  post_id     TEXT NOT NULL,
  vid         TEXT NOT NULL,
  created_at  TEXT NOT NULL,
  PRIMARY KEY (post_id, vid)
);

-- Reader reports. One per visitor per post or reply.
CREATE TABLE IF NOT EXISTS corner_reports (
  id          TEXT PRIMARY KEY,
  post_id     TEXT NOT NULL,
  reply_id    TEXT,
  reason      TEXT NOT NULL,
  note        TEXT,
  vid         TEXT NOT NULL,
  resolved    INTEGER NOT NULL DEFAULT 0,
  created_at  TEXT NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_corner_reports_once ON corner_reports(post_id, COALESCE(reply_id, ''), vid);
CREATE INDEX IF NOT EXISTS idx_corner_reports_open ON corner_reports(resolved, created_at);

-- Hourly per-visitor counters for rate limits (posts, replies, reports, reactions, AI checks).
CREATE TABLE IF NOT EXISTS corner_usage (
  vid   TEXT NOT NULL,
  kind  TEXT NOT NULL,
  hour  TEXT NOT NULL,
  n     INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (vid, kind, hour)
);
