-- Sports fill for 2026-10-18: stories for every sport. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain or Creative Commons with credit; editor to confirm each image renders and its license.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-nfl-week-six', 'nfl-week-6-sunday-preview-chiefs-chargers-cowboys-packers-ravens-browns', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'NFL Week 6: Ravens-Browns, Cowboys-Packers headline a crowded Sunday', 'With Denver''s overtime win over Seattle already in the books, a 12-game Sunday tests division leaders and winless teams alike.', 'The NFL''s Week 6 began Thursday night, when the Denver Broncos beat the Seattle Seahawks 17-14 in overtime. According to the Associated Press, cornerback Ja''Quan McMillian intercepted Sam Darnold in the extra period, and Wil Lutz then hit a 53-yard field goal to win it. Denver moved to 4-2. Seattle, the defending champion, fell to 3-3.

Twelve more games are on the schedule for Sunday, with Washington at San Francisco closing the week on Monday night. Cincinnati, Detroit, Miami and Minnesota have the week off.

## Games to watch

| Time (ET) | Matchup | Records entering week |
|---|---|---|
| 9:30 a.m. | Houston vs. Jacksonville (London) | 1-4 vs. 4-1 |
| 1:00 p.m. | Baltimore at Cleveland | 4-1 at 3-2 |
| 4:25 p.m. | Buffalo at Las Vegas | 4-1 at 3-2 |
| 4:25 p.m. | L.A. Chargers at Kansas City | 0-5 at 4-0 |
| 8:20 p.m. | Dallas at Green Bay | 2-3 at 3-2 |
| Mon., 8:15 p.m. | Washington at San Francisco | 1-3-1 at 5-0 |

Sources: CBS Sports schedule; records per Sports Illustrated.

Sports Illustrated rates Dallas at Green Bay as Sunday''s top game. It is the teams'' first meeting since the Micah Parsons trade, though Parsons is still recovering from a knee injury. Baltimore goes to Cleveland with Lamar Jackson out because of an ankle injury, according to the NFL''s official injury report.

## Standings storylines

The 49ers and Chiefs are the league''s last unbeaten teams that play this week. Tennessee and the Chargers are both 0-5. Tennessee plays at Indianapolis.

In the NFC West, SI notes the Rams are only one game ahead of Arizona, which has lost four in a row. The two teams play Sunday in Los Angeles. Buffalo leads the AFC East.

In the 1 p.m. window, the Patriots (3-2) host the Jets.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Aerial_view_of_Indianapolis,_Indiana,_with_a_focus_on_Lucas_Oil_Stadium,_highsm.40934.jpg/1280px-Aerial_view_of_Indianapolis,_Indiana,_with_a_focus_on_Lucas_Oil_Stadium,_highsm.40934.jpg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nfl-week-six-src1', 'bd-20261018-nfl-week-six', 'NFL Schedule - Week 6', 'https://www.cbssports.com/nfl/schedule/2026/regular/6/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nfl-week-six-src2', 'bd-20261018-nfl-week-six', 'NFL Week 6 schedule 2026: Ranking every game from worst to best', 'https://www.si.com/nfl/nfl-week-6-schedule-2026-ranking-every-game-from-worst-to-best', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nfl-week-six-src3', 'bd-20261018-nfl-week-six', 'Broncos beat Seahawks 17-14 in OT (AP)', 'https://www.nbcsportsboston.com/nfl/broncos-beat-seahawks-17-14/807870/', 'Associated Press (via NBC Sports Boston)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nfl-week-six-src4', 'bd-20261018-nfl-week-six', 'Official NFL Injury Report - Week 6 of the 2026 Season', 'https://www.nfl.com/injuries/league/2026/reg6', 'NFL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-nfl-week-six-ev1', 'bd-20261018-nfl-week-six', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-cfb-upset-saturday', 'college-football-oct-17-georgia-texas-alabama-notre-dame-indiana-lose-top-25-upsets', 'newsroom', 'news_story', 'college-football', 'EDITORIAL_REVIEW', 0, 'Five of top seven fall: Georgia, Notre Dame, Indiana lose on wild Saturday', 'Auburn stunned No. 1 Georgia on a last-second kick as upsets tore through the top of the rankings on Oct. 17.', 'The top of the college football rankings fell apart Saturday. Five of the seven highest-ranked teams lost, including No. 1 Georgia, No. 2 Notre Dame and previously unbeaten No. 5 Indiana.

## Georgia stunned at home

Unranked Auburn beat Georgia 27-24 at Sanford Stadium on a field goal as time ran out, according to Sports Illustrated. It was Georgia''s first loss, dropping the Bulldogs to 6-1, and ended a run of 93 straight home wins over unranked opponents.

In Bloomington, No. 4 Ohio State beat Indiana 19-15. SI reported that the loss ended the Hoosiers'' 22-game winning streak, and that the finish turned on an out-of-bounds ruling on a possible winning touchdown.

Later Saturday night, No. 8 BYU beat Notre Dame 28-24. Unranked Florida beat No. 7 Texas, and No. 14 Tennessee handled No. 6 Alabama. No. 3 Miami stayed unbeaten, but only after two overtimes against Florida State.

## Top-25 results

