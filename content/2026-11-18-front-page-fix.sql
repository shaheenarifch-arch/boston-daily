-- Front-page fixes requested by the editor (Nov. 18, 2026).
-- 1) The "TEST - Guest post email check, please decline" item is live under More headlines. Archive it and decline its submission.
-- 2) The Patriots-Lions injury-report preview from Nov. 14 is still in Most read after the game was played. Archive it.
-- 3) Old lead candidates from Nov. 3-6 (and earlier) still sort above newer stories, so they fill the cards under the lead.
--    Clear the lead flag on every published story written before Nov. 17. They stay published and in their sections.
-- Events are recorded first so each story's history shows the change.

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-archive-20261118', id, status, 'ARCHIVED', 'newsroom-assistant', 'Archived at editor request: test guest post must not appear on the site', '2026-11-18T12:40:00.000Z'
  FROM stories WHERE slug = 'test-guest-post-email-check-please-decline' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-archive-20261118', id, status, 'ARCHIVED', 'newsroom-assistant', 'Archived at editor request: game preview superseded by the Lions 35, Patriots 10 result', '2026-11-18T12:40:00.000Z'
  FROM stories WHERE slug = 'patriots-injury-report-aj-brown-stevenson-questionable-lions-munich' AND status IN ('PUBLISHED','UPDATED','CORRECTED');

INSERT OR IGNORE INTO guest_post_events (id, guest_post_id, kind, note, actor, created_at)
  SELECT id || '-ev-decline-20261118', id, 'status', 'Declined: internal test submission (editor request)', 'newsroom-assistant', '2026-11-18T12:40:00.000Z'
  FROM guest_posts WHERE story_id IN (SELECT id FROM stories WHERE slug = 'test-guest-post-email-check-please-decline') AND status != 'declined';
UPDATE guest_posts SET status = 'declined', updated_at = '2026-11-18T12:40:00.000Z'
  WHERE story_id IN (SELECT id FROM stories WHERE slug = 'test-guest-post-email-check-please-decline');

UPDATE stories SET status = 'ARCHIVED', updated_at = '2026-11-18T12:40:00.000Z'
  WHERE slug IN ('test-guest-post-email-check-please-decline', 'patriots-injury-report-aj-brown-stevenson-questionable-lions-munich')
  AND status IN ('PUBLISHED','UPDATED','CORRECTED');

UPDATE stories SET is_lead_candidate = 0
  WHERE is_lead_candidate = 1 AND created_at < '2026-11-17' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
