-- Newsroom drafts for 2026-10-27. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-alaska-doj-suit', 'alaska-senate-doj-lawsuit-peltola-motion-to-dismiss-sullivan', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Peltola asks federal judge to toss Trump-ordered suit over Alaska Senate certification', 'The Justice Department wants Alaska barred from certifying a Peltola win because a second Dan Sullivan is on the ballot. Election law experts call the claim weak.', 'Democrat Mary Peltola has asked a federal judge in Alaska to dismiss a Justice Department lawsuit that seeks to stop the state from certifying the U.S. Senate result if she defeats Republican Sen. Dan Sullivan on Nov. 3.

Lawyers for Peltola''s campaign and the Democratic Senatorial Campaign Committee filed the request late Sunday, calling the suit "wholly baseless" and an improper federal intrusion into election administration, which the Constitution leaves to the states, Reuters reported. The campaign asked U.S. District Judge Sharon Gleason to rule this week.

## What the government wants

The department sued the Alaska Division of Elections on Oct. 22, according to the Alaska Beacon. It argues that a second candidate, Dan J. Sullivan Jr. of Petersburg, is on the ballot to confuse voters and help Peltola, and that certification should wait for an investigation. The claim rests on the National Voter Registration Act. President Trump said he ordered the suit.

Attorney General Todd Blanche said on CNN that the administration is not trying to take over a state election, Reuters reported. Sen. Adam Schiff, D-Calif., told NBC the department lacks standing, according to Fox News. Several election law scholars told the Beacon and Al Jazeera the argument has little chance of success.

## How the ballot works

State officials tried to remove Dan J. Sullivan from the primary ballot in June, but Alaska courts reinstated him. He says he is not working with Peltola. Alaska ranks candidates, so a vote for him with the senator ranked second would move to the senator if he is eliminated.

| August primary | Share |
| --- | --- |
| Mary Peltola (D) | 49.5% |
| Dan S. Sullivan (R, incumbent) | 41.4% |
| Dan J. Sullivan Jr. | 2.5% |
| Gerald Heikes (R) | 1.1% |

*Source: Alaska Beacon.*', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-27.sql', 9, 1, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-alaska-doj-suit-src1', 'bd-20261027-alaska-doj-suit', 'Alaska Democratic Senate candidate Peltola asks judge to toss lawsuit over certification', 'https://www.spokesman.com/stories/2026/oct/26/alaska-democratic-senate-candidate-peltola-asks-ju/', 'Reuters (via The Spokesman-Review)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-alaska-doj-suit-src2', 'bd-20261027-alaska-doj-suit', 'Trump administration sues to block Alaska''s US Senate election result if Peltola wins', 'https://alaskabeacon.com/2026/10/23/trump-administration-sues-to-block-alaskas-us-senate-election-result-if-peltola-wins/', 'Alaska Beacon', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-alaska-doj-suit-src3', 'bd-20261027-alaska-doj-suit', 'Dan Sullivan vs Dan Sullivan: Why is Trump''s DOJ suing in Alaska?', 'https://www.aljazeera.com/news/2026/10/24/dan-sullivan-vs-dan-sullivan-why-is-trumps-doj-suing-in-alaska', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-alaska-doj-suit-src4', 'bd-20261027-alaska-doj-suit', '2026 Midterms: Trump attacks El-Sayed, DOJ defends Alaska lawsuit (live updates, Oct. 26)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-el-sayed-california-alaska-october-26', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-alaska-doj-suit-ev1', 'bd-20261027-alaska-doj-suit', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-fed-meeting', 'federal-reserve-october-meeting-warsh-rates-hold-expected', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Fed opens two-day meeting today, with a pause expected after September''s hike', 'Markets see little chance of another increase this week, but hot inflation keeps a December move in play. The decision lands six days before the midterms.', 'Federal Reserve policymakers begin a two-day meeting in Washington today, and most economists expect them to leave the benchmark interest rate unchanged when the decision is released Wednesday.

The Fed''s calendar lists the policy statement for 2 p.m. Eastern on Oct. 28, followed by Chairman Kevin Warsh''s news conference at 2:30 p.m. It is the fourth meeting of Warsh''s tenure, according to The Associated Press.

## Where rates stand

In September the Fed raised its target range by a quarter point to 3.75% to 4%, its first increase in three years, CBS News reported. CME''s FedWatch tool showed an 88% probability of a hold this week and a 71% chance of a hike in December, according to CBS.

| Measure | Latest reading |
| --- | --- |
| Federal funds target | 3.75% to 4% |
| September inflation (headline) | 3.7% |
| Core inflation, past year | 2.6% |
| Fed''s inflation goal | 2% |
| 30-year mortgage rate | 7.32% |