| Winner | Score | Loser |
|---|---|---|
| Auburn | 27-24 | No. 1 Georgia |
| No. 8 BYU | 28-24 | No. 2 Notre Dame |
| No. 3 Miami | 43-35 (2OT) | Florida State |
| No. 4 Ohio State | 19-15 | No. 5 Indiana |
| No. 14 Tennessee | 26-10 | No. 6 Alabama |
| Florida | 27-24 | No. 7 Texas |
| No. 9 Ole Miss | 31-3 | No. 13 Missouri |
| No. 11 Utah | 27-24 | Colorado |
| No. 15 Kentucky | 21-13 | Oklahoma |
| No. 20 Houston | 35-32 | No. 18 Oklahoma State |
| No. 22 LSU | 31-0 | No. 16 Mississippi State |

Rankings are from before Saturday''s games. Scores are from NCAA.com.

A new No. 1 is guaranteed in Sunday''s AP poll. Miami and Ohio State are the leading candidates.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 7, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cfb-upset-saturday-src1', 'bd-20261018-cfb-upset-saturday', 'College football Week 7: Recaps, highlights, rankings and scores', 'https://www.ncaa.com/live-updates/football/fbs/college-football-week-7-live-updates-schedule-scores-rankings', 'NCAA.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cfb-upset-saturday-src2', 'bd-20261018-cfb-upset-saturday', 'Will There Be a New No. 1 Team in the College Football Rankings This Week?', 'https://www.si.com/fannation/college/cfb-hq/rankings/college-football-rankings-no-1-georgia-bulldogs-auburn-upset', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-cfb-upset-saturday-ev1', 'bd-20261018-cfb-upset-saturday', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-cbb-season-preview', 'college-basketball-2026-27-preview-opening-night-uconn-big-east-favorite', 'newsroom', 'news_story', 'college-basketball', 'EDITORIAL_REVIEW', 0, 'College basketball 2026-27: Season tips Nov. 2; UConn picked to win Big East', 'A midnight opener, an early Florida-Duke showdown and a preseason nod for UConn headline the run-up to the new season.', 'The 2026-27 men''s college basketball season is two weeks away. The first official game tips off at midnight on Monday, Nov. 2, when High Point plays Liberty in Rock Hill, S.C. Visit York County, the event''s host, says that game opens a daylong marathon of games.

The first night has a marquee game too. According to ESPN, Florida hosts Miami at 6 p.m. Eastern on ESPN2. Florida is No. 1 in ESPN''s "Way-Too-Early" Top 25, with Duke No. 2. Those two meet Dec. 1 in the SEC/ACC Challenge.

## Early dates to circle

| Date | Game | Site |
|---|---|---|
| Nov. 2 | High Point vs. Liberty | Rock Hill, S.C. (midnight ET) |
| Nov. 2 | Miami at Florida | Gainesville |
| Nov. 10 | Kansas vs. Kentucky | Champions Classic, Chicago |
| Nov. 17 | Michigan State at Tennessee | Knoxville |
| Dec. 1 | Duke at Florida | SEC/ACC Challenge |

Source: ESPN/SEC schedule release, Oct. 7.

## UConn the Big East pick

The Big East''s coaches picked UConn to win the league, according to the Associated Press. Guard Silas Demary Jr. was named preseason player of the year. The Huskies have reached three of the last four national championship games.

The Philadelphia Inquirer reported that UConn got 98 points and eight first-place votes. Defending champion St. John''s was second with 90 points, followed by Villanova, Marquette and Providence. WFSB reported that sophomore Braylon Mullins was a unanimous first-team all-conference pick.

The Associated Press preseason Top 25 had not appeared in the sources reviewed for this story. Preseason picks for Boston College and Harvard were also not available.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 5, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cbb-season-preview-src1', 'bd-20261018-cbb-season-preview', 'ESPN and SEC announce 2026-27 men''s college basketball schedule', 'https://espnpressroom.com/press-release/espn-and-sec-announce-2026-27-mens-college-basketball-schedule-with-more-than-230-games-across-espn-networks/', 'ESPN Press Room', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cbb-season-preview-src2', 'bd-20261018-cbb-season-preview', 'Field of 68 returns midnight tip: High Point vs. Liberty to open 2026-27 season in Rock Hill', 'https://www.visityorkcounty.com/articles/post/field-of-68-returns-midnight-tip-in-rock-hill/', 'Visit York County', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cbb-season-preview-src3', 'bd-20261018-cbb-season-preview', 'UConn picked to win Big East, led by preseason player of the year Silas Demary Jr. (AP)', 'https://www.nbcsports.com/mens-college-basketball/news/uconn-picked-to-win-big-east-led-by-preseason-conference-player-of-the-year-silas-demary-jr', 'Associated Press (via NBC Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cbb-season-preview-src4', 'bd-20261018-cbb-season-preview', 'Big East men''s and women''s basketball preseason poll', 'https://www.inquirer.com/college-sports/villanova/big-east-mens-womens-basketball-preseason-poll-all-conference-20261001.html', 'The Philadelphia Inquirer', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-cbb-season-preview-src5', 'bd-20261018-cbb-season-preview', 'UConn men''s basketball the Big East preseason favorite', 'https://www.wfsb.com/2026/10/01/uconn-mens-basketball-big-east-preseason-favorite/', 'WFSB', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-cbb-season-preview-ev1', 'bd-20261018-cbb-season-preview', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-hurts-blood-clot', 'jalen-hurts-blood-clot-out-eagles-panthers-qb-injuries-week-6', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Hurts out with blood clot as QB injuries pile up across the NFL', 'Philadelphia turns to Tanner McKee on Sunday, one of several teams playing without their starting quarterback in Week 6.', 'The Philadelphia Eagles will play Sunday''s game against Carolina without Jalen Hurts. The quarterback has a superficial blood clot in his calf, the team said.

