-- Newsroom drafts for 2026-10-21. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain (government / Library of Congress origin) with credit; drafts without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-nc-senate', 'trump-greenville-rally-whatley-cooper-nc-senate', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump rallies for Whatley in Greenville as Cooper holds wide poll and cash leads', 'The president pitched $5,000 checks and a chip investment in eastern North Carolina, two weeks before Election Day in one of the Senate races that could decide control of the chamber.', 'President Donald Trump rallied Republicans in Greenville, N.C., on Tuesday night, urging voters to back Michael Whatley over Democrat Roy Cooper in the state''s open U.S. Senate race, two weeks before the Nov. 3 election.

It was Trump''s second North Carolina rally in about two months, following a Sept. 16 stop in Gastonia, WRAL News reported. Vice President JD Vance campaigned with Whatley in Hendersonville a day earlier.

## What Trump said

Trump called Cooper, a former two-term governor, a liberal and waved off recent surveys as fake polls, according to WRAL. He repeated his promise of $5,000 payments to Americans if Republicans keep Congress.

He also said the Department of War would invest $1.5 billion in semiconductor production in North Carolina, Fox News reported. Commerce Secretary Howard Lutnick said quartz supplier Sibelco plans to invest hundreds of millions of dollars in the state.

## Democrats respond

Gov. Josh Stein, campaigning for legislative candidates in the east, blamed tariffs and the Iran war for higher costs, WRAL reported.

## The race by the numbers

| Measure | Figure |
| --- | --- |
| Elon Poll, Senate | Cooper +13 |
| Trump approval (WRAL/WSOC poll) | 37% |
| Trump approval (Elon Poll) | 34% |
| Cooper cash on hand, end of Sept. | about $12.5 million |
| Whatley cash on hand, end of Sept. | $916,000 |
| Share of early ballots through Oct. 18 | 46% Democrats, about 20% Republicans, about 35% unaffiliated |

Source: WRAL News

Whatley has suspended campaign-funded TV ads, and Republican groups have shifted ad money away from the race, WRAL reported. Democratic early voting is running about 53% above the 2022 midterm pace, while Republican early voting is down about 7%.

In northeastern North Carolina, WRAL described the House race between Democratic Rep. Don Davis and Republican Laurie Buckhout as a dead heat.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-21.sql', 9, 1, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-nc-senate-src1', 'bd-20261021-nc-senate', 'Trump''s NC trip is meant to help GOP candidates. Top Democrat has a message for him', 'https://www.wral.com/news/nccapitol/trump-gop-candidate-democrat-greenville-october-20/', 'WRAL News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-nc-senate-src2', 'bd-20261021-nc-senate', 'Trump campaigns in key battleground of North Carolina for 2026 midterms (live updates, Oct. 20)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-north-carolina-early-voting-october-20', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-nc-senate-ev1', 'bd-20261021-nc-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-early-vote', 'georgia-one-million-early-votes-record-turnout-midterms', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Georgia passes 1 million early votes as midterm turnout runs ahead of 2022', 'Early voting is up 12% from the last midterm in Georgia, and Texas and North Carolina are also seeing heavy early turnout.', 'More than 1 million Georgians had voted early in person by noon Tuesday, the secretary of state''s office said, running well ahead of the pace set in the 2022 midterms.

The state counted 1,007,015 in-person early votes, up 12% from 894,412 at the same point four years ago. With 48,916 accepted absentee ballots, total turnout reached 1,055,931.

"We continue to break records each day of early voting," Secretary of State Brad Raffensperger said. Early voting in Georgia runs through Oct. 30. Election Day is Tuesday, Nov. 3.

## Elsewhere

- **Texas:** More than 812,000 Texans had voted, Fox News reported. Data analyst Derek Ryan found first-day turnout ran more than 20% above 2022.
- **North Carolina:** Through Oct. 18, Democrats cast 46% of early ballots, Republicans about 20% and unaffiliated voters about 35%, WRAL News reported.
- **New states:** In-person early voting opened Tuesday in Hawaii, Louisiana, Utah and Wisconsin, according to Fox News.

## Georgia at a glance

| | 2026 | 2022 (same point) |
| --- | --- | --- |
| In-person early votes | 1,007,015 | 894,412 |
| Accepted absentee ballots | 48,916 | n/a |
| Total turnout | 1,055,931 | n/a |

