-- Cached Google Search Console reports (refreshed at most every 6 hours).
CREATE TABLE IF NOT EXISTS gsc_cache (
  key         TEXT PRIMARY KEY,
  body        TEXT NOT NULL,
  fetched_at  TEXT NOT NULL
);
