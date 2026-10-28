-- Newsroom drafts for 2026-10-28. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-texas-senate', 'trump-corpus-christi-lubbock-rallies-paxton-talarico-texas-senate-tied', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump rallies for Paxton in Corpus Christi and Lubbock as Texas Senate race sits at a tie', 'A Fox News poll has Ken Paxton and James Talarico at 49% each in a state Trump won by nearly 14 points. Talarico answered with his own Lubbock rally.', 'President Trump made his fourth campaign trip to Texas since Labor Day on Tuesday, holding events in Corpus Christi and Lubbock for Republican Senate nominee Ken Paxton one week before the Nov. 3 election.

At the Port of Corpus Christi and later in Lubbock, Trump praised Paxton, the state attorney general, and told supporters he needs him in the Senate, KVUE reported. He criticized Democrat James Talarico as out of step with Texas values.

## A tie in a red state

A new Fox News poll shows Paxton and Talarico tied at 49% among likely voters, Fox News reported. Last month Talarico led 51% to 49%. Trump carried Texas by nearly 14 points in 2024.

| Fox News poll | Paxton (R) | Talarico (D) |
| --- | --- | --- |
| Likely voters | 49% | 49% |
| Support within own party | 90% of Republicans | 98% of Democrats |
| Hispanic likely voters | 34% | 64% |

*Source: Fox News.*

Democrats also lead on enthusiasm: 69% say they are extremely interested in the election, compared with 61% of Republicans, according to the poll.

## Dueling rallies

Talarico, a state representative and former public school teacher, held his own rally in Lubbock on Tuesday night during a West Texas swing that included Midland and Amarillo. His campaign moved the event to a larger venue because of demand, KVUE reported. A political scientist told the station the aim appears to be narrowing Paxton''s margin in the region rather than winning it.

Paxton defeated Sen. John Cornyn in a Republican primary that went to overtime, leaving Cornyn''s seat open. Democrats have not won a statewide race in Texas in more than 30 years.

More than 20% of registered Texas voters had already cast ballots, ABC News reported. Lt. Gov. Dan Patrick urged Republicans to vote early rather than wait for Election Day.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/The_Texas_Governor%27s_Mansion_in_Austin,_the_capital_of_Texas_LCCN2014632021.tif/lossy-page1-1280px-The_Texas_Governor%27s_Mansion_in_Austin,_the_capital_of_Texas_LCCN2014632021.tif.jpg', 'The Texas Governor''s Mansion in Austin (file). Photo: Carol M. Highsmith, Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-28.sql', 9, 1, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-texas-senate-src1', 'bd-20261028-texas-senate', 'Trump won this reliably red state by double digits. Now a deadlocked race is bringing him back', 'https://www.foxnews.com/politics/trump-won-reliably-red-state-double-digits-deadlocked-race-bringing-him-back', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-texas-senate-src2', 'bd-20261028-texas-senate', 'Trump holds rallies in Corpus Christi, Lubbock in effort to energize Republicans ahead of midterm election', 'https://www.yahoo.com/news/politics/articles/trump-holds-rallies-corpus-christi-224908742.html', 'KVUE (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-texas-senate-src3', 'bd-20261028-texas-senate', 'Midterm elections live updates: 1 week until high-stakes elections', 'https://abcnews.com/Politics/live-updates/midterm-elections-2026-1-week-high-stakes-elections/?id=137578278', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-texas-senate-ev1', 'bd-20261028-texas-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-maurene-comey', 'judge-furman-rules-maurene-comey-unlawfully-fired-justice-department', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Judge rules Justice Department unlawfully fired prosecutor Maurene Comey', 'Judge Jesse Furman rejected the administration''s claim of unlimited removal power and ordered back pay. The department says it will appeal.', 'A federal judge in Manhattan ruled Monday that the Justice Department broke the law when it fired Maurene Comey, a former federal prosecutor and the daughter of former FBI Director James Comey.

U.S. District Judge Jesse Furman found that the July 2025 firing violated the separation of powers and the Civil Service Reform Act of 1978, CBS News reported. He rejected the administration''s argument that Article II of the Constitution gives the president unrestricted power to remove such employees, calling the government''s position a "sweeping and unprecedented theory of executive authority."

## What the ruling does

Furman ordered Comey retroactively reinstated and awarded back pay from her firing through Dec. 20, 2025, when she accepted another job, according to CBS News. Al Jazeera reported the judge found the administration exceeded its authority by removing protected "inferior officers" without cause.