According to NBC Sports Philadelphia, Hurts was hurt in the Oct. 4 game against the Rams. An ultrasound in London found the clot before the Eagles'' Week 5 game, and medical staff cleared him to play in the 19-17 loss to Jacksonville. A follow-up scan Wednesday showed the clot had moved, and the team ruled him out Thursday.

Tanner McKee, who has not played in a game this season, is expected to start. The Eagles said Hurts''s health is their top priority while they decide on treatment.

A Temple Health vascular surgeon told 6abc that clots like this usually heal with rest. Full recovery can take up to six weeks, she said, but Hurts may be able to return sooner. Philadelphia will also be without running back Saquon Barkley, who is out with a hamstring injury, according to the NFL''s official injury report.

## Quarterbacks out for Week 6

| Team | Player | Injury | Status |
|---|---|---|---|
| Eagles | Jalen Hurts | Calf | Out |
| Ravens | Lamar Jackson | Ankle | Out |
| Buccaneers | Baker Mayfield | Thumb | Out |
| Bears | Caleb Williams | Hamstring | Questionable |

Source: NFL.com Week 6 injury report.

Jackson''s absence leaves Baltimore with Tyler Huntley for its game at Cleveland, Sports Illustrated reported. In Tampa Bay, Mayfield is out with a right thumb injury. Chicago''s Caleb Williams is questionable but practiced fully.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-hurts-blood-clot-src1', 'bd-20261018-hurts-blood-clot', 'Official NFL Injury Report - Week 6 of the 2026 Season', 'https://www.nfl.com/injuries/league/2026/reg6', 'NFL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-hurts-blood-clot-src2', 'bd-20261018-hurts-blood-clot', 'Jalen Hurts out with blood clot vs. Panthers: Eagles statement', 'https://www.nbcsportsboston.com/nfl/jalen-hurts-out-with-blood-clot-panthers-eagles-statement/807782/', 'NBC Sports Philadelphia', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-hurts-blood-clot-src3', 'bd-20261018-hurts-blood-clot', 'Eagles QB Jalen Hurts ruled out vs. Panthers with blood clot in calf', 'https://6abc.com/post/philadelphia-eagles-qb-jalen-hurts-carolina-panthers-team/19941083/', '6abc Philadelphia (WPVI)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-hurts-blood-clot-src4', 'bd-20261018-hurts-blood-clot', 'NFL Week 6 schedule 2026: Ranking every game from worst to best', 'https://www.si.com/nfl/nfl-week-6-schedule-2026-ranking-every-game-from-worst-to-best', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-hurts-blood-clot-ev1', 'bd-20261018-hurts-blood-clot', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-nba-opening-week', 'nba-2026-27-opening-week-preview-lebron-sixers-knicks-banner', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'NBA opens Tuesday: LeBron''s Sixers debut meets Knicks banner night', 'The 2026-27 season starts with a national tripleheader, and three teams stand out as early title favorites.', 'The NBA''s 81st season tips off Tuesday, Oct. 20, with a national tripleheader on NBC and Peacock. The night is packed with storylines, and the biggest one lands at Madison Square Garden.

That is where LeBron James makes his debut with the Philadelphia 76ers, according to Awful Announcing, and where the Knicks will raise their 2025-26 championship banner, Fox Sports reports. Jaylen Brown, traded away by Boston this offseason, also suits up for Philadelphia for the first time.

## Opening week

| Date | Matchup | TV |
|---|---|---|
| Tue., Oct. 20 | Celtics at Pistons, 3 p.m. | NBC/Peacock |
| Tue., Oct. 20 | 76ers at Knicks, 7 p.m. | NBC/Peacock |
| Tue., Oct. 20 | Thunder at Spurs, 9:30 p.m. | NBC/Peacock |
| Wed., Oct. 21 | Timberwolves-Heat; Warriors-Lakers | ESPN |
| Thu., Oct. 22 | Cavaliers-76ers; Thunder-Nuggets | ESPN |
| Fri., Oct. 23 | Knicks-Celtics; Rockets-Spurs | Prime Video |

*Times ET. Wednesday-Friday pairings per Bleacher Report.*

## Who can win it

ESPN''s Zach Kram puts three teams in a tier of their own: New York, Oklahoma City and San Antonio. They were the only clubs to win a conference finals game last spring, and they bring back nearly all of their starters. The Knicks and Thunder own the last two titles, and the Spurs reached the Finals in June.

The summer reshaped much of the rest of the league. Giannis Antetokounmpo is gone from Milwaukee, the Lakers moved on without James, and Washington took AJ Dybantsa with the No. 1 pick, Kram writes.

