-- Cleanup for the Nov. 21, 2026 release, at the editor's request (Shaheen replied "Yes" on Nov. 21).
-- 1) Archive two live stories that the Nov. 21 drafts replace:
--    - "Patriots fear Drake Maye fractured his ankle..." (Nov. 17) is replaced by the fractured-fibula report.
--    - "Senate heads to key votes on the bipartisan permitting and power-grid bill..." (Nov. 18) is a preview of votes already taken.
--    Only stories that are already public are archived here. If either one is still in review, reject it in /admin instead.
-- 2) Clear the lead flag on every story created before Nov. 21, so the Nov. 21 news-conference story is the only lead candidate.
-- Nothing here publishes a story; the Nov. 21 drafts still need a human editor's approval in /admin.

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-archive-20261121', id, status, 'ARCHIVED', 'newsroom-assistant', 'Archived at editor request: replaced by the Nov. 21 Drake Maye fractured-fibula story', '2026-11-21T14:30:00.000Z'
  FROM stories WHERE id = 'bd-20261117-maye-ankle' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
UPDATE stories SET status = 'ARCHIVED', updated_at = '2026-11-21T14:30:00.000Z'
  WHERE id = 'bd-20261117-maye-ankle' AND status IN ('PUBLISHED','UPDATED','CORRECTED');

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-archive-20261121', id, status, 'ARCHIVED', 'newsroom-assistant', 'Archived at editor request: vote preview replaced by the Nov. 21 permitting story (Senate passed the bill 62-33 on Nov. 19)', '2026-11-21T14:30:00.000Z'
  FROM stories WHERE id = 'bd-20261118-senate-permitting-votes' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
UPDATE stories SET status = 'ARCHIVED', updated_at = '2026-11-21T14:30:00.000Z'
  WHERE id = 'bd-20261118-senate-permitting-votes' AND status IN ('PUBLISHED','UPDATED','CORRECTED');

UPDATE stories SET is_lead_candidate = 0
  WHERE is_lead_candidate = 1 AND created_at < '2026-11-21';