A Justice Department spokesperson said the department disagrees with the decision and will appeal in due course.

## Background

Comey had worked as an assistant U.S. attorney in Manhattan since 2015 and handled cases involving Jeffrey Epstein, Ghislaine Maxwell and Sean "Diddy" Combs, Al Jazeera reported. Her lawsuit argued that she was fired in retaliation for her father''s conflict with President Trump.

James Comey, who led the FBI from 2013 until Trump fired him in 2017, faces a separate criminal case filed in April over a social media post that prosecutors called a threat against the president. He has called that case political persecution, according to Al Jazeera.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 8, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-maurene-comey-src1', 'bd-20261028-maurene-comey', 'Maurene Comey, James Comey''s daughter, was unlawfully fired, judge rules', 'https://www.cbsnews.com/news/maurene-comey-lawsuit-firing-justice-department-ruling/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-maurene-comey-src2', 'bd-20261028-maurene-comey', 'US court rules daughter of Trump critic James Comey was illegally fired', 'https://www.aljazeera.com/news/2026/10/26/us-court-rules-daughter-of-trump-critic-james-comey-was-illegally-fired', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-maurene-comey-ev1', 'bd-20261028-maurene-comey', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-scotus-admin-closure', 'supreme-court-denies-cities-immigration-judges-administrative-closure', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Supreme Court leaves ban on immigration judges'' case pauses in place', 'The justices turned away an emergency request from Baltimore, New Haven, Columbus and an immigrant legal group, with no noted dissents.', 'The Supreme Court on Tuesday declined to restore immigration judges'' ability to temporarily set aside deportation cases, a tool known as administrative closure, Reuters reported.

The court''s one-sentence order gave no explanation, and no justice publicly dissented. It leaves in place a nationwide judgment blocking a 2024 Biden administration rule that allowed the practice while the litigation continues.

## How the case got here

Texas sued over the rule on June 22. The Trump administration agreed the same day that the rule was unlawful, and U.S. District Judge Reed O''Connor in Wichita Falls approved the agreement and blocked the rule nationwide, according to Reuters.

O''Connor later refused to let the cities of Baltimore, New Haven, Conn., and Columbus, Ohio, along with the legal services group Centro Legal de la Raza, join the case. The 5th U.S. Circuit Court of Appeals declined to pause the judgment.

## The arguments

The challengers, represented by Democracy Forward, called the Texas suit "manufactured litigation" and said the deal sidestepped federal rulemaking law, Reuters reported. They told the court the policy helped crime victims and neglected juveniles, according to Newsweek.

The Justice Department urged the justices to reject the request, arguing that the cities lacked standing and had not shown immediate harm, Newsweek reported. Texas and the administration argue that administrative closure works like an amnesty for people without legal status.

Immigration judges have used administrative closure in hundreds of thousands of deportation cases over the years, according to Reuters.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 7, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-scotus-admin-closure-src1', 'bd-20261028-scotus-admin-closure', 'U.S. Supreme Court denies immigration judges the power to shelve deportation cases', 'https://www.spokesman.com/stories/2026/oct/27/us-supreme-court-denies-immigration-judges-the-pow/', 'Reuters (via The Spokesman-Review)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-scotus-admin-closure-src2', 'bd-20261028-scotus-admin-closure', 'Supreme Court Allows Trump to Undo Major Biden-Era Immigration Policy', 'https://www.newsweek.com/supreme-court-trump-biden-immigration-policy-12626637', 'Newsweek', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-scotus-admin-closure-ev1', 'bd-20261028-scotus-admin-closure', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-congress-math', 'one-week-out-democrats-need-three-house-four-senate-seats-control', 'newsroom', 'news_story', 'congress', 'EDITORIAL_REVIEW', 0, 'One week out: Democrats need three House seats and four Senate seats to take control', 'Record ad spending and more than 30 million early votes frame the final stretch before Nov. 3.', 'With the midterm elections a week away, Democrats need a net gain of three House seats and four Senate seats to win majorities in both chambers, ABC News reported.

## The House

All 435 seats are on the ballot Nov. 3. The House has 218 Republicans, 214 Democrats and one independent, Rep. Kevin Kiley of California, who generally sides with the speaker on floor votes. Two seats are vacant after April resignations, according to ABC News.

## The Senate

Thirty-five Senate seats are up: 13 held by Democrats and 22 by Republicans. Republicans hold 53 seats; Democrats hold 45, plus two independents who caucus with them. Republicans can lose three seats and keep control because Vice President JD Vance breaks ties.

