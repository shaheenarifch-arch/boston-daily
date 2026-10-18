-- Wikimedia images are served from upload.wikimedia.org. Early drafts used thumb.wikimedia.org,
-- which does not serve images, so those stories showed no picture. Point them at the real host.
UPDATE stories SET hero_image_url = REPLACE(hero_image_url, 'https://thumb.wikimedia.org/', 'https://upload.wikimedia.org/')
  WHERE hero_image_url LIKE 'https://thumb.wikimedia.org/%';
