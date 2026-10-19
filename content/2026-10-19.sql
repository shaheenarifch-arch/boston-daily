-- Newsroom drafts for 2026-10-19. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain (Library of Congress) with credit; stories without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-russia-waiver', 'trump-waives-graham-act-russia-sanctions-republican-backlash', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump waives most of new Russia sanctions law, drawing fire from both parties', 'An order signed Friday sets aside penalties Congress passed in September. Several Republican senators said the move was a mistake.', 'President Donald Trump has waived most of the penalties in a Russia sanctions law he signed a month ago, an order that has drawn criticism from lawmakers in both parties.

The executive order, signed Friday and posted by the White House on Saturday, puts into effect the Lindsey O. Graham Sanctioning Russia and Iran Act of 2026 and then waives most of it. The law''s penalties were due to take effect on Oct. 18.

## What the order does

According to the order''s text on WhiteHouse.gov:

- It sets 500% duties on Russian goods and 100% duties on the top buyers of Russian oil and gas, then waives those duties.
- It waives most of the law''s other sanctions, citing the national interest.
- The waivers have no end date and stay in place until the president or the secretary of state changes them.
- Russia sanctions imposed under earlier executive orders are not affected.

ABC News reported it is the second such waiver in two weeks and that the administration has tied the moves to easing diesel prices.

## The reaction

Trump told reporters Saturday it was "a very good decision," Fox Business reported. A White House spokesperson told ABC News the law gives the president tools to pursue peace.

Critics included Republicans. Sen. Thom Tillis called the move "beyond irresponsible," and Sen. Ted Cruz said it was a mistake, according to ABC News and Fox Business. On CBS''s "Face the Nation" on Sunday, Rep. Mike Turner of Ohio said the waiver should be reversed and examined by Congress.

Democrats, including Senate Minority Leader Chuck Schumer, also condemned it. Rep. Thomas Massie, a Kentucky Republican, welcomed the waiver, Fox Business reported.

Ukrainian President Volodymyr Zelenskyy said the step only fuels Russia''s desire to keep fighting, ABC News reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Exterior_of_the_north_portico_and_driveway_of_the_White_House,_Washington,_D.C._LCCN96502756.jpg', 'The White House north portico. Photo: Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-19.sql', 9, 1, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-russia-waiver-src1', 'bd-20261019-russia-waiver', 'Implementing the Lindsey O. Graham Sanctioning Russia and Iran Act of 2026', 'https://www.whitehouse.gov/presidential-actions/2026/10/implementing-the-lindsey-o-graham-sanctioning-russia-and-iran-act-of-2026/', 'The White House', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-russia-waiver-src2', 'bd-20261019-russia-waiver', 'Trump signs order waiving Graham Act sanctions on Russia, drawing backlash from some lawmakers and Zelenskyy', 'https://abcnews.com/Politics/trump-signs-order-waiving-graham-act-sanctions-russia/story?id=137341529', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-russia-waiver-src3', 'bd-20261019-russia-waiver', 'Trump faces bipartisan backlash over Russia sanctions waiver', 'https://www.foxbusiness.com/politics/trump-faces-bipartisan-backlash-over-russia-sanctions-waiver-causing-top-republicans-break-ranks', 'Fox Business', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-russia-waiver-src4', 'bd-20261019-russia-waiver', 'Full transcript of "Face the Nation with Margaret Brennan," Oct. 18, 2026', 'https://www.cbsnews.com/news/face-the-nation-full-transcript-10-18-2026/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-russia-waiver-ev1', 'bd-20261019-russia-waiver', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-abc-post-poll', 'abc-washington-post-ipsos-poll-trump-approval-house-vote-october', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Poll: Trump approval hits a low as Democrats lead the House vote by 8', 'Two weeks before Election Day, an ABC News/Washington Post/Ipsos survey finds voters sour on prices, with gasoline at the top of the list.', 'President Donald Trump''s approval rating has fallen to the lowest point of either term in the ABC News/Washington Post/Ipsos poll, and Democrats hold an 8-point lead among likely voters in the race for the House, the poll''s sponsors reported Sunday.

