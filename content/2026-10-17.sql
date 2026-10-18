-- Newsroom drafts for 2026-10-17. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain or Creative Commons with credit.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-ky-rally', 'trump-northern-kentucky-rally-midterms', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'With 17 days to go, Trump takes his midterm push to Northern Kentucky', 'The president rallied supporters in Highland Heights as Republicans defend a Senate seat and watch a tightening House race.', 'President Donald Trump brought his midterm campaign to Highland Heights in Northern Kentucky on Saturday, 17 days before the Nov. 3 general election.

The free, ticketed rally was announced earlier in the week, with Trump scheduled to speak at 2 p.m., according to the Kentucky Lantern. Trump has been touring Republican-leaning states to boost GOP candidates ahead of the midterms, the Lantern reported.

## The races on the ballot

Kentucky''s open U.S. Senate seat pits Republican Rep. Andy Barr against Democrat Charles Booker, a former state representative. Barr told the Lantern the White House had offered him a speaking slot at the event.

Closer to the rally site, the 6th Congressional District race between Republican Ralph Alvarado and Democrat Zach Dembo has drawn attention after several political forecasters recently tightened their ratings, the Lantern reported.

Saturday''s visit was Trump''s first trip to Kentucky since March, when he rallied in Hebron for Ed Gallrein. Gallrein went on to defeat Rep. Thomas Massie in the May Republican primary.

## Key dates for Kentucky voters

The State Board of Elections lists these deadlines for the general election:

- Mail-in absentee ballot requests close **Oct. 20**.
- Excused in-person absentee voting runs **Oct. 21-23** and **Oct. 26-28**.
- No-excuse in-person early voting runs **Oct. 29-31**.
- The Postal Service recommends mailing completed ballots by **Oct. 27**.

Election Day is **Tuesday, Nov. 3**.', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/19/January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg/1280px-January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg', 'Official presidential portrait, January 2025. Photo: Daniel Torok / The White House (public domain)', 'public_domain', 'newsroom', 'content/2026-10-17.sql', 9, 1, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-ky-rally-src1', 'bd-20261017-ky-rally', 'Trump to hold midterm rally in Northern Kentucky Saturday', 'https://newsfromthestates.com/article/trump-rally-northern-kentucky-saturday', 'Kentucky Lantern / News From The States', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-ky-rally-src2', 'bd-20261017-ky-rally', 'Kentucky State Board of Elections: 2026 general election dates', 'https://elect.ky.gov/', 'Kentucky State Board of Elections', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-ky-rally-ev1', 'bd-20261017-ky-rally', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-maine-senate', 'collins-jackson-maine-senate-final-debate', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Collins and Jackson close out their debates in Maine''s toss-up Senate race', 'The Republican incumbent pitched her clout in Washington; her Democratic challenger cast her as an enabler of Trump administration policies.', 'Sen. Susan Collins and Democratic nominee Troy Jackson held the last of their four scheduled debates on Thursday night in Bangor, closing out one of the most closely watched Senate races in the country.

Fox News, which rates the contest a toss-up, reported that a protester interrupted the final debate.

## Where the candidates stand

At their third debate on Oct. 13, hosted by WABI and WAGM, the two drew sharp contrasts, Maine Morning Star reported:

- **Influence vs. opposition.** Collins argued Maine benefits from senators who can shape policy, pointing to tariff exemptions she said she secured for concrete, pulp and road salt. Jackson said those exemptions were a temporary patch, not a solution.
- **Immigration enforcement.** Collins backed reforming ICE, including funding for body cameras and de-escalation training, rather than abolishing it. Jackson called for abolishing the agency, saying it operates without proper oversight.
- **Money.** Collins pressed Jackson on not yet filing a campaign finance report. Jackson criticized Collins for relying on donations from nearly 100 billionaires and their spouses.