*Sources: CBS News; The Associated Press.*

## What to watch

Gasoline has topped $4 a gallon for three months and accounted for more than half of September''s price increase, CBS reported. Diesel set a record of $6.53 in late September, the AP said.

The AP noted that some analysts expect two or three dissents, with Cleveland Fed President Beth Hammack and Dallas Fed President Lorie Logan seen as most likely to favor a hike. Warsh has criticized the practice of signaling future moves, so his news conference may offer few hints.

The meeting falls six days before the Nov. 3 midterm elections.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Federal_Reserve_Bank,_Cleveland,_Ohio_LCCN2010630382.jpg/1280px-Federal_Reserve_Bank,_Cleveland,_Ohio_LCCN2010630382.jpg', 'The Federal Reserve Bank of Cleveland, whose president, Beth Hammack, votes on policy this year. Photo: Carol M. Highsmith, Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-27.sql', 8, 0, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-fed-meeting-src1', 'bd-20261027-fed-meeting', 'October 2026 calendar: FOMC meeting and press conference', 'https://www.federalreserve.gov/newsevents/2026-october.htm', 'Board of Governors of the Federal Reserve System', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-fed-meeting-src2', 'bd-20261027-fed-meeting', 'Federal Reserve to announce its latest interest rate move this week', 'https://www.cbsnews.com/news/federal-reserve-interest-rates-october-meeting', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-fed-meeting-src3', 'bd-20261027-fed-meeting', '5 things to watch from the Federal Reserve''s next meeting', 'https://www.clickorlando.com/news/politics/2026/10/27/5-things-to-watch-from-the-federal-reserves-next-meeting/', 'The Associated Press (via WKMG)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-fed-meeting-ev1', 'bd-20261027-fed-meeting', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-mississippi-senate', 'trump-corinth-rally-hyde-smith-colom-mississippi-senate', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump rallies in Corinth for Hyde-Smith as Democrats pour money into Mississippi', 'Forecasters still rate the seat safely Republican, but the president''s visit and a Democratic ad buy signal both sides are watching Scott Colom''s challenge.', 'President Trump campaigned in Corinth on Monday night for Sen. Cindy Hyde-Smith, adding a stop in a state he carried by about 23 points in 2024 as the midterms enter their final week.

Trump predicted Hyde-Smith is "going to win big" and called her Democratic opponent, Scott Colom, a "disaster," Fox News reported. The rally was held at the Crossroads Arena in the state''s northeast corner, according to Mississippi Today.

## The race

- **Cindy Hyde-Smith (R)** is seeking her second full term. Trump endorsed her in March 2025.
- **Scott Colom (D)** is a district attorney in north Mississippi. He has challenged Trump to debate him and says Hyde-Smith is scared of the race, WLOX reported.
- **Ty Pinkins**, a lawyer, is on the ballot as an independent.

Most national forecasters rate the race solid or likely Republican, and a Democrat has not won a Senate race in Mississippi since 1982, Mississippi Today reported. Sen. Roger Wicker said he believes Hyde-Smith still leads.

## Outside help

Democrats have sent reinforcements. Senate Majority PAC announced a $1.2 million ad buy for Colom, former Vice President Kamala Harris campaigned with him in Columbus last week, and former President Barack Obama has endorsed him, according to Mississippi Today. Former Gov. Phil Bryant was reported to be planning a bus tour with Hyde-Smith.

Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-27.sql', 7, 0, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-mississippi-senate-src1', 'bd-20261027-mississippi-senate', 'Trump considering Mississippi visit to support Hyde-Smith', 'https://mississippitoday.org/2026/10/21/trump-considering-mississippi-visit-to-support-hyde-smith/', 'Mississippi Today', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-mississippi-senate-src2', 'bd-20261027-mississippi-senate', 'Trump rallying in Mississippi on Monday to support Hyde-Smith', 'https://www.wlox.com/2026/10/21/trump-rallying-mississippi-monday-support-hyde-smith/', 'WLOX', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-mississippi-senate-src3', 'bd-20261027-mississippi-senate', '2026 Midterms: Trump attacks El-Sayed, DOJ defends Alaska lawsuit (live updates, Oct. 26)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-el-sayed-california-alaska-october-26', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-mississippi-senate-ev1', 'bd-20261027-mississippi-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-fraud-reward', 'trump-1-million-voter-fraud-reward-truth-social-midterms', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump offers $1 million for voter fraud tips that lead to convictions', 'The president announced the reward on social media a week before the midterms. The White House and Justice Department did not say how it would be paid or run.', 'President Trump said Monday that people who report election fraud leading to an arrest and conviction will be paid $1 million, an offer that arrives eight days before the Nov. 3 midterms.

