-- Boston Speakers' Corner events board (freedom of assembly): rallies, vigils, town halls, know-your-rights
-- trainings and interfaith gatherings posted by readers. Events go live at once; reports reach the editor.
-- Events at a private home are not allowed (targeted residential picketing is not protected; see Frisby v. Schultz).

CREATE TABLE IF NOT EXISTS corner_events (
  id             TEXT PRIMARY KEY,
  kind           TEXT NOT NULL CHECK (kind IN ('rally','vigil','townhall','training','interfaith','other')),
  title          TEXT NOT NULL,
  body           TEXT,
  starts_local   TEXT NOT NULL,          -- "YYYY-MM-DDTHH:MM" as entered, in the event's time zone
  ends_local     TEXT,
  tz             TEXT NOT NULL,          -- IANA zone from the state, e.g. America/New_York
  starts_at      TEXT NOT NULL,          -- UTC, for sorting
  ends_at        TEXT NOT NULL,          -- UTC (start + 2 h when no end time was given)
  online         INTEGER NOT NULL DEFAULT 0,
  online_url     TEXT,
  venue          TEXT,
  address        TEXT,
  town           TEXT,
  state          TEXT NOT NULL,          -- two-letter code
  organizer      TEXT NOT NULL,
  link           TEXT,
  tag            TEXT,
  going_count    INTEGER NOT NULL DEFAULT 0,
  report_count   INTEGER NOT NULL DEFAULT 0,
  status         TEXT NOT NULL DEFAULT 'live' CHECK (status IN ('live','hidden','removed')),
  status_reason  TEXT,
  ip_hash        TEXT,
  owner_key_hash TEXT,
  moderated_by   TEXT,
  moderated_at   TEXT,
  created_at     TEXT NOT NULL,
  updated_at     TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_corner_events_when ON corner_events(status, ends_at, starts_at);
CREATE INDEX IF NOT EXISTS idx_corner_events_ip ON corner_events(ip_hash, created_at);

CREATE TABLE IF NOT EXISTS corner_event_going (
  event_id   TEXT NOT NULL,
  vid        TEXT NOT NULL,
  created_at TEXT NOT NULL,
  PRIMARY KEY (event_id, vid)
);

CREATE TABLE IF NOT EXISTS corner_event_reports (
  id         TEXT PRIMARY KEY,
  event_id   TEXT NOT NULL,
  reason     TEXT NOT NULL,
  note       TEXT,
  vid        TEXT NOT NULL,
  resolved   INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_corner_event_reports_once ON corner_event_reports(event_id, vid);
CREATE INDEX IF NOT EXISTS idx_corner_event_reports_open ON corner_event_reports(resolved, created_at);