## The numbers

| Measure | Result |
| --- | --- |
| Trump approval, all adults | 33% approve, 66% disapprove |
| Trump approval, registered voters | 37% approve, 63% disapprove |
| House vote, likely voters | Democrats 52%, Republicans 44% |
| House vote, registered voters | Democrats 50%, Republicans 42% |

The Democratic lead was 3 points in a July Post-Ipsos poll, according to ABC News.

## Prices drive the mood

Seventy-one percent of Americans now call gasoline unaffordable, up from 28% in February, ABC News reported. Majorities also said health care and groceries were unaffordable. Just 21% approve of Trump''s handling of the cost of living.

Republicans held a 5-point edge on crime in the survey, while Democrats led on health care, inflation and the economy. Immigration was roughly even.

USA Today noted that a Fox News poll released last week also showed Trump at a low point in that series.

## About the poll

The survey of 2,545 adults, including 2,032 registered and likely voters, was conducted Oct. 9-13 on Ipsos''s online KnowledgePanel. The margin of error is plus or minus 2 points for the full sample.

Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Aerial_of_the_U.S._Capitol_under_restoration,_Washington,_D.C_LCCN2010630859.jpg/1280px-Aerial_of_the_U.S._Capitol_under_restoration,_Washington,_D.C_LCCN2010630859.jpg', 'The U.S. Capitol from the air. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-19.sql', 8, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-abc-post-poll-src1', 'bd-20261019-abc-post-poll', 'Democrats lead Republicans in House vote choice as Trump''s approval rating hits record low: ABC/Post/Ipsos poll', 'https://abcnews.com/Politics/democrats-lead-republicans-house-vote-choice-trumps-approval/story?id=137322849', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-abc-post-poll-src2', 'bd-20261019-abc-post-poll', 'Trump''s approval rating hits record low in poll as midterms near', 'https://www.aol.com/articles/trumps-approval-rating-hits-record-125700000.html', 'USA Today (via AOL)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-abc-post-poll-ev1', 'bd-20261019-abc-post-poll', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-texas-senate', 'texas-senate-talarico-paxton-poll-early-voting-opens', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Texas Senate race is a dead heat as early voting opens', 'A new CBS News poll shows James Talarico and Ken Paxton within the margin of error. Both held rallies Sunday night.', 'Early voting began Monday in Texas with the U.S. Senate race between Democrat James Talarico and Republican Ken Paxton essentially tied.

A CBS News/YouGov poll found Talarico at 51% and Paxton at 49% among likely voters, within the margin of error, according to The Eastern Herald. CBS News elections director Anthony Salvanto described the race on "Face the Nation" on Sunday as about as tight as it can be.

The same poll showed Republican Gov. Greg Abbott leading Democrat Gina Hinojosa 52% to 48%, The Eastern Herald reported. Earlier polls this month from the University of Texas and Marist also showed Talarico narrowly ahead, The Texas Tribune reported.

## Closing arguments

Both candidates rallied Sunday evening. Talarico campaigned in Plano, in North Texas, while Paxton spoke in San Antonio, the Washington Examiner reported. The U.S. Chamber of Commerce endorsed Paxton the same day.

Voters who named the cost of living as their top issue favored Talarico, according to The Eastern Herald''s account of the poll.

## How to vote in Texas

| Key date | |
| --- | --- |
| Early voting | Oct. 19-30 |
| Mail ballot applications due | Oct. 23 |
| Election Day | Nov. 3 |