The NBA Cup group stage starts Oct. 30, and the regular season ends April 11.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nba-opening-week-src1', 'bd-20261018-nba-opening-week', 'When does the 2026-27 NBA season start? Opening Night schedule', 'https://www.foxsports.com/stories/nba/when-does-2026-27-nba-season-start-opening-night-schedule', 'Fox Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nba-opening-week-src2', 'bd-20261018-nba-opening-week', '2026-27 NBA opening week schedule', 'https://bleacherreport.com/articles/25470153-2026-27-nba-opening-week-schedule-lebron-76ers-vs-brunson-knicks-and-every-game-released', 'Bleacher Report', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nba-opening-week-src3', 'bd-20261018-nba-opening-week', 'NBA 2026-27 opening night and Christmas Day schedule', 'https://awfulannouncing.com/nba/2026-27-opening-night-christmas-day-schedule-lebron-sixers.html', 'Awful Announcing', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nba-opening-week-src4', 'bd-20261018-nba-opening-week', 'NBA preview 2026-27: Zach Kram tiers all 30 teams', 'https://abc7ny.com/post/nba-preview-2026-27-zach-kram-tiers-30-teams/19809872/', 'ESPN (via ABC7 New York)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-nba-opening-week-ev1', 'bd-20261018-nba-opening-week', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-nhl-early-season', 'nhl-early-season-2026-27-rangers-kraken-flyers-hellebuyck', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'NHL''s first two weeks: Rangers roll without Shesterkin, Flyers still winless', 'Surprise starts in New York, Seattle and Ottawa share the spotlight with trade demands and Ovechkin''s farewell season.', 'Two weeks into the 2026-27 season, the early NHL standings have some surprises, and several of the league''s biggest stories are happening away from the ice.

## Early standouts and strugglers

NHL.com''s Dan Rosen, writing Oct. 14, pointed to these clubs:

| Team | Record | Note |
|---|---|---|
| N.Y. Rangers | 6-2-0 | 5-0-0 at home |
| Seattle | 5-2-0 | 4.00 goals per game |
| Ottawa | 5-2-0 | Linus Ullmark 5-0-0 |
| Winnipeg | 4-1-1 | Winning without Hellebuyck |
| Philadelphia | 0-5-3 | Only winless East team |

The Rangers have kept winning even though goaltender Igor Shesterkin is out for the season with a lower-body injury. Rookie Dylan Garand has stepped in. Seattle is scoring at a high rate but is being outshot, which suggests regression could come. Philadelphia has been outscored 30-10.

The Hockey News'' Adam Proteau also flagged Utah''s fast start and Philadelphia''s struggles in his Oct. 7 look at what''s real and what isn''t.

## Off-ice drama

In Winnipeg, Connor Hellebuyck is suspended after he asked for a trade and skipped training camp, according to NHL.com. The Deseret News reported that Detroit captain Dylan Larkin has also asked to be traded.

The season is also a farewell tour. Alex Ovechkin, who passed Wayne Gretzky for the career goals record in 2025, has said this will be his last NHL season, the Deseret News reported.

In Edmonton, Devon Levi, picked up from Buffalo for two 2028 draft picks, is 3-0 since a rough first start.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Ingalls_Rink_Highsmith.jpg/1280px-Ingalls_Rink_Highsmith.jpg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18-sports.sql', 5, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nhl-early-season-src1', 'bd-20261018-nhl-early-season', 'Surprises two weeks into 2026-27 season, according to NHL.com''s Dan Rosen', 'https://www.nhl.com/news/dan-rosen-weekly-national-hockey-list-biggest-surprises-early-2026-27', 'NHL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nhl-early-season-src2', 'bd-20261018-nhl-early-season', 'What''s real and what''s not in the early stages of the NHL season', 'https://thehockeynews.com/news/latest-news/whats-real-and-whats-not-in-the-early-stages-of-the-nhl-season', 'The Hockey News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nhl-early-season-src3', 'bd-20261018-nhl-early-season', 'NHL storylines, October 2026', 'https://www.deseret.com/sports/2026/10/05/nhl-storylines-october-2026/', 'Deseret News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-nhl-early-season-ev1', 'bd-20261018-nhl-early-season', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-mls-playoff-picture', 'mls-playoff-picture-2026-revolution-clinch-decision-day', 'newsroom', 'news_story', 'mls', 'EDITORIAL_REVIEW', 0, 'Revolution in the MLS playoffs, now chasing seeding before Decision Day', 'New England has clinched a postseason spot and hosts Chicago on Sunday, with the regular season ending Nov. 7.', 'The Revolution have secured a playoff spot. What''s still undecided is where they will be seeded, with the MLS regular season wrapping up on Decision Day, Nov. 7.

New England clinched with a 3-2 win at FC Cincinnati on Wednesday, MLSsoccer.com reported. That left the Revs third in the Eastern Conference with 49 points (15-10-4) and five games to play. Next up is a home game against Chicago on Sunday. The Fire clinched their own spot Saturday and sit just behind New England with 48 points.

A Nov. 1 visit from Inter Miami could decide second place in the East, according to the league site.

## Who''s in

According to the league''s clinching tracker and team announcements, these clubs have qualified so far: Nashville SC, Inter Miami, New England and Chicago in the East, and FC Dallas, St. Louis CITY SC, Vancouver, Houston and San Jose in the West.

Nashville has been the league''s best team. Before drawing 1-1 at San Jose on Saturday, it had 66 points, putting it on pace to break the single-season points record of 74 set by Miami in 2024.

## Postseason schedule

Nine teams per conference make the playoffs. Seeds 8 and 9 play a one-game wild card for the last spot in Round One.

| Round | Dates |
|---|---|
| Decision Day | Sat., Nov. 7 |
| Wild Card | Wed., Nov. 18 |
| Round One (best-of-3) | Nov. 20-Dec. 2 |
| Conference Semifinals | Dec. 5-6 |
| Conference Finals | Dec. 11-12 |
| MLS Cup | Fri., Dec. 18 |

