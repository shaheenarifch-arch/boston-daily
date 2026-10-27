-- Newsletter sign-ups from Shaheen's other websites (affiliate sites, GetServices.ai), one list tagged by site.
-- Separate from `subscribers`, which holds Boston Daily's own daily/weekly readers.
CREATE TABLE IF NOT EXISTS site_subscribers (
  id          TEXT PRIMARY KEY,
  site        TEXT NOT NULL,
  email       TEXT NOT NULL,
  status      TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','unsubscribed')),
  token       TEXT NOT NULL UNIQUE,
  source_page TEXT,
  created_at  TEXT NOT NULL,
  updated_at  TEXT NOT NULL,
  UNIQUE (site, email)
);
CREATE INDEX IF NOT EXISTS idx_site_subscribers_site ON site_subscribers (site, status);
