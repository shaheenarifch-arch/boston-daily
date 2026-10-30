-- Newsroom drafts for 2026-10-30. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
-- Wikimedia Commons (API and file pages) was unreachable from the newsroom sandbox on this run, so only U.S. National Archives / White House files were used, with URLs built from the file names. Editor: confirm each photo loads and matches its caption.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-trump-telerallies', 'trump-cancels-kansas-iowa-rallies-telerallies-rock-hill-graham', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump swaps weekend rallies in Kansas and Iowa for telephone events after Rock Hill stop for Darline Graham', 'The RNC calls it a "72-hour sprint" of telerallies in nearly 20 states. In South Carolina, Trump spent about 90 minutes making the case for Graham in a race polls show tied.', 'President Trump has canceled in-person rallies planned for Kansas on Saturday and Iowa on Sunday and will instead campaign by phone through the final weekend before Tuesday''s midterm elections, The Associated Press reported.

The Republican National Committee announced Thursday evening what it called a "72-hour sprint" of telerallies, with nearly 20 states on the list so far, according to the AP. Each call is expected to last about 10 minutes.

Asked whether his health played a role in skipping Kansas, Trump told reporters, "I feel perfect," the AP reported. The AP noted that his voice has grown raspy and that he held 25 rallies in October, short of a goal of more than 30.

## A stop in Rock Hill

Earlier Thursday, Trump spoke for roughly 90 minutes in Rock Hill, S.C., for Sen. Darline Graham, who was appointed to the seat of her late brother, Lindsey Graham, according to the Rock Hill Herald. Fox News reported it was his first visit to the city as president.

Trump praised Graham and criticized Democrat Annie Andrews over guns, policing, taxes, energy and gender-affirming care, the Herald reported. Graham told the crowd she is the only conservative in the race and warned that votes for anyone outside the Republican ticket could help Democrats win the Senate.

A New York Times/Siena poll released Wednesday showed the race tied. South Carolina Public Radio reported that several people in line said they came mainly to see Trump. Rep. Ralph Norman, whom Graham defeated for the nomination, did not attend, and his son Warren has endorsed Andrews, SCPR reported.

## The final stretch

| When | What |
| --- | --- |
| Friday | Trump rally in Daytona Beach, Fla. |
| Saturday to Monday | Trump telerallies in nearly 20 states |
| Tuesday, Nov. 3 | Election Day |', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/President_Donald_Trump_boards_Air_Force_One_at_Gimhae_International_Airport_(54890669398).jpg/1280px-President_Donald_Trump_boards_Air_Force_One_at_Gimhae_International_Airport_(54890669398).jpg', 'President Trump boards Air Force One (file). Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-30.sql', 9, 1, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-trump-telerallies-src1', 'bd-20261030-trump-telerallies', 'Trump cancels Iowa rally in favor of "72-hour sprint" of telerallies, bristles at health question: "I feel perfect"', 'https://www.cbsnews.com/minnesota/news/trump-cancels-iowa-kansas-rallies-telerallies-midterms/', 'The Associated Press (via CBS News Minnesota)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-trump-telerallies-src2', 'bd-20261030-trump-telerallies', 'Trump rallies for Graham in SC, attacks Dems amid surprisingly tight Senate race', 'https://www.yahoo.com/news/politics/articles/trump-rallies-graham-sc-attacks-201937751.html', 'Rock Hill Herald', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-trump-telerallies-src3', 'bd-20261030-trump-telerallies', 'In Rock Hill, a Trump rally for Graham is more about Trump', 'https://www.southcarolinapublicradio.org/sc-news/2026-10-29/in-rock-hill-a-trump-rally-for-graham-is-more-about-trump', 'South Carolina Public Radio', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-trump-telerallies-src4', 'bd-20261030-trump-telerallies', '2026 Midterms: Trump Heads to South Carolina as Race Tightens', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-south-carolina-ohio-october-29', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-trump-telerallies-ev1', 'bd-20261030-trump-telerallies', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-carter-ballots', 'judge-carter-rejects-doj-bid-set-aside-20000-california-ballots', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Federal judge refuses Justice Department request to hold back up to 20,000 California mail ballots', 'Judge David O. Carter warned that separating the ballots would disrupt the midterms. The department says it will appeal.', 'A federal judge in California has rejected the Trump administration''s request to stop the state from processing mail ballots tied to as many as 20,000 voters the Justice Department says may not be citizens.

U.S. District Judge David O. Carter ruled Wednesday in a 26-page decision, CBS News reported. He warned that setting the ballots aside would "wreak havoc" on the midterm elections and risk disenfranchising eligible voters, according to Fox News. The Justice Department said it would appeal, Fox reported.

