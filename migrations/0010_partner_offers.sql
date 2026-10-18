-- Partner Offers: category-aware products in the side panel (src/offers.js).
-- Products: approved tags, extra categories, eligible regions, promotion window, flags.
ALTER TABLE products ADD COLUMN tags TEXT;              -- comma-separated, lowercase: "laptops,accessories"
ALTER TABLE products ADD COLUMN extra_sections TEXT;    -- comma-separated section slugs beyond section_slug
ALTER TABLE products ADD COLUMN regions TEXT;           -- comma-separated codes ("US,UK"); NULL = everywhere
ALTER TABLE products ADD COLUMN promo_label TEXT;
ALTER TABLE products ADD COLUMN promo_start TEXT;       -- YYYY-MM-DD
ALTER TABLE products ADD COLUMN promo_end TEXT;         -- YYYY-MM-DD (inclusive); past = excluded
ALTER TABLE products ADD COLUMN featured INTEGER NOT NULL DEFAULT 0;      -- editorially featured / approved site-wide
ALTER TABLE products ADD COLUMN sponsored INTEGER NOT NULL DEFAULT 0;     -- paid placement: shows a Sponsored label
ALTER TABLE products ADD COLUMN sensitive_ok INTEGER NOT NULL DEFAULT 0;  -- editor-approved for a manually chosen module on a sensitive page

-- Categories: switch Partner Offers off, and the category's product keywords.
ALTER TABLE sections ADD COLUMN partner_offers INTEGER NOT NULL DEFAULT 1;
ALTER TABLE sections ADD COLUMN offer_tags TEXT;

-- Articles: switch Partner Offers off, or pick the products by hand (comma-separated product ids).
ALTER TABLE stories ADD COLUMN partner_offers INTEGER NOT NULL DEFAULT 1;
ALTER TABLE stories ADD COLUMN partner_offer_ids TEXT;

-- Impressions and clicks per day, page category and product. No story, candidate or viewpoint is stored.
CREATE TABLE IF NOT EXISTS offer_stats (
  day          TEXT NOT NULL,
  page_section TEXT NOT NULL,
  product_id   TEXT NOT NULL,
  impressions  INTEGER NOT NULL DEFAULT 0,
  clicks       INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (day, page_section, product_id)
);
