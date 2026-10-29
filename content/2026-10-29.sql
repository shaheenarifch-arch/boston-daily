-- Newsroom drafts for 2026-10-29. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
-- Wikimedia Commons API was unreachable from the newsroom sandbox on this run, so only Library of Congress / Architect of the Capitol files were used. Editor: confirm each photo loads.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-senate-tossup', 'senate-control-toss-up-six-days-south-carolina-poll-tie', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Six days out, Senate control is a toss-up as South Carolina joins the list of close races', 'Fox News rates five seats as pure toss-ups. A new NYT/Siena poll ties the race for the late Lindsey Graham''s seat at 48% apiece.', 'Control of the Senate remains up for grabs with six days left before the Nov. 3 election, and the list of competitive races keeps growing.

Republicans hold the chamber 53-47. Because Vice President JD Vance breaks ties, Republicans keep control with 50 seats, which means Democrats need a net gain of four.

## The ratings

The latest Fox News Power Rankings favor Democrats in 48 seats and Republicans in 47, with five toss-ups: Alaska, Iowa, Maine, Michigan and Texas, Fox News reported Wednesday. Ohio moved from toss-up to Lean Democrat, and South Carolina slid from Likely Republican to Lean Republican.

In Alaska, Iowa and Kansas, about 10% of voters in recent high-quality polls said they were undecided or would not back either major candidate, according to the Fox analysis.

## Latest Senate polls

| State | Democrat | Republican | Poll |
| --- | --- | --- | --- |
| South Carolina | Annie Andrews 48% | Darline Graham 48% | NYT/Siena |
| Ohio | Sherrod Brown 47% | Jon Husted 44% | Suffolk |
| Texas | James Talarico 50% | Ken Paxton 45% | Univision/YouGov |
| Michigan | Abdul El-Sayed 50% | Mike Rogers 48% | Marist |
| Iowa | Josh Turek 46% | Ashley Hinson 44% | Cook |
| Kansas | Adam Hamilton 46% | Roger Marshall 47% | NYT/Siena (Oct. 7) |

*Source: poll roundup compiled by Forbes.*

In South Carolina, a separate survey from The Citadel had Graham, the late senator''s sister, ahead 43% to 39%, Forbes reported.

## The national mood

Nationally, Democrats led Republicans 47% to 36% on a generic congressional ballot in a Reuters/Ipsos poll taken Oct. 22 to 26, Al Jazeera reported. The same poll put President Trump''s approval at 32%.

More than 35 million Americans had already voted as of Tuesday, CBS News reported, citing the University of Florida Election Lab.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/24/Flickr_-_USCapitol_-_Russell_Senate_Office_Building.jpg', 'The Russell Senate Office Building on Capitol Hill (file). Photo: Architect of the Capitol / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-29.sql', 9, 1, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-senate-tossup-src1', 'bd-20261029-senate-tossup', 'Senate control a toss-up with 6 days left until midterm elections', 'https://www.foxnews.com/politics/senate-control-coin-flip-democrats-path-runs-through-trump-country', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-senate-tossup-src2', 'bd-20261029-senate-tossup', 'Latest Polls In 2026 Midterms: Tie In South Carolina Senate Race For Lindsey Graham''s Seat', 'https://www.forbes.com/sites/saradorn/2026/10/28/latest-polls-in-2026-midterms-tie-in-south-carolina-senate-race-for-lindsey-grahams-seat-updated-daily/', 'Forbes', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-senate-tossup-src3', 'bd-20261029-senate-tossup', 'US midterms: Six days left. Who leads in the polls as Trump, Obama rally?', 'https://www.aljazeera.com/news/2026/10/28/us-midterms-six-days-left-who-leads-in-the-polls-as-trump-obama-rally', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-senate-tossup-src4', 'bd-20261029-senate-tossup', 'Live Updates: 2026 midterm campaigns make final pre-Election Day pitch', 'https://www.cbsnews.com/live-updates/2026-elections-midtems-house-senate-trump/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-senate-tossup-ev1', 'bd-20261029-senate-tossup', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-fed-hold', 'fed-holds-rates-split-vote-cook-hammack-dissent-warsh-december', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Fed holds rates at 3.75% to 4% in a split vote as two officials push for another hike', 'Governor Lisa Cook and Cleveland Fed President Beth Hammack dissented. Chair Kevin Warsh said the coming election played no part in the decision.', 'The Federal Reserve left its benchmark interest rate unchanged on Wednesday, holding the federal funds target range at 3.75% to 4%, six days before the midterm elections.

