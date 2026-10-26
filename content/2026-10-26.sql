-- Newsroom drafts for 2026-10-26. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-michigan-senate', 'trump-port-huron-rally-obama-detroit-michigan-senate-rogers-el-sayed', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump rallies in Port Huron a day after Obama stumps for El-Sayed in Michigan Senate race', 'The open-seat contest between Republican Mike Rogers and Democrat Abdul El-Sayed is one of a handful that could decide control of the Senate on Nov. 3.', 'President Donald Trump held his first Michigan campaign rally of the year on Sunday in Port Huron, one day after former President Barack Obama campaigned in Detroit for the state''s Democratic ticket.

The back-to-back visits put a spotlight on Michigan''s open U.S. Senate seat, where former Republican Rep. Mike Rogers faces Democrat Abdul El-Sayed, a former public health official. Election Day is Nov. 3.

## Obama in Detroit

On Saturday, Obama appeared with El-Sayed, gubernatorial nominee Jocelyn Benson and other statewide Democratic candidates, according to Reuters. He compared attacks on El-Sayed''s patriotism to the false claims once made about his own birthplace. If elected, El-Sayed would be the first Muslim member of the U.S. Senate, Reuters noted.

## Trump in Port Huron

Trump spoke for nearly two hours at a hockey arena, with Rogers joining him on stage, Al Jazeera reported. Both men attacked El-Sayed, alleging ties to extremist groups. Reuters and Al Jazeera each reported that no evidence has been offered for those claims. El-Sayed has rejected them and says he is focused on costs and health care.

Trump also defended the war with Iran, saying he had no second thoughts, and argued gas would cost more without his actions. Michigan drivers paid about $4.82 a gallon on Monday, well above the national average of $4.29, according to AAA.

Rogers has broken with the president on tariffs, citing their effect on the auto industry, Reuters reported.

## What is at stake

| Chamber | Current majority | Democrats need |
| --- | --- | --- |
| Senate | Republicans, 53-47 | Net gain of 4 seats |
| House | Republicans, 218-214 | Net gain of 4 seats |

Figures as reported by Reuters. Al Jazeera described Michigan as one of about seven toss-up Senate races.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Birds_eye_view_of_the_city_of_Port_Huron,_Sarnia_%26_Gratiot,_St._Clair_Co.,_Michigan_1867_%26_Point_Edwards,_Lambton_Co.,_Canada_west._LOC_73693443.jpg/1280px-Birds_eye_view_of_the_city_of_Port_Huron,_Sarnia_%26_Gratiot,_St._Clair_Co.,_Michigan_1867_%26_Point_Edwards,_Lambton_Co.,_Canada_west._LOC_73693443.jpg', 'An 1867 bird''s-eye view of Port Huron, Mich. Photo: Library of Congress, Geography and Map Division / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-26.sql', 9, 1, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-michigan-senate-src1', 'bd-20261026-michigan-senate', 'Trump campaigns in Michigan a day after Obama rallies Democrats', 'https://www.yahoo.com/news/articles/trump-campaigns-michigan-day-obama-100245240.html', 'Reuters (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-michigan-senate-src2', 'bd-20261026-michigan-senate', 'Trump dials up Islamophobia against Abdul El-Sayed at Michigan Senate rally', 'https://www.aljazeera.com/news/2026/10/26/trump-dials-up-islamophobia-at-michigan-senate-rally-against-abdul-el-sayed', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-michigan-senate-src3', 'bd-20261026-michigan-senate', 'State Gas Price Averages', 'https://gasprices.aaa.com/state-gas-price-averages/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-michigan-senate-ev1', 'bd-20261026-michigan-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-calif-ballots', 'ninth-circuit-skeptical-doj-bid-set-aside-20000-california-mail-ballots', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Appeals judges question Justice Department bid to set aside 20,000 California mail ballots', 'A rare Sunday hearing ended without a ruling; a federal trial judge takes up the case Tuesday, a week before Election Day.', 'A three-judge panel of the 9th U.S. Circuit Court of Appeals heard arguments on Sunday over the Trump administration''s demand that California separate roughly 20,000 mail ballots sent to people federal officials suspect are not citizens.