Texas has a record 19 million registered voters for this election, the Texas Secretary of State''s office announced last week.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Houston,Texas_by_Carol_M._Highsmith.jpg/1280px-Houston,Texas_by_Carol_M._Highsmith.jpg', 'Houston, Texas. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-19.sql', 7, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-texas-senate-src1', 'bd-20261019-texas-senate', 'Secretary Howden Announces Texas Has a Record 19 Million Registered Voters', 'https://www.sos.state.tx.us/about/newsreleases/2026/101626.shtml', 'Texas Secretary of State', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-texas-senate-src2', 'bd-20261019-texas-senate', 'Texas Senate poll: Talarico 51, Paxton 49 as early voting opens', 'https://easternherald.com/2026/10/18/texas-senate-poll-talarico-paxton-turnout/', 'The Eastern Herald', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-texas-senate-src3', 'bd-20261019-texas-senate', 'Full transcript of "Face the Nation with Margaret Brennan," Oct. 18, 2026', 'https://www.cbsnews.com/news/face-the-nation-full-transcript-10-18-2026/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-texas-senate-src4', 'bd-20261019-texas-senate', 'Chamber of Commerce endorses Paxton as he and Talarico host rallies ahead of Texas early voting', 'https://www.washingtonexaminer.com/news/campaigns/congressional/4770262/paxton-endorsement-talarico-rallies-texas-early-voting/', 'Washington Examiner', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-texas-senate-src5', 'bd-20261019-texas-senate', 'Texas Democrats leading Republicans in polls ahead of midterms', 'https://www.texastribune.org/2026/10/14/texas-democrats-leading-republicans-polls-midterms/', 'The Texas Tribune', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-texas-senate-ev1', 'bd-20261019-texas-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-gas-prices', 'gas-prices-oct-19-national-average-massachusetts-diesel', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'Gas dips to $4.30 a gallon, but drivers still pay $1.26 more than last year', 'Diesel remains about 21 cents below its September record, and Massachusetts prices track the national average, AAA data show.', 'The national average price of regular gasoline edged down to about **$4.30** a gallon on Monday, roughly 6 cents lower than a week ago but about $1.26 higher than a year ago, according to AAA.

Diesel averaged **$6.32**, about 21 cents below the record of $6.53 set on Sept. 22. A year ago it was $3.63.

## The numbers

| | Today | Week ago | Year ago |
| --- | --- | --- | --- |
| Regular, national | $4.30 | $4.36 | $3.04 |
| Diesel, national | $6.32 | $6.27 | $3.63 |
| Regular, Massachusetts | $4.27 | $4.32 | $3.02 |
| Diesel, Massachusetts | $6.33 | $6.33 | $3.82 |

Massachusetts figures are AAA''s most recent state reading. Regular gas nationally remains below its all-time high of $5.02, set in June 2022.

## Why prices stay high

In its weekly update on Thursday, AAA said crude oil remained expensive, with West Texas Intermediate settling at $95.09 a barrel. North Carolina had the cheapest gas in the country at $3.70, and California the most expensive at $6.23.

Prices at the pump have become a campaign issue. In an ABC News/Washington Post/Ipsos poll released Sunday, 71% of Americans called gasoline unaffordable, up from 28% in February, ABC News reported.

*Prices are AAA averages as of Oct. 19, 2026.*', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Old_gas_station_and_pumps_near_Pipe_Creek_in_Bandera_County,_Texas_LCCN2014631432.tif/lossy-page1-1280px-Old_gas_station_and_pumps_near_Pipe_Creek_in_Bandera_County,_Texas_LCCN2014631432.tif.jpg', 'Gas pumps near Pipe Creek, Texas. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-19.sql', 6, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-gas-prices-src1', 'bd-20261019-gas-prices', 'AAA Gas Prices: national average', 'https://gasprices.aaa.com/page/1', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-gas-prices-src2', 'bd-20261019-gas-prices', 'AAA Gas Prices: Massachusetts average', 'https://gasprices.aaa.com/page/2/?state=MA', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-gas-prices-src3', 'bd-20261019-gas-prices', 'Gas Prices Not Budging Much as Crude Oil Remains High', 'https://gasprices.aaa.com/gas-prices-not-budging-much-as-crude-oil-remains-high/', 'AAA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-gas-prices-src4', 'bd-20261019-gas-prices', 'Democrats lead Republicans in House vote choice as Trump''s approval rating hits record low', 'https://abcnews.com/Politics/democrats-lead-republicans-house-vote-choice-trumps-approval/story?id=137322849', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-gas-prices-ev1', 'bd-20261019-gas-prices', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-suspicious-letters', 'suspicious-letters-white-powder-election-offices-congress-fbi', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Suspicious letters reach election offices and lawmakers as FBI investigates', 'More Illinois offices reported envelopes over the weekend. Officials say most substances tested so far were harmless.', 'The FBI and the U.S. Postal Inspection Service are investigating a wave of suspicious letters sent to election offices and members of Congress in the final weeks before the Nov. 3 election.