All playoff games stream on Apple TV, and MLS Cup will also air on Fox.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src1', 'bd-20261018-mls-playoff-picture', 'New England Revolution clinch Audi 2026 MLS Cup Playoffs spot', 'https://www.mlssoccer.com/news/new-england-revolution-clinch-audi-2026-mls-cup-playoffs-spot', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src2', 'bd-20261018-mls-playoff-picture', 'Chicago Fire FC clinch Audi 2026 MLS Cup Playoffs spot', 'https://www.mlssoccer.com/playoffs/2026/news/chicago-fire-fc-clinch-audi-2026-mls-cup-playoffs-spot', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src3', 'bd-20261018-mls-playoff-picture', 'Every team that''s in: Audi 2026 MLS Cup Playoffs', 'https://www.mlssoccer.com/news/every-team-qualified-audi-2026-mls-cup-playoffs', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src4', 'bd-20261018-mls-playoff-picture', 'Matchday 31: Who can clinch playoffs or be eliminated?', 'https://www.mlssoccer.com/news/matchday-31-who-can-clinch-playoffs-or-be-eliminated-2026', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src5', 'bd-20261018-mls-playoff-picture', 'Matchday 31: How Nashville SC can clinch the Supporters'' Shield', 'https://www.mlssoccer.com/news/matchday-31-how-nashville-sc-can-clinch-the-supporters-shield', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src6', 'bd-20261018-mls-playoff-picture', 'Playoff countdown: New England Revolution, St. Louis CITY mean business', 'https://www.mlssoccer.com/playoffs/2026/news/playoff-countdown-new-england-revolution-st-louis-city-mean-business', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-mls-playoff-picture-src7', 'bd-20261018-mls-playoff-picture', 'Audi 2026 MLS Cup Playoffs: Key dates, schedule information', 'https://www.mlssoccer.com/playoffs/2026/news/audi-2026-mls-cup-playoffs-key-dates-schedule-information', 'MLSsoccer.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-mls-playoff-picture-ev1', 'bd-20261018-mls-playoff-picture', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-wnba-finals-game1', 'wnba-finals-2026-valkyries-beat-dream-game-1', 'newsroom', 'news_story', 'wnba', 'EDITORIAL_REVIEW', 0, 'Valkyries edge Dream 68-64 in WNBA Finals opener behind Gabby Williams', 'Second-year Golden State held Atlanta to eight fourth-quarter points to win Game 1, with Game 2 set for Monday in San Francisco.', 'The Golden State Valkyries are three wins from a championship in just their second season.

Golden State beat the Atlanta Dream 68-64 in Game 1 of the WNBA Finals on Saturday at Chase Center. Gabby Williams scored 26 points and made four free throws in the last 78 seconds to put the game away, Al Jazeera reported.

Atlanta went cold late, making only 2 of 19 shots in the fourth quarter. Allisha Gray returned from a hand injury to score 19, and Angel Reese had 14 points and 12 rebounds, all of her points coming before halftime.

## A first title either way

Whoever wins, it will be a first championship. Atlanta has lost all three of its previous Finals trips. Golden State began play in 2025, and the league says no expansion team has reached the Finals faster. The Valkyries swept Las Vegas in the semifinals, finishing the series with an 87-77 overtime win on Oct. 9, NBC Bay Area reported. Atlanta swept New York.

## Rest of the series

| Game | Date | Site | TV |
|---|---|---|---|
| 2 | Mon., Oct. 19, 8 p.m. | Golden State | USA/Peacock/CNBC |
| 3 | Wed., Oct. 21, 8 p.m. | Atlanta | USA/Peacock/CNBC |
| 4 | Sat., Oct. 24, 1 p.m. | Atlanta | NBC/Peacock |
| 5* | Mon., Oct. 26, 8 p.m. | Golden State | USA/Peacock/CNBC |
| 6* | Thu., Oct. 29, 8 p.m. | Atlanta | USA/Peacock/CNBC |
| 7* | Sat., Oct. 31, 8 p.m. | Golden State | USA/Peacock/CNBC |

*If necessary. Times ET, per WNBA.com.*

Off the court, Commissioner Cathy Engelbert is working her final WNBA Finals before she leaves at the end of the year, Yahoo Sports reported.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 7, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-wnba-finals-game1-src1', 'bd-20261018-wnba-finals-game1', '2026 WNBA Finals Preview: Golden State vs. Atlanta', 'https://www.wnba.com/news/game-preview-2026-wnba-finals', 'WNBA.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-wnba-finals-game1-src2', 'bd-20261018-wnba-finals-game1', 'WNBA Finals: Gabby Williams leads Valkyries to nervy Game 1 win over Dream', 'https://www.aljazeera.com/sports/2026/10/18/wnba-finals-gabby-williams-leads-valkyries-to-nervy-game-1-win-over-dream', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-wnba-finals-game1-src3', 'bd-20261018-wnba-finals-game1', 'Valkyries sweep Aces, advance to WNBA Finals vs. Dream', 'https://www.nbcbayarea.com/wnba/golden-state-valkyries/finals-sweep-aces-playoffs-dream/4155969/', 'NBC Bay Area', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-wnba-finals-game1-src4', 'bd-20261018-wnba-finals-game1', 'WNBA Finals live updates: Dream vs. Valkyries Game 1', 'https://sports.yahoo.com/wnba/live/wnba-finals-live-updates-dream-valkyries-score-allisha-gray-angel-reese-gabby-williams-game-1-180245104.html', 'Yahoo Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-wnba-finals-game1-ev1', 'bd-20261018-wnba-finals-game1', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-yin-shanghai-win', 'ruoning-yin-wins-buick-lpga-shanghai-2026-choi-runner-up', 'newsroom', 'news_story', 'golf', 'EDITORIAL_REVIEW', 0, 'Ruoning Yin rallies past Hye-Jin Choi to win Buick LPGA Shanghai', 'China''s Ruoning Yin closed with a 68 at Sheshan Golf Club to win by one shot for her second LPGA title of the season.', 'Ruoning Yin gave the home crowd in Shanghai a Sunday to remember, overtaking third-round leader Hye-Jin Choi to win the Buick LPGA Shanghai by a single stroke, the LPGA Tour reported.