The panel did not rule after the session in San Francisco, which ran about 105 minutes, according to Votebeat.

## The arguments

Justice Department lawyer Matthew Donnelly urged the court to act quickly. Judge Mark Bennett, a Trump appointee, asked why the department had not sued sooner and questioned whether federal law lets Washington dictate how a state screens its voters, The Washington Sun reported. Judge Gabriel Sanchez, a Biden appointee, pressed on how reliable the federal list is.

Votebeat reported that Judge Patrick Bumatay, also a Trump appointee, appeared more open to the government''s position.

California Deputy Attorney General Samuel Siegel said voters must attest to their citizenship and argued no law supports the remedy the department wants.

## What counties found

Los Angeles County officials said 7,035 names on the list had county addresses. In a sample of 200, most had never voted, and a significant share indicated they were born in the United States, according to filings described by ABC News and Votebeat.

The department has charged about 28 people from the list with voting and immigration crimes, ABC News reported.

## What comes next

| Date | Event |
| --- | --- |
| Oct. 15 | Justice Department sues California |
| Oct. 25 | 9th Circuit hears emergency appeal |
| Oct. 27 | U.S. District Judge David O. Carter holds hearing |
| Nov. 3 | Election Day |

California mailed ballots and opened early voting centers on Oct. 5.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/c/c4/Glass_ballot_box_-_Smithsonian.jpg', 'A glass ballot box in the Smithsonian collection. Photo: Smithsonian Institution / Wikimedia Commons, CC0 (public domain)', 'public_domain', 'newsroom', 'content/2026-10-26.sql', 8, 0, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-calif-ballots-src1', 'bd-20261026-calif-ballots', 'Federal appeals court hears arguments in Trump administration voting lawsuit against California', 'https://abcnews.com/Politics/federal-appeals-court-hear-arguments-trump-administrations-voting/story?id=137546706', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-calif-ballots-src2', 'bd-20261026-calif-ballots', 'Appeals Court Questions Trump Administration Bid to Block 20,000 California Ballots', 'https://www.washingtonsun.com/legal/9th-circuit-appeals-trump-doj-california-ballot-hearing', 'The Washington Sun', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-calif-ballots-src3', 'bd-20261026-calif-ballots', 'Trump administration urges appeals court to set aside thousands of California ballots', 'https://www.votebeat.org/national/2026/10/26/trump-california-noncitizens-ballots-lawsuit-midterm/', 'Votebeat', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-calif-ballots-ev1', 'bd-20261026-calif-ballots', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-iran-choice', 'trump-weighs-iran-deal-or-renewed-strikes-oil-above-117', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump says he is weighing an Iran deal against renewed strikes as oil stays high', 'The president ruled out a strike on Saturday but not later; Iran says it would reopen the Strait of Hormuz if the U.S. lifts its naval blockade.', 'President Donald Trump said Sunday that he is choosing between a deal with Iran and renewed military action, as talks to end the war remain stalled and oil prices hover near their highest levels since spring.

A day earlier, Trump told reporters there would be no strike that day but said further action remained possible, according to Gulf News. He also floated the prospect of a large agreement while questioning whether Tehran would honor one.

## Where talks stand

Iran says it has not closed the door to diplomacy and that messages are still passing through intermediaries, CBS News reported. Tehran says it would reopen the Strait of Hormuz if Washington lifts its naval blockade of Iranian ports; the U.S. says the blockade stays.

Saudi, Turkish and Pakistani officials were scheduled to meet Iranian officials in Tehran on Monday on regional security, according to CBS News.

## Pressure on the region and on prices

Houthi forces fired missiles toward Saudi targets over the weekend. Riyadh''s main airport reopened Sunday after a two-week closure, and debris from intercepted missiles injured two people, Gulf News reported.

| Measure | Figure |
| --- | --- |
| Brent crude, start of October | Under $97 a barrel |
| Brent crude, Oct. 23 | Above $117 a barrel |
| U.S. regular gas, Monday | $4.29 a gallon (AAA) |
| Ships escorted with U.S. support | More than 3,000 in six months |