## How the case got here

The administration sued California and Los Angeles County on Oct. 15 after they declined to separate the flagged ballots, NBC Los Angeles reported. The department asked that ballots from people on a federal list be held until their citizenship could be checked.

On Monday, a federal appeals panel voted 2-1 against the department''s emergency request, saying it could not act because Carter had not yet ruled, according to NBC Los Angeles. Judge Mark Bennett, writing for the majority, said part of the delay was the government''s own doing. Judge Patrick Bumatay dissented, arguing the federal government has an interest in protecting federal elections.

## What each side says

California''s secretary of state''s office said federal officials claimed in July that 19,000 noncitizens were on the state''s rolls but provided no proof when asked, NBC Los Angeles reported. Attorney General Rob Bonta said voter fraud is exceedingly rare.

Carter had earlier dismissed a separate Justice Department bid to force California to turn over its full voter registration list.

Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/1/1a/California_-_Los_Angeles_-_NARA_-_23934521_(cropped).jpg', 'Los Angeles (file). Photo: U.S. National Archives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-30.sql', 8, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-carter-ballots-src1', 'bd-20261030-carter-ballots', '2026 Midterms: Trump Heads to South Carolina as Race Tightens (California ballots item)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-south-carolina-ohio-october-29', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-carter-ballots-src2', 'bd-20261030-carter-ballots', 'Live Midterm Election Updates (California ballots item)', 'https://www.cbsnews.com/live-updates/2026-elections-midtems-house-senate-trump/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-carter-ballots-src3', 'bd-20261030-carter-ballots', 'Trump administration case over LA County mail ballots', 'https://www.nbclosangeles.com/news/local/trump-administration-la-county-california/3961194/', 'NBC Los Angeles', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-carter-ballots-ev1', 'bd-20261030-carter-ballots', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-alaska-sullivans', 'alaska-dunleavy-orders-probe-two-dan-sullivans-senate-ballot', 'newsroom', 'news_story', 'states', 'EDITORIAL_REVIEW', 0, 'Alaska governor orders state probe of the second Dan Sullivan on the Senate ballot', 'Gov. Mike Dunleavy asked state police to look into whether the candidacy was meant to mislead voters. Mary Peltola''s campaign denies any role.', 'Alaska Gov. Mike Dunleavy has directed the state Department of Public Safety to investigate whether an effort to put a second Dan Sullivan on the U.S. Senate ballot broke state law, Newsweek reported.

The Republican governor acted Wednesday and said reporting by The New York Times largely supported earlier findings by the state elections division, according to Newsweek. The probe will also weigh whether criminal charges or civil action are warranted.

## Who is on the ballot

The race pits Sen. Dan S. Sullivan, a Republican, against Democrat Mary Peltola, a former congresswoman. Also listed are Daniel J. Sullivan Jr., a retired teacher from Petersburg with no party label on the ballot, and Republican Gerald Heikes. Alaska uses ranked-choice voting.

State election officials removed Sullivan Jr. from the ballot in June, finding he filed to confuse or mislead voters, but state courts reversed that decision, Newsweek reported. He has said he entered the race on his own because he was unhappy with the incumbent.

## The response

Trump said Tuesday that Peltola and the other Sullivan should be prosecuted, CBS News reported. Peltola''s campaign says it did not recruit any candidates, and the Democratic Senatorial Campaign Committee also denied involvement, according to Newsweek.

Separately, the Justice Department has sued over the race, and Alaska''s Department of Law asked a federal judge on Oct. 26 to dismiss that case.

## The polls

| Poll | Peltola | Sullivan |
| --- | --- | --- |
| NYT/Siena (Sept. 24 to Oct. 1) | 50% | 43% |
| InsiderAdvantage (Oct. 9 to 10) | 50% | 48% |

*Source: Newsweek.*', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Kiksetti_Totem._Representing_Kiksetti,_Kalteen_and_Shadesty_families._Erected_Wrangell,_Alaska,_1894._-_NARA_-_297733.jpg', 'A totem pole in Wrangell, Alaska, photographed in the 1890s (file). Photo: U.S. National Archives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-30.sql', 7, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-alaska-sullivans-src1', 'bd-20261030-alaska-sullivans', 'Dan Sullivan Controversy: DOJ Escalates Alaska Election Probe With New Subpoenas', 'https://newsweek.com/mary-peltola-dan-sullivan-alaska-governor-mike-dunleavy-12636664', 'Newsweek', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-alaska-sullivans-src2', 'bd-20261030-alaska-sullivans', 'Live Midterm Election Updates (Alaska Senate items)', 'https://www.cbsnews.com/live-updates/2026-elections-midtems-house-senate-trump/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-alaska-sullivans-ev1', 'bd-20261030-alaska-sullivans', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-georgia-early-vote', 'georgia-breaks-midterm-early-in-person-voting-record-last-day-friday', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Georgia passes its midterm record for early in-person voting with one day left', 'More than 2.29 million Georgians had voted in person by Thursday afternoon. Early voting ends at 7 p.m. Friday.', 'Georgia set a new midterm record for early in-person voting on Thursday, a day before the early voting period closes, according to Atlanta News First and CBS News Atlanta.

