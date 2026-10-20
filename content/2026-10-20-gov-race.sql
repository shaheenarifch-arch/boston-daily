-- Newsroom draft (2026-10-20 evening): Massachusetts governor race. Written from opened news reports; campaign fundraising emails were used as a tip only, not as a source.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-gov-race', 'healey-leads-minogue-poll-two-weeks-before-election', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Healey leads Minogue by 25 points two weeks before Election Day, poll finds', 'A UMass Amherst/WCVB poll has the governor at 57% to 32% after a heated final debate over costs, housing and energy.', 'Gov. Maura Healey holds a wide lead over Republican Mike Minogue two weeks before Election Day, according to a new UMass Amherst/WCVB poll reported by WBUR.

| Candidate | Party | Likely voters |
|---|---|---|
| Maura Healey | Democrat (incumbent) | 57% |
| Mike Minogue | Republican | 32% |

The poll surveyed 800 people from Oct. 5 to 12, before the final debate. Its margin of error is 4.2 points.

## A heated final debate

At their last debate on Oct. 15, the candidates clashed over costs, housing and energy, WBUR reported. Healey blamed President Trump''s tariffs for rising prices. Minogue said state policy had pushed up residents'' bills, called for an immediate gas-tax cut and proposed a 45-day housing permit timeline. Healey said the state had already cut its own permit timeline to 30 days. She has also proposed cutting the gas tax, but the Legislature has not acted.

## Minogue''s Montana home

Healey''s campaign has made Minogue''s wealth an issue, pointing to a Montana home that state records value at $31 million, which The Boston Globe first reported in July. Minogue, the former chief executive of Abiomed, told the Globe he had "met the criteria" for disclosing his assets. His campaign has called the valuation overinflated.

## What''s next

Independent candidate Andrea James is also on the ballot but was not invited to the debate. Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-20-gov-race.sql', 8, 0, 'newsroom-assistant', '2026-10-20T21:45:00.000Z', '2026-10-20T21:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-gov-race-src1', 'bd-20261020-gov-race', 'UMass Amherst/WCVB poll on the governor''s race and ballot questions', 'https://www.wbur.org/news/2026/10/19/massachusetts-governors-race-ballot-question-poll', 'WBUR', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T21:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T21:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-gov-race-src2', 'bd-20261020-gov-race', 'Healey and Minogue meet in unbridled final debate before election', 'https://www.wbur.org/news/2026/10/15/healey-and-minogue-meet-in-unbridled-final-debate-before-election', 'WBUR', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T21:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T21:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-gov-race-src3', 'bd-20261020-gov-race', 'Michael Minogue says he ''met the criteria'' for disclosing wealth', 'https://www.bostonglobe.com/2026/08/01/metro/michael-minogue-wealth-disclosures/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T21:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T21:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-gov-race-ev1', 'bd-20261020-gov-race', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting; awaiting editor approval', '2026-10-20T21:45:00.000Z');