The FBI said it was looking into a series of suspicious mailings to addresses around the country, including secretary of state and election offices, Votebeat reported. More than 100 letters were sent in all, according to Votebeat.

## Who received them

- At least 36 lawmakers from both parties had reported letters as of Friday, CNN reported. Recipients included Sens. Ted Cruz, Susan Collins, Kirsten Gillibrand and Raphael Warnock.
- Election offices in at least 10 states were targeted. Offices in Arizona, Louisiana and Oklahoma were evacuated, according to CNN.
- In Minnesota, an unidentified white powder was found in a letter to the secretary of state''s office, FOX 9 reported.

Over the weekend, The Record of Illinois'' North Shore reported that offices of several Illinois House members, including Reps. Jan Schakowsky and Brad Schneider, had also received envelopes. A hazardous materials team found nothing harmful at Schneider''s office, the paper reported.

## No injuries reported

No injuries have been reported, and in at least six cases the substance was found to be non-hazardous, CNN reported.

Election officials said voting would go on. Minnesota Secretary of State Steve Simon said his office "will not be deterred," according to FOX 9.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Potter_Stewart_U.S._Post_Office_and_Courthouse,_Cincinnati,_Ohio_LCCN2014630182.jpg/1280px-Potter_Stewart_U.S._Post_Office_and_Courthouse,_Cincinnati,_Ohio_LCCN2014630182.jpg', 'A U.S. post office and courthouse in Cincinnati. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-19.sql', 6, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-suspicious-letters-src1', 'bd-20261019-suspicious-letters', 'Suspicious letters sent to election officials nationwide weeks before the midterms', 'https://www.votebeat.org/national/2026/10/15/suspicious-letters-white-powder-election-officials-threats/', 'Votebeat', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-suspicious-letters-src2', 'bd-20261019-suspicious-letters', 'Suspicious substances mailed to dozens of election and congressional offices nationwide', 'https://krdo.com/politics/cnn-us-politics/2026/10/16/suspicious-letters-with-white-powder-sent-to-election-offices-in-multiple-states/', 'CNN (via KRDO)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-suspicious-letters-src3', 'bd-20261019-suspicious-letters', 'Local lawmakers receive "suspicious" envelopes reportedly as part of nationwide campaign', 'https://www.therecordnorthshore.org/2026/10/18/local-lawmakers-receive-suspicious-envelopes-reportedly-as-part-of-nationwide-campaign/', 'The Record North Shore', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-suspicious-letters-src4', 'bd-20261019-suspicious-letters', 'Unidentified white powder found in "suspicious" letter sent to Minnesota Secretary of State', 'https://www.fox9.com/news/unidentified-white-powder-suspicious-letter-sent-minnesota-secretary-state-oct-16-2026', 'FOX 9', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-suspicious-letters-ev1', 'bd-20261019-suspicious-letters', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-patriots-jets', 'patriots-beat-jets-26-19-maye-three-touchdowns-bears-next', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Patriots hold off Jets 26-19 for a third straight win', 'Drake Maye threw three touchdown passes. New England, now 4-2, visits the Bears on Thursday night.', 'Drake Maye threw three touchdown passes and the New England Patriots held on to beat the New York Jets 26-19 on Sunday at Gillette Stadium, their third win in a row.

The Patriots improved to 4-2. The Jets fell to 2-4.

## How it happened

New England led 17-3 at halftime. Maye hit Romeo Doubs for a 42-yard score in the first quarter, then found DeMario Douglas and Hunter Henry for touchdowns, according to the Boston Globe and theScore. Maye finished 18 of 32 for 235 yards with no interceptions.

Douglas led the Patriots with seven catches for 86 yards, but also lost a fumble. New England lost two fumbles in all, which helped the Jets climb back.