| Chamber | Today | Democrats need |
| --- | --- | --- |
| House | 218 R, 214 D, 1 I, 2 vacant | Net gain of 3 |
| Senate | 53 R, 47 D (incl. 2 independents) | Net gain of 4 |

*Source: ABC News.*

## Money and early votes

The 2025-26 cycle is now the most expensive on record. Media tracker AdImpact counted $11.21 billion in ad spending and reservations as of Monday night, just above the $11.20 billion spent in the entire 2023-24 cycle, ABC News reported.

More than 30 million Americans have already voted, Fox News reported.

Speaker Mike Johnson marked three years in the job this week. Republican lawmakers told Fox News he would likely step aside if his party loses the House.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Flickr_-_USCapitol_-_Longworth_House_Office_Building.jpg', 'The Longworth House Office Building on Capitol Hill. Photo: Architect of the Capitol / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-28.sql', 7, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-congress-math-src1', 'bd-20261028-congress-math', 'Control of Congress is up for grabs on Election Day. What''s the math for Democrats and Republicans?', 'https://abcnews.com/Politics/control-congress-grabs-election-day-math-democrats-republicans/story?id=137229697', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-congress-math-src2', 'bd-20261028-congress-math', 'Midterm elections live updates: 1 week until high-stakes elections', 'https://abcnews.com/Politics/live-updates/midterm-elections-2026-1-week-high-stakes-elections/?id=137578278', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-congress-math-src3', 'bd-20261028-congress-math', 'Trump takes campaign blitz to Texas with 7 days before Election Day (live updates, Oct. 27)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-texas-comey-october-27', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-congress-math-ev1', 'bd-20261028-congress-math', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-diesel-prices', 'diesel-6-35-near-record-gas-4-27-aaa', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Diesel sits near its record at $6.35 as gasoline eases to $4.27', 'Regular gas is down about 21 cents from a month ago but still more than $1.20 above last year. Diesel has nearly doubled in a year.', 'Diesel prices remain within 18 cents of an all-time high, even as gasoline continues a slow autumn decline, according to AAA.

The national average for diesel was $6.35 a gallon on Tuesday, AAA data show. The record, $6.53, was set on Sept. 22 of this year. A year ago, diesel averaged $3.66.

Regular gasoline averaged $4.27, down about 2 cents from Monday and about 21 cents from a month ago. It is still about $1.21 higher than a year ago.

| AAA national average | Regular | Diesel |
| --- | --- | --- |
| Tuesday, Oct. 27 | $4.27 | $6.35 |
| Week ago | $4.28 | $6.32 |
| Month ago | $4.48 | $6.47 |
| Year ago | $3.05 | $3.66 |
| Record | $5.02 (June 2022) | $6.53 (Sept. 2026) |

*Source: AAA.*

## What is moving prices

In its Oct. 22 weekly update, AAA said the seasonal switch to winter-blend gasoline, which is cheaper to make, was helping pump prices, while crude oil was nearing $100 a barrel.

Diesel fuels most trucks, trains and farm equipment, so its price affects the cost of moving goods. Fox News noted in its election coverage that diesel was just under its September record, as prices remain a campaign issue one week before the Nov. 3 midterms.

AAA''s next weekly update is due Thursday.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 6, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-diesel-prices-src1', 'bd-20261028-diesel-prices', 'AAA Gas Prices: national averages', 'https://gasprices.aaa.com/?icid=mag_cars', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-diesel-prices-src2', 'bd-20261028-diesel-prices', 'AAA gas prices news, October 2026', 'https://gasprices.aaa.com/2026/10/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-diesel-prices-src3', 'bd-20261028-diesel-prices', 'Trump takes campaign blitz to Texas with 7 days before Election Day (live updates, Oct. 27)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-texas-comey-october-27', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-diesel-prices-ev1', 'bd-20261028-diesel-prices', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-world-series-g4', 'rays-walk-off-brewers-4-3-12-innings-world-series-game-4', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Rays rally in the 12th, walk off the Brewers 4-3 and force World Series Game 5', 'Pinch-hitter Ben Williamson''s grounder scored the winner after Cooper Pratt''s homer had Milwaukee three outs from a sweep. The Brewers lead 3-1.', 'The Tampa Bay Rays avoided a World Series sweep Tuesday night, scoring twice in the bottom of the 12th inning to beat the Milwaukee Brewers 4-3 at Tropicana Field. Milwaukee leads the series 3-1.

Brewers rookie shortstop Cooper Pratt had put Milwaukee ahead with a solo home run off Rays left-hander Ian Seymour in the top of the 12th, MLB.com and ESPN reported.