Source: Georgia Secretary of State, as of noon Oct. 20

Early turnout alone does not predict results. The Nov. 3 elections will decide control of the House and Senate.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-21.sql', 8, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-early-vote-src1', 'bd-20261021-early-vote', 'Georgia Surpasses One Million Early Votes', 'https://sos.ga.gov/news/georgia-surpasses-one-million-early-votes', 'Georgia Secretary of State', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-early-vote-src2', 'bd-20261021-early-vote', 'Trump campaigns in key battleground of North Carolina for 2026 midterms (live updates, Oct. 20)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-north-carolina-early-voting-october-20', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-early-vote-src3', 'bd-20261021-early-vote', 'Trump''s NC trip is meant to help GOP candidates. Top Democrat has a message for him', 'https://www.wral.com/news/nccapitol/trump-gop-candidate-democrat-greenville-october-20/', 'WRAL News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-early-vote-ev1', 'bd-20261021-early-vote', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-5000-checks', 'trump-5000-checks-promise-cost-congress-explainer', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump keeps promising $5,000 checks. Here is what it would take', 'The payments would cost more than $1 trillion and need an act of Congress. The White House says trade and investment deals would pay for them.', 'President Donald Trump is closing out the midterm campaign with a recurring promise: $5,000 for Americans if Republicans keep control of both the House and the Senate on Nov. 3. He repeated it at a rally in Greenville, N.C., on Tuesday, WRAL News reported.

Trump first made the pledge on Sept. 9 at the Republican Midterm Convention in Dallas, calling it the "Trump dividend," PBS News reported.

## The cost

Trump has acknowledged the payments would cost more than $1 trillion, The Associated Press reported. PBS estimated about $1.2 trillion, based on roughly 245 million adult U.S. citizens.

## Who would pay

The White House says the money would come from trade deals, foreign investment commitments, government stakes in private companies, and oil and mineral deals, according to the AP. Vice President JD Vance earlier told Fox News some funds would come from tariff revenue, PBS reported.

Any payment would need Congress. Sen. Bernie Moreno, R-Ohio, has said he would introduce a bill after the election.

## Doubts

Earlier promised payments, including $2,000 tariff dividends and refunds tied to Department of Government Efficiency savings, never arrived, both outlets noted. When the AP asked whether the administration had modeled the economic effects, White House economic adviser Christopher Phelan declined to answer.

In an AP-NORC poll in September, about half of registered voters said Trump does not keep his promises.

Meanwhile, the administration is sending smaller sums before the election: $90 to about 20 million Medicare enrollees and $500 "rebates" for people it says overpaid for Affordable Care Act plans, the AP reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Obverse_of_the_series_2009_%24100_Federal_Reserve_Note.jpg', 'Image: U.S. Bureau of Engraving and Printing / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-21.sql', 7, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-5000-checks-src1', 'bd-20261021-5000-checks', 'Even some of Trump''s devoted fans doubt his promised $5,000 checks will ever arrive', 'https://fortune.com/2026/10/20/trump-5000-checks-midterms-supporters-doubt/', 'The Associated Press (via Fortune)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-5000-checks-src2', 'bd-20261021-5000-checks', 'Trump promised $5,000 checks if Republicans win the midterms. How would that work?', 'https://www.pbs.org/newshour/politics/trump-promised-5000-checks-if-republicans-win-the-midterms-how-would-that-work', 'PBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-5000-checks-src3', 'bd-20261021-5000-checks', 'Trump''s NC trip is meant to help GOP candidates. Top Democrat has a message for him', 'https://www.wral.com/news/nccapitol/trump-gop-candidate-democrat-greenville-october-20/', 'WRAL News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-5000-checks-ev1', 'bd-20261021-5000-checks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-prices', 'gas-prices-inflation-september-cpi-before-midterms', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Gas slips to $4.28, but inflation is at 3.7% in the last price report before Election Day', 'Federal data show consumer prices rose 0.6% in September alone, led by gasoline, which costs about a third more than a year ago.', 'The national average for a gallon of regular gasoline slipped to about $4.28 on Tuesday, according to AAA, down from $4.33 a week earlier. Drivers are still paying far more than they did a year ago.

## The inflation picture

The latest consumer price report from the Bureau of Labor Statistics, covering September, showed prices up 3.7% over the past year. Prices rose 0.6% in September alone, after seasonal adjustment.