As of 1:35 p.m. Thursday, 2,294,275 voters had cast ballots in person, edging past the 2022 total of 2,289,951, Atlanta News First reported. More than 108,000 absentee ballots had also been accepted, CBS News Atlanta reported.

Counting mail ballots, more than 30% of the state''s roughly 7.5 million active registered voters had already voted, according to Atlanta News First.

## By the numbers

| Measure | Figure |
| --- | --- |
| Early in-person votes, 2026 (Thursday, 1:35 p.m.) | 2,294,275 |
| Early in-person votes, 2022 midterm | 2,289,951 |
| Absentee ballots accepted | 108,000+ |
| Women''s share of early ballots | 56% |

Secretary of State Brad Raffensperger credited local election officials and voter confidence, Atlanta News First reported.

## What is on the ballot

Sen. Jon Ossoff, a Democrat, faces Republican Rep. Mike Collins. Ossoff is the only Democratic senator running in a state President Trump won in 2024, CBS News Atlanta noted. The governor, lieutenant governor, secretary of state and attorney general races all have new candidates.

In the governor''s race, Democrat Keisha Lance Bottoms faces Republican Rick Jackson, Fox News reported. Former President Barack Obama campaigned with Ossoff and Bottoms on Wednesday in Morrow.

## If you still need to vote

Early voting runs until 7 p.m. Friday at designated sites in a voter''s home county, CBS News Atlanta reported. Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-30.sql', 6, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-georgia-early-vote-src1', 'bd-20261030-georgia-early-vote', 'Georgia breaks midterm record for early in-person voting as turnout nears 2.3 million', 'https://www.atlantanewsfirst.com/2026/10/29/georgia-breaks-midterm-record-early-in-person-voting-turnout-nears-23-million/', 'Atlanta News First', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-georgia-early-vote-src2', 'bd-20261030-georgia-early-vote', 'Georgia breaks early in-person voting record for midterm election', 'https://www.cbsnews.com/atlanta/news/georgia-breaks-early-in-person-voting-record-for-midterm-election-as-polling-places-see-high-turnout/', 'CBS News Atlanta', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-georgia-early-vote-src3', 'bd-20261030-georgia-early-vote', '2026 Midterms: Trump Heads to South Carolina as Race Tightens (Obama in Georgia item)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-south-carolina-ohio-october-29', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-georgia-early-vote-ev1', 'bd-20261030-georgia-early-vote', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-gas-halloween', 'gas-falls-to-4-23-before-halloween-oil-above-100-aaa', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Gas slips to $4.23 heading into Halloween, but $100 oil keeps a floor under prices', 'The national average fell about 5 cents in a week, AAA says. It is still about $1.19 higher than a year ago.', 'The national average price for a gallon of regular gasoline fell to $4.23 on Thursday, down about 5 cents from a week earlier, according to AAA.

The auto club said crude oil prices above $100 a barrel are limiting how far pump prices can fall. U.S. benchmark crude rose $2.88 on Wednesday to settle at $102.78, AAA reported.

## How prices compare

| Date | National average |
| --- | --- |
| Thursday | $4.23 |
| One week ago | $4.27 |
| One month ago | $4.46 |
| One year ago | $3.04 |

## Supply and demand

Federal data cited by AAA showed gasoline demand fell to 8.38 million barrels a day from 8.98 million the week before. Total gasoline supply rose to 209.2 million barrels from 205.3 million, while domestic crude inventories dropped 1.9 million barrels to 410.6 million, about 4% below the five-year average.

## Highest and lowest states

| Most expensive | Price | Least expensive | Price |
| --- | --- | --- | --- |
| California | $5.94 | North Carolina | $3.42 |
| Hawaii | $5.65 | Georgia | $3.61 |
| Nevada | $5.25 | Texas | $3.70 |
| Washington | $5.24 | South Carolina | $3.72 |
| Oregon | $4.83 | Louisiana | $3.74 |

## Electric vehicles