## The winning rally

In the bottom half, Junior Caminero reached when Brewers third baseman Joey Ortiz made an errant throw, ESPN reported. Caminero aggravated a left foot injury on the play, and Cedric Mullins ran for him. Jonny DeLuca singled in the tying run, and Chandler Simpson''s single loaded the bases. Pinch-hitter Ben Williamson then hit a grounder that bounced into shallow right field, scoring pinch-runner Nick Fortes.

Simpson had also doubled home DeLuca for a 1-0 lead in the second inning, according to MLB.com.

Tampa Bay used 21 players and seven pitchers. Griffin Jax started, and Game 1 starter Nick Martinez threw two scoreless innings in relief, ESPN reported.

## Game 5

| | |
| --- | --- |
| When | Wednesday, 8 p.m. ET |
| Where | Tropicana Field, St. Petersburg, Fla. |
| TV | FOX |
| Series | Brewers lead 3-1 |

*Source: MLB.com.*

The Brewers are one win from the first championship in franchise history. Caminero said he expects to play. Drew Rasmussen is the likely Rays starter for a Game 6, ESPN reported; Tampa Bay''s plan for Game 5 was unclear.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 8, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-world-series-g4-src1', 'bd-20261028-world-series-g4', 'Rays live to fight another day thanks to Williamson''s walk-off single', 'https://www.mlb.com/news/rays-win-world-series-game-4-2026', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-world-series-g4-src2', 'bd-20261028-world-series-g4', 'Rays steal Game 4 from Brewers in extras to stay alive in World Series', 'https://www.espn.com/mlb/story/_/id/50304403/rays-steal-game-4-extras-stay-alive-world-series', 'ESPN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-world-series-g4-ev1', 'bd-20261028-world-series-g4', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-bruins-canes', 'hurricanes-beat-bruins-2-1-aho-kochetkov-8-0', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Kochetkov stays perfect as Hurricanes edge Bruins 2-1 in a meeting of East leaders', 'Sebastian Aho''s third-period goal ended Boston''s eight-game point streak. The Bruins head to St. Louis on Thursday.', 'Sebastian Aho scored midway through the third period, and the Carolina Hurricanes beat the Boston Bruins 2-1 on Tuesday night in Raleigh, ending Boston''s eight-game point streak.

Pavel Zacha gave Boston the lead on a power play 1:31 into the game. Jackson Blake tied it with 52 seconds left in the first period, and Aho scored the winner with 9:41 remaining on a feed from Andrei Svechnikov, according to The Associated Press and the Hurricanes.

## In goal

Pyotr Kochetkov made 14 saves and improved to 8-0-0, tying Frederik Andersen''s franchise record for consecutive wins to open a season, the Hurricanes said. Jeremy Swayman stopped 28 shots for Boston, the AP reported.

Aho''s goal was the 69th game-winner of his career, a Carolina record.

## Standings and schedule

| Team | Record | Points | Next game |
| --- | --- | --- | --- |
| Hurricanes | 10-2-2 | 22 | Thursday vs. Columbus |
| Bruins | 9-3-1 | 19 | Thursday at St. Louis |

*Sources: The Associated Press, Carolina Hurricanes.*

The loss also ended Boston''s two-game winning streak. The Bruins are 4-2-1 on the road.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 6, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-bruins-canes-src1', 'bd-20261028-bruins-canes', 'Recap: Aho''s Late Goal Lifts Canes Past Bruins', 'https://www.nhl.com/hurricanes/news/recap-aho-s-late-goal-lifts-canes-past-bruins', 'Carolina Hurricanes (NHL.com)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-bruins-canes-src2', 'bd-20261028-bruins-canes', 'Hurricanes 2-1 Bruins (Oct 27, 2026) Game Recap', 'https://www.espn.com/nhl/recap/_/gameId/401892586', 'The Associated Press (via ESPN)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-bruins-canes-ev1', 'bd-20261028-bruins-canes', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-celtics-nets', 'tatum-overtime-buzzer-beater-40-points-celtics-beat-nets-125-124', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Tatum hits an overtime buzzer-beater and scores 40 as Celtics edge winless Nets 125-124', 'Boston nearly let it slip twice, at the end of regulation and in overtime, before Tatum''s jumper from the elbow.', 'Jayson Tatum hit a 17-foot jumper from the left elbow as time expired in overtime, giving the Boston Celtics a 125-124 win over the Brooklyn Nets on Tuesday night at TD Garden, The Boston Globe reported. Tatum finished with 40 points and eight assists.

