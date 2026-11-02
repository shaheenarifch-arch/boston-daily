-- Newsroom drafts for 2026-11-02 (election eve). Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Every story carries its own public-domain image; none was used in an earlier package.
-- Wikimedia Commons was unreachable on this run, so all photos are Library of Congress files (mostly Carol M. Highsmith, no known restrictions). URLs come from loc.gov item records. Editor: confirm each photo loads and matches its caption.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-election-eve', 'election-eve-what-to-watch-senate-house-control-tuesday', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Election eve: Senate control runs through 11 battlegrounds as more than 54 million Americans have already voted', 'Republicans hold the Senate 53-47 and the House by a handful of seats heading into Tuesday. President Trump spends Monday on tele-rallies and an afternoon event at the Lincoln Memorial Reflecting Pool.', 'Polls open Tuesday, Nov. 3, in the first nationwide federal election since 2024, with control of both chambers of Congress on the line.

More than 54 million Americans had cast ballots before Election Day, CBS News reported, citing the University of Florida''s early-vote tracking.

## Where the chambers stand

| Chamber | Now | Needed for control |
| --- | --- | --- |
| Senate | Republicans 53, Democrats 47 | 51 seats (vice president breaks ties) |
| House | Republicans 218 plus one independent who usually votes with them; Democrats 214; two vacancies | 218 seats |

Figures are from CBS News.

## The Senate map

CBS News counts 11 key Senate races. Eight are seats Republicans hold now: Alaska, Iowa, Kansas, Maine, North Carolina, Ohio, South Carolina and Texas. Three are Democratic seats: Georgia, Michigan and New Hampshire.

Democrats need a net gain of four seats for a majority.

## The House

CBS News'' Battleground Tracker, last updated Oct. 25, put Democrats on course for about 229 seats, within a range of 215 to 237. The low end of that range would leave Republicans a narrow majority. The network identified 47 battleground districts, 27 held by Republicans and 20 by Democrats.

## The president''s final day

The White House said Trump would join nine tele-rallies on Monday beginning at 11 a.m. ET and then speak at the Lincoln Memorial Reflecting Pool at 2 p.m. ET, ABC News reported. Asked why he chose the site, he said he wanted to show how the renovated pool looks.

At his Sunday stop in Dubuque, Iowa, Trump again questioned the integrity of the vote in several states, ABC News reported. Research by the Brennan Center for Justice has found voter fraud to be very rare, the network noted.

His Sunday evening rally in Salina, Kan., was billed as the last in-person stop of his midterm campaign, CBS News reported.

## Before you vote