The average cost at public EV chargers held at 41 cents per kilowatt-hour, AAA said. Hawaii was highest at 55 cents and Kansas lowest at 31 cents.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/d/de/SOME_MOTORISTS_RAN_OUT_OF_GAS_SUCH_AS_THIS_MAN_IN_PORTLAND_AND_HAD_TO_STAND_IN_LINE_WITH_A_GAS_CAN_DURING_THE_FUEL..._-_NARA_-_555460.jpg', 'A motorist waits with a gas can during the 1973 fuel shortage in Portland, Ore. (file). Photo: U.S. National Archives (DOCUMERICA) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-30.sql', 6, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-gas-halloween-src1', 'bd-20261030-gas-halloween', 'Gas Prices Dip Before Halloween', 'https://gasprices.aaa.com/gas-prices-dip-before-halloween/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-gas-halloween-ev1', 'bd-20261030-gas-halloween', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-bruins-blues', 'blues-beat-bruins-4-1-hofer-31-saves-blackhawks-next', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Hofer stops 31 shots as Blues beat Bruins 4-1, leaving Boston winless on a two-game trip', 'James Hagens scored first for Boston, but St. Louis answered with four straight goals. The Bruins host Chicago on Saturday afternoon.', 'The St. Louis Blues beat the Bruins 4-1 on Thursday night at Enterprise Center, sending Boston home without a win from a two-game road trip.

James Hagens put the Bruins ahead 5:28 into the game, with an assist from Casey Mittelstadt, according to The Associated Press. Jimmy Snuggerud tied it on a power play late in the first period, ending a Blues scoring drought of more than 138 minutes.

Philip Broberg and Robert Thomas scored in the second period for a 3-1 lead, and Jake Neighbours added a power-play goal in the third. Thomas finished with a goal and two assists, the AP reported.

## In goal

| Goalie | Team | Saves | Shots |
| --- | --- | --- | --- |
| Joel Hofer | Blues | 31 | 32 |
| Jeremy Swayman | Bruins | 14 | 18 |

*Source: Sports Illustrated''s Bruins On SI.*

Boston outshot St. Louis by a wide margin but could not solve Hofer. The loss was the Bruins'' second in a row and dropped them to 9-4-1, Sports Illustrated reported.

## Up next

The Bruins host the Chicago Blackhawks at TD Garden on Saturday at 1 p.m. ET, on NESN. The Blues visit the Detroit Red Wings on Saturday.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-30.sql', 6, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-bruins-blues-src1', 'bd-20261030-bruins-blues', 'Thomas, Broberg lead Blues to 4-1 win over Bruins', 'https://whdh.com/sports/thomas-broberg-lead-blues-to-4-1-win-over-bruins/', 'The Associated Press (via WHDH)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-bruins-blues-src2', 'bd-20261030-bruins-blues', 'Bruins Go Winless in Road Trip With Loss to Blues', 'https://www.si.com/nhl/bruins/onsi/news/bruins-go-winless-in-road-trip-with-loss-to-blues', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-bruins-blues-ev1', 'bd-20261030-bruins-blues', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-patriots-thursday', 'patriots-henderson-aj-brown-miss-thursday-practice-dolphins-boston-weekend', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Henderson and A.J. Brown sit out Thursday practice as Patriots prepare for Miami', 'TreVeyon Henderson missed practice with an illness. Drake Maye was a full participant again. Here is the Boston sports weekend.', 'Running back TreVeyon Henderson and receiver A.J. Brown did not practice Thursday as the Patriots prepared for Sunday''s trip to Miami, according to SB Nation''s Pats Pulpit.

Henderson was listed with an illness. Brown, who was limited Wednesday with ankle and knee injuries according to the team''s official report, did not take part Thursday, leaving his status for Sunday uncertain, Pats Pulpit reported.

Quarterback Drake Maye, listed with a right shoulder injury, was a full participant both days.

## Thursday report

| Status | Patriots |
| --- | --- |
| Did not practice | RB TreVeyon Henderson (illness), WR A.J. Brown (ankle, knee) |
| Limited | T Morgan Moses (foot), G Ben Brown (knee), DT DaQuan Jones (back) |
| Full | QB Drake Maye, S Kevin Byard, CB Carlton Davis III, LB Dre''Mont Jones, LB Christian Elliss and others |

For Miami, tackle Kadyn Proctor did not practice because of a concussion, and quarterback Malik Willis was a full participant while listed with a groin injury, Pats Pulpit reported.

Kickoff at Hard Rock Stadium is set for 4:25 p.m. ET on Sunday.

## The Boston sports weekend