Oil figures and the escort count are as reported by CBS News, which cited the head of U.S. Central Command for the shipping number.

Trump has said Iranian reports of attacks on tankers are false and meant to push oil prices higher.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/The_Eisenhower_Carrier_Strike_Group_Transits_the_Strait_of_Hormuz_(8170044).jpg/1280px-The_Eisenhower_Carrier_Strike_Group_Transits_the_Strait_of_Hormuz_(8170044).jpg', 'The USS Dwight D. Eisenhower carrier strike group in the Strait of Hormuz (file). Photo: U.S. Navy / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-26.sql', 8, 0, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-iran-choice-src1', 'bd-20261026-iran-choice', 'Live Updates: Trump says he is weighing deal with Iran against action to finish them off', 'https://www.cbsnews.com/live-updates/iran-war-trump-us-oil-gas-prices-strait-of-hormuz-midterms/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-iran-choice-src2', 'bd-20261026-iran-choice', 'Trump rules out Iran strike amid Houthi attack on Saudi Arabia', 'https://gulfnews.com/world/mena/middle-east-war-drone-missile-intercepted-over-riyadh-as-king-khalid-airport-resumes-operations-1.500722685', 'Gulf News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-iran-choice-src3', 'bd-20261026-iran-choice', 'State Gas Price Averages', 'https://gasprices.aaa.com/state-gas-price-averages/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-iran-choice-ev1', 'bd-20261026-iran-choice', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-gas-prices', 'gas-ticks-up-to-4-29-michigan-jumps-massachusetts-4-23', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Gas ticks back up to $4.29 as Michigan jumps; Massachusetts drivers pay $4.23', 'Prices had dipped with the switch to winter-blend fuel, but crude near $100 a barrel is keeping pump costs about $1.20 above last year.', 'The national average for a gallon of regular gasoline stood at $4.29 on Monday, according to AAA, slightly above the $4.27 the auto club reported in its weekly update on Thursday.

That update showed a 6-cent weekly drop, which AAA tied to the seasonal switch to cheaper winter-blend gasoline. But it also warned that crude oil was nearing $100 a barrel. U.S. benchmark crude settled at $97.15 in the period AAA reviewed.

## Year over year

AAA put the year-ago national average at about $3.07, meaning drivers are paying roughly $1.20 more per gallon than they were last fall.

## The Midwest jump

Michigan stands out. AAA listed the state at $4.60 last week; on Monday it was about $4.82, among the highest in the country. California remains the most expensive state at $6.02, and North Carolina the cheapest at $3.48.

## New England prices on Monday

| State | Regular | Diesel |
| --- | --- | --- |
| Massachusetts | $4.23 | $6.34 |
| New Hampshire | $4.20 | $6.36 |
| Rhode Island | $4.15 | $6.33 |
| Connecticut | $4.30 | $6.43 |
| Maine | $4.30 | $6.41 |
| U.S. average | $4.29 | — |

Source: AAA state averages, rounded to the cent.

## Demand and supply

Federal data cited by AAA showed gasoline demand rising to 8.98 million barrels a day from 8.40 million, while total stocks fell to 205.3 million barrels.

International benchmark Brent crude passed $117 a barrel on Oct. 23, its highest since March, CBS News reported, as the standoff with Iran over the Strait of Hormuz continues.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/0/01/GASOLINE_SHORTAGE_HIT_THE_STATE_OF_OREGON_IN_THE_FALL_OF_1973_BY_MIDDAY_GASOLINE_WAS_BECOMING_UNAVAILABLE_ALONG..._-_NARA_-_555405.jpg', 'Gasoline shortage in Oregon, fall 1973 (archive photo). Photo: DOCUMERICA, U.S. National Archives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-26.sql', 6, 0, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-gas-prices-src1', 'bd-20261026-gas-prices', 'State Gas Price Averages', 'https://gasprices.aaa.com/state-gas-price-averages/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-gas-prices-src2', 'bd-20261026-gas-prices', 'National Average Falls 6 Cents, But Crude Oil Nears $100/Barrel', 'https://gasprices.aaa.com/national-average-falls-6-cents-but-crude-oil-nears-100-barrel/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-gas-prices-src3', 'bd-20261026-gas-prices', 'Live Updates: Trump says he is weighing deal with Iran against action to finish them off', 'https://www.cbsnews.com/live-updates/iran-war-trump-us-oil-gas-prices-strait-of-hormuz-midterms/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-gas-prices-ev1', 'bd-20261026-gas-prices', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-world-series-g3', 'world-series-game-3-brewers-lead-rays-2-0-gasser-peralta', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'World Series shifts to Tampa Bay with the Brewers up 2-0 and Peralta facing his old team', 'Milwaukee rallied from a four-run hole to win Game 2, 5-4. Game 3 is Monday at 8 p.m. ET on FOX.', 'The Milwaukee Brewers are two wins from their first World Series title after coming back to beat the Tampa Bay Rays 5-4 in Game 2 on Saturday night.

