-- Newsroom drafts for 2026-11-01. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
-- Wikimedia Commons (API and file pages) was unreachable from the newsroom sandbox on this run, so only U.S. government / National Archives files were used, with URLs built from the file names. Editor: confirm each photo loads and matches its caption.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-final-sunday', 'trump-dubuque-salina-rallies-final-sunday-senate-battlegrounds', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'On the final Sunday before the midterms, Trump rallies in Dubuque and Salina with 11 Senate races in play', 'After two days of schedule changes, the president holds back-to-back rallies in Iowa and Kansas, two Senate races that CBS News rates as only leaning Republican.', 'President Trump closes the last weekend of the midterm campaign with two in-person rallies on Sunday, one in Dubuque, Iowa, and one in Salina, Kan., two days before Tuesday''s election.

The stops come after a run of schedule changes. The Republican National Committee called off both rallies on Thursday in favor of telephone events. Trump then reversed course, and the Iowa event briefly moved to Cedar Rapids before returning to its original venue in Dubuque, KWWL reported.

## Sunday''s schedule

| Stop | Venue | Doors | Trump speaks |
| --- | --- | --- | --- |
| Dubuque, Iowa | Five Flags Event Center | 10:30 a.m. | 2 p.m. |
| Salina, Kan. | Hangar at Salina Regional Airport | 2:30 p.m. | 6 p.m. |

Times are local, according to KWWL and KCUR.

Speaking at a Friday night rally in Daytona Beach, Fla., Trump said allies in both states had asked him to come in person, CBS News reported.

## Kansas and the Senate map

In Kansas, Republican Sen. Roger Marshall faces Democrat Adam Hamilton, a pastor. A recent CNN poll showed Hamilton ahead within the margin of error, KCUR reported. Trump carried the state by 16 points in 2024, according to CBS News.

CBS News currently tracks 11 Senate battlegrounds:

| Rating | States |
| --- | --- |
| Toss-up | Maine, Michigan, Ohio, Texas, Alaska |
| Lean Republican | Iowa, Kansas, South Carolina |
| Lean Democratic | Georgia, North Carolina, New Hampshire |

## Votes already cast

As of Thursday evening, 44.8 million Americans had voted early, about 23.6 million in person and 21.3 million by mail, CBS News reported, citing the University of Florida Election Lab.

Asked about the outcome on Friday, Trump said, "Tuesday, we''re going to see how it all works out," CBS News reported.

Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/4/42/President_Trump_Boards_Air_Force_One_(50558375023).jpg', 'President Trump boards Air Force One (file). Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-11-01.sql', 9, 1, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-final-sunday-src1', 'bd-20261101-final-sunday', 'Breaking: Trump rally changes again, now back on in Dubuque Sunday afternoon', 'https://www.kwwl.com/news/breaking-trump-rally-in-iowa-rescheduled-to-cedar-rapids-this-sunday/article_9628452c-864a-45e4-8fea-8d98edbcad08.html', 'KWWL', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-final-sunday-src2', 'bd-20261101-final-sunday', 'Trump un-cancels Kansas rally and will now visit Sunday to support Marshall''s tight Senate race', 'https://www.kcur.org/2026-10-30/trump-un-cancels-kansas-rally-and-will-now-visit-sunday-to-support-marshalls-tight-senate-race', 'KCUR', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-final-sunday-src3', 'bd-20261101-final-sunday', '2026 elections live updates: candidates make their final push', 'https://www.cbsnews.com/live-updates/2026-midterm-elections-campaigns-weekend-before/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-final-sunday-ev1', 'bd-20261101-final-sunday', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-alaska-ballots', 'alaska-tells-judge-segregating-sullivan-ballots-not-possible-doj-lawsuit', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Alaska tells a federal judge the Justice Department''s demand to set aside Senate ballots is impossible', 'The department wants ballots ranking independent Daniel J. Sullivan preserved and separated, with a ruling by Monday. The state says votes are mixed in the box and the case should be dismissed.', 'Alaska''s attorneys asked a federal judge on Saturday to throw out a Justice Department lawsuit over the state''s U.S. Senate race, calling the department''s latest demand to separate certain ballots unworkable.