The vote was 10-2. Governor Lisa D. Cook and Cleveland Fed President Beth M. Hammack dissented, preferring a quarter-point increase, according to the Fed''s policy statement.

The Fed raised rates in September, its first increase since July 2023, Fox Business reported.

## What the Fed said

| Item | October statement |
| --- | --- |
| Rate range | 3.75% to 4% (unchanged) |
| Vote | 10-2; two dissents in favor of a hike |
| Economy | Activity expanding at a strong pace |
| Jobs | Gains keeping pace with the workforce; unemployment little changed |
| Inflation | Remains elevated |

*Source: Federal Reserve.*

The statement said more information will help policymakers decide how to return inflation to the Fed''s 2% goal. Consumer prices rose 3.7% over the 12 months through September, Yahoo Finance reported.

## Warsh on politics

At his news conference, Chair Kevin Warsh said politics played no role in the decision and that he heard no talk of politics during two days of meetings, Yahoo Finance reported. He declined to respond to criticism from President Trump, who has called for lower rates.

House Ways and Means Chair Jason Smith, a Republican, said it was long past time for rates to fall. Sen. Elizabeth Warren, a Democrat, blamed the president for higher rates, according to the same report.

## What''s next

Traders priced in more than an 80% chance of a quarter-point hike at the Fed''s final meeting of the year, Dec. 8 and 9, according to CME FedWatch data cited by Yahoo Finance. That meeting includes new economic projections.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-29.sql', 8, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-fed-hold-src1', 'bd-20261029-fed-hold', 'Federal Reserve issues FOMC statement (October 28, 2026)', 'https://www.federalreserve.gov/newsevents/pressreleases/monetary20261028a.htm', 'Federal Reserve Board', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-fed-hold-src2', 'bd-20261029-fed-hold', '''I didn''t hear an utterance about politics'': Warsh bats away midterm talk following rate decision', 'https://finance.yahoo.com/economy/policy/article/i-didnt-hear-an-utterance-about-politics-warsh-bats-away-midterm-talk-following-rate-decision-203737154.html', 'Yahoo Finance', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-fed-hold-src3', 'bd-20261029-fed-hold', 'Rate decision live: Interest rates held steady in split vote', 'https://finance.yahoo.com/economy/policy/live/fed-meeting-live-updates-federal-reserve-october-meeting-kevin-warsh-161129201.html', 'Yahoo Finance', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-fed-hold-src4', 'bd-20261029-fed-hold', 'October FOMC: Federal Reserve holds rates steady ahead of election', 'https://www.foxbusiness.com/economy/federal-reserve-interest-rate-decision-october-28-2026', 'Fox Business', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-fed-hold-ev1', 'bd-20261029-fed-hold', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-trump-ohio', 'trump-chillicothe-rally-husted-ramaswamy-brown-acton-ohio', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump rallies in Chillicothe for Husted and Ramaswamy and defends the ad aimed at Acton', 'On his third Ohio stop this month, the president urged voters to keep Sen. Jon Husted in office as polls show Sherrod Brown slightly ahead.', 'President Trump returned to Ohio on Wednesday for the third time this month, rallying for Sen. Jon Husted and gubernatorial nominee Vivek Ramaswamy at the Shoemaker Center on Ohio University''s Chillicothe campus.

Trump spoke for more than 90 minutes, WHIO-TV reported. He praised Husted and repeatedly urged the crowd to back him in the special Senate election against Democrat Sherrod Brown, according to the Scioto Valley Guardian. Husted, from the same stage, challenged voters to name something Brown had done to improve their lives.

## The Acton ad