The series resumes Monday at Tropicana Field, where the Rays will try to avoid a 3-0 hole.

## How Game 2 turned

Tampa Bay scored four times in the first inning, helped by an error and a home run by Liam Hicks, according to Field Level Media. Milwaukee answered with two runs in the bottom of the inning, closed to 4-3 on a Rays fielding error and tied it on Sal Frelick''s sixth-inning homer.

Rookie Cooper Pratt drove in the go-ahead run with a single in the seventh. Five Brewers relievers then held the Rays scoreless, and Aaron Ashby earned the save.

Only 10 teams have come back from 2-0 down to win the World Series, the last being the 1996 Yankees, Field Level Media noted.

## Game 3 at a glance

| | |
| --- | --- |
| Time | 8 p.m. ET |
| TV | FOX |
| Brewers starter | Robert Gasser |
| Rays starter | Freddy Peralta |

Peralta spent his first eight seasons in Milwaukee. Since Aug. 26 he is 7-0 with a 0.89 ERA and was named ALCS MVP, according to MLB.com.

Milwaukee''s bullpen has allowed one run in 10 innings this series, MLB.com reported, and Ashby has not allowed a run in 15 2/3 postseason innings.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-26.sql', 7, 0, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-world-series-g3-src1', 'bd-20261026-world-series-g3', '2026 World Series Game 3 storylines: Brewers vs. Rays', 'https://www.mlb.com/news/2026-world-series-game-3-storylines-brewers-vs-rays', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-world-series-g3-src2', 'bd-20261026-world-series-g3', 'Brewers erase 4-run deficit, take 2-0 World Series lead vs. Rays', 'https://deadspin.com/brewers-erase-4-run-deficit-take-2-0-world-series-lead-vs-rays/', 'Field Level Media (via Deadspin)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-world-series-g3-ev1', 'bd-20261026-world-series-g3', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-bruins-sharks', 'bruins-beat-sharks-6-4-carolina-next', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'First-place Bruins rally past the Sharks 6-4, then head to Carolina', 'Boston scored four times in the third period to improve to 9-2-1 ahead of a Tuesday game at Carolina.', 'The Bruins scored four third-period goals to beat the San Jose Sharks 6-4 at TD Garden on Saturday night and stay in first place in the Atlantic Division.

San Jose led 3-2 early in the third on a power-play goal by Dmitry Orlov. David Pastrnak tied it at 8:27, and James Hagens put Boston ahead less than a minute later with his fourth goal of the season.

## Scoring summary

| Period | Goal | Score |
| --- | --- | --- |
| 1st | Mittelstadt (BOS) | 1-0 BOS |
| 1st | Misa (SJ), power play | 1-1 |
| 2nd | Khusnutdinov (BOS) | 2-1 BOS |
| 2nd | Sherwood (SJ), shorthanded | 2-2 |
| 3rd | Orlov (SJ), power play | 3-2 SJ |
| 3rd | Pastrnak (BOS) | 3-3 |
| 3rd | Hagens (BOS) | 4-3 BOS |
| 3rd | Minten (BOS), power play | 5-3 BOS |
| 3rd | Smith (SJ) | 5-4 BOS |
| 3rd | Borgen (BOS), empty net | 6-4 BOS |

Jeremy Swayman made 23 saves on 27 shots, according to Covers'' box score. Boston is 9-2-1.