Yin shot a final-round 4-under 68 at Sheshan Golf Club to finish at 11-under 277 after rounds of 68, 74, 67 and 68, according to Australian Golf Digest. The victory was worth $480,000.

## How it turned

Choi began the day one shot clear but gave ground with back-to-back bogeys on the seventh and eighth holes, Seoul Economic Daily reported. Yin drew level with a birdie at the 10th, then pulled ahead late. The Associated Press said a four-foot birdie putt at the 16th gave her the lead for good, and Australian Golf Digest reported she added another birdie at the 17th.

Yin was steady from tee to green, hitting all 14 fairways and needing just 26 putts, according to Australian Golf Digest. It was her seventh career LPGA win and her second of 2026, following her victory at the FM Championship in the Boston area in August.

Choi, who has 12 wins on the Korean LPGA Tour, closed with a 71 and is still looking for her first LPGA title. Amy Yang matched Yin''s 68 to finish alone in third, three shots back.

## Leading finishers

| Pos | Player | Total | To par | Final rd |
|---|---|---|---|---|
| 1 | Ruoning Yin | 277 | -11 | 68 |
| 2 | Hye-Jin Choi | 278 | -10 | 71 |
| 3 | Amy Yang | 280 | -8 | 68 |
| T6 | A Lim Kim | — | -5 | — |
| T8 | Jeeno Thitikul | — | -3 | 69 |

*Players in fourth and fifth were not named in the reports reviewed.*

## Up next

The tour''s Asian swing continues this week with the BMW Ladies Championship, Oct. 22-25 at Pine Beach Golf Links in South Korea.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-yin-shanghai-win-src1', 'bd-20261018-yin-shanghai-win', 'Ruoning Yin Overtakes Hye-Jin Choi to Win the 2026 Buick LPGA Shanghai', 'https://www.lpga.com/news/2026/ruoning-yin-overtakes-hye-jin-choi-to-win-the-2026-buick-lpga-shanghai', 'LPGA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-yin-shanghai-win-src2', 'bd-20261018-yin-shanghai-win', 'LPGA Tournaments schedule', 'https://www.lpga.com/tournaments', 'LPGA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-yin-shanghai-win-src3', 'bd-20261018-yin-shanghai-win', 'LPGA star continues late-season run with another victory in her home country', 'https://www.australiangolfdigest.com.au/ruoning-yin-buick-lpga-shanghai-2026/', 'Australian Golf Digest', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-yin-shanghai-win-src4', 'bd-20261018-yin-shanghai-win', 'Choi Hye-jin Falls One Shot Short Again in Shanghai', 'https://en.sedaily.com/sports/2026/10/18/choi-hye-jin-falls-one-shot-short-again-in-shanghai', 'Seoul Economic Daily', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-yin-shanghai-win-src5', 'bd-20261018-yin-shanghai-win', 'China''s Ruoning Yin overtakes Choi to win the LPGA''s Shanghai tournament', 'https://mymotherlode.com/sports/top-sports-general-news/11231793/chinas-ruoning-yin-overtakes-choi-to-win-the-lpgas-shanghai-tournament.html', 'The Associated Press (via myMotherLode.com)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-yin-shanghai-win-src6', 'bd-20261018-yin-shanghai-win', 'Aussie golfer Kim makes crucial rankings rise in China', 'https://australiangolfdigest.com.au/aussie-golfer-kim-makes-crucial-rankings-rise-in-china', 'Australian Golf Digest', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-yin-shanghai-win-ev1', 'bd-20261018-yin-shanghai-win', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-shanghai-wuhan-finals', 'davidovich-fokina-wins-shanghai-masters-chwalinska-wins-wuhan-2026', 'newsroom', 'news_story', 'tennis', 'EDITORIAL_REVIEW', 0, 'Davidovich Fokina takes Shanghai crown; Chwalinska wins first title in Wuhan', 'Both Sunday champions came from a set down, while Rafael Jodar''s run to the Shanghai final lifted him into the race for Turin.', 'Sunday in China belonged to the comeback.

Alejandro Davidovich Fokina rallied to beat fellow Spaniard Rafael Jodar 1-6, 7-6(5), 6-4 in the Rolex Shanghai Masters final, the ATP Tour reported. Jodar, the 12th seed, ran away with the first set, but Davidovich Fokina won the second in a tiebreak and broke in the fifth game of the third to close out a 2-hour, 28-minute match.

It was his first Masters 1000 title and the third tour-level crown of his career. He had lost his first five finals but has now won three straight, after earlier titles this year in Mallorca and Chengdu.

## Chwalinska''s breakthrough