On Friday the department asked for a preliminary injunction ordering the state to preserve and segregate all ballots that rank Daniel J. Sullivan, an independent who shares a name with Republican Sen. Dan Sullivan, CBS News reported. It also sought expedited discovery from Democrat Mary Peltola''s campaign and the Democratic Senatorial Campaign Committee, and asked for a ruling by Monday.

## The state''s response

The Alaska Department of Law argues that ballots are mixed together in the box on Election Day, so separating them would break ballot secrecy, according to CBS News. The state also says a preservation order is unnecessary because it already keeps ballots for 22 months.

In earlier filings, the state said the National Voter Registration Act, the only law the suit cites, covers registration rather than counting or certification, Alaska Public Media reported. The state also noted that the ballot lists the incumbent as a Republican and the challenger with no party.

## How the case got here

| Date | Development |
| --- | --- |
| June | Alaska Supreme Court keeps Daniel J. Sullivan on the ballot |
| Oct. 22 | Justice Department files suit |
| Oct. 26 | U.S. District Judge Sharon Gleason fast-tracks the case |
| Oct. 30 | U.S. Attorney Michael Heyman confirms a criminal investigation |
| Oct. 31 | State files motion to dismiss |
| Nov. 3 | Election Day |

Dates are from Alaska Public Media, CBS News and Yahoo News.

Heyman said he was not assuming a crime had been committed, CBS News reported. No one has been charged, according to Yahoo News. Peltola has denied involvement in the second Sullivan''s campaign, and the DSCC has also denied involvement.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-11-01.sql', 8, 0, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-alaska-ballots-src1', 'bd-20261101-alaska-ballots', 'DOJ calls allegations about 2 Dan Sullivans in Alaska Senate race "troubling," asks to segregate ballots', 'https://www.cbsnews.com/news/alaska-us-attorney-senate-race-two-dan-sullivans/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-alaska-ballots-src2', 'bd-20261101-alaska-ballots', 'State of Alaska says DOJ lawsuit over Senate race "has no legal basis"', 'https://alaskapublic.org/news/politics/elections/2026-10-27/state-of-alaska-says-doj-lawsuit-over-senate-race-has-no-legal-basis', 'Alaska Public Media', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-alaska-ballots-src3', 'bd-20261101-alaska-ballots', 'Feds confirm criminal probe into 2nd Dan Sullivan''s Alaska Senate run as DOJ seeks to isolate ballots', 'https://www.yahoo.com/news/politics/article/feds-confirm-criminal-probe-into-2nd-dan-sullivans-alaska-senate-run-as-doj-seeks-to-isolate-ballots-160652369.html', 'Yahoo News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-alaska-ballots-ev1', 'bd-20261101-alaska-ballots', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-michigan-senate', 'el-sayed-leads-rogers-michigan-senate-polls-stevens-detroit-unity-event', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'El-Sayed leads Rogers in two new Michigan Senate polls as Democrats try to mend a primary rift', 'Abdul El-Sayed is scheduled to appear in Detroit on Sunday with former rival Rep. Haley Stevens and Rep. James Clyburn, after a week of public sparring between the two Democrats.', 'Democrat Abdul El-Sayed holds a lead over Republican Mike Rogers in Michigan''s open U.S. Senate race in two polls released in the final week of the campaign.

The seat is open because Democratic Sen. Gary Peters is not seeking reelection, CBS Detroit reported. CBS News lists the race as one of five Senate toss-ups.

## The latest numbers

| Poll | Field dates | El-Sayed | Rogers | Margin of error |
| --- | --- | --- | --- | --- |
| Mitchell Research for CBS Detroit and other stations | Oct. 26-27 | 51% | 44% | +/-3.9 pts |
| Glengariff Group for WDIV and The Detroit News | Oct. 19-22 | 51.4% | 45.1% | +/-4.0 pts |

Both surveys were of likely voters. In the Mitchell poll, El-Sayed led independents 52% to 38%, and 28% of respondents said they had already voted or were voting absentee, CBS Detroit reported. The Glengariff poll found El-Sayed viewed favorably by 42.2% of voters and Rogers by 32.2%, according to WDIV.

## A Sunday unity event

