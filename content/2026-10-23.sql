-- Newsroom drafts for 2026-10-23. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain (Library of Congress origin) with credit; drafts without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-maine-senate', 'maine-senate-collins-jackson-tied-fox-poll', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Collins and Jackson tied at 49% in Maine as early voters break toward the Democrat', 'A new Fox News poll shows the five-term Republican senator in a dead heat with former state Senate President Troy Jackson 11 days before Election Day.', 'Republican Sen. Susan Collins and Democrat Troy Jackson are tied at 49% each in a new Fox News poll of Maine''s U.S. Senate race, with Election Day on Nov. 3.

Collins is seeking a sixth term. Jackson, a former logger, is a past president of the Maine Senate, according to The Associated Press.

## Who is already voting

About one in five Maine voters in the survey said they had already cast a ballot, and that group favors Jackson by 40 points, according to Fox News. Voters who plan to vote on Election Day favor Collins by 12.

Fox News noted that Collins is the only Republican senator on the ballot this year in a state President Donald Trump lost in 2024. In the same poll, 37% of Maine voters approve of Trump''s job performance and 62% disapprove. Asked which party they want running the Senate, 53% chose Democrats and 45% Republicans.

## The rest of the ballot

| Race | Result |
| --- | --- |
| Senate | Collins (R) 49%, Jackson (D) 49% |
| Governor | Hannah Pingree (D) 49%, Bobby Charles (R) 39%, Rick Bennett (I) 9% |

The poll of 1,689 registered voters, including 1,514 likely voters, was taken Oct. 16 to 20 by Beacon Research and Shaw & Company Research. Fox News reported a margin of error of plus or minus 2 points for registered voters and 2.5 points for likely voters.

## A sharp final debate

The candidates met for their last debate on Oct. 15 in Bangor. After a protester interrupted Collins and she suggested the person backed her rival, Jackson told her to "shut up," the AP reported. Jackson later said he did not regret the remark. The protester told The New York Times there had been no coordination with Jackson''s campaign, according to the AP.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-23.sql', 9, 1, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-maine-senate-src1', 'bd-20261023-maine-senate', 'Fox News Poll: Nail-biter in Maine Senate race', 'https://www.foxnews.com/politics/fox-news-poll-nail-biter-maine-senate-race', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-maine-senate-src2', 'bd-20261023-maine-senate', 'Jackson doesn''t regret telling Collins to ''shut up'' after protester interrupted Maine Senate debate', 'https://www.pbs.org/newshour/politics/jackson-doesnt-regret-telling-collins-to-shut-up-after-protester-interrupted-maine-senate-debate', 'The Associated Press (via PBS NewsHour)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-dpa-oil', 'trump-defense-production-act-oil-refining-gas-prices', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump invokes Defense Production Act to expand oil production and refining', 'The White House order lets the Pentagon finance pipelines, storage and refinery capacity as gas averages $4.27 a gallon less than two weeks before the midterms.', 'President Donald Trump on Thursday invoked the Defense Production Act to boost U.S. oil production, refining and fuel logistics, declaring that capacity essential to national defense.

## What the order does

The presidential determination, published by the White House on Oct. 22, finds that private industry cannot expand the capacity quickly enough on its own. It cites tight financing, long lead times, permitting delays and supply-chain limits.

It directs the Secretary of War to use purchases, purchase commitments and other financial tools to support projects in four areas:

- Exploration and production
- Gathering and transmission pipelines
- Storage
- Marine terminals

The order waives several of the Cold War-era law''s usual requirements and ties the action to the national energy emergency Trump declared on Jan. 20, 2025.

Vice President JD Vance said the administration plans to use the law to expand the Delek US Holdings refinery in Tyler, Texas, NTD News reported.

## Prices at the pump

The national average for regular gasoline stood at $4.27 a gallon on Oct. 22, according to AAA. NTD, citing AAA, put average diesel at $6.30. Oil prices have climbed since the war with Iran began in February, NTD reported.

Early Friday, Brent crude futures traded near $113 a barrel and U.S. crude near $99, close to their highest levels since early May, Investing.com reported. Both were up about 3% for the week.