Gasoline stood out. The agency said gas prices rose 34.2% in the 12 months through September.

Excluding volatile food and energy costs, so-called core prices rose 0.3% for the month and 2.6% over the year.

The next report, for October, is due Nov. 10, a week after the midterm elections. That makes September''s numbers the last official inflation reading voters will see before they cast ballots.

## At the pump

AAA said on Oct. 15 that the national average had stayed above $4 since late July and was more than a dollar higher than a year earlier. Crude oil was again nearing $100 a barrel, the auto club said.

| Measure | Latest |
| --- | --- |
| Regular gas, national average (Oct. 20) | $4.28 |
| Regular gas, national average (Oct. 15) | $4.33 |
| Consumer prices, 12 months to Sept. | +3.7% |
| Consumer prices, Sept. (monthly) | +0.6% |
| Core prices, 12 months to Sept. | +2.6% |
| Gasoline, 12 months to Sept. | +34.2% |
| Public EV charging (Oct. 15) | 41 cents per kWh |

Sources: AAA; Bureau of Labor Statistics', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-21.sql', 7, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-prices-src1', 'bd-20261021-prices', 'Consumer Price Index: September 2026', 'https://www.bls.gov/cpi/', 'U.S. Bureau of Labor Statistics', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-prices-src2', 'bd-20261021-prices', 'AAA Gas Prices: October 2026 updates and national average', 'https://gasprices.aaa.com/2026/10/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-prices-src3', 'bd-20261021-prices', 'Gas Prices Not Budging Much as Crude Oil Remains High', 'https://newsroom.aaa.com/2026/10/gas-prices-not-budging-much-as-crude-oil-remains-high/', 'AAA Newsroom', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-prices-ev1', 'bd-20261021-prices', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-scotus-orders', 'supreme-court-home-distilling-ban-wilcox-nlrb-firing', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Supreme Court takes up home-distilling ban and lets NLRB member''s firing stand', 'Monday''s orders added an 1860s liquor law and a school admissions dispute to the docket, and left Gwynne Wilcox''s removal in place.', 'The Supreme Court agreed Monday to decide whether the federal government can keep banning people from distilling spirits at home, and it turned away a challenge to President Donald Trump''s firing of a National Labor Relations Board member.

## Home distilling

The justices granted the Justice Department''s appeal in *Department of Justice v. McNutt*, according to the court''s order list.

The ban dates to the 1860s, and appeals courts have split over it, according to a case summary by the law firm Dorsey & Whitney. The Fifth Circuit struck the law down, while the Sixth Circuit upheld it. The question is whether the ban is a necessary and proper way for Congress to carry out its power to collect taxes.

## Wilcox firing stands

The court denied review in *Wilcox v. Trump*, with no noted dissent. Gwynne Wilcox, reappointed to the NLRB by President Joe Biden in 2023, challenged her removal.

A federal judge sided with Wilcox in March 2025, but the D.C. Circuit reversed that ruling 2-1 in December, Reuters reported. In June, the Supreme Court upheld Trump''s firing of Federal Trade Commission member Rebecca Slaughter and overturned its 1935 *Humphrey''s Executor* precedent, which had let Congress shield some agency officials from removal.

## Also on the list

| Case | Action |
| --- | --- |
| Assn. for Education Fairness v. Montgomery County Board of Education | Granted, limited to one question |
| BMG Rights Management v. Vetter | Lower ruling affirmed; court lacked a quorum |
| O''Donnell v. City of Chicago | Denied, with a statement by Justice Sotomayor |

Source: Supreme Court order list, Oct. 19