Jets quarterback Geno Smith threw for 252 yards, including a 48-yard touchdown to rookie Omar Cooper Jr. The Patriots recovered a late onside kick to seal it, Yahoo Sports reported.

A.J. Brown, back from a high ankle sprain, caught three of 10 targets for 27 yards, the Globe reported.

| Team stats | Patriots | Jets |
| --- | --- | --- |
| Total yards | 383 | 324 |
| Rushing yards | 148 | 97 |
| Third downs | 8 of 15 | 3 of 10 |

## Up next

The Patriots play at the Chicago Bears on **Thursday, Oct. 22, at 8:15 p.m. ET**, according to CBS Sports. Chicago is also 4-2 after beating Atlanta 31-23 on Sunday.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-19.sql', 8, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-patriots-jets-src1', 'bd-20261019-patriots-jets', 'Game Preview: Patriots vs. Jets | NFL Week 6', 'https://patriots.com/news/game-preview-patriots-vs-jets-nfl-week-6', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-patriots-jets-src2', 'bd-20261019-patriots-jets', 'Patriots 26, Jets 19: A.J. Brown struggles, but New England grinds out third straight win', 'https://www.bostonglobe.com/2026/10/18/sports/patriots-jets-live-score-updates/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-patriots-jets-src3', 'bd-20261019-patriots-jets', 'Jets at Patriots box score', 'https://www.thescore.com/nfl/event/140664', 'theScore', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-patriots-jets-src4', 'bd-20261019-patriots-jets', 'Patriots Hold Off Jets to Extend Winning Streak to Three Games', 'https://sports.yahoo.com/articles/patriots-hold-off-jets-extend-212123979.html', 'Yahoo Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-patriots-jets-src5', 'bd-20261019-patriots-jets', '2026 NFL Thursday Night Football schedule', 'https://fantasy-api.cbssports.com/nfl/news/2026-nfl-thursday-night-football-schedule/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-patriots-jets-src6', 'bd-20261019-patriots-jets', 'Bears at Falcons box score', 'https://www.thescore.com/nfl/event/140663', 'theScore', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-patriots-jets-ev1', 'bd-20261019-patriots-jets', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-rays-alcs', 'rays-beat-guardians-game-5-alcs-lead-3-2-game-6-tropicana', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Rays one win from World Series after Rasmussen silences Guardians', 'Tampa Bay took Games 4 and 5 in Cleveland and can clinch Monday night at home. Milwaukee awaits.', 'The Tampa Bay Rays are one win from the World Series after beating the Cleveland Guardians 3-1 on Sunday in Game 5 of the American League Championship Series. Tampa Bay leads the series 3-2.

Drew Rasmussen allowed one run on four hits over seven innings with six strikeouts, according to MLB.com. The Rays scored once in each of the first three innings, and Bryan Baker closed it out for his fifth save of the postseason.

The win followed a 7-3 Rays victory in Game 4 on Saturday that tied the series. Jonathan Aranda drove in two runs and Yandy Díaz hit a two-run homer in that game, CBS Sports and Bleacher Report reported.

## The series

| Game | Result |
| --- | --- |
| 1 | Guardians 7, Rays 3 |
| 2 | Rays 3, Guardians 1 |
| 3 | Guardians 3, Rays 2 |
| 4 | Rays 7, Guardians 3 |
| 5 | Rays 3, Guardians 1 |

## What''s next

Game 6 is **Monday, Oct. 19, at 8 p.m. ET** at Tropicana Field in St. Petersburg, Fla., on TBS, according to MLB.com. A Game 7, if needed, would be played there Tuesday.