| Day | Game | Time (ET) |
| --- | --- | --- |
| Friday | Bulls at Celtics, TD Garden | 7:30 p.m., NBC Sports Boston |
| Saturday | Blackhawks at Bruins, TD Garden | 1 p.m., NESN |
| Sunday | Patriots at Dolphins, Hard Rock Stadium | 4:25 p.m. |

The Celtics enter Friday at 3-1 on a three-game winning streak, while the Bulls are 1-4, according to Fubo''s game listing.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-30.sql', 7, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-patriots-thursday-src1', 'bd-20261030-patriots-thursday', 'Official New England Patriots Injury and Practice Participation Reports', 'https://www.patriots.com/team/injury-report/', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-patriots-thursday-src2', 'bd-20261030-patriots-thursday', 'Patriots vs. Dolphins Thursday injury report: TreVeyon Henderson, A.J. Brown sidelined', 'https://sports.yahoo.com/articles/patriots-vs-dolphins-thursday-injury-205109108.html', 'SB Nation (Pats Pulpit, via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-patriots-thursday-src3', 'bd-20261030-patriots-thursday', 'Chicago Bulls at Boston Celtics: where to watch (Oct. 30, 2026)', 'https://www.fubo.tv/news/nba/chicago-bulls-at-boston-celtics-where-to-watch-stream-info-tv-channel-and-live-updates-october-30-2026/', 'Fubo', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-patriots-thursday-src4', 'bd-20261030-patriots-thursday', 'Bruins Go Winless in Road Trip With Loss to Blues', 'https://www.si.com/nhl/bruins/onsi/news/bruins-go-winless-in-road-trip-with-loss-to-blues', 'Sports Illustrated', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-patriots-thursday-ev1', 'bd-20261030-patriots-thursday', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261030-packers-panthers', 'packers-beat-panthers-27-19-thursday-night-watson-returns-hospital', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Christian Watson returns from a hospital trip to lead Packers past Panthers 27-19', 'Jordan Love threw three touchdown passes and Green Bay sacked Bryce Young six times on Thursday night.', 'The Green Bay Packers beat the Carolina Panthers 27-19 on Thursday night at Lambeau Field, with receiver Christian Watson coming back from a first-half trip to the hospital to lead all receivers.

Watson was hurt after a 53-yard catch and left in an ambulance for precautionary tests on a chest injury, according to USA Today Sports. The tests came back clear and he returned in the third quarter, NFL.com reported. He finished with eight catches for 113 yards.

## How it went

Carolina led 10-6 in the first quarter after recovering a fumbled opening kickoff and a Chuba Hubbard touchdown run. Green Bay then pulled ahead and built a 17-point lead in the third quarter before the Panthers cut it to one score with about five minutes left, NFL.com reported.

Josh Jacobs scored twice, once rushing and once receiving. Matthew Golden and Tucker Kraft each caught a touchdown pass.

## Key numbers

| Player | Line |
| --- | --- |
| Jordan Love, GB | 30 of 41, 288 yards, 3 TD, 1 INT |
| Christian Watson, GB | 8 catches, 113 yards |
| Bryce Young, CAR | 23 of 41, 209 yards, 1 TD, 1 INT |
| Chuba Hubbard, CAR | 22 carries, 81 yards, 1 TD |

*Source: USA Today Sports.*

Green Bay''s defense sacked Young six times, Agence France-Presse reported, though the Packers turned the ball over three times and averaged 2.5 yards per carry.

## Standings

The Packers improved to 5-3 but remain last in the NFC North, according to AFP. The Panthers fell to 3-4 and still lead the NFC South.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-30.sql', 5, 0, 'newsroom-assistant', '2026-10-30T10:30:00.000Z', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-packers-panthers-src1', 'bd-20261030-packers-panthers', 'Panthers-Packers on Thursday Night Football: What We Learned from Green Bay''s 27-19 win', 'https://www.nfl.com/news/panthers-packers-on-thursday-night-football-what-we-learned-from-green-bay-s-27-19-win', 'NFL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-packers-panthers-src2', 'bd-20261030-packers-panthers', 'Christian Watson''s incredible return stole the show. Packers vs Panthers takeaways', 'https://sports.yahoo.com/articles/thursday-night-football-live-updates-200049466.html', 'USA Today Sports (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261030-packers-panthers-src3', 'bd-20261030-packers-panthers', 'Packers beat Panthers 27-19 as Watson returns from hospital', 'https://sports.yahoo.com/articles/packers-beat-panthers-27-19-040223751.html', 'Agence France-Presse (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-30T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-30. Editor to confirm.', 'newsroom-assistant', '2026-10-30T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261030-packers-panthers-ev1', 'bd-20261030-packers-panthers', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-30T10:30:00.000Z');