Polling hours and ID rules vary by state. Check your state election office''s website or [vote.gov](https://vote.gov) for your polling place and hours.', 'Boston Daily Staff', 'https://tile.loc.gov/image-services/iiif/service:pnp:highsm:15600:15672/full/pct:25/0/default.jpg', 'The Reflecting Pool leading to the Lincoln Memorial on the National Mall, Washington (file). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 9, 1, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-election-eve-src1', 'bd-20261102-election-eve', '2026 elections live updates: Trump to speak at D.C. Reflecting Pool, and more from the campaign trail', 'https://www.cbsnews.com/live-updates/2026-elections-monday-november-2/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-election-eve-src2', 'bd-20261102-election-eve', 'Midterm elections live updates: Trump to deliver remarks, join tele-rallies on Monday', 'https://abcnews.com/Politics/live-updates/midterm-elections-2026-1-week-high-stakes-elections/?id=137578278', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-election-eve-ev1', 'bd-20261102-election-eve', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-stevens-rogers', 'haley-stevens-endorses-mike-rogers-michigan-senate-el-sayed', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Democrat Haley Stevens endorses Republican Mike Rogers in Michigan''s Senate race two days before the vote', 'The congresswoman, who lost the Democratic primary to Abdul El-Sayed, crossed party lines on Sunday. Party leaders condemned the move, and El-Sayed''s campaign says it raised more than $1.2 million afterward.', 'Rep. Haley Stevens of Michigan endorsed Republican Mike Rogers for the state''s open U.S. Senate seat on Sunday, Nov. 1, backing the GOP nominee over Democrat Abdul El-Sayed, CBS News reported.

Stevens lost the Democratic Senate primary to El-Sayed earlier this year. In an interview with CNN''s Anderson Cooper, she said the decision lifted a weight from her, while also saying she still wants Democrats to win control of the Senate, according to CBS News.

## The reaction

- Senate Minority Leader Chuck Schumer called the endorsement despicable, CBS News reported.
- Former House Speaker Nancy Pelosi accused Stevens of betraying Michigan families.
- Rep. Debbie Dingell, a fellow Michigan Democrat, said the interview had become a distraction.
- Stevens had been expected at a joint appearance with El-Sayed on Sunday; Cooper raised in the interview that she had been disinvited.

A campaign official told CBS News that El-Sayed raised more than $1.2 million after the endorsement became public. Politico first reported the figure.

## Why it matters

Michigan is one of only three Democratic-held seats on CBS News'' list of 11 Senate battlegrounds. Republicans currently hold 53 seats, so Democrats cannot afford to lose it if they hope to win a majority.

President Trump has repeatedly attacked El-Sayed on the campaign trail, ABC News reported, including in remarks the network said targeted his Muslim faith.

Polls in Michigan close at 8 p.m. ET Tuesday in most of the state.', 'Boston Daily Staff', 'https://tile.loc.gov/storage-services/service/pnp/highsm/63400/63411v.jpg', 'Aerial view of the Detroit skyline (file). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 8, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-stevens-rogers-src1', 'bd-20261102-stevens-rogers', '2026 elections live updates (Stevens endorsement, El-Sayed fundraising)', 'https://www.cbsnews.com/live-updates/2026-elections-monday-november-2/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-stevens-rogers-src2', 'bd-20261102-stevens-rogers', 'Midterm elections live updates', 'https://abcnews.com/Politics/live-updates/midterm-elections-2026-1-week-high-stakes-elections/?id=137578278', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-stevens-rogers-ev1', 'bd-20261102-stevens-rogers', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-alaska-ruling', 'judge-dismisses-doj-lawsuit-alaska-senate-certification-sullivan', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Federal judge throws out Justice Department bid to hold up Alaska''s Senate results if Sen. Dan Sullivan loses', 'Judge Sharon Gleason ruled the government had no workable way to separate ballots without breaking voter secrecy. The department has filed a notice of appeal.', 'A federal judge in Alaska on Sunday dismissed a Justice Department lawsuit that sought to delay or block certification of the state''s U.S. Senate results if Republican Sen. Dan Sullivan loses on Tuesday, Alaska Public Media reported.

In a 20-page decision, U.S. District Judge Sharon Gleason found the government offered no workable plan to set aside and investigate ballots while protecting the secrecy of the vote. CBS News reported that the order also found the department lacked proper legal standing.

## What the lawsuit asked for

The suit, filed Oct. 22, centered on a second candidate on the ballot: Daniel J. Sullivan Jr., a retired Petersburg teacher running with no party affiliation. The department argued voters could confuse the two men. It asked the court to stop certification if confusion could have changed the outcome, and to have ballots marked for the challenger preserved and segregated for an investigation, according to Alaska Public Media.

Alaska''s Division of Elections said the ballot already limits confusion by listing the incumbent as "Dan S. Sullivan," Republican. The state also told the court an investigation was impossible because ballots carry no names and are mixed together once cast. The Alaska Supreme Court ruled this summer that the challenger had a right to appear on the ballot.

## The race

Sullivan faces Democrat Mary Peltola. A poll released Friday showed Peltola ahead by two percentage points, with the second Sullivan drawing more than 4%, Alaska Public Media reported.

The Justice Department has filed a notice of appeal, CBS News reported. U.S. Attorney Michael Heyman has said the FBI is adding resources for the election in Alaska.', 'Boston Daily Staff', 'https://tile.loc.gov/image-services/iiif/service:pnp:highsm:03700:03770/full/pct:25/0/default.jpg', 'The Federal Building in Anchorage, Alaska (file). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 7, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-alaska-ruling-src1', 'bd-20261102-alaska-ruling', 'Judge tosses DOJ lawsuit that sought to block election results if Republican Sen. Dan Sullivan loses', 'https://alaskapublic.org/news/politics/elections/2026-11-01/judge-tosses-doj-lawsuit-that-sought-to-block-election-results-if-republican-sen-dan-sullivan-loses', 'Alaska Public Media', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-alaska-ruling-src2', 'bd-20261102-alaska-ruling', 'Judge tosses DOJ lawsuit seeking to delay certification of Alaska Senate race', 'https://www.cbsnews.com/news/judge-doj-lawsuit-alaska-senate-race-dan-sullivan/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-alaska-ruling-ev1', 'bd-20261102-alaska-ruling', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-murphy-stroke', 'sen-chris-murphy-hospitalized-stroke-johns-hopkins', 'newsroom', 'news_story', 'congress', 'EDITORIAL_REVIEW', 0, 'Sen. Chris Murphy hospitalized after a stroke; his office expects a full recovery', 'The Connecticut Democrat, 53, first noticed numbness in his arm at his son''s hockey game on Saturday and was moved to Johns Hopkins for monitoring.', 'Sen. Chris Murphy, D-Conn., is in the hospital after having a stroke, his office said Sunday, Nov. 1, PBS NewsHour reported.

Chief of staff Allison Herwitt said Murphy, 53, felt numbness in his arm on Saturday while at his son''s hockey game. Doctors at a local hospital diagnosed the stroke, and he was transferred to Johns Hopkins for further monitoring.

Herwitt said he was "awake and alert" and responding well to treatment, and that his team is optimistic he will fully recover, according to PBS.

## Who is Murphy

- Elected to the House in 2006 and to the Senate in 2012.
- Sits on the Appropriations Committee.
- A leading Democratic voice on gun policy and immigration, and often mentioned as a possible 2028 presidential candidate.

Murphy is not on Tuesday''s ballot. He had been campaigning for Democratic candidates in the final weeks of the midterms.

## Reaction

Sen. Richard Blumenthal, his Connecticut colleague, said he expects Murphy back in the Senate soon. Senators from both parties, including John Fetterman, Chuck Grassley and Pete Ricketts, sent well wishes, and President Trump said he was surprised by the news, PBS reported.

Sens. Ben Ray Luján and Chris Van Hollen both had strokes and later returned to work.

## Know the signs

Doctors use the BE FAST checklist for stroke: balance, eyes, face drooping, arm weakness, speech difficulty, time to call 911. [Learn the warning signs from the CDC](https://www.cdc.gov/stroke/).', 'Boston Daily Staff', 'https://tile.loc.gov/storage-services/service/pnp/det/4a00000/4a09000/4a09400/4a09467v.jpg', 'Johns Hopkins Hospital, Baltimore, about 1902 (historical file). Photo: Detroit Publishing Co. / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 7, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-murphy-stroke-src1', 'bd-20261102-murphy-stroke', 'Connecticut Sen. Chris Murphy is in the hospital after having a stroke, his office says', 'https://www.pbs.org/newshour/politics/connecticut-sen-chris-murphy-is-in-the-hospital-after-having-a-stroke-his-office-says', 'PBS NewsHour', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-murphy-stroke-src2', 'bd-20261102-murphy-stroke', 'Sen. Chris Murphy hospitalized following stroke', 'https://www.cbsnews.com/news/chris-murphy-stroke-hospitalized/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-murphy-stroke-ev1', 'bd-20261102-murphy-stroke', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-ma-ballot', 'massachusetts-voter-guide-governor-senate-nine-ballot-questions', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Massachusetts voter guide: Healey and Markey lead in final polls, and nine questions fill a record-tying ballot', 'A University of New Hampshire poll shows Gov. Maura Healey and Sen. Ed Markey ahead by double digits. Voters also decide on open primaries, Election Day registration, marijuana sales and a gun law.', 'Massachusetts voters choose a governor, a U.S. senator and nine ballot questions on Tuesday, Nov. 3. The nine questions tie the state''s record, according to the Secretary of the Commonwealth.

## Top of the ticket

A University of New Hampshire poll released in the campaign''s final days, reported by WJAR, showed:

| Race | Democrat | Republican |
| --- | --- | --- |
| Governor | Maura Healey (incumbent) 55% | Mike Minogue 36% |
| U.S. Senate | Ed Markey (incumbent) 53% | John Deaton 32% |

An earlier UMass Amherst/WCVB poll of 800 people, taken Oct. 5-12 with a margin of error of 4.2 points, had Healey ahead 57% to 32% among likely voters, WBUR reported.

## The nine ballot questions

| # | Topic | UMass/WCVB poll (Oct. 5-12) |
| --- | --- | --- |
| 1 | Expand the public records law | 84% yes |
| 2 | Collective bargaining for public defenders (CPCS staff) | 53% yes, 19% no |
| 3 | State primary elections open to all candidates | 49% yes, 39% no |
| 4 | Election Day voter registration | 67% yes, 26% no |
| 5 | State revenue limit and taxpayer rebates | 58% yes, 20% no |
| 6 | Natural resource conservation fund | 70% yes, 19% no |
| 7 | Single-family homes on smaller lots | 65% yes, 21% no |
| 8 | End retail sales of recreational marijuana | 31% yes, 61% no |
| 9 | Firearms regulation (keep the 2024 gun law) | 70% yes, 21% no |

The later UNH poll found Question 3 trailing, 59% no to 30% yes, and Question 9 ahead 53% to 34%, WJAR reported. It found 79% of respondents rejecting Question 8.

## How to vote

Polls in Massachusetts are open from 7 a.m. to 8 p.m. Find your polling place and read the official summaries of each question in the state''s [Information for Voters guide](https://www.sec.state.ma.us/divisions/elections/research-and-statistics/2026-Information-for-voters/2026-ballot-questions.htm).', 'Boston Daily Staff', 'https://tile.loc.gov/image-services/iiif/service:pnp:highsm:12000:12099/full/pct:50/0/default.jpg', 'The Massachusetts State House on Beacon Hill, Boston (file). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 8, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-ma-ballot-src1', 'bd-20261102-ma-ballot', '2026 Ballot Questions', 'https://www.sec.state.ma.us/divisions/elections/research-and-statistics/2026-Information-for-voters/2026-ballot-questions.htm', 'Secretary of the Commonwealth of Massachusetts', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-ma-ballot-src2', 'bd-20261102-ma-ballot', 'A new poll takes the temperature on the Mass. governor''s race and all 9 ballot questions', 'https://www.wbur.org/news/2026/10/19/massachusetts-governors-race-ballot-question-poll', 'WBUR', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-ma-ballot-src3', 'bd-20261102-ma-ballot', 'Final poll gives glimpse on where voters stand ahead of Election Day', 'https://turnto10.com/news/local/final-poll-gives-glimpse-on-where-voters-stand-ahead-of-election-day-nov-2-2026', 'WJAR (Turn to 10)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-ma-ballot-ev1', 'bd-20261102-ma-ballot', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-patriots-dolphins', 'patriots-rally-beat-dolphins-24-19-maye-three-touchdowns', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Drake Maye accounts for three touchdowns as the Patriots erase a 10-point halftime deficit and beat Miami 24-19', 'New England shut out the Dolphins after the break, moved to 5-3 and won without A.J. Brown and TreVeyon Henderson. Green Bay visits Foxborough next.', 'The Patriots trailed 13-3 at halftime in Miami Gardens on Sunday, Nov. 1, then scored 21 straight points and held on for a 24-19 win over the Dolphins, the Associated Press reported.

Drake Maye completed 16 of 20 passes for 199 yards with two touchdown throws and ran for a third score.

## How the comeback happened

- **Third quarter:** Kyle Williams caught a 43-yard touchdown pass that was first ruled incomplete. Coach Mike Vrabel challenged, and the call was reversed.
- **End of the third:** Maye ran in from 2 yards out with 59 seconds left in the quarter for the go-ahead score.
- **Fourth quarter:** DeMario Douglas took a 48-yard touchdown pass for a 24-13 lead.
- **Late:** Malik Willis hit Kevin Coleman Jr. for a 35-yard score with two minutes left, and Rhamondre Stevenson recovered the Dolphins'' onside kick.

## Key numbers

| Player | Line |
| --- | --- |
| Drake Maye, NE | 16-of-20, 199 yards, 2 TD passes, 1 rushing TD |
| Rhamondre Stevenson, NE | 19 carries, 82 yards |
| DeMario Douglas, NE | 3 catches, 76 yards, 1 TD |
| Malik Willis, MIA | 21-of-32, 211 yards, 2 TD, 1 INT, sacked 5 times |

Figures are from the AP.

## Injuries

A.J. Brown (knee/ankle), Mack Hollins (calf) and TreVeyon Henderson (illness) did not play. Tight end Hunter Henry (foot) and Gabe Jacas (knee) were hurt during the game and did not return, the AP reported.

## Next up

The Patriots (5-3) host the Green Bay Packers on Sunday, Nov. 8. Miami fell to 1-7 and hosts Detroit.', 'Boston Daily Staff', 'https://tile.loc.gov/storage-services/service/pnp/highsm/62700/62770v.jpg', 'Aerial view of Hard Rock Stadium in Miami Gardens, Fla. (file). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 8, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-patriots-dolphins-src1', 'bd-20261102-patriots-dolphins', 'Maye has 3 touchdowns as Patriots rally to beat Dolphins 24-19 (AP)', 'https://abcnews.com/Sports/wireStory/maye-3-touchdowns-patriots-rally-beat-dolphins-24-137759707', 'Associated Press via ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-patriots-dolphins-src2', 'bd-20261102-patriots-dolphins', 'Drake Maye leads Patriots'' second-half rally past Dolphins', 'https://www.cbssports.com/nfl/news/drake-maye-leads-patriots-second-half-rally-past-dolphins/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-patriots-dolphins-ev1', 'bd-20261102-patriots-dolphins', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-celtics-magic', 'celtics-beat-magic-fifth-straight-tatum-32-rockets-next', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Tatum scores 32 as the Celtics beat the Magic 108-97 for a fifth straight win before a Monday test in Houston', 'Boston forced 16 turnovers and overcame a cold night from 3-point range. The Rockets, 6-1 and coached by Ime Udoka, host the Celtics at 8:30 p.m. ET Monday.', 'Jayson Tatum scored 32 points and the Celtics beat the Orlando Magic 108-97 on Sunday, Nov. 1, for their fifth straight win. Boston improved to 5-1.

Tatum went 8-of-19 from the field and 15-of-17 at the free-throw line, with seven assists, four rebounds and two blocks, Yahoo Sports reported.

## Box score highlights

| Celtics | Points |
| --- | --- |
| Jayson Tatum | 32 |
| Paul George | 17 |
| Derrick White | 12 |
| Luka Garza | 12 |
| Baylor Scheierman | 10 |

## What stood out

- **Defense:** Boston forced 16 Orlando turnovers.
- **Shooting:** The Celtics made just 12 of 44 3-point attempts, 27%.
- **Rebounding:** Orlando won the boards 43-41, the fifth time in six games Boston has been outrebounded.
- **Lineup:** Mitchell Robinson sat out, the first game a rotation player has missed this season. Neemias Queta started at center and had 8 points and 9 rebounds.

The Celtics led 55-50 at halftime and opened the third quarter with a defensive run that pushed the lead to 10, NBC Sports Boston reported.

## Next up

Boston plays at the Houston Rockets on Monday, Nov. 2, at 8:30 p.m. ET. The Rockets are 6-1 after beating Oklahoma City 119-98 and are coached by former Celtics coach Ime Udoka.', 'Boston Daily Staff', 'https://tile.loc.gov/image-services/iiif/service:pnp:highsm:28000:28037/full/pct:25/0/default.jpg', 'Aerial view of Houston, where the Celtics play the Rockets next (file, 2014). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 6, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-celtics-magic-src1', 'bd-20261102-celtics-magic', 'Boston Celtics stay hot with win in Orlando: How it happened', 'https://sports.yahoo.com/articles/boston-celtics-stay-hot-win-231511144.html', 'Yahoo Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-celtics-magic-src2', 'bd-20261102-celtics-magic', 'Celtics-Magic recap: Jayson Tatum leads C''s to fifth straight win', 'https://www.nbcsportsboston.com/nba/boston-celtics/live-updates-celtics-magic-jayson-tatum-video-highlights/810660/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-celtics-magic-src3', 'bd-20261102-celtics-magic', 'Stingy defense, Jayson Tatum''s 32 points help Celtics put away Magic for fifth straight win', 'https://www.bostonglobe.com/2026/11/01/sports/celtics-magic/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-celtics-magic-ev1', 'bd-20261102-celtics-magic', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261102-nfl-week8', 'nfl-week-8-scores-broncos-beat-chiefs-bills-rout-ravens', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'NFL Week 8: Broncos edge the Chiefs, Bills rout the Ravens and two games go to overtime', 'Denver beat Kansas City 28-24, Buffalo won 36-10 in Baltimore and Washington handled Philadelphia 27-10 on Sunday night. Chicago visits Seattle on Monday night.', 'Twelve games were played on Sunday, Nov. 1. Two went to overtime, and Denver won a key AFC West game over Kansas City.

## Sunday''s final scores

| Winner | Score | Loser |
| --- | --- | --- |
| Denver Broncos | 28-24 | Kansas City Chiefs |
| Buffalo Bills | 36-10 | Baltimore Ravens |
| Cincinnati Bengals | 43-36 (OT) | Tennessee Titans |
| Arizona Cardinals | 33-30 (OT) | Dallas Cowboys |
| Detroit Lions | 19-15 | Minnesota Vikings |
| Jacksonville Jaguars | 42-7 | Indianapolis Colts |
| Las Vegas Raiders | 38-33 | New York Jets |
| Pittsburgh Steelers | 27-6 | Cleveland Browns |
| Tampa Bay Buccaneers | 16-0 | Atlanta Falcons |
| Los Angeles Rams | 24-9 | Los Angeles Chargers |
| New England Patriots | 24-19 | Miami Dolphins |
| Washington Commanders | 27-10 | Philadelphia Eagles |

Scores are from The Sports Encounter''s Week 8 results and the Fox Sports Week 8 live blog.

## Takeaways

- **AFC West:** Denver took the division lead with its win over Kansas City.
- **Buffalo:** The Bills'' 26-point win in Baltimore was one of the most lopsided results of the week.
- **Philadelphia:** The Eagles'' Sunday night loss to Washington added to a difficult stretch.
- **Shutout:** Tampa Bay blanked Atlanta 16-0.

## Monday night

The Chicago Bears play the Seattle Seahawks at 8:15 p.m. ET on Monday, Nov. 2, to close out Week 8.', 'Boston Daily Staff', 'https://tile.loc.gov/image-services/iiif/service:pnp:highsm:48500:48577/full/pct:25/0/default.jpg', 'The Denver Broncos'' home stadium at Mile High, Denver (file). Photo: Carol M. Highsmith / Library of Congress, public domain', 'public_domain', 'newsroom', 'content/2026-11-02.sql', 6, 0, 'newsroom-assistant', '2026-11-02T13:00:00.000Z', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-nfl-week8-src1', 'bd-20261102-nfl-week8', 'NFL Week 8: Broncos seize AFC West lead, Lions stop Vikings, Bills rout Ravens', 'https://thesportsencounter.com/2026/11/02/nfl-week-8-results-2026-broncos-chiefs-lions-vikings/', 'The Sports Encounter', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261102-nfl-week8-src2', 'bd-20261102-nfl-week8', 'NFL Week 8 highlights: Rams handle Chargers, Broncos hang on to beat Chiefs', 'https://www.foxsports.com/live-blog/nfl/nfl-week-8-live-updates-scores', 'Fox Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-02T13:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-02. Editor to confirm.', 'newsroom-assistant', '2026-11-02T13:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261102-nfl-week8-ev1', 'bd-20261102-nfl-week8', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-02T13:00:00.000Z');