The Montgomery County case asks whether challengers to a race-neutral admissions policy must show the targeted group was harmed overall. It involves a magnet middle school lottery in Maryland that a group says disadvantages Asian American students, according to Dorsey & Whitney.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/b/b8/SUPREME_COURT,_U.S._HUGHES_COURT_LCCN2016861500.jpg', 'The Hughes Court, which decided Humphrey''s Executor in 1935. Photo: Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-21.sql', 7, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-scotus-orders-src1', 'bd-20261021-scotus-orders', 'Order List, Monday, October 19, 2026', 'https://www.supremecourt.gov/orders/courtorders/101926zor_q8l1.pdf', 'Supreme Court of the United States', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-scotus-orders-src2', 'bd-20261021-scotus-orders', 'U.S. Supreme Court will not review Trump''s firing of labor board member', 'https://valawyersweekly.com/2026/10/20/supreme-court-declines-trump-firing-nlrb-member/', 'Reuters (via Virginia Lawyers Weekly)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-scotus-orders-src3', 'bd-20261021-scotus-orders', 'The Supreme Court Update: October 19, 2026', 'https://www.dorsey.com/insights/the-supreme-court-update-october-19-2026', 'Dorsey & Whitney', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-scotus-orders-ev1', 'bd-20261021-scotus-orders', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-celtics-pistons', 'pistons-beat-celtics-121-113-paul-george-38-debut', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Pistons erase a 22-point hole and spoil Paul George''s 38-point Celtics debut', 'Boston led big early in the third quarter in Detroit, then was outscored 76-55 after halftime. The home opener against the Knicks is Friday.', 'Paul George could hardly have scripted a better first night in green. The rest of the Celtics'' season opener got away from them.

The Detroit Pistons rallied from 22 points down to beat Boston 121-113 on Tuesday afternoon at Little Caesars Arena.

## How it slipped away

George hit three 3-pointers in less than a minute early in the third quarter to push Boston''s lead to 22, NBC Sports Boston reported. Detroit then outscored the Celtics 76-55 after halftime, including 39-25 in the fourth quarter, when a long Pistons run turned the game.

George finished with 38 points on 12-of-21 shooting, 7 of 12 from 3-point range, plus five steals. It was the most points by a player in a Celtics debut, according to NBC Sports Boston and Boston.com.

Jayson Tatum had 13 points and 11 assists but shot 6 of 23 and missed all seven of his 3-point tries. Derrick White and Payton Pritchard each scored 17.

For Detroit, Cade Cunningham and Jalen Duren had 22 points apiece, Duncan Robinson added 21 and Javonte Green scored 19 off the bench.

## Box score

| | 1st | 2nd | 3rd | 4th | Final |
| --- | --- | --- | --- | --- | --- |
| Celtics | 28 | 30 | 30 | 25 | 113 |
| Pistons | 27 | 18 | 37 | 39 | 121 |

Source: Sports Illustrated scoreboard

## Up next

| Date | Opponent | Time (ET) |
| --- | --- | --- |
| Fri., Oct. 23 | New York Knicks (home opener) | 7 p.m. |
| Mon., Oct. 26 | Chicago Bulls | 7:30 p.m. |
| Tue., Oct. 27 | Brooklyn Nets | 7:30 p.m. |

Source: Boston.com', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-21.sql', 6, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-celtics-pistons-src1', 'bd-20261021-celtics-pistons', 'Celtics vs. Pistons, Oct. 20, 2026: scoreboard and box score', 'https://www.si.com/nba/scoreboard/celtics-vs-pistons-10-20-2026-1491', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-celtics-pistons-src2', 'bd-20261021-celtics-pistons', 'Celtics-Pistons recap: C''s fall apart late, spoil Paul George''s strong debut', 'https://www.nbcsportsboston.com/nba/boston-celtics/live-updates-celtics-pistons-highlights-video-jayson-tatum/808480/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-celtics-pistons-src3', 'bd-20261021-celtics-pistons', 'Celtics fall apart in season opener, lose to Pistons despite big Paul George debut: 8 takeaways', 'https://www.boston.com/sports/boston-celtics/2026/10/20/celtics-fall-apart-in-season-opener-lose-to-pistons-despite-big-paul-george-debut-8-takeaways/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-celtics-pistons-ev1', 'bd-20261021-celtics-pistons', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-bruins-stars', 'rantanen-overtime-hat-trick-stars-end-bruins-win-streak', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Rantanen''s overtime hat trick ends the Bruins'' five-game winning streak', 'Boston led twice in Dallas but fell 3-2 on a power-play goal in overtime, finishing its road trip 3-0-1. Nashville visits TD Garden on Thursday.', 'Mikko Rantanen scored all three Dallas goals, including a power-play winner 3:52 into overtime, as the Stars beat the Bruins 3-2 on Tuesday night and snapped Boston''s five-game winning streak.

The Bruins still earned a point and finished their four-game road trip at 3-0-1. They are 7-2-1. Dallas improved to 5-3-1 with its third straight win, according to NHL.com.

## How it happened

