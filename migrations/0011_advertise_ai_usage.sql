-- Advertise smart form: per-visitor hourly counters for website look-ups and AI ad-copy calls.
-- Visitors are a salted hash, never a raw IP. Over the limit, the form falls back to templates.
CREATE TABLE IF NOT EXISTS advertise_usage (
  vid   TEXT NOT NULL,
  kind  TEXT NOT NULL,
  hour  TEXT NOT NULL,
  n     INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (vid, kind, hour)
);
