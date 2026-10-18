-- Boston Daily — initial schema
-- Two lanes share one content store: 'newsroom' (journalism) and 'partner_commerce'
-- (blog bot posts, sponsored content). Products, businesses and courses have their own tables.

-- Sections are configurable records, never a hardcoded list.
CREATE TABLE sections (
  slug               TEXT PRIMARY KEY,
  name               TEXT NOT NULL,
  kind               TEXT NOT NULL CHECK (kind IN ('news','niche','commerce')),
  parent_slug        TEXT,
  sort_order         INTEGER NOT NULL DEFAULT 100,
  in_nav             INTEGER NOT NULL DEFAULT 1,
  commerce_allowed   INTEGER NOT NULL DEFAULT 1,  -- 0 = no products/ads/network modules on this section
  always_human       INTEGER NOT NULL DEFAULT 0,  -- 1 = every story needs human approval (politics, health)
  description        TEXT,
  active             INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE stories (
  id                 TEXT PRIMARY KEY,
  slug               TEXT NOT NULL UNIQUE,
  lane               TEXT NOT NULL CHECK (lane IN ('newsroom','partner_commerce')),
  type               TEXT NOT NULL CHECK (type IN ('news_story','analysis','opinion','feature','blog_post','product_feature','sponsored')),
  section_slug       TEXT NOT NULL REFERENCES sections(slug),
  status             TEXT NOT NULL,
  sensitive          INTEGER NOT NULL DEFAULT 0,
  headline           TEXT NOT NULL,
  dek                TEXT,
  body               TEXT NOT NULL DEFAULT '',
  byline             TEXT,
  credited_reviewer  TEXT,
  hero_image_url     TEXT,
  hero_image_credit  TEXT,
  hero_image_rights  TEXT CHECK (hero_image_rights IN ('licensed','owned','public_domain','permitted_release') OR hero_image_rights IS NULL),
  disclosure_label   TEXT,          -- Affiliate | Sponsored | Partner Content (required for partner_commerce)
  disclosure_text    TEXT,
  sponsor_name       TEXT,
  source_system      TEXT NOT NULL DEFAULT 'manual', -- newsroom | seo-controller | manual | merchant_feed
  source_ref         TEXT,                            -- repo/path@sha, feed id, etc.
  priority           INTEGER NOT NULL DEFAULT 0,      -- higher = more prominent in edition building
  is_lead_candidate  INTEGER NOT NULL DEFAULT 0,
  approved_by        TEXT,
  approved_at        TEXT,
  scheduled_at       TEXT,
  published_at       TEXT,
  last_updated_at    TEXT,   -- public "Updated" timestamp
  corrected_at       TEXT,   -- public "Corrected" timestamp
  archived_at        TEXT,
  version            INTEGER NOT NULL DEFAULT 1,
  view_count         INTEGER NOT NULL DEFAULT 0,
  created_by         TEXT NOT NULL DEFAULT 'system',
  created_at         TEXT NOT NULL,
  updated_at         TEXT NOT NULL
);
CREATE INDEX idx_stories_status ON stories(status);
CREATE INDEX idx_stories_section ON stories(section_slug, status, published_at);
CREATE INDEX idx_stories_lane ON stories(lane, status);

-- Every published / updated / corrected text is preserved.
CREATE TABLE story_versions (
  id           TEXT PRIMARY KEY,
  story_id     TEXT NOT NULL REFERENCES stories(id),
  version      INTEGER NOT NULL,
  change_type  TEXT NOT NULL CHECK (change_type IN ('publish','update','correction')),
  headline     TEXT NOT NULL,
  dek          TEXT,
  body         TEXT NOT NULL,
  note         TEXT,
  editor       TEXT NOT NULL,
  created_at   TEXT NOT NULL
);
CREATE INDEX idx_versions_story ON story_versions(story_id, version);

-- Provenance: every source behind a story, with its rights type.
CREATE TABLE story_sources (
  id           TEXT PRIMARY KEY,
  story_id     TEXT NOT NULL REFERENCES stories(id),
  title        TEXT NOT NULL,
  url          TEXT,
  publisher    TEXT,
  channel      TEXT,
  rights_type  TEXT NOT NULL CHECK (rights_type IN ('LICENSED_REPUBLISH','PERMITTED_RELEASE','PUBLIC_DOMAIN','PRIMARY_SOURCE','DISCOVERY_ONLY','ORIGINAL')),
  license_ref  TEXT,
  verified     INTEGER NOT NULL DEFAULT 0,
  public       INTEGER NOT NULL DEFAULT 1,  -- show in the public Sources block
  retrieved_at TEXT,
  notes        TEXT,
  added_by     TEXT NOT NULL,
  created_at   TEXT NOT NULL
);
CREATE INDEX idx_sources_story ON story_sources(story_id);

-- Public update / correction notes shown on the story.
CREATE TABLE story_notices (
  id          TEXT PRIMARY KEY,
  story_id    TEXT NOT NULL REFERENCES stories(id),
  kind        TEXT NOT NULL CHECK (kind IN ('update','correction')),
  note        TEXT NOT NULL,
  editor      TEXT NOT NULL,
  created_at  TEXT NOT NULL
);
CREATE INDEX idx_notices_story ON story_notices(story_id);

-- Audit trail of every lifecycle transition (safe operational status only).
CREATE TABLE story_events (
  id           TEXT PRIMARY KEY,
  story_id     TEXT NOT NULL REFERENCES stories(id),
  from_status  TEXT,
  to_status    TEXT NOT NULL,
  actor        TEXT NOT NULL,
  note         TEXT,
  created_at   TEXT NOT NULL
);
CREATE INDEX idx_events_story ON story_events(story_id, created_at);
CREATE INDEX idx_events_time ON story_events(created_at);

-- Daily editions: a dated snapshot of which stories appear where.
CREATE TABLE editions (
  id              TEXT PRIMARY KEY,
  edition_date    TEXT NOT NULL UNIQUE,  -- YYYY-MM-DD (America/New_York)
  edition_number  INTEGER NOT NULL,
  status          TEXT NOT NULL CHECK (status IN ('draft','published')),
  published_at    TEXT,
  built_by        TEXT NOT NULL,
  created_at      TEXT NOT NULL
);
CREATE TABLE edition_items (
  edition_id  TEXT NOT NULL REFERENCES editions(id),
  story_id    TEXT NOT NULL REFERENCES stories(id),
  slot        TEXT NOT NULL CHECK (slot IN ('lead','top','editors_selection','section')),
  position    INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (edition_id, story_id)
);

-- Affiliate merchants and products (source of truth: master affiliate database, synced in).
CREATE TABLE merchants (
  id                     TEXT PRIMARY KEY,
  name                   TEXT NOT NULL,
  network                TEXT NOT NULL DEFAULT 'awin',
  network_merchant_id    TEXT,
  publisher_account_id   TEXT,
  display_name_allowed   INTEGER NOT NULL DEFAULT 1,
  category               TEXT,
  section_slug           TEXT,
  website                TEXT,
  status                 TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','paused','removed')),
  created_at             TEXT NOT NULL,
  updated_at             TEXT NOT NULL,
  UNIQUE (network, network_merchant_id)
);

CREATE TABLE products (
  id                TEXT PRIMARY KEY,
  merchant_id       TEXT NOT NULL REFERENCES merchants(id),
  external_id       TEXT NOT NULL,
  name              TEXT NOT NULL,
  description       TEXT,
  image_url         TEXT,
  image_rights_ok   INTEGER NOT NULL DEFAULT 0,
  price             REAL,
  currency          TEXT DEFAULT 'USD',
  availability      TEXT DEFAULT 'in_stock',
  deep_link         TEXT NOT NULL,
  category          TEXT,
  section_slug      TEXT,
  is_deal           INTEGER NOT NULL DEFAULT 0,
  status            TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','inactive','broken_link')),
  last_verified_at  TEXT,
  clicks            INTEGER NOT NULL DEFAULT 0,
  created_at        TEXT NOT NULL,
  updated_at        TEXT NOT NULL,
  UNIQUE (merchant_id, external_id)
);
CREATE INDEX idx_products_section ON products(section_slug, status);

-- Business registry: GetServices.ai network businesses + paid third-party listings.
CREATE TABLE businesses (
  id                 TEXT PRIMARY KEY,
  slug               TEXT NOT NULL UNIQUE,
  name               TEXT NOT NULL,
  domain             TEXT,
  logo_url           TEXT,
  grp                TEXT,
  section_slug       TEXT,
  short_description  TEXT,
  long_description   TEXT,
  owned_by_network   INTEGER NOT NULL DEFAULT 1,
  paid_listing       INTEGER NOT NULL DEFAULT 0,
  featured           INTEGER NOT NULL DEFAULT 0,
  sort_order         INTEGER NOT NULL DEFAULT 100,
  status             TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','hidden','unverified')),
  health_ok          INTEGER,
  last_health_check  TEXT,
  clicks             INTEGER NOT NULL DEFAULT 0,
  created_at         TEXT NOT NULL,
  updated_at         TEXT NOT NULL
);

-- RealSkillSet course catalog (Phase 1: catalog + outbound links; checkout is Phase 2).
CREATE TABLE courses (
  id           TEXT PRIMARY KEY,
  slug         TEXT NOT NULL UNIQUE,
  title        TEXT NOT NULL,
  type         TEXT NOT NULL CHECK (type IN ('owned','affiliate')),
  provider     TEXT NOT NULL DEFAULT 'RealSkillSet',
  category     TEXT,
  section_slug TEXT,
  level        TEXT,
  duration     TEXT,
  format       TEXT,
  price        REAL,
  currency     TEXT DEFAULT 'USD',
  url          TEXT NOT NULL,
  description  TEXT,
  status       TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','draft','inactive')),
  clicks       INTEGER NOT NULL DEFAULT 0,
  created_at   TEXT NOT NULL,
  updated_at   TEXT NOT NULL
);

-- Advertise With Us inquiries. Nothing is auto-accepted.
CREATE TABLE inquiries (
  id          TEXT PRIMARY KEY,
  type        TEXT NOT NULL,
  company     TEXT,
  name        TEXT,
  email       TEXT NOT NULL,
  website     TEXT,
  package     TEXT,
  budget      TEXT,
  dates       TEXT,
  message     TEXT,
  status      TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new','responded','negotiating','won','declined')),
  created_at  TEXT NOT NULL
);

-- Every ingestion attempt (blog bot, merchant sync, registry sync).
CREATE TABLE ingest_log (
  id          TEXT PRIMARY KEY,
  source      TEXT NOT NULL,
  ref         TEXT,
  result      TEXT NOT NULL,  -- published | queued | rejected | upserted | error
  detail      TEXT,
  created_at  TEXT NOT NULL
);
CREATE INDEX idx_ingest_time ON ingest_log(created_at);