At the Wuhan Open, Poland''s Maja Chwalinska, seeded 16th, came back to beat Britain''s Sonay Kartal 2-6, 6-4, 6-2 for her first WTA title, according to the WTA. Chwalinska won the last four games and saved three break points while serving for the match. Kartal, ranked 170th, had knocked out Belinda Bencic, Jasmine Paolini, Elina Svitolina and Jelena Ostapenko on her way to the final.

## Race to the finals

Seven of eight places at the WTA Finals in Indian Wells are filled, with Svitolina the latest qualifier, the WTA said. On the men''s side, the ATP noted that Jannik Sinner is ending his season with an injury, making ninth place effectively the last ticket to Turin. Jodar''s run moved him into that spot.

| Rank | Player | Live Race points |
|---|---|---|
| 1 | Alexander Zverev | 9,150 |
| 2 | Jannik Sinner | 7,950 |
| 3 | Carlos Alcaraz | 4,600 |
| 4 | Ben Shelton | 4,480 |
| 5 | Flavio Cobolli | 3,540 |
| 6 | Daniil Medvedev | 3,420 |
| 7 | Frances Tiafoe | 3,380 |
| 8 | Arthur Fils | 3,325 |
| 9 | Rafael Jodar | 3,159 |
| 10 | Alex de Minaur | 2,880 |

*PIF ATP Live Race to Turin as listed on atptour.com Sunday.*', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-src1', 'bd-20261018-shanghai-wuhan-finals', 'Alejandro Davidovich Fokina digs deep to stop Rafael Jodar in Shanghai final', 'https://www.atptour.com/en/news/jodar-davidovich-fokina-shanghai-2026-final', 'ATP Tour', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-src2', 'bd-20261018-shanghai-wuhan-finals', 'PIF ATP Live Race to Turin', 'https://www.atptour.com/en/rankings/singles-race-to-turin', 'ATP Tour', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-src3', 'bd-20261018-shanghai-wuhan-finals', 'Why Rafael Jodar''s result in Shanghai will have massive implications', 'https://www.atptour.com/en/news/jodar-pif-atp-live-race-to-turin-shanghai-2026-update', 'ATP Tour', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-src4', 'bd-20261018-shanghai-wuhan-finals', 'Chwalinska rallies past Kartal for first WTA title in Wuhan', 'https://www.wtatennis.com/news/4593967/chwalinska-rallies-past-kartal-for-first-wta-title-in-wuhan', 'WTA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-src5', 'bd-20261018-shanghai-wuhan-finals', 'Chwalinska vs. Kartal: Everything to know about the Wuhan final', 'https://www.wtatennis.com/news/4593447/maja-chwalinska-sonay-kartal-wuhan-open-final-2026-everything-to-know', 'WTA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-src6', 'bd-20261018-shanghai-wuhan-finals', 'Elina Svitolina secures seventh singles spot for WTA Finals Indian Wells', 'https://www.wtatennis.com/news/4592816/elina-svitolina-secures-seventh-singles-spot-for-wta-finals-indian-wells-one-place-remains', 'WTA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-shanghai-wuhan-finals-ev1', 'bd-20261018-shanghai-wuhan-finals', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-nascar-phoenix-chase', 'nascar-chase-phoenix-freeway-insurance-500-preview-larson-leads', 'newsroom', 'news_story', 'motorsport', 'EDITORIAL_REVIEW', 0, 'Larson carries 49-point Chase lead into Phoenix as NASCAR title race tightens', 'Sunday''s Freeway Insurance 500 is the seventh of 10 Chase races, with Chase Briscoe arriving on a two-race winning streak.', 'With Formula 1 idle until the United States Grand Prix on Oct. 23-25, the spotlight in motorsport turns to the desert, where NASCAR''s Cup Series runs the Freeway Insurance 500 at Phoenix Raceway on Sunday afternoon.

The green flag is set for 3:05 p.m. Eastern, according to Jayski. The race is the seventh of 10 in the Chase, NASCAR''s championship format for the top 16 drivers in points.

## Larson out front

Kyle Larson leads the standings by 49 points over Denny Hamlin, with Christopher Bell two points further back, according to NASCAR''s weekly Chase report. Larson stretched his advantage by nine points last weekend at Charlotte.

The hottest driver is Chase Briscoe. The Joe Gibbs Racing driver won at Charlotte by 0.029 seconds over Bell, NASCAR reported, his second victory in a row, and climbed to fourth, 65 points behind Larson.

## Chase standings

| Pos | Driver | Behind leader |
|---|---|---|
| 1 | Kyle Larson | — |
| 2 | Denny Hamlin | -49 |
| 3 | Christopher Bell | -51 |
| 4 | Chase Briscoe | -65 |
| 5 | Ryan Blaney | -85 |
| 6 | Joey Logano | -92 |
| 7 | Tyler Reddick | -114 |
| 8 | Austin Cindric | -145 |

*Standings after Charlotte, per NASCAR.*