Trump defended a Ramaswamy campaign ad that features the estranged mother of Democratic nominee Amy Acton, drawing a standing ovation, WHIO reported. The ad has drawn criticism from both parties, including from Gov. Mike DeWine, a Republican, CBS News reported. Ramaswamy used his remarks to criticize Acton''s handling of COVID-19 as state health director.

Trump also spoke about immigration, crime, taxes and the state''s voter ID ballot measure. A few hecklers were removed, and small groups protested outside, the Guardian reported.

## Where the race stands

| Measure | Reading |
| --- | --- |
| Suffolk poll | Brown 47%, Husted 44% |
| Fox News Power Rankings | Lean Democrat (from toss-up) |
| CBS News rating | Toss-up |

*Sources: Forbes, Fox News, CBS News.*

More than $400 million had been spent or reserved in the Ohio Senate race as of Oct. 8, Al Jazeera reported, citing Axios. Husted was appointed to the seat Vance left to become vice president.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Columbus,_Ohio_-_Highsmith_22.jpg/1280px-Columbus,_Ohio_-_Highsmith_22.jpg', 'Columbus, Ohio, the state capital (file). Photo: Carol M. Highsmith, Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-29.sql', 7, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-trump-ohio-src1', 'bd-20261029-trump-ohio', 'ELECTION 2026: President Trump holds rally in Chillicothe ahead of midterms', 'https://www.yahoo.com/news/politics/articles/election-2026-president-trump-holds-022311636.html', 'WHIO-TV (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-trump-ohio-src2', 'bd-20261029-trump-ohio', 'Trump urges Ohio GOP support, dances offstage at Chillicothe rally', 'https://sciotovalleyguardian.com/2026/10/28/trump-urges-ohio-gop-support-dances-offstage-at-chillicothe-rally/', 'Scioto Valley Guardian', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-trump-ohio-src3', 'bd-20261029-trump-ohio', 'Latest Polls In 2026 Midterms (updated daily)', 'https://www.forbes.com/sites/saradorn/2026/10/28/latest-polls-in-2026-midterms-tie-in-south-carolina-senate-race-for-lindsey-grahams-seat-updated-daily/', 'Forbes', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-trump-ohio-src4', 'bd-20261029-trump-ohio', 'Live Updates: 2026 midterm campaigns make final pre-Election Day pitch', 'https://www.cbsnews.com/live-updates/2026-elections-midtems-house-senate-trump/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-trump-ohio-ev1', 'bd-20261029-trump-ohio', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-murkowski-alaska', 'murkowski-endorses-democrat-kreiss-tomkins-alaska-governor', 'newsroom', 'news_story', 'states', 'EDITORIAL_REVIEW', 0, 'Murkowski crosses party lines to back Democrat Jonathan Kreiss-Tomkins for Alaska governor', 'The Republican senator''s endorsement puts her at odds with President Trump, who backs Bernadette Wilson in the ranked-choice race.', 'Sen. Lisa Murkowski, an Alaska Republican, has endorsed Democrat Jonathan Kreiss-Tomkins for governor, a week before Election Day.

Murkowski also endorsed his running mate, Zac Johnson, a nonpartisan candidate for lieutenant governor, Fox News reported. In a statement released by the campaign, she said the state''s future should not be held back by partisan divisions and called for a serious conversation about Alaska''s finances, energy costs and economic growth.

She said Alaska needs a governor who will work with the Legislature, and faulted Gov. Mike Dunleavy''s administration for leaving federal money unused, citing the Alaska Marine Highway System, Alaska''s News Source reported.

## The field

| Candidate | Party | September NYT/Siena poll |
| --- | --- | --- |
| Jonathan Kreiss-Tomkins | Democrat | about 40% |
| Bernadette Wilson | Republican | 20% |
| Dave Bronson | Republican | 15% |
| Treg Taylor | Republican | 11% |

*Source: Alaska''s News Source.*

Trump endorsed Wilson on Oct. 13. Wilson and Trump have urged Bronson and Taylor to drop out so the Republican vote is not split under Alaska''s ranked-choice system, according to Alaska''s News Source.

## Reaction