Matthew Poitras put Boston ahead 2:09 into the game. Rantanen tied it early in the second period, and James Hagens restored the Bruins'' lead at 7:30 of the second.

Rantanen tied it again midway through the third when Roope Hintz''s shot deflected in off a block, then won it in overtime off a Miro Heiskanen assist.

It was Rantanen''s 11th career hat trick, NHL.com reported.

Jeremy Swayman made 22 saves for Boston. Jake Oettinger stopped 18 for Dallas, which managed only two shots on goal in the third period. The Bruins blocked 22 shots to Dallas''s 13.

## Scoring summary

| Period | Team | Goal | Time |
| --- | --- | --- | --- |
| 1st | BOS | Matthew Poitras (Frederic Brunet) | 2:09 |
| 2nd | DAL | Mikko Rantanen | 2:50 |
| 2nd | BOS | James Hagens (Casey Mittelstadt) | 7:30 |
| 3rd | DAL | Mikko Rantanen | 13:38 |
| OT | DAL | Mikko Rantanen (Miro Heiskanen), power play | 3:52 |

Source: NHL.com

## Up next

The Bruins return home to face the Nashville Predators on Thursday at 7 p.m., the team''s Hockey Fights Cancer night, according to the Bruins, NESN and the Portland Press Herald.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Dallas_City_Hall,_Dallas,_Texas_LCCN2015630778.tif/lossy-page1-1280px-Dallas_City_Hall,_Dallas,_Texas_LCCN2015630778.tif.jpg', 'Dallas City Hall. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-21.sql', 6, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-bruins-stars-src1', 'bd-20261021-bruins-stars', 'Rantanen caps hat trick with OT goal, lifts Stars past Bruins', 'https://www.nhl.com/news/boston-bruins-dallas-stars-game-recap-october-20-2026', 'NHL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-bruins-stars-src2', 'bd-20261021-bruins-stars', 'Need to Know: Bruins at Stars', 'https://www.nhl.com/bruins/news/need-to-know-bruins-at-stars-x7872', 'Boston Bruins', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-bruins-stars-src3', 'bd-20261021-bruins-stars', 'Bruins vs. Stars: score, updates and highlights', 'https://nesn.com/boston-bruins/news/bruins-vs-stars-score-updates-highlights-nhl-game/247afd4b79c8497721eea936', 'NESN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-bruins-stars-src4', 'bd-20261021-bruins-stars', 'Bruins'' 5-game winning streak snapped in overtime', 'https://www.pressherald.com/2026/10/20/bruins-5-game-winning-streak-snapped-in-overtime/', 'Portland Press Herald (The Associated Press)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-bruins-stars-ev1', 'bd-20261021-bruins-stars', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-world-series', 'world-series-2026-brewers-rays-schedule-game-1-preview', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Brewers vs. Rays: World Series schedule and what to know before Friday''s Game 1', 'The majors'' winningest team meets the American League''s top seed, and a first-time champion is guaranteed. Milwaukee has home-field advantage.', 'One of them will win a World Series for the first time. The Milwaukee Brewers and Tampa Bay Rays open the Fall Classic on Friday night in Milwaukee.

## How they got here

The Brewers won a franchise-record 103 games, the most in the majors for a second straight season, according to MLB.com. They beat San Diego in four games in the Division Series, then swept the two-time defending champion Los Angeles Dodgers in the NL Championship Series.

The Rays won 98 games, the most in the American League, and earned a first-round bye. They swept the New York Yankees in the Division Series and beat Cleveland in six games for the pennant.

Milwaukee won two of three games when the teams met in late March and early April.

## History

The Brewers'' only previous World Series trip was in 1982, a loss to St. Louis, Fox Sports noted. The Rays reached the Series in 2008 and 2020 but have never won it.

## Aces

Milwaukee''s Jacob Misiorowski went 16-5 with a 1.80 ERA and 250 strikeouts this season, according to Fox Sports. Tampa Bay''s Drew Rasmussen went 16-5 with a 2.67 ERA. MLB.com had not listed Game 1 starters as of Wednesday morning.

## Schedule

