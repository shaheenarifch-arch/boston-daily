-- Hero image health: checked by the scheduled job; broken images are repaired or removed so cards never show a broken picture.
ALTER TABLE stories ADD COLUMN image_checked_at TEXT;