Election Day is Nov. 3.', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5f/Susan_Collins_official_Senate_photo.jpg/1280px-Susan_Collins_official_Senate_photo.jpg', 'Sen. Susan Collins, official Senate photo. United States Congress (public domain)', 'public_domain', 'newsroom', 'content/2026-10-17.sql', 8, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-maine-senate-src1', 'bd-20261017-maine-senate', '3 takeaways from the latest Senate debate between Collins and Jackson', 'https://www.newsfromthestates.com/article/3-takeaways-latest-senate-debate-between-collins-and-jackson', 'Maine Morning Star / News From The States', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-maine-senate-src2', 'bd-20261017-maine-senate', 'Midterm elections live: candidates clash in debates (Oct. 16)', 'https://foxnews.com/live-news/midterm-elections-2026-less-than-three-weeks-away-october-16', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-maine-senate-ev1', 'bd-20261017-maine-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-alaska-senate', 'sullivan-peltola-alaska-senate-debate', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Oil, fuel costs and the Iran war dominate Alaska''s Sullivan-Peltola showdown', 'Both parties see the state as pivotal to Senate control. Alaska has not elected a Democratic senator since 2008.', 'Republican Sen. Dan Sullivan and Democrat Mary Peltola met for a televised debate on Thursday in a race both parties see as central to control of the Senate, The Associated Press reported.

Sullivan, seeking a third term, argued that electing Peltola, a former congresswoman, would empower Democrats who want to limit oil and gas leasing, including around projects such as Willow. Peltola said those attacks distract from the fuel costs Alaskans face and from the war in Iran, and said she would work with President Trump to advance oil and gas projects, according to the AP.

## National attention

Trump rallied for Sullivan in Wasilla on Oct. 13, and Vice President JD Vance visited Fairbanks the week before. Fox News rates the race a toss-up. Alaska last elected a Democrat to the Senate in 2008.

## How Alaska votes

Alaska uses a pick-one primary and ranked-choice voting for state and federal races, a system it adopted in 2022, according to the state Division of Elections. The top four finishers in the August primary advanced to the Nov. 3 general election.', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/210103_Snowy_capitol.jpg/1280px-210103_Snowy_capitol.jpg', 'Alaska State Capitol, Juneau. Photo: James Brooks / Wikimedia Commons, CC BY 2.0', 'licensed', 'newsroom', 'content/2026-10-17.sql', 7, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alaska-senate-src1', 'bd-20261017-alaska-senate', 'Sullivan, Peltola set to meet in televised debate in high-stakes Alaska US Senate race', 'https://mynorthwest.com/national/sullivan-peltola-set-to-meet-in-televised-debate-in-high-stakes-alaska-us-senate-race/4286852', 'The Associated Press (via MyNorthwest)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alaska-senate-src2', 'bd-20261017-alaska-senate', 'Midterm elections live (Oct. 16)', 'https://foxnews.com/live-news/midterm-elections-2026-less-than-three-weeks-away-october-16', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alaska-senate-src3', 'bd-20261017-alaska-senate', 'Alaska Division of Elections', 'https://www.elections.alaska.gov/', 'State of Alaska', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-alaska-senate-ev1', 'bd-20261017-alaska-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-gas-prices', 'gas-prices-massachusetts-national-average-october', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'Gas eases to $4.31 nationally as diesel hovers near a record', 'Massachusetts drivers are paying about $4.28 a gallon, more than a dollar above a year ago, AAA data show.', 'The national average price of regular gasoline slipped to **$4.31** a gallon on Saturday, down about 6 cents from a week earlier but still more than $1.25 above where it stood a year ago, according to AAA.

Diesel remains the bigger pain point. The national average was **$6.33** a gallon, just below the record of $6.53 set on Sept. 22, 2026. A year ago, diesel averaged $3.64.

## In Massachusetts

| | Today | Week ago | Year ago |
| --- | --- | --- | --- |
| Regular, Massachusetts | $4.28 | $4.32 | $3.02 |
| Regular, Boston metro | $4.30 | | |
| Diesel, Massachusetts | $6.34 | $6.33 | $3.82 |

Regular gas nationally remains below its all-time high of $5.02, set on June 14, 2022.

Fuel costs have become a recurring theme on the campaign trail ahead of the Nov. 3 midterms, including in Alaska''s Senate race.