Wilson said Murkowski had abandoned Alaska values. Bronson said the senator was entitled to her choice, and Taylor said he was disappointed, the station reported. Kreiss-Tomkins, a former state legislator from Sitka, said he was honored by the support.

Murkowski has broken with her party before, including endorsing Democrat Mary Peltola in the 2024 House race. Peltola is now challenging Sen. Dan Sullivan in a Senate race Fox News rates a toss-up.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-29.sql', 6, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-murkowski-alaska-src1', 'bd-20261029-murkowski-alaska', 'Sen. Murkowski endorses Democrat JKT in Alaska''s governor''s race', 'https://www.alaskasnewssource.com/2026/10/27/sen-murkowski-endorses-democrat-jkt-alaskas-governors-race/', 'Alaska''s News Source', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-murkowski-alaska-src2', 'bd-20261029-murkowski-alaska', 'Murkowski snubs Trump-backed Alaska candidate, endorses Democrat for governor', 'https://www.foxnews.com/politics/murkowski-snubs-trump-backed-alaska-candidate-endorses-democrat-governor', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-murkowski-alaska-src3', 'bd-20261029-murkowski-alaska', 'Senate control a toss-up with 6 days left until midterm elections', 'https://www.foxnews.com/politics/senate-control-coin-flip-democrats-path-runs-through-trump-country', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-murkowski-alaska-ev1', 'bd-20261029-murkowski-alaska', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-brewers-champions', 'brewers-beat-rays-game-5-first-world-series-title', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Brewers beat Rays 4-1 in Game 5 to win the first World Series title in franchise history', 'Jacob Misiorowski threw 5 2/3 scoreless innings in St. Petersburg, and catcher William Contreras was named Series MVP.', 'The Milwaukee Brewers are World Series champions for the first time.

Milwaukee beat the Tampa Bay Rays 4-1 in Game 5 on Wednesday night at Tropicana Field in St. Petersburg, Fla., to win the Series four games to one, The Associated Press reported.

## How it happened

| Inning | Play |
| --- | --- |
| 2nd | Cooper Pratt RBI single, Brewers 1-0 |
| 5th | Pratt scores on David Hamilton grounder, 2-0 |
| 6th | William Contreras RBI double, Pratt sacrifice fly, 4-0 |
| 9th | Chandler Simpson RBI double for Tampa Bay, 4-1 |

*Sources: The Associated Press, Sports Illustrated.*

Starter Jacob Misiorowski held the Rays scoreless for 5 2/3 innings before leaving with a cramp in his right leg, according to the AP. JoJo Romero and Abner Uribe each got two outs, and Trevor Megill finished the final two innings.

## Records and history

Contreras, the Brewers'' catcher, was named Series MVP after hitting .381 and throwing out four baserunners, Sports Illustrated reported. Rookie Pratt set a Series record with six straight hits, and Jackson Chourio set a five-game Series record with 11 hits, the AP reported.

The franchise began as the Seattle Pilots in 1969 and moved to Milwaukee in 1970. Its only other World Series, in 1982, ended with a Game 7 loss to the St. Louis Cardinals.

Milwaukee went 11-2 this postseason, beating San Diego and sweeping the Los Angeles Dodgers before the Series, according to Sports Illustrated. Manager Pat Murphy''s club ranked 19th in payroll as of Aug. 31, the AP reported.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-29.sql', 8, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-brewers-champions-src1', 'bd-20261029-brewers-champions', 'Brewers beat Rays 4-1 in Game 5 to win 1st World Series title in franchise history', 'https://arizonasports.com/mlb/brewers-beat-rays-4-1-in-game-5-to-win-1st-world-series-title-in-franchise-history', 'The Associated Press (via Arizona Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-brewers-champions-src2', 'bd-20261029-brewers-champions', 'Brewers Win First World Series Title After Taking Down Rays in Game 5', 'https://www.si.com/mlb/brewers/2026-world-series-brewers-win-first-title-after-taking-down-rays-in-game-5', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-brewers-champions-ev1', 'bd-20261029-brewers-champions', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-bruins-blues', 'bruins-visit-blues-st-louis-after-loss-at-carolina', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Atlantic-leading Bruins visit the slumping Blues tonight after a 2-1 loss in Carolina', 'St. Louis has not scored in more than two full games. David Pastrnak leads Boston with 18 points.', 'The Boston Bruins try to bounce back tonight in St. Louis, where they face a Blues team that has gone more than two games without a goal.