El-Sayed and Rep. Haley Stevens, whom he defeated in the Democratic primary three months ago, are scheduled to appear together in Detroit on Sunday with Rep. James Clyburn of South Carolina, CBS News reported.

The run-up has been tense. Stevens demanded an apology for El-Sayed''s comments on Israel, asked him to condemn an outside group''s ad she called antisemitic and to drop his own ad featuring Tucker Carlson, according to CBS News. El-Sayed accused her of trying to relitigate the primary.

Michigan voters go to the polls Tuesday, Nov. 3.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/f/f1/Michigan_-_Detroit_-_NARA_-_23941577.jpg', 'Detroit, Michigan (file). Photo: U.S. National Archives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-11-01.sql', 7, 0, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-michigan-senate-src1', 'bd-20261101-michigan-senate', 'Abdul El-Sayed widens lead over Mike Rogers to 7 points in newest Michigan Senate poll', 'https://www.cbsnews.com/detroit/news/el-sayed-widens-lead-rogers-michigan-senate-poll/', 'CBS Detroit', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-michigan-senate-src2', 'bd-20261101-michigan-senate', 'Democratic candidate El-Sayed leads Michigan U.S. Senate race, new poll finds', 'https://www.clickondetroit.com/news/local/2026/10/27/democratic-candidate-el-sayed-leads-michigan-us-senate-race-new-poll-finds/', 'WDIV ClickOnDetroit', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-michigan-senate-src3', 'bd-20261101-michigan-senate', '2026 elections live updates: candidates make their final push', 'https://www.cbsnews.com/live-updates/2026-midterm-elections-campaigns-weekend-before/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-michigan-senate-ev1', 'bd-20261101-michigan-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-gas-prices', 'gas-prices-fall-to-4-18-aaa-national-average-election-weekend', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Gas falls to $4.18 heading into Election Day, down 11 cents in a week but still $1.14 above last year', 'AAA''s national average has dropped steadily through October. Diesel remains above $6.30 a gallon, and Massachusetts drivers are paying almost exactly the national average.', 'The price of a gallon of regular gasoline kept sliding into the final weekend before the midterm elections, but it remains far above where it stood a year ago.

AAA''s national average for regular was $4.184 on Saturday, down from $4.296 a week earlier and $4.434 a month ago, according to the motor club''s daily survey. A year ago, drivers paid $3.040.

## Where prices stand

| Grade | Saturday | Week ago | Month ago | Year ago |
| --- | --- | --- | --- | --- |
| Regular | $4.184 | $4.296 | $4.434 | $3.040 |
| Mid-grade | $4.703 | $4.811 | $4.955 | $3.550 |
| Premium | $5.097 | $5.205 | $5.345 | $3.907 |
| Diesel | $6.310 | $6.337 | $6.414 | $3.688 |

Source: AAA national averages for Oct. 31.

## Diesel stays high

Diesel has eased far more slowly than gasoline, falling less than 3 cents in a week. That matters for truckers and farmers. One Kansas farm family told CBS News that higher diesel and fertilizer costs added about $737,000 to its expenses this year.

## Closer to home

In Massachusetts, the average for regular was $4.181 on Saturday, about the same as the national figure, AAA data show. Among the states AAA highlighted, Hawaii was the most expensive at $5.665.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-11-01.sql', 7, 0, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-gas-prices-src1', 'bd-20261101-gas-prices', 'AAA Gas Prices: national average', 'https://gasprices.aaa.com/?state=US', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-gas-prices-src2', 'bd-20261101-gas-prices', '2026 elections live updates: candidates make their final push', 'https://www.cbsnews.com/live-updates/2026-midterm-elections-campaigns-weekend-before/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-gas-prices-ev1', 'bd-20261101-gas-prices', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-patriots-dolphins', 'patriots-rule-out-aj-brown-henderson-dolphins-miami-sunday', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Patriots rule out A.J. Brown and TreVeyon Henderson for Sunday''s game in Miami', 'With Brown out, New England has three healthy receivers on its 53-man roster for the 4:25 p.m. kickoff against the Dolphins at Hard Rock Stadium.', 'The Patriots will be without wide receiver A.J. Brown and running back TreVeyon Henderson when they visit the Miami Dolphins on Sunday afternoon.