The winner faces the Milwaukee Brewers, who swept the Dodgers for the National League pennant. Game 1 of the World Series is **Friday, Oct. 23**, in Milwaukee on FOX, MLB said. NBC Sports Boston lists an 8 p.m. ET start.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-19.sql', 7, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-rays-alcs-src1', 'bd-20261019-rays-alcs', 'Drew Rasmussen dominates as Rays win Game 5 of 2026 ALCS', 'https://www.mlb.com/news/drew-rasmussen-dominates-as-rays-win-game-5-of-2026-alcs', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-rays-alcs-src2', 'bd-20261019-rays-alcs', 'Broadcast schedule announced for the 2026 World Series presented by Capital One', 'https://www.mlb.com/news/press-release-broadcast-schedule-announced-for-the-2026-world-series-presented-by-capital-one', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-rays-alcs-src3', 'bd-20261019-rays-alcs', 'Rays even ALCS vs. Guardians: Winners and losers from Game 4', 'https://www.cbssports.com/mlb/news/guardians-rays-live-updates-alcs-game-4/live/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-rays-alcs-src4', 'bd-20261019-rays-alcs', 'Rays Beat Guardians in Game 4 to Even ALCS', 'https://bleacherreport.com/articles/25512560-rays-beat-guardians-game-4-even-alcs-box-score-stats-highlights-updated-mlb-playoff-bracket', 'Bleacher Report', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-rays-alcs-src5', 'bd-20261019-rays-alcs', 'World Series schedule 2026: start date and format', 'https://www.nbcsportsboston.com/mlb/world-series-schedule-start-date-format-2026/806191/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-rays-alcs-ev1', 'bd-20261019-rays-alcs', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261019-celtics-opener', 'celtics-open-season-at-pistons-tuesday-tatum-paul-george', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Celtics open the season Tuesday afternoon in Detroit', 'Paul George makes his Boston debut, and Jayson Tatum is expected to play. The home opener against the champion Knicks is Friday.', 'The Boston Celtics open the NBA season on **Tuesday, Oct. 20, at 3 p.m. ET** against the Detroit Pistons, the first game of the league''s opening-night tripleheader.

NBA.com billed the game as a meeting of last season''s top two seeds in the Eastern Conference. Detroit is led by guard Cade Cunningham.

## A new-look Boston roster

Paul George is set to make his Celtics debut alongside Jayson Tatum, according to NBA.com, which described the Boston roster as retooled. Jaylen Brown is now with Philadelphia.

Tatum is expected to play Tuesday, CBS Sports reported. He sat out Friday''s preseason finale, a 125-120 overtime win over the 76ers. Last season he returned from an Achilles injury and averaged 21.8 points and 10 rebounds in 16 games.

## Opening week

| Date | Game | Time (ET) |
| --- | --- | --- |
| Tue., Oct. 20 | Celtics at Pistons | 3 p.m. |
| Tue., Oct. 20 | 76ers at Knicks | 7 p.m. |
| Tue., Oct. 20 | Thunder at Spurs | 9:30 p.m. |
| Fri., Oct. 23 | Knicks at Celtics | 7 p.m. |

Tuesday''s games air on NBC and Peacock, NBC Boston reported. The Celtics'' home opener at TD Garden on Friday is against the defending champion New York Knicks, according to NBC Sports Boston.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-19.sql', 6, 0, 'newsroom-assistant', '2026-10-19T10:15:00.000Z', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-celtics-opener-src1', 'bd-20261019-celtics-opener', 'Starting 5: Regular season countdown, American Express Tip-Off guide', 'https://www.nba.com/news/starting-5-october-13-2026', 'NBA.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-celtics-opener-src2', 'bd-20261019-celtics-opener', 'Celtics to open NBA season on October 20th vs. Detroit', 'https://www.nbcsportsboston.com/nba/boston-celtics/celtics-schedule-opening-night-2026/798828/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-celtics-opener-src3', 'bd-20261019-celtics-opener', 'Celtics'' Jayson Tatum: Expected to suit up Tuesday', 'https://www.cbssports.com/fantasy/basketball/news/celtics-jayson-tatum-expected-to-suit-up-tuesday/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261019-celtics-opener-src4', 'bd-20261019-celtics-opener', 'NBA opening night schedule', 'https://www.nbcboston.com/nba/nba-opening-night-schedule-games-watch-knicks-spurs-sixers-thunder-celtics-pistons/3994942/?amp=1', 'NBC Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-19T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-19. Editor to confirm.', 'newsroom-assistant', '2026-10-19T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261019-celtics-opener-ev1', 'bd-20261019-celtics-opener', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-19T10:15:00.000Z');