## Up next

| Date | Opponent | Time (ET) |
| --- | --- | --- |
| Tue., Oct. 27 | at Carolina | 8 p.m. |
| Thu., Oct. 29 | at St. Louis | 8 p.m. |
| Sat., Oct. 31 | vs. Chicago | 1 p.m. |
| Mon., Nov. 2 | vs. Vegas | 7 p.m. |

Schedule as listed by Hockey-Reference; check the team site for TV details.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/3/3f/2011_Boston_Bruins_at_White_House.jpg', 'The Bruins'' 2011 Stanley Cup team at the White House (file). Photo: Official White House photo / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-26.sql', 6, 0, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-bruins-sharks-src1', 'bd-20261026-bruins-sharks', 'Official Boston Bruins Website: Bruins Beat Sharks 6-4 in Back-and-Forth Affair at TD Garden', 'https://www.nhl.com/bruins/', 'NHL.com / Boston Bruins', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-bruins-sharks-src2', 'bd-20261026-bruins-sharks', 'Sharks vs Bruins game overview and box score, Oct. 24, 2026', 'https://www.covers.com/sport/hockey/nhl/matchup/382449', 'Covers', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-bruins-sharks-src3', 'bd-20261026-bruins-sharks', '2026-27 Boston Bruins Schedule', 'https://www.hockey-reference.com/teams/BOS/2027_games.html', 'Hockey-Reference', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-bruins-sharks-ev1', 'bd-20261026-bruins-sharks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261026-celtics-bulls', 'celtics-host-bulls-monday-after-tatum-36-point-win', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Celtics, at 1-1, host the Bulls tonight after Tatum carried them past the Knicks', 'Boston returns from a weekend off for a 7:30 p.m. tip at TD Garden; Chicago arrives at 1-2.', 'The Celtics return to TD Garden on Monday night to face the Chicago Bulls, their first game since Jayson Tatum led them past the New York Knicks in the home opener.

Tatum had 36 points, nine rebounds and seven assists in Friday''s 107-103 win, leading the team in all three categories, NBC Sports Boston reported. Neemias Queta added 15 points and three blocks off the bench.

That win evened Boston''s record at 1-1 after a season-opening loss in Detroit, where the Celtics let a lead slip away.

## Tonight

| | |
| --- | --- |
| Tip-off | 7:30 p.m. ET |
| Where | TD Garden |
| TV | NBC Sports Boston |
| Records | Celtics 1-1, Bulls 1-2 |

## Scouting Chicago

The Bulls are coming off a 124-120 loss to the Washington Wizards, according to a Fubo game preview. The same preview listed center Nic Claxton out with a hamstring injury and forwards Patrick Williams and Noa Essengue as questionable.

Fubo noted that its previews are generated automatically and that some injury entries may be dated, so fans should check the latest reports before tip-off. Boston guard Devin Carter missed Friday''s game with an illness.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/1/14/Boston_Celtics_player_Jayson_Tatum_on_November_21,_2024_at_White_House_(cropped).jpg', 'Jayson Tatum at the White House, Nov. 21, 2024 (file). Photo: Official White House photo / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-26.sql', 5, 0, 'newsroom-assistant', '2026-10-26T10:15:00.000Z', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-celtics-bulls-src1', 'bd-20261026-celtics-bulls', 'Celtics-Knicks recap: Jayson Tatum comes through in clutch for first victory', 'https://www.nbcsportsboston.com/nba/boston-celtics/live-updates-celtics-hosting-knicks-in-bostons-home-opener/809129/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261026-celtics-bulls-src2', 'bd-20261026-celtics-bulls', 'Chicago Bulls at Boston Celtics: where to watch, stream info, TV channel (Oct. 26, 2026)', 'https://www.fubo.tv/news/nba/chicago-bulls-at-boston-celtics-where-to-watch-stream-info-tv-channel-and-live-updates-october-26-2026/', 'Fubo News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-26T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-26. Editor to confirm.', 'newsroom-assistant', '2026-10-26T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261026-celtics-bulls-ev1', 'bd-20261026-celtics-bulls', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-26T10:15:00.000Z');
