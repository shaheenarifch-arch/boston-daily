-- Commerce engine: editorial formats, richer product data with explicit source types,
-- partner promotions, click attribution, and direct-sale orders.

-- Article format (independent of type): news, guide, buying_guide, review, comparison, best_list.
ALTER TABLE stories ADD COLUMN format TEXT;

-- Products: every product carries its commercial source type. Rendering and checkout depend on it.
--   affiliate          -> third-party product, CTA goes to the merchant through the affiliate URL
--   owned_inventory    -> sold by us: cart, checkout, payment, orders, returns
--   partner_promotion  -> approved partner campaign item
--   sponsored          -> paid placement
ALTER TABLE products ADD COLUMN source_type TEXT NOT NULL DEFAULT 'affiliate';
ALTER TABLE products ADD COLUMN brand TEXT;
ALTER TABLE products ADD COLUMN product_url TEXT;
ALTER TABLE products ADD COLUMN previous_price REAL;
ALTER TABLE products ADD COLUMN rating REAL;
ALTER TABLE products ADD COLUMN rating_count INTEGER;
ALTER TABLE products ADD COLUMN rating_source TEXT;
ALTER TABLE products ADD COLUMN subcategory TEXT;
ALTER TABLE products ADD COLUMN editorial_note TEXT;
ALTER TABLE products ADD COLUMN editors_pick INTEGER NOT NULL DEFAULT 0;
ALTER TABLE products ADD COLUMN sponsor_name TEXT;
ALTER TABLE products ADD COLUMN stock_qty INTEGER;
ALTER TABLE products ADD COLUMN variants TEXT;
ALTER TABLE products ADD COLUMN delivery_info TEXT;
ALTER TABLE products ADD COLUMN promotion TEXT;
ALTER TABLE products ADD COLUMN source TEXT;
CREATE INDEX IF NOT EXISTS idx_products_type ON products(source_type, status);

-- Partner promotions (offers supplied by an approved partner or affiliate source; never invented).
CREATE TABLE IF NOT EXISTS promotions (
  id               TEXT PRIMARY KEY,
  partner          TEXT NOT NULL,
  merchant_id      TEXT,
  title            TEXT NOT NULL,
  offer            TEXT,
  terms            TEXT,
  url              TEXT NOT NULL,
  image_url        TEXT,
  image_rights_ok  INTEGER NOT NULL DEFAULT 0,
  section_slug     TEXT,
  sponsored        INTEGER NOT NULL DEFAULT 0,
  starts_at        TEXT,
  expires_at       TEXT,
  source           TEXT,
  status           TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','paused','expired')),
  clicks           INTEGER NOT NULL DEFAULT 0,
  created_at       TEXT NOT NULL,
  updated_at       TEXT NOT NULL
);

-- Click attribution for commercial links (no personal data).
CREATE TABLE IF NOT EXISTS commerce_clicks (
  id          TEXT PRIMARY KEY,
  item_type   TEXT NOT NULL,
  item_id     TEXT NOT NULL,
  placement   TEXT,
  page        TEXT,
  created_at  TEXT NOT NULL
);

-- Direct sale (owned inventory only).
CREATE TABLE IF NOT EXISTS orders (
  id                 TEXT PRIMARY KEY,
  status             TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','paid','fulfilled','cancelled','refund_requested','refunded','returned')),
  email              TEXT,
  currency           TEXT NOT NULL DEFAULT 'USD',
  total              REAL NOT NULL DEFAULT 0,
  stripe_session_id  TEXT,
  shipping           TEXT,
  note               TEXT,
  created_at         TEXT NOT NULL,
  updated_at         TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS order_items (
  id          TEXT PRIMARY KEY,
  order_id    TEXT NOT NULL REFERENCES orders(id),
  product_id  TEXT NOT NULL,
  name        TEXT NOT NULL,
  variant     TEXT,
  qty         INTEGER NOT NULL,
  unit_price  REAL NOT NULL
);