*Prices are AAA daily averages as of Oct. 17, 2026.*', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a4/Gas_Prices_Sign_-_Yes_Way_Gas_Station_-_Fort_Pierre_-_South_Dakota.jpg/1280px-Gas_Prices_Sign_-_Yes_Way_Gas_Station_-_Fort_Pierre_-_South_Dakota.jpg', 'Photo: Tony Webster / Wikimedia Commons, CC BY 2.0', 'licensed', 'newsroom', 'content/2026-10-17.sql', 6, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-gas-prices-src1', 'bd-20261017-gas-prices', 'AAA Gas Prices: national averages', 'https://gasprices.aaa.com/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-gas-prices-src2', 'bd-20261017-gas-prices', 'AAA Gas Prices: Massachusetts', 'https://gasprices.aaa.com/?state=MA', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-gas-prices-ev1', 'bd-20261017-gas-prices', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-brewers', 'brewers-sweep-dodgers-world-series', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Brewers sweep the Dodgers and head to their first World Series since 1982', 'Milwaukee erased a four-run deficit in Game 4, ending Los Angeles''s bid for a third straight title.', 'The Milwaukee Brewers completed a four-game sweep of the Los Angeles Dodgers on Thursday night, winning 6-4 at Dodger Stadium to claim the National League pennant.

It is Milwaukee''s first trip to the World Series since 1982, and its first as a National League club. The result ends the Dodgers'' run at a third consecutive championship.

## How Game 4 turned

- Los Angeles jumped ahead 4-0 in the second inning, highlighted by a three-run home run from Shohei Ohtani.
- William Contreras and Jake Bauers hit back-to-back doubles in the fourth to cut the lead in half.
- In the fifth, David Hamilton drove in a run with a single and Bauers drew a bases-loaded walk to tie the game.
- Garrett Mitchell put Milwaukee ahead with a home run in the sixth, and Hamilton added a solo shot in the ninth.
- Aaron Ashby recorded the final nine outs.

## What''s next

Game 1 of the World Series is set for **Friday, Oct. 23, at 8 p.m. ET** at American Family Field in Milwaukee, according to MLB. The Brewers will face the winner of the American League Championship Series between the Cleveland Guardians and the Tampa Bay Rays.', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/MillerParkStadium.jpg/1280px-MillerParkStadium.jpg', 'American Family Field, then known as Miller Park, in Milwaukee. Photo: Greg Hume / Wikimedia Commons, CC BY-SA 3.0', 'licensed', 'newsroom', 'content/2026-10-17.sql', 8, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-brewers-src1', 'bd-20261017-brewers', 'Brewers end Dodgers'' three-peat bid with an NLCS sweep of their own', 'https://www.mlb.com/news/brewers-win-nlcs-2026', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-brewers-ev1', 'bd-20261017-brewers', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-alcs', 'guardians-rays-alcs-game-3-halpin', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Halpin''s homer gives Guardians a 2-1 ALCS edge over the Rays', 'Cleveland''s 3-2 Game 3 win puts it two victories from a World Series date with Milwaukee.', 'A go-ahead home run from Petey Halpin lifted the Cleveland Guardians to a 3-2 win over the Tampa Bay Rays in Game 3 of the American League Championship Series on Thursday, giving Cleveland a 2-1 series lead, The Associated Press reported.

## The series so far

| Game | Date | Result |
| --- | --- | --- |
| 1 | Mon., Oct. 12 | Guardians 7, Rays 3 |
| 2 | Tue., Oct. 13 | Rays 3, Guardians 1 |
| 3 | Thu., Oct. 15 | Guardians 3, Rays 2 |

Game 4 was rescheduled because of weather and is being played Saturday night in Cleveland, with Game 5 set for Sunday. If needed, the series would return to Tampa Bay for Games 6 and 7.