| Game | Date | Matchup | Time (ET) |
| --- | --- | --- | --- |
| 1 | Fri., Oct. 23 | Rays at Brewers | 8 p.m. |
| 2 | Sat., Oct. 24 | Rays at Brewers | 8 p.m. |
| 3 | Mon., Oct. 26 | Brewers at Rays | 8 p.m. |
| 4 | Tue., Oct. 27 | Brewers at Rays | 8 p.m. |
| 5* | Wed., Oct. 28 | Brewers at Rays | 8 p.m. |
| 6* | Fri., Oct. 30 | Rays at Brewers | 8 p.m. |
| 7* | Sat., Oct. 31 | Rays at Brewers | 8 p.m. |

*If necessary. All games on FOX. Source: MLB.com', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/25/Panoramic_view_of_Milwaukee,_Wis._Taken_from_City_Hall_tower_-_-_The_Gugler_Lithographic_Co._LCCN98508658.jpg', 'Milwaukee, Game 1 host city, in a historic panorama from City Hall tower. Image: The Gugler Lithographic Co. / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-21.sql', 6, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-world-series-src1', 'bd-20261021-world-series', '2026 MLB World Series FAQ: Schedule, times, teams and more', 'https://www.mlb.com/news/2026-mlb-world-series-faq-schedule-times-teams-and-more', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-world-series-src2', 'bd-20261021-world-series', '2026 World Series Schedule: How To Watch Brewers vs. Rays On FOX', 'https://www.foxsports.com/stories/mlb/2026-world-series-schedule-how-watch-brewers-vs-rays-fox', 'Fox Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-world-series-ev1', 'bd-20261021-world-series', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261021-pats-injuries', 'patriots-bears-injury-report-guards-vera-tucker-brown', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Patriots likely without both starting guards for Thursday night in Chicago', 'Ben Brown and Alijah Vera-Tucker missed practice again, Romeo Doubs is on injured reserve, and Drake Maye was a full participant.', 'The Patriots appear headed to Chicago without both of their starting guards.

Ben Brown (knee) and Alijah Vera-Tucker (hamstring) did not practice Monday or Tuesday, according to the team''s injury report, and Field Level Media reported both are unlikely to play Thursday. Both were hurt in Sunday''s 26-19 win over the Jets.

New England also placed receiver Romeo Doubs on injured reserve with a shoulder injury, Field Level Media reported.

## Some good news

Cornerback Carlton Davis III returned to practice on a limited basis after missing two games with a neck injury. Quarterback Drake Maye, listed with a right shoulder issue, was a full participant both days, as were running back TreVeyon Henderson and tackle Will Campbell.

Both teams are 4-2.

## Key Patriots on the report

| Player | Pos. | Injury | Mon. | Tue. |
| --- | --- | --- | --- | --- |
| Ben Brown | OL | Knee | DNP | DNP |
| Alijah Vera-Tucker | G | Hamstring | DNP | DNP |
| Joshua Farmer | DT | Personal | DNP | DNP |
| Carlton Davis III | CB | Neck | DNP | Limited |
| A.J. Brown | WR | Ankle | Limited | Limited |
| Morgan Moses | T | Foot | Limited | Limited |
| Drake Maye | QB | Right shoulder | Full | Full |

Monday was a walkthrough, so participation is estimated. Source: Patriots.com

## The Bears'' side

Chicago linebackers T.J. Edwards (hamstring) and Jack Sanborn (concussion) and running back Kyle Monangai (thumb, toe) did not practice Tuesday, the Patriots'' report shows. Guard Jonah Jackson moved up to limited.

Bears quarterback Caleb Williams returned from a hamstring injury in last week''s win over Atlanta, Field Level Media noted.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Military_service_members_honored_during_Chicago_Bears_game_141116-A-TI382-323.jpg', 'Service members honored on the field at Soldier Field, 2014. Photo: U.S. Army / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-21.sql', 5, 0, 'newsroom-assistant', '2026-10-21T10:30:00.000Z', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-pats-injuries-src1', 'bd-20261021-pats-injuries', 'Week 7 Injury Report: Patriots at Bears', 'https://www.patriots.com/news/week-7-injury-report-patriots-at-bears', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261021-pats-injuries-src2', 'bd-20261021-pats-injuries', 'Patriots likely without starting guards Thursday against Bears', 'https://fieldlevelmedia.com/nfl/patriots-likely-without-starting-guards-thursday-against-bears/', 'Field Level Media', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-21T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-21. Editor to confirm.', 'newsroom-assistant', '2026-10-21T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261021-pats-injuries-ev1', 'bd-20261021-pats-injuries', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-21T10:30:00.000Z');