Trump made the announcement on Truth Social, according to Newsweek and Fox News. Newsweek reported the offer covers alleged fraud in past elections as well as this year''s.

## Open questions

Trump did not say where the money would come from, how tips would be submitted or who would decide whether one qualified, Newsweek reported. The White House referred questions back to the post, and the Justice Department said it defers to the White House on whether it would run or fund the reward, according to Newsweek.

The offer is separate from a $25 million fraud whistleblower program the Justice Department announced earlier for reporting fraud in federal programs. Newsweek reported that program''s published awards range from $10,000 to $30,000.

## A wider push

The announcement follows a series of administration actions on noncitizen voting:

- The Justice Department said on Oct. 20 that it had charged 113 people in 20 states with illegal voting and registration offenses over seven weeks, Newsweek reported. Charges are allegations, not findings of guilt.
- The Department of Homeland Security announced charges against five noncitizens accused of voting illegally in Florida, according to Fox News.
- A federal judge rejected the department''s request for Georgia''s unredacted voter list, which Newsweek described as the administration''s 26th straight court loss on such requests. The government has appealed in several cases.

More than 27.4 million Americans had voted early as of Monday morning, Fox News reported.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-27.sql', 6, 0, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-fraud-reward-src1', 'bd-20261027-fraud-reward', 'Trump offers $1M for election fraud convictions week before midterms', 'https://www.yahoo.com/news/politics/articles/trump-offers-1m-election-fraud-222339049.html', 'Newsweek (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-fraud-reward-src2', 'bd-20261027-fraud-reward', '2026 Midterms: Trump attacks El-Sayed, DOJ defends Alaska lawsuit (live updates, Oct. 26)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-el-sayed-california-alaska-october-26', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-fraud-reward-ev1', 'bd-20261027-fraud-reward', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-world-series-g3', 'brewers-rout-rays-10-1-world-series-game-3-lead-3-0', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Brewers score eight in the fifth, rout Rays 10-1 and move one win from their first title', 'Rookie Robert Gasser allowed one hit over six innings and Jackson Chourio had four hits as Milwaukee took a 3-0 World Series lead. Game 4 is tonight.', 'The Milwaukee Brewers are one win away from the first World Series championship in franchise history after a 10-1 rout of the Tampa Bay Rays in Game 3 on Monday night at Tropicana Field.

Milwaukee broke open a scoreless game with eight runs in the fifth inning, all with two outs, MLB.com reported. ESPN said the inning included seven straight two-out hits, a postseason record.

## The big inning

Brice Turang''s liner deflected off shortstop Taylor Walls'' glove for two runs, ESPN reported. Garrett Mitchell singled in a run, Cooper Pratt doubled in two, and Sal Frelick, David Hamilton and Jackson Chourio added run-scoring hits. Rays starter Freddy Peralta, facing his former team, did not finish the inning.

Chourio went 4 for 5 with a stolen base. Every Brewers starter reached base, and eight of nine drove in a run, according to MLB.com.

## Gasser''s gem

Rookie left-hander Robert Gasser allowed one hit, a first-inning single by Yandy Diaz, over six scoreless innings. ESPN said he retired 14 straight batters at one point.

## History check

Only one of 43 teams to trail 3-0 in a best-of-seven postseason series has come back: the 2004 Red Sox, ESPN noted. A Brewers win tonight would make them the first team since the 1976 Reds to sweep both the LCS and the World Series.

| Game 4 | Details |
| --- | --- |
| When | Tuesday, Oct. 27, 8 p.m. ET |
| Where | Tropicana Field, St. Petersburg |
| TV | FOX |
| Series | Brewers lead 3-0 |', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-27.sql', 8, 0, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-world-series-g3-src1', 'bd-20261027-world-series-g3', 'Brewers win World Series Game 3', 'https://www.mlb.com/rays/news/brewers-win-world-series-game-3-2026', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-world-series-g3-src2', 'bd-20261027-world-series-g3', 'Brewers ride 8-run fifth to Game 3 rout of Rays, take 3-0 World Series lead', 'https://www.espn.com/mlb/story/_/id/50293953/brewers-rout-rays-game-3-1-win-first-world-series-title', 'ESPN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-world-series-g3-ev1', 'bd-20261027-world-series-g3', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-celtics-bulls', 'celtics-rout-bulls-134-99-pritchard-28-tatum', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Pritchard hits seven 3s and scores 28 as Celtics rout Bulls 134-99', 'Boston blew the game open with a 39-21 third quarter and improves to 2-1. The Nets visit TD Garden tonight.', 'Payton Pritchard scored 28 points and made seven of 10 3-point attempts as the Celtics routed the Chicago Bulls 134-99 on Monday night at TD Garden.