The winner opens the World Series against the Milwaukee Brewers on Friday, Oct. 23, in Milwaukee.', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/08/Progressive_Field.jpg/1280px-Progressive_Field.jpg', 'Progressive Field, Cleveland. Photo: Jsawczuk / Wikimedia Commons (public domain)', 'public_domain', 'newsroom', 'content/2026-10-17.sql', 6, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alcs-src1', 'bd-20261017-alcs', 'Halpin''s go-ahead homer flips Game 3 as Guardians beat Rays 3-2 for ALCS lead', 'https://www.news5cleveland.com/sports/cleveland-guardians/halpins-go-ahead-homer-flips-game-3-as-guardians-beat-rays-3-2-for-alcs-lead', 'The Associated Press (via News 5 Cleveland)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alcs-src2', 'bd-20261017-alcs', 'World Series 2026 bracket: Rays vs. Guardians ALCS', 'https://bleacherreport.com/articles/25510141-world-series-2026-updated-bracket-predictions-rays-vs-guardians-alcs-game-3', 'Bleacher Report', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T01:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-alcs-ev1', 'bd-20261017-alcs', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-bruins', 'bruins-beat-ducks-west-coast-trip-kings', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins take a winning streak into Los Angeles after beating the Ducks', 'Boston''s 4-2 win in Anaheim followed a 6-3 victory in San Jose. The Kings are next, then a stop in Dallas.', 'The Boston Bruins beat the Anaheim Ducks 4-2 on Thursday night, their second straight win on a West Coast road trip.

Boston opened the trip with a 6-3 victory over the San Jose Sharks on Monday night.

## Up next

| Date | Opponent | Time (ET) |
| --- | --- | --- |
| Sat., Oct. 17 | at Los Angeles Kings | 9 p.m. |
| Tue., Oct. 20 | at Dallas Stars | 8 p.m. |

The Kings game is Boston''s last stop in California before the team heads to Dallas.

*Scores and schedule: official NHL game data.*', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/34/TD_Garden.JPG/1280px-TD_Garden.JPG', 'TD Garden, home of the Bruins. Photo: Nywalton / Wikimedia Commons (public domain)', 'public_domain', 'newsroom', 'content/2026-10-17.sql', 5, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-bruins-src1', 'bd-20261017-bruins', 'Boston Bruins schedule and results (NHL.com)', 'https://www.nhl.com/bruins/schedule', 'NHL', 'web', 'PRIMARY_SOURCE', 0, 1, '2026-10-18T01:30:00.000Z', 'Official schedule page: open it, confirm the scores and dates, then tick Verified.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-bruins-ev1', 'bd-20261017-bruins', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-patriots', 'patriots-jets-preview-week-7', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Patriots host the Jets at Gillette after a 45-point outing', 'New England is coming off a 45-17 rout of the Raiders. A short week follows, with a Thursday night trip to Chicago.', 'The New England Patriots return to Gillette Stadium on Sunday to face the New York Jets at 1 p.m., a week after beating the Las Vegas Raiders 45-17 in Foxborough.

The Jets arrive after a 17-12 home win over the Cleveland Browns on Oct. 11, their most recent game.

## A busy stretch

| Date | Opponent | Time (ET) |
| --- | --- | --- |
| Sun., Oct. 18 | vs. New York Jets | 1 p.m. |
| Thu., Oct. 22 | at Chicago Bears | 8:15 p.m. |

The quick turnaround means New England will play twice in five days.

*Scores and schedule: official NFL game data.*', 'Boston Daily Staff', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Gillette_Stadium02.jpg/1280px-Gillette_Stadium02.jpg', 'Gillette Stadium, Foxborough. Photo: Bernard Gagnon / Wikimedia Commons, CC BY-SA 3.0', 'licensed', 'newsroom', 'content/2026-10-17.sql', 5, 0, 'newsroom-assistant', '2026-10-18T01:30:00.000Z', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-patriots-src1', 'bd-20261017-patriots', 'New England Patriots schedule and results (Patriots.com)', 'https://www.patriots.com/schedule/', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 0, 1, '2026-10-18T01:30:00.000Z', 'Official schedule page: open it, confirm the scores and dates, then tick Verified.', 'newsroom-assistant', '2026-10-18T01:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-patriots-ev1', 'bd-20261017-patriots', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T01:30:00.000Z');
