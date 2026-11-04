-- Front page (2026-11-04): put the midterm winners at the top of today's edition. The edition was built before the
-- results stories went live, so it still led with Tuesday's "polls open" preview. Lead: Democrats win both chambers;
-- then every race-winner story (Maine Senate, governors, Massachusetts). The rest of the edition moves down, nothing is removed.
UPDATE edition_items SET slot = 'top', position = position + 20
  WHERE edition_id = (SELECT id FROM editions WHERE edition_date = '2026-11-04') AND slot IN ('lead','top');
INSERT INTO edition_items (edition_id, story_id, slot, position)
  SELECT e.id, s.id, 'lead', 0 FROM editions e JOIN stories s ON s.id = 'bd-20261104-democrats-win-congress'
  WHERE e.edition_date = '2026-11-04' AND s.status IN ('PUBLISHED','UPDATED','CORRECTED')
  ON CONFLICT(edition_id, story_id) DO UPDATE SET slot = 'lead', position = 0;
INSERT INTO edition_items (edition_id, story_id, slot, position)
  SELECT e.id, s.id, 'top', CASE s.id WHEN 'bd-20261104-maine-jackson-collins' THEN 0 WHEN 'bd-20261104-governors-texas-ohio' THEN 1 WHEN 'bd-20261104-massachusetts-results' THEN 2 ELSE 3 END
  FROM editions e JOIN stories s ON s.id IN ('bd-20261104-maine-jackson-collins','bd-20261104-governors-texas-ohio','bd-20261104-massachusetts-results','bd-20261104-trump-reaction')
  WHERE e.edition_date = '2026-11-04' AND s.status IN ('PUBLISHED','UPDATED','CORRECTED')
  ON CONFLICT(edition_id, story_id) DO UPDATE SET slot = 'top', position = excluded.position;