Puck drop at Enterprise Center is 8 p.m. Eastern. It is the first of two meetings this season and the last game of a five-game homestand for St. Louis, according to the Blues'' preview on NHL.com.

## By the numbers

| | Bruins | Blues |
| --- | --- | --- |
| Record | 9-3-1, first in the Atlantic | Not listed |
| Last game | Lost 2-1 at Carolina | Lost 2-0 to Montreal |
| Likely goalie | Jeremy Swayman (7-2) | Jordan Binnington |

*Source: NHL.com.*

The Blues outshot Montreal 46-20 on Tuesday but were shut out by Jacob Fowler, and they had gone 123 minutes, 55 seconds without a goal, NHL.com reported.

## Players to watch

David Pastrnak leads Boston with seven goals and 18 points. Elias Lindholm has a point in three straight games and has 17 points in 26 career games against St. Louis. J.J. Peterka has nine points in 13 games.

For St. Louis, captain Robert Thomas has six points in nine career games against Boston, and Pavel Buchnevich has points in four of his last five against the Bruins.

Boston won both meetings last season, 5-2 each time, and is 7-2-1 in its last 10 games. Michael DiPietro (2-1) is the other Boston goalie.

The Bruins play the Chicago Blackhawks on Saturday at 1 p.m., according to Daily Faceoff.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Saint_Louis_Gateway_Arch_(originally_Jefferson_National_Expansion_Memorial),_Saint_Louis,_Missouri,_1947-65;_dedicated,_1968._View_-_00178v.jpg/1280px-Saint_Louis_Gateway_Arch_(originally_Jefferson_National_Expansion_Memorial),_Saint_Louis,_Missouri,_1947-65;_dedicated,_1968._View_-_00178v.jpg', 'The Gateway Arch in St. Louis (file). Photo: Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-29.sql', 6, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-bruins-blues-src1', 'bd-20261029-bruins-blues', 'Preview: Blues vs. Bruins', 'https://www.nhl.com/blues/news/preview-blues-vs-bruins-10292026', 'NHL.com (St. Louis Blues)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-bruins-blues-src2', 'bd-20261029-bruins-blues', 'Boston Bruins schedule, week of Oct. 26', 'https://www.dailyfaceoff.com/teams/boston-bruins/schedule/2026-10-26', 'Daily Faceoff', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-bruins-blues-ev1', 'bd-20261029-bruins-blues', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-patriots-injuries', 'patriots-dolphins-wednesday-injury-report-aj-brown-limited', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'A.J. Brown limited as the Patriots open Dolphins week; two Miami starters in concussion protocol', 'Drake Maye was a full participant. Miami tackle Kadyn Proctor and cornerback JuJu Brents did not practice.', 'The Patriots opened their week of preparation for Sunday''s trip to Miami with most of their roster on the field, though wide receiver A.J. Brown was limited.

Brown, listed with knee and ankle injuries, missed four games before returning and has had a bumpy start in the offense, Pro Football Talk reported. The extended break after last Thursday''s loss to the Bears gives him more time to settle in, according to the report.

Kickoff at Hard Rock Stadium is 4:25 p.m. Eastern on Sunday.

## Wednesday practice report

| Team | Did not practice | Limited | Full (selected) |
| --- | --- | --- | --- |
| Patriots | None | WR A.J. Brown, OT Morgan Moses, G Ben Brown, DT DaQuan Jones | QB Drake Maye, CB Carlton Davis III, S Kevin Byard III |
| Dolphins | OT Kadyn Proctor, CB JuJu Brents | WR Malik Washington, TE Greg Dulcich, S Michael Taaffe | QB Malik Willis, RB Jaylen Wright |

