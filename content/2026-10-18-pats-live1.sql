-- In-game update: Patriots vs. Jets. Draft for editor approval.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-pats-live1', 'patriots-jets-live-maye-doubs-touchdown-second-quarter', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Patriots lead Jets 10-3 as Maye hits Doubs for 42-yard touchdown', 'New England''s defense held the Jets to a field goal through the second quarter at Gillette, though injuries piled up on the offensive line.', 'The Patriots led the New York Jets 10-3 in the second quarter at Gillette Stadium on Sunday, according to The Boston Globe''s live coverage as of 2:22 p.m.

## How the scoring went

| Quarter | Team | Play | Score |
|---|---|---|---|
| 1st | Jets | Field goal capping a 13-play opening drive | NYJ 3-0 |
| 1st | Patriots | Drake Maye 42-yard TD pass to Romeo Doubs | NE 7-3 |
| 2nd | Patriots | Andy Borregales 32-yard field goal | NE 10-3 |

New England''s defense sacked Geno Smith twice, with Milton Williams and Christian Barmore each getting to him, and the Jets turned the ball over on downs twice in the first half, the Globe reported. Jets running back Braelon Allen had 48 yards on eight carries through the first quarter.

## Injuries to watch

- **Romeo Doubs** (shoulder) walked off after his touchdown and was listed as questionable, according to the Globe.
- **Alijah Vera-Tucker** (hamstring) and **Morgan Moses** (ankle) were questionable to return on the offensive line; Matt Pryor replaced Vera-Tucker.
- Cornerback **Carlton Davis** was ruled out before kickoff, Boston.com reported, while A.J. Brown, Christian Gonzalez, TreVeyon Henderson and Will Campbell were set to play.
- The Jets were without running back Breece Hall (quad).

The Patriots entered 3-2 and the Jets 2-3, according to NFL.com. The game is on CBS.

*This is an in-game update. Boston Daily will post the final score and recap after the game.*', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-pats-live1.sql', 9, 1, 'newsroom-assistant', '2026-10-18T18:45:00.000Z', '2026-10-18T18:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-pats-live1-src1', 'bd-20261018-pats-live1', 'Patriots vs. Jets live score updates', 'https://www.bostonglobe.com/2026/10/18/sports/patriots-jets-live-score-updates/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T18:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T18:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-pats-live1-src2', 'bd-20261018-pats-live1', 'Patriots vs. Jets live coverage', 'https://www.boston.com/new-england-patriots/live/patriots-vs-jets-live-coverage-can-drake-maye-new-england-keep-momentum-rolling-at-home/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T18:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T18:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-pats-live1-src3', 'bd-20261018-pats-live1', 'Jets at Patriots, 2026 Week 6 game center', 'https://www.nfl.com/games/jets-at-patriots-2026-reg-6', 'NFL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T18:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T18:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-pats-live1-ev1', 'bd-20261018-pats-live1', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'In-game update drafted from live coverage; awaiting editor approval', '2026-10-18T18:45:00.000Z');
UPDATE stories SET is_lead_candidate = 0 WHERE id = 'bd-20261018-patriots-jets';