The team ruled both players out on Saturday, along with offensive tackle Marcus Bryant, according to the Patriots'' injury report. New England is 4-3 after a 30-24 loss at Chicago on Oct. 22.

## Why they are out

Brown is dealing with ankle and knee injuries. He was limited in Wednesday''s practice and could not finish it, ESPN reported. He had already spent time on injured reserve with a high ankle sprain from the season opener.

Henderson, the No. 2 running back, missed Thursday and Friday practices with an illness, according to ESPN.

## Roster moves

The Patriots signed running back Lan Larison from the practice squad and elevated wide receiver Ryan Miller for the game, ESPN reported. That leaves DeMario "Pop" Douglas, Kyle Williams and Efton Chism III as the healthy receivers on the 53-man roster. Rhamondre Stevenson leads the backfield.

## Injury report

| Team | Out | Questionable |
| --- | --- | --- |
| Patriots | WR A.J. Brown, RB TreVeyon Henderson, T Marcus Bryant | CB Carlton Davis III, LB Christian Elliss |
| Dolphins | G/T Kadyn Proctor | CB JuJu Brents, CB Reese Taylor |

Quarterback Drake Maye practiced fully Friday and carries no game status.

## How to watch

Kickoff is 4:25 p.m. on CBS (WBZ in Boston) and 98.5 FM, according to the team schedule. The Patriots host Green Bay on Nov. 8.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-11-01.sql', 7, 0, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-patriots-dolphins-src1', 'bd-20261101-patriots-dolphins', 'Week 8 Injury Report: Patriots at Dolphins', 'https://www.patriots.com/news/week-8-injury-report-patriots-at-dolphins-x9227', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-patriots-dolphins-src2', 'bd-20261101-patriots-dolphins', 'Patriots 2026 Schedule', 'https://www.patriots.com/schedule/', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-patriots-dolphins-src3', 'bd-20261101-patriots-dolphins', 'Patriots rule out A.J. Brown, TreVeyon Henderson vs. Dolphins', 'https://www.espn.com/nfl/story/_/id/50337296/patriots-rule-aj-brown-treveyon-henderson-vs-dolphins', 'ESPN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-patriots-dolphins-ev1', 'bd-20261101-patriots-dolphins', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-bruins-blackhawks', 'bruins-rally-from-two-down-beat-blackhawks-5-4-overtime-lindholm', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins erase a two-goal deficit late and beat the Blackhawks 5-4 on Lindholm''s overtime winner', 'Morgan Geekie tied it in the final seconds of regulation, snapping Boston''s two-game skid. The Atlantic Division leaders host Vegas on Monday.', 'The Bruins trailed by two goals with less than eight minutes left on Saturday afternoon. They left TD Garden with a 5-4 overtime win over the Chicago Blackhawks.

Elias Lindholm scored the winner early in overtime, set up by Charlie McAvoy, according to ESPN and Second City Hockey. The win ended a two-game losing streak after road defeats at Carolina and St. Louis.

## The comeback

Chicago went up 4-2 on goals from Ryan Greene and Connor Bedard midway through the third period. Mason Lohrei answered less than a minute after Bedard''s goal, and Morgan Geekie tied the game with seconds left in regulation, ESPN''s scoring summary shows.

| Period | Chicago | Boston |
| --- | --- | --- |
| 1st | Anton Frondell (PP) | David Pastrnak |
| 2nd | Frondell | Casey Mittelstadt |
| 3rd | Greene, Bedard | Lohrei, Geekie |
| OT | | Lindholm |

Pastrnak''s goal was his eighth of the season. Frondell scored twice for Chicago.

## By the numbers

Chicago outshot Boston 41-32, Second City Hockey reported. Patrick Kane picked up an assist on Frondell''s first goal, his 900th career assist, according to NESN.

The Bruins are 10-4-1 with 21 points, first in the Atlantic Division, according to ESPN. Chicago fell to 4-9-1.

## Up next