Boston led 66-54 at halftime and pulled away with a 39-21 third quarter, NBC Sports Boston reported. Pritchard scored 19 points in the period on 5-of-5 shooting from deep, his best single quarter as a pro.

## Box score notes

- **Jayson Tatum** had 23 points, seven rebounds and six assists in 28 minutes, including a buzzer-beating 3 to end the first half.
- **Paul George** added 16 points.
- **Sam Hauser** scored 11 off the bench with three 3s.
- **Mike Conley** made both of his 3-point tries in his first stint as a Celtic.

Norman Powell led Chicago in scoring, and rookie Caleb Wilson added 17 points, according to NBC Sports Boston.

## By the numbers

Bleacher Nation, which covers the Bulls, tallied the gaps:

| Category | Celtics | Bulls |
| --- | --- | --- |
| Points off turnovers | 39 | 17 |
| Bench points | 79 | 33 |
| Points in the paint | 46 | 30 |
| Rebounds | 65 | 53 |
| 3-point shooting | 48% | 27% |

## Up next

The Celtics (2-1) play the second game of a back-to-back tonight against the Brooklyn Nets at TD Garden. The Bulls fell to 1-3.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-27.sql', 6, 0, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-celtics-bulls-src1', 'bd-20261027-celtics-bulls', 'Payton Pritchard, Jayson Tatum drive Celtics blowout win vs. Bulls', 'https://www.nbcsportsboston.com/nba/boston-celtics/live-updates-celtics-bulls-facing-off-at-td-garden/809410/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-celtics-bulls-src2', 'bd-20261027-celtics-bulls', 'Bulls 99-134 Celtics: Chicago Can''t Keep Up with Boston', 'https://www.bleachernation.com/bulls/2026/10/26/bulls-celtics-oct-26/', 'Bleacher Nation', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-celtics-bulls-ev1', 'bd-20261027-celtics-bulls', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261027-bruins-canes', 'bruins-at-hurricanes-nhl-best-records-geekie-swayman', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins visit Carolina tonight in a matchup of the NHL''s two best records', 'Boston brings an eight-game points streak to Raleigh to face the defending Stanley Cup champions, with former Hurricanes pick Morgan Geekie on a new line.', 'The Bruins open a two-game road trip tonight in Raleigh against the Carolina Hurricanes, the defending Stanley Cup champions, in a meeting of the two best records in the NHL.

Boston is 9-2-1 and has earned points in eight straight games, winning seven, according to the Bruins'' team site. Carolina is 9-2-2.

## Boston''s form

- **David Pastrnak** leads the team with seven goals and 10 assists, CBS Sports reported.
- **Jeremy Swayman** is 7-1-1 in goal.
- **James Hagens** has four goals.
- The Bruins have scored at least four goals in eight of their nine wins, CBS Sports said, most recently a 6-4 comeback win over San Jose.

Coach Marco Sturm moved Morgan Geekie to the second line with Fraser Minten and Marat Khusnutdinov last week. Geekie, a 2017 draft pick of the Hurricanes, led Boston with 39 goals last season. Sturm told reporters simply that he wants to beat the champions.

## Carolina''s side

Goalie Pyotr Kochetkov is 7-0-0, including a shutout at St. Louis, CBS Sports reported. Seth Jarvis is set for his home debut after offseason shoulder surgery, while captain Jordan Staal, Taylor Hall and Mark Jankowski are out.

| Road trip | Opponent | Time (ET) |
| --- | --- | --- |
| Tue., Oct. 27 | at Carolina (Lenovo Center) | 8 p.m. |
| Thu., Oct. 29 | at St. Louis (Enterprise Center) | 8 p.m. |', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-27.sql', 6, 0, 'newsroom-assistant', '2026-10-27T10:30:00.000Z', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-bruins-canes-src1', 'bd-20261027-bruins-canes', 'Practice Report: Geekie, Bruins gear up for two-game road trip', 'https://www.nhl.com/bruins/news/practice-report-geekie-bruins-gear-up-for-two-game-road-trip', 'Boston Bruins / NHL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261027-bruins-canes-src2', 'bd-20261027-bruins-canes', 'Bruins and Hurricanes clash for early East supremacy', 'https://www.cbssports.com/nhl/news/bruins-and-hurricanes-clash-for-early-east-supremacy/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-27T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-27. Editor to confirm.', 'newsroom-assistant', '2026-10-27T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261027-bruins-canes-ev1', 'bd-20261027-bruins-canes', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-27T10:30:00.000Z');