On Truth Social, Trump accused Iran of trying to push oil prices higher before the Nov. 3 midterm elections, according to NTD. Energy costs and inflation are among the top issues for voters this fall.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/d/dc/Texas_oil_wells%3B_Texas_Chief_gusher_LCCN2016648042.jpg', 'The Texas Chief gusher in an early 20th-century Texas oil field. Photo: Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-23.sql', 8, 0, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-dpa-oil-src1', 'bd-20261023-dpa-oil', 'Presidential Determination Pursuant to Section 303 of the Defense Production Act of 1950, as Amended, on Domestic Petroleum Production, Refining, and Logistics Capacity', 'https://www.whitehouse.gov/presidential-actions/2026/10/presidential-determination-pursuant-to-section-303-of-the-defense-production-act-of-1950-as-amended-on-domestic-petroleum-production-refining-and-logistics-capacity-c139/', 'The White House', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-dpa-oil-src2', 'bd-20261023-dpa-oil', 'AAA Gas Prices (national average as of 10/22/26)', 'https://gasprices.aaa.com/pump-prices-remain-at-record-highs-for-autumn/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-dpa-oil-src3', 'bd-20261023-dpa-oil', 'Trump Invokes Defense Production Act to Increase Petroleum Production', 'https://www.ntd.com/trump-invokes-defense-production-act-to-increase-petroleum-production_1180785.html', 'NTD News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-dpa-oil-src4', 'bd-20261023-dpa-oil', 'Oil prices cool from 5-month highs as Trump invokes defense production act', 'https://www.investing.com/news/commodities-news/oil-prices-cool-from-5month-highs-as-trump-invokes-defense-production-act-4967880', 'Investing.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-scotus-midterms', 'supreme-court-rulings-shape-2026-midterms', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'How the Supreme Court has shaped the midterm map, from voting rights to Missouri', 'Rulings this year have mostly helped Republicans, a Reuters review finds, though the justices also sided with Democrats on mail ballots and Missouri''s map.', 'Voters head into the Nov. 3 midterms after an election season shaped heavily by the Supreme Court, and Republicans have generally fared better in the major cases, according to a Reuters analysis.

Democrats need a net gain of four seats in each chamber to take control of the House and Senate, Reuters noted.

## Rulings that helped Republicans

| When | Decision |
| --- | --- |
| April | Weakened a key part of the Voting Rights Act, making racial challenges to maps harder |
| June | Struck down federal limits on party spending coordinated with candidates |
| October | Let stand a Trump administration policy giving parties discounted broadcast ad rates |

The court also allowed Texas to use its new Republican-drawn House map, which the state adopted at Trump''s urging, Reuters reported.

## Rulings that went the other way

The justices endorsed grace periods for mail ballots in June and in September turned away a Trump-backed effort to restrict mail voting, according to Reuters. They also allowed California''s new Democratic-leaning map.

On Sept. 25, the court again blocked Missouri''s Republican-drawn map, which would have favored the GOP in seven of the state''s eight House districts, CBS News reported. The unsigned order had no noted dissents. Missouri will use its 2022 district lines because ballots had already been printed and mailed.

## Sharp words from the bench

Justice Elena Kagan, speaking at Catholic University, said the conservative majority was making "a too-polarized country even more so," Reuters reported. University of Illinois Chicago law professor Steve Schwinn told Reuters the rulings had "decidedly tilted the political playing field." George Mason University''s Ilya Somin said many reflected long-held conservative legal priorities and predicted more election litigation.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/9/97/SUPREME_COURT,_U.S._TAFT_COURT_LCCN2016861489.jpg', 'The U.S. Supreme Court under Chief Justice William Howard Taft, an archival group portrait. Photo: Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-23.sql', 7, 0, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-scotus-midterms-src1', 'bd-20261023-scotus-midterms', 'US Supreme Court rulings reshape midterm election battlefield (Reuters)', 'https://www.taylorvilledailynews.com/us-supreme-court-rulings-reshape-midterm-election-battlefield/', 'Reuters (via Taylorville Daily News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-scotus-midterms-src2', 'bd-20261023-scotus-midterms', 'Supreme Court again blocks Missouri from using redrawn congressional map', 'https://cbsnews.com/news/supreme-court-missouri-map', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-usda-fertilizer', 'usda-fields-fertilizer-plants-573-million', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'USDA picks eight fertilizer plants for $573 million to cut reliance on a few suppliers', 'Vance and Agriculture Secretary Brooke Rollins say the projects would add about 1.08 million tons of yearly U.S. capacity once built.', 'The U.S. Department of Agriculture has selected eight fertilizer manufacturing projects to share about $573 million in proposed federal funding, Vice President JD Vance and Agriculture Secretary Brooke Rollins announced Thursday.

The projects carry more than $1.34 billion in total proposed investment, according to USDA. The money comes through a new program called FIELDS, short for Fertilizer Investment & Expansion for Long-Term Domestic Supply. USDA said it is also redirecting unused money from projects under an earlier program created during the Biden administration.

## Why it matters to farmers

USDA said the fertilizer market is highly concentrated. Four companies control about 77% of North American nitrogen capacity, and two each control roughly 90% of phosphate and potash capacity, according to the department.

Once the plants are running, a USDA analysis projects:

- Nitrogen prices down 4.4% and potash prices down 5.3%
- Domestic nitrogen output up 3.7%
- Domestic potash output up nearly 40%
- About 1.08 million tons of added yearly capacity