The Bruins host the Vegas Golden Knights on Monday, Nov. 2, at 7 p.m., NESN reported.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-11-01.sql', 6, 0, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-bruins-blackhawks-src1', 'bd-20261101-bruins-blackhawks', 'Bruins 5-4 Blackhawks (Oct 31, 2026) Final Score', 'https://www.espn.com/nhl/game/_/gameId/401892614', 'ESPN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-bruins-blackhawks-src2', 'bd-20261101-bruins-blackhawks', 'Blackhawks at Bruins, October 31, 2026 NHL Recap', 'https://www.secondcityhockey.com/chicago-blackhawks-boston-bruins-october-31-2026-regular-season-result-score-recap-highlights/', 'Second City Hockey', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-bruins-blackhawks-src3', 'bd-20261101-bruins-blackhawks', 'Bruins vs. Blackhawks score, highlights from NHL game', 'https://nesn.com/boston-bruins/news/bruins-vs-blackhawks-score-updates-highlights-nhl-game/9b51805b45907a5df38c9229', 'NESN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-bruins-blackhawks-ev1', 'bd-20261101-bruins-blackhawks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261101-notre-dame-navy-final', 'notre-dame-pulls-away-from-navy-35-13-gillette-stadium', 'newsroom', 'news_story', 'college-football', 'EDITORIAL_REVIEW', 0, 'No. 5 Notre Dame shakes off an early Navy lead and wins 35-13 at Gillette Stadium', 'Nolan James Jr. ran for two touchdowns and Marcus Freeman earned his 50th win as the Irish improved to 7-1 ahead of a home game against No. 1 Miami.', 'Navy led No. 5 Notre Dame late in the first half in Foxborough on Saturday. The Fighting Irish scored the game''s last 28 points and won 35-13 at Gillette Stadium.

Jackson Gutierrez''s 2-yard run gave Navy a 13-7 lead with 1:52 left in the second quarter, ESPN reported. Less than a minute later, Nolan James Jr. broke a 52-yard touchdown run to put Notre Dame ahead to stay.

## How it unfolded

| Team | 1st | 2nd | 3rd | 4th | Final |
| --- | --- | --- | --- | --- | --- |
| Notre Dame | 7 | 7 | 14 | 7 | 35 |
| Navy | 3 | 10 | 0 | 0 | 13 |

Jonaz Walton scored on a 3-yard run and James added a 23-yard touchdown run in the third quarter, according to the South Bend Tribune. CJ Carr threw touchdown passes of 11 yards to Micah Gilbert and 31 yards to Jerome Bettis Jr.

## Key numbers

- James: 9 carries, 107 yards, 2 TDs
- Carr: 210 passing yards, 2 TDs
- Gutierrez: 28 carries, 110 yards for Navy
- Navy managed 56 total yards in the second half.

Figures are from ESPN.

The win was the 50th for Marcus Freeman as Notre Dame''s coach. Navy fell to 2-6.

## Next up

Notre Dame, now 7-1, hosts No. 1 Miami next Saturday. Navy hosts Temple, according to ESPN.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/0/0a/US_Navy_081115-N-4565G-559_Midshipman_Ricky_Dobbs_(%5E4)_dives_across_the_pile_for_a_4-yard_gain_during_the_fourth_quarter_of_the_Saturday,_Nov._15,_2008_college_football_game_between_the_U.S._Naval_Academy_and_the_University_of.jpg', 'Navy and Notre Dame meet in a 2008 game (file). Photo: U.S. Navy / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-11-01.sql', 6, 0, 'newsroom-assistant', '2026-11-01T11:00:00.000Z', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-notre-dame-navy-final-src1', 'bd-20261101-notre-dame-navy-final', 'Notre Dame 35-13 Navy (Oct 31, 2026) Game Recap', 'https://www.espn.com/college-football/recap?gameId=401859185', 'ESPN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261101-notre-dame-navy-final-src2', 'bd-20261101-notre-dame-navy-final', 'Notre Dame football vs. Navy', 'https://sports.yahoo.com/articles/notre-dame-football-vs-navy-200725370.html', 'South Bend Tribune (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-01T11:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-01. Editor to confirm.', 'newsroom-assistant', '2026-11-01T11:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261101-notre-dame-navy-final-ev1', 'bd-20261101-notre-dame-navy-final', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-11-01T11:00:00.000Z');