The Celtics were playing the second night of a back-to-back after routing the Chicago Bulls 134-99 on Monday, NBC Sports Boston noted. Boston came in at 2-1; Brooklyn was 0-3.

## How it got to overtime

Boston led by three with four seconds left in regulation. After a chaotic sequence of free throws at both ends, Nets rookie Mikel Brown Jr. hit a 3-pointer from the left corner with 0.2 seconds left to tie the game, the Globe reported.

## Overtime

Two Julius Randle layups and another Brown 3-pointer gave Brooklyn a 124-119 lead with two minutes left. Randle fouled out with 1:02 to play, and two Celtics free throws cut the lead to one. Boston regained the ball after a replay challenge, and Tatum hit the winner.

Michael Porter Jr. led Brooklyn with 27 points. The Nets made 17 of 50 3-point attempts, according to the Globe.

| | |
| --- | --- |
| Final | Celtics 125, Nets 124 (OT) |
| Tatum | 40 points, 8 assists |
| Nets leader | Porter Jr., 27 points |
| Nets 3-pointers | 17 of 50 |

*Sources: The Boston Globe, NBC Sports Boston.*', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 6, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-celtics-nets-src1', 'bd-20261028-celtics-nets', 'The Celtics made a mess of it, but Jayson Tatum''s OT buzzer beater made it a winning night over the Nets', 'https://www.bostonglobe.com/2026/10/27/sports/nba-celtics-nets-game-score/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-celtics-nets-src2', 'bd-20261028-celtics-nets', 'Celtics-Nets recap: Jayson Tatum drills the game-winner in overtime', 'https://www.nbcsportsboston.com/nba/boston-celtics/live-updates-nets-highlights-score-news/809669/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-celtics-nets-ev1', 'bd-20261028-celtics-nets', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261028-patriots-dolphins', 'patriots-4-3-at-dolphins-1-5-week-8-preview', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Patriots, 4-3 after the loss in Chicago, visit the 1-5 Dolphins on Sunday', 'New England is a 7.5-point favorite at Hard Rock Stadium after its three-game winning streak ended on Thursday night.', 'The New England Patriots head to Miami on Sunday looking to rebound from a 30-24 Thursday night loss to the Chicago Bears that ended a three-game winning streak, according to Sports Illustrated.

## The matchup

| | |
| --- | --- |
| Kickoff | Sunday, Nov. 1, 4:25 p.m. ET |
| Site | Hard Rock Stadium |
| TV | CBS |
| Records | Patriots 4-3, Dolphins 1-5 |
| Line | Patriots by 7.5 (DraftKings) |

*Source: Sports Illustrated.*

New England is 2-0 in the AFC East and trails Buffalo in the division, Roundtable Sports reported.

## Miami''s first win

The Dolphins earned their first victory last week, 28-25 over the New York Jets. Quarterback Malik Willis completed 14 of 21 passes for 208 yards without an interception, and Ollie Gordon II ran for 103 yards, according to Roundtable.

## Injuries

Cornerbacks Karon Prunty, Channing Canada and Carlton Davis III and center Ben Brown are listed as questionable for New England, and guard Alijah Vera-Tucker is on injured reserve, Sports Illustrated reported. Miami running back De''Von Achane is also on injured reserve.

## Rookies to watch

Caleb Lomu has allowed three pressures and no sacks in 160 snaps, and Eli Raridon has two touchdown catches and has become a favorite target of quarterback Drake Maye, Roundtable reported.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-28.sql', 5, 0, 'newsroom-assistant', '2026-10-28T10:30:00.000Z', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-patriots-dolphins-src1', 'bd-20261028-patriots-dolphins', 'Patriots vs. Dolphins Prediction, Odds, Spread, Injuries, Trends for NFL Week 8', 'https://www.si.com/betting/patriots-vs-dolphins-prediction-odds-spread-injuries-trends-for-nfl-week-8-2026', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261028-patriots-dolphins-src2', 'bd-20261028-patriots-dolphins', 'Monday Morning Game Notes: Patriots Shift Focus to Dolphins After Thursday Night Loss', 'https://sports.yahoo.com/articles/monday-morning-game-notes-patriots-130041464.html', 'Roundtable Sports (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-28T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-28. Editor to confirm.', 'newsroom-assistant', '2026-10-28T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261028-patriots-dolphins-ev1', 'bd-20261028-patriots-dolphins', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-28T10:30:00.000Z');