USDA did not give construction or opening dates.

## The projects

| Company | Location | Proposed USDA share |
| --- | --- | --- |
| Intrepid Potash | Near Carlsbad, N.M. | $139 million |
| Agriculture Project Holdco | Kansas and Indiana | $116.9 million |
| PCI Nitrogen | Texas and Oregon | $100 million |
| TalusAg | 11 sites in seven states | $99.8 million |
| AdvanSix | Hopewell, Va. | $47.4 million |
| SUL4R-PLUS Illinois | Marissa, Ill. | $34.9 million |
| Peace Valley | Bartow, Fla. | $19.9 million |
| True Organic Products | California, Oregon and Arizona | $15.3 million |

Figures are rounded as reported by USDA.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-23.sql', 6, 0, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-usda-fertilizer-src1', 'bd-20261023-usda-fertilizer', 'Trump Administration Announces Major Investment in American Fertilizer Manufacturing to Strengthen National Security and Support Farmers', 'https://www.usda.gov/about-usda/news/press-releases/2026/10/22/trump-administration-announces-major-investment-american-fertilizer-manufacturing-strengthen', 'U.S. Department of Agriculture', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-pats-bears', 'bears-beat-patriots-30-24-thursday-night', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Bears hold off Patriots 30-24, ending New England''s three-game win streak', 'Drake Maye threw for 321 yards, but an end-zone interception and a recovered onside kick sent the Patriots home 4-3.', 'The New England Patriots'' three-game winning streak ended Thursday night at Soldier Field, where the Chicago Bears won 30-24.

New England fell to 4-3. Chicago improved to 5-2, according to The Associated Press.

## How it got away

Chicago built an early 10-0 lead and was ahead 27-14 in the third quarter before Drake Maye found Eli Raridon for a 30-yard touchdown, according to the Bears'' game recap.

Two drives ended without points for New England. D''Marco Jackson intercepted Maye in the end zone in the first half, and Kyler Gordon sacked him on fourth-and-5 for a turnover on downs, the Bears reported.

Bears kicker Cairo Santos made a 58-yard field goal with 1:34 left, a career long that matched the franchise record, the AP reported. Andy Borregales answered with a 47-yarder, but Chicago''s Rome Odunze recovered the Patriots'' onside kick to seal it.

## By the numbers

| Player | Line |
| --- | --- |
| Drake Maye, NE | 24 of 31, 321 yards, 2 TD, 1 INT; 7-yard TD run |
| Rhamondre Stevenson, NE | 5 catches, 93 yards, 1 TD |
| Caleb Williams, CHI | 308 passing yards, 2 TD |
| Luther Burden III, CHI | 4 catches, 130 yards, 1 TD |

Maye had thrown 10 touchdown passes and one interception during the winning streak, the AP noted.

## Injuries and what''s next

Defensive tackle Christian Barmore left late in the game, the AP reported. Cornerback Christian Gonzalez played after being listed as questionable with an illness.

The Patriots next play at Miami on Nov. 1.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-23.sql', 8, 0, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-pats-bears-src1', 'bd-20261023-pats-bears', 'Game Recap: Bears knock off Patriots on Thursday Night Football, improve to 5-2', 'https://www.chicagobears.com/news/game-recap-bears-knock-off-patriots-on-thursday-night-football-improve-to-5-2', 'Chicago Bears (team site)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-pats-bears-src2', 'bd-20261023-pats-bears', 'Bears 30-24 Patriots (Oct 22, 2026) Game Recap (AP)', 'https://www.espn.com/nfl/recap?gameId=401873010', 'The Associated Press (via ESPN)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-bruins-preds', 'bruins-shut-out-predators-6-0-dipietro', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'DiPietro earns first NHL shutout as Bruins rout Predators 6-0', 'David Pastrnak and Charlie McAvoy had four points each, and Boston stretched its point streak to seven games.', 'Michael DiPietro made 28 saves for the first shutout of his NHL career, and the Boston Bruins beat the Nashville Predators 6-0 on Thursday night at TD Garden.

Boston improved to 8-2-1 and has earned points in seven straight games (6-0-1), according to NHL.com. Nashville fell to 3-3-3.

## Scoring

| Period | Goal |
| --- | --- |
| 1st | Casey Mittelstadt; Elias Lindholm (power play) |
| 2nd | David Pastrnak; JJ Peterka |
| 3rd | Pastrnak; Mark Kastelic |

Pastrnak finished with two goals and two assists. NHL.com reported it was the 20th four-point game of his career, making him the eighth player in team history to reach that mark. He has 14 points in his last seven games.

Charlie McAvoy added a career-high four assists, the Associated Press reported. He has six points in five games since returning from a six-game suspension, according to NHL.com.

## A goalie''s big week