After Phoenix, the Chase moves to Talladega and Martinsville before the finale at Homestead-Miami Speedway. As Jayski noted this week, the surest way for drivers behind Larson to make up ground is to win, since victories carry a significant points haul.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nascar-phoenix-chase-src1', 'bd-20261018-nascar-phoenix-chase', 'The Chase Report presented by Mobil 1: Where we stand after Charlotte', 'https://www.nascar.com/news-media/2026/10/12/the-chase-report-presented-by-mobil-1-where-we-stand-after-charlotte/', 'NASCAR', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nascar-phoenix-chase-src2', 'bd-20261018-nascar-phoenix-chase', 'NASCAR Cup Series results', 'https://www.nascar.com/results/', 'NASCAR', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nascar-phoenix-chase-src3', 'bd-20261018-nascar-phoenix-chase', '2026 NASCAR Cup Series Freeway Insurance 500 at Phoenix Raceway', 'https://www.jayski.com/nascar-cup-series/2026-nascar-cup-series-fall-phoenix-race-page/', 'Jayski', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nascar-phoenix-chase-src4', 'bd-20261018-nascar-phoenix-chase', 'One obvious solution for NASCAR Cup Chase pursuers: find Victory Lane', 'https://www.jayski.com/2026/10/15/one-obvious-solution-for-nascar-cup-chase-pursuers-find-victory-lane/', 'Jayski', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-nascar-phoenix-chase-src5', 'bd-20261018-nascar-phoenix-chase', 'F1 2026 race calendar', 'https://www.formula1.com/en/racing/2026', 'Formula 1', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-nascar-phoenix-chase-ev1', 'bd-20261018-nascar-phoenix-chase', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-malott-ko-buckley', 'ufc-edmonton-results-malott-knocks-out-buckley-jasudavicius-beats-blanchfield', 'newsroom', 'news_story', 'combat-sports', 'EDITORIAL_REVIEW', 0, 'Malott knocks out Buckley in Edmonton; Jasudavicius upsets Blanchfield', 'Canadian fighters swept the top two bouts at UFC Fight Night in Edmonton on Saturday night.', 'Mike Malott gave a hometown crowd at Rogers Place exactly what it came for Saturday, knocking out Joaquin Buckley in the second round of the UFC Fight Night main event in Edmonton.

Malott, the No. 13-ranked welterweight from Fonthill, Ontario, ended it with a knee and follow-up punch at 2:32 of the second round, Yahoo Sports'' Uncrowned reported. CBS Sports said Buckley fell face-first and was slow to get back up. The win lifts Malott to 15-2-1, while Buckley, ranked 10th coming in, dropped his third straight fight, according to Uncrowned.

## Upset in the co-main

Ontario''s Jasmine Jasudavicius took a unanimous decision from Erin Blanchfield, the fourth-ranked women''s flyweight, with all three judges scoring it 29-28. CBS Sports said Jasudavicius controlled much of the fight on the mat. Uncrowned called it the biggest win of her career and her seventh in eight fights.

## Main card results

| Bout | Winner | Result |
|---|---|---|
| Welterweight | Mike Malott def. Joaquin Buckley | KO, Rd 2, 2:32 |
| Women''s flyweight | Jasmine Jasudavicius def. Erin Blanchfield | Unanimous decision |
| Lightweight | Cristian Perez def. Kyle Nelson | KO, Rd 1, 0:27 |
| Middleweight | Marc-Andre Barriault def. Kyle Daukaus | TKO, Rd 1 |
| Bantamweight | Timmy Cuamba def. Louis Jourdain | Submission, Rd 2 |
| Lightweight | Mandel Nallo def. Nate Landwehr | TKO, Rd 2, 0:47 |

*Sources: UFC, CBS Sports, Uncrowned.*

The UFC returns next Saturday with UFC 333 in Abu Dhabi, where Alexander Volkanovski meets Movsar Evloev, according to the UFC''s schedule.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-18-sports.sql', 6, 0, 'newsroom-assistant', '2026-10-18T14:30:00.000Z', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-malott-ko-buckley-src1', 'bd-20261018-malott-ko-buckley', 'UFC Fight Night: Buckley vs Malott event page', 'https://www.ufc.com/event/ufc-fight-night-october-17-2026', 'UFC', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-malott-ko-buckley-src2', 'bd-20261018-malott-ko-buckley', 'UFC Edmonton Results: Buckley vs Malott', 'https://www.ufc.com/news/ufc-edmonton-results-buckley-vs-malott', 'UFC', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-malott-ko-buckley-src3', 'bd-20261018-malott-ko-buckley', 'Pivotal welterweight bout between Joaquin Buckley and Mike Malott headlines UFC return', 'https://www.ufc.com/news/pivotal-welterweight-bout-between-joaquin-buckley-and-mike-malott-headlines-ufc-return', 'UFC', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-malott-ko-buckley-src4', 'bd-20261018-malott-ko-buckley', 'UFC events', 'https://www.ufc.com/events', 'UFC', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-malott-ko-buckley-src5', 'bd-20261018-malott-ko-buckley', 'UFC Edmonton results: Mike Malott viciously folds Joaquin Buckley; Jasmine Jasudavicius shocks Erin Blanchfield', 'https://sports.yahoo.com/mma/article/ufc-edmonton-results-mike-malott-viciously-folds-joaquin-buckley-jasmine-jasudavicius-shocks-erin-blanchfield-032744371.html', 'Yahoo Sports (Uncrowned)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-malott-ko-buckley-src6', 'bd-20261018-malott-ko-buckley', 'UFC Fight Night results, highlights: Mike Malott delivers KO of the Year contender against Joaquin Buckley', 'https://www.cbssports.com/ufc/news/ufc-fight-night-results-live-updates-joaquin-buckley-mike-malott/live/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T14:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T14:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-malott-ko-buckley-ev1', 'bd-20261018-malott-ko-buckley', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T14:30:00.000Z');