*Sources: Pats Pulpit (via Yahoo Sports), Pro Football Talk.*

## Healthier secondary

Cornerbacks Carlton Davis III, Channing Canada and Karon Prunty all missed the Bears game but were full participants Wednesday, Pats Pulpit reported. Right guard Ben Brown, who also sat out last week, was limited.

Quarterback Drake Maye was listed with a right shoulder issue but practiced fully.

For Miami, Proctor and Brents were both listed with concussions. Quarterback Malik Willis was added to the report with a groin injury but took part fully.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-29.sql', 5, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-patriots-injuries-src1', 'bd-20261029-patriots-injuries', 'Patriots vs. Dolphins Wednesday injury report: Ben Brown returns, while Carlton Davis III ramps up', 'https://sports.yahoo.com/articles/patriots-vs-dolphins-wednesday-injury-210343712.html', 'Pats Pulpit (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-patriots-injuries-src2', 'bd-20261029-patriots-injuries', 'A.J. Brown, Ben Brown limited in Patriots practice', 'https://www.nbcsports.com/nfl/profootballtalk/rumor-mill/news/a-j-brown-ben-brown-limited-in-patriots-practice', 'NBC Sports (Pro Football Talk)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-patriots-injuries-src3', 'bd-20261029-patriots-injuries', 'New England Patriots injury and practice participation reports', 'https://www.patriots.com/team/injury-report/', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 0, 1, '2026-10-29T10:30:00.000Z', 'Official page: open it, confirm, then tick Verified.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-patriots-injuries-ev1', 'bd-20261029-patriots-injuries', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261029-celtics-bulls-rematch', 'celtics-3-1-host-bulls-friday-road-trip-orlando-houston', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Celtics, 3-1 after Tatum''s overtime winner, get the Bulls again Friday before a road swing', 'Boston has won three straight. Devin Carter is out with an illness, and Derrick White was cleared after a hip issue.', 'The Celtics have two days off to enjoy a three-game winning streak before a busy stretch that includes a rematch with Chicago and two road games in two days.

Boston is 3-1 and fourth in the Eastern Conference, according to CBS Sports. Jayson Tatum scored 40 points and hit an overtime buzzer-beater in Tuesday''s 125-124 win over Brooklyn.

## Results so far

| Date | Opponent | Result |
| --- | --- | --- |
| Oct. 20 | at Detroit | L 121-113 |
| Oct. 23 | New York | W 107-103 |
| Oct. 26 | Chicago | W 134-99 |
| Oct. 27 | Brooklyn | W 125-124 (OT) |

*Sources: ESPN, CBS Sports.*

## What''s next

Chicago (1-4) visits TD Garden on Friday at 7:30 p.m. Eastern, four days after Boston beat the Bulls by 35. Payton Pritchard scored 28 off the bench in that game, CBS Sports reported.

| Date | Opponent |
| --- | --- |
| Fri., Oct. 30 | Chicago |
| Sun., Nov. 1 | at Orlando |
| Mon., Nov. 2 | at Houston |
| Wed., Nov. 4 | Milwaukee |

*Source: ESPN.*

## Injuries

Guard Devin Carter is the only Celtic on the injury report, out with an illness, according to CBS Sports. Derrick White dealt with a right hip issue but was cleared to play Tuesday.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-29.sql', 5, 0, 'newsroom-assistant', '2026-10-29T10:30:00.000Z', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-celtics-bulls-rematch-src1', 'bd-20261029-celtics-bulls-rematch', 'Boston Celtics News, Scores and Stats 2026-27', 'https://www.cbssports.com/nba/teams/BOS/boston-celtics/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261029-celtics-bulls-rematch-src2', 'bd-20261029-celtics-bulls-rematch', 'Boston Celtics 2026-27 Regular Season NBA Schedule', 'https://www.espn.com/nba/team/schedule/_/name/bos/boston-celtics', 'ESPN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-29T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-29. Editor to confirm.', 'newsroom-assistant', '2026-10-29T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261029-celtics-bulls-rematch-ev1', 'bd-20261029-celtics-bulls-rematch', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-29T10:30:00.000Z');