DiPietro had picked up his first NHL win the night before, according to NHL.com. He has appeared in seven NHL games since his debut in 2019.

Nashville goalie Justus Annunen stopped 25 shots in his first game of the season. Predators coach Andrew Brunette said his team "forgot to play hockey tonight," NHL.com reported.

## Up next

The Bruins host the San Jose Sharks on Saturday, the AP reported. The Predators visit Pittsburgh the same day.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-23.sql', 7, 0, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-bruins-preds-src1', 'bd-20261023-bruins-preds', 'DiPietro gets first career shutout, Bruins defeat Predators to stay hot', 'https://www.nhl.com/news/nashville-predators-boston-bruins-game-recap-october-22-2026', 'NHL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-bruins-preds-src2', 'bd-20261023-bruins-preds', 'DiPietro has first career shutout, Pastrnak scores 2 as Bruins beat Predators 6-0 (AP)', 'https://www.boston.com/sports/boston-bruins/2026/10/22/dipietro-has-first-career-shutout-pastrnak-scores-2-as-bruins-beat-predators-6-0/', 'The Associated Press (via Boston.com)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261023-ws-game1', 'world-series-game-1-martinez-misiorowski-tonight', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Rays hand Game 1 to Nick Martinez as World Series opens tonight in Milwaukee', 'Tampa Bay holds Drew Rasmussen for Game 2 and lines up Freddy Peralta for its home opener against the 103-win Brewers.', 'The World Series begins Friday night at American Family Field, and the Tampa Bay Rays are opening with a surprise. Veteran right-hander Nick Martinez, 36, will start Game 1 against Milwaukee''s Jacob Misiorowski, Sports Illustrated reported.

First pitch is set for 8:08 p.m. ET, according to SI. Every game airs on Fox, MLB.com said.

## Why Martinez

The Rays plan to start Drew Rasmussen in Game 2 on Saturday and Freddy Peralta in Game 3 at Tropicana Field, where Peralta has made all three of his postseason starts, according to SI. The setup could let Martinez start twice in a seven-game series.

Misiorowski, 24, has started Game 1 of each of Milwaukee''s last two series. He threw 1,115 pitches of 100 mph or faster this season, The Associated Press reported, topping out at 105.5 mph in June.

## A first-time champion

Neither franchise has won a World Series, guaranteeing a first-time champion for the first time since 1980, the AP reported. It is also the first World Series to use the automated ball-strike challenge system.

The Brewers went 103-59, a franchise record, and swept the Dodgers in the NLCS, according to MLB.com. The Rays went 98-64 and beat Cleveland in six games for the AL pennant.

| Game | Date | Site |
| --- | --- | --- |
| 1 | Fri., Oct. 23 | Milwaukee |
| 2 | Sat., Oct. 24 | Milwaukee |
| 3 | Mon., Oct. 26 | Tampa Bay |
| 4 | Tue., Oct. 27 | Tampa Bay |
| 5* | Wed., Oct. 28 | Tampa Bay |
| 6* | Fri., Oct. 30 | Milwaukee |
| 7* | Sat., Oct. 31 | Milwaukee |

*If necessary. All games 8 p.m. ET on Fox, per MLB.com.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-23.sql', 7, 0, 'newsroom-assistant', '2026-10-23T10:00:00.000Z', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-ws-game1-src1', 'bd-20261023-ws-game1', '2026 MLB World Series FAQ: Schedule, times, teams and more', 'https://www.mlb.com/news/2026-mlb-world-series-faq-schedule-times-teams-and-more', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-ws-game1-src2', 'bd-20261023-ws-game1', 'Probable Starting Pitchers for Game 1 of the 2026 World Series', 'https://www.si.com/fannation/mlb/fastball/news/2026-world-series-game-1-starting-pitchers-nick-martinez-jacob-misiorowski-michael3', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261023-ws-game1-src3', 'bd-20261023-ws-game1', 'World Series preview: Brewers-Rays matchup will open with Misiorowski''s record heat (AP)', 'https://www.timesleader.com/sports/1763222/world-series-preview-brewers-rays-matchup-will-open-with-misiorowskis-record-heat', 'The Associated Press (via Times Leader)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-23T10:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-23. Editor to confirm.', 'newsroom-assistant', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-maine-senate-ev1', 'bd-20261023-maine-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-dpa-oil-ev1', 'bd-20261023-dpa-oil', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-scotus-midterms-ev1', 'bd-20261023-scotus-midterms', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-usda-fertilizer-ev1', 'bd-20261023-usda-fertilizer', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-pats-bears-ev1', 'bd-20261023-pats-bears', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-bruins-preds-ev1', 'bd-20261023-bruins-preds', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261023-ws-game1-ev1', 'bd-20261023-ws-game1', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-23T10:00:00.000Z');
