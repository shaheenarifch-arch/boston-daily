-- Section descriptions now appear in section pages' meta descriptions. Replace the one internal note with reader-facing text. Loaded once.
UPDATE sections SET description = 'Health news, wellness guides and practical advice for everyday health' WHERE slug = 'health-wellness' AND description LIKE 'Health news is always%';
