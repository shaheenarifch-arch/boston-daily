-- Privacy-friendly visitor counts (no cookies, no raw IPs: a daily salted hash) and a login guard.
CREATE TABLE IF NOT EXISTS visits (
  day  TEXT NOT NULL,
  vid  TEXT NOT NULL,
  PRIMARY KEY (day, vid)
);
CREATE TABLE IF NOT EXISTS pageviews (
  day  TEXT PRIMARY KEY,
  n    INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS auth_failures (
  ip            TEXT PRIMARY KEY,
  window_start  TEXT NOT NULL,
  n             INTEGER NOT NULL DEFAULT 0
);
