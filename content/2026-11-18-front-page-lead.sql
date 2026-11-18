-- Front-page fixes, part 2 (Nov. 18, 2026), at the editor's request.
-- 1) The Nov. 18 stories are approved, but the morning edition still led with Tuesday's Manila arrival story.
--    Put the Shenzhen story in the lead slot of the latest edition, move the old lead into Top stories and clear its lead flag.
-- 2) "A.J. Brown practices again as the Patriots open their week in Munich before facing the Lions" (Nov. 14) is a game
--    preview still in Latest updates after Lions 35, Patriots 10. Archive it.

UPDATE stories SET is_lead_candidate = 0 WHERE id = 'bd-20261117-trump-manila-asean';

DELETE FROM edition_items
  WHERE edition_id = (SELECT id FROM editions WHERE status = 'published' ORDER BY edition_date DESC LIMIT 1)
  AND story_id = 'bd-20261118-trump-shenzhen-xi-tarmac'
  AND EXISTS (SELECT 1 FROM stories WHERE id = 'bd-20261118-trump-shenzhen-xi-tarmac' AND status IN ('PUBLISHED','UPDATED','CORRECTED'));
UPDATE edition_items SET slot = 'top', position = 0
  WHERE edition_id = (SELECT id FROM editions WHERE status = 'published' ORDER BY edition_date DESC LIMIT 1)
  AND slot = 'lead'
  AND EXISTS (SELECT 1 FROM stories WHERE id = 'bd-20261118-trump-shenzhen-xi-tarmac' AND status IN ('PUBLISHED','UPDATED','CORRECTED'));
INSERT OR IGNORE INTO edition_items (edition_id, story_id, slot, position)
  SELECT e.id, s.id, 'lead', 0 FROM editions e, stories s
  WHERE e.id = (SELECT id FROM editions WHERE status = 'published' ORDER BY edition_date DESC LIMIT 1)
  AND s.id = 'bd-20261118-trump-shenzhen-xi-tarmac' AND s.status IN ('PUBLISHED','UPDATED','CORRECTED');

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-archive-20261118', id, status, 'ARCHIVED', 'newsroom-assistant', 'Archived at editor request: game preview superseded by the Lions 35, Patriots 10 result', '2026-11-18T13:00:00.000Z'
  FROM stories WHERE id = 'bd-20261113-patriots-munich-practice' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
UPDATE stories SET status = 'ARCHIVED', updated_at = '2026-11-18T13:00:00.000Z'
  WHERE id = 'bd-20261113-patriots-munich-practice' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
