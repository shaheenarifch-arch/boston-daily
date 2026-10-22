-- Newsroom drafts for 2026-10-22. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain (government / Library of Congress origin) with credit; drafts without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-texas-senate', 'texas-senate-talarico-paxton-tied-fox-poll-early-vote', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Texas Senate race tied at 49% in new poll as early turnout surges', 'Neil Bush crosses party lines for Democrat James Talarico, while Elon Musk urges Texans to back Republican Ken Paxton.', 'A new Fox News poll finds Democrat James Talarico and Republican Ken Paxton tied at 49% among likely voters in the race for Texas''s open U.S. Senate seat, with Election Day 12 days away.

The survey of 1,398 likely voters has a margin of error of plus or minus 2.5 points, according to Fox News. The same voters said they prefer Republican control of the Senate, 51% to 47%. A Fox News poll taken in late September had Talarico at 51% and Paxton at 49%.

## Endorsements cross party lines

Neil Bush, a brother of former President George W. Bush, announced his support for Talarico in a social media post on Tuesday, Al Jazeera reported. He cited concerns about Paxton''s judgment and conduct, including the attorney general''s challenge to 2020 presidential election results in other states. Barbara Bush, the former president''s daughter, gave $2,500 to Lone Star Rising PAC, a group backing Talarico, according to Fox News.

On the other side, Elon Musk urged Texans on X to vote for Paxton, and the Trump-aligned super PAC MAGA Inc. has spent $46 million supporting him, Fox News reported. Talarico has accused Musk of trying to buy the seat.

Paxton ousted Sen. John Cornyn in a May 26 primary runoff after President Donald Trump endorsed him. Democrats have not won a U.S. Senate race in Texas since 1988, Al Jazeera noted.

## Turnout is running hot

Early voting in Texas is up 74% over the same point in 2022, according to an analysis by The Associated Press. In Travis County, home to Austin, nearly 41,000 people voted on the first day, Oct. 19, a first-day record for any midterm this century, KUT reported, citing Texas Secretary of State data.

| Key date | |
| --- | --- |
| Early voting ends | Friday, Oct. 30 |
| Election Day | Tuesday, Nov. 3 |', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/9/9a/The_Gaines_County_Courthouse_in_Seminole,_Texas_LCCN2014631702.jpg', 'The Gaines County Courthouse in Seminole, Texas. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-22.sql', 9, 1, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-texas-senate-src1', 'bd-20261022-texas-senate', '2026 Midterm Elections live updates (Oct. 21-22): Texas Fox News Poll, Musk, MAGA Inc. spending', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-south-carolina-democrats-october-21', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-texas-senate-src2', 'bd-20261022-texas-senate', 'Fox News Poll: It''s a Lone Star Senate showdown between Talarico and Paxton (Sept. poll)', 'https://www.foxnews.com/politics/fox-news-poll-its-lone-star-senate-showdown-between-talarico-paxton.print', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-texas-senate-src3', 'bd-20261022-texas-senate', 'Brother of George W. Bush endorses Democratic Senate candidate in Texas', 'https://www.aljazeera.com/news/2026/10/22/brother-of-george-bush-endorses-democratic-senate-candidate-in-texas', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-texas-senate-src4', 'bd-20261022-texas-senate', 'The Latest: early voting up sharply in Senate battlegrounds', 'https://clickorlando.com/news/politics/2026/10/21/the-latest-trump-vance-announce-25m-whistleblower-program-to-encourage-reporting-of-alleged-fraud', 'The Associated Press (via WKMG ClickOrlando)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-texas-senate-src5', 'bd-20261022-texas-senate', 'Travis County breaks first-day early voting turnout record for every midterm election this century', 'https://www.kut.org/austin/2026-10-20/travis-county-austin-tx-first-day-early-voting-turnout-midterm-election', 'KUT 90.5', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-texas-senate-ev1', 'bd-20261022-texas-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-scotus-bop', 'supreme-court-blocks-trump-prison-transgender-care-policy', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Supreme Court keeps block on Trump prison policy ending transgender inmates'' medical care', 'Justices Clarence Thomas and Samuel Alito would have let the Bureau of Prisons enforce the restrictions while the case goes on.', 'The Supreme Court on Wednesday turned down the Trump administration''s emergency request to enforce a Federal Bureau of Prisons policy restricting medical care for transgender people in federal custody.

The unsigned order leaves a lower-court block in place while the lawsuit continues. The court gave no explanation, Courthouse News Service reported. Justices Clarence Thomas and Samuel Alito would have granted the request, according to SCOTUSblog.

## What the policy would do

The 2026 policy grew out of a January 2025 executive order from President Donald Trump. It would halt surgeries, taper inmates off hormone therapy and end accommodations such as makeup and wigs, according to The Associated Press. Courthouse News reported that almost 1,000 people in federal custody would be affected.

## The arguments

Solicitor General D. John Sauer told the court the policy was needed for institutional security, Deseret News reported. The government also argued that hormone treatment and social accommodations are not medically necessary for gender dysphoria, according to Courthouse News.

The case was brought by three people in federal custody whom prison officials had diagnosed with gender dysphoria. Their suit argues the policy violates the Eighth Amendment''s ban on cruel and unusual punishment. The American Civil Liberties Union, which is challenging the policy, told the justices the request would upend a three-decade status quo.

A lower court found the administration lacked evidence that the treatments had caused security problems, Courthouse News reported.

| Case | Trump v. Kingdom, No. 26A416 |
| --- | --- |
| Came from | U.S. Court of Appeals for the D.C. Circuit |
| Result | Request denied; Thomas and Alito would have granted it |', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/1/19/McNeil_Island_Prison_-_NARA_-_299549.jpg', 'The former federal penitentiary on McNeil Island, Washington. Photo: U.S. National Archives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-22.sql', 8, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-scotus-bop-src1', 'bd-20261022-scotus-bop', 'Supreme Court won''t let Trump restrict gender-affirming care for transgender inmates', 'https://www.courthousenews.com/supreme-court-wont-let-trump-restrict-gender-affirming-care-for-transgender-inmates/', 'Courthouse News Service', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-scotus-bop-src2', 'bd-20261022-scotus-bop', 'Trump v. Kingdom (No. 26A416) case page', 'https://www.scotusblog.com/cases/trump-v-kingdom/', 'SCOTUSblog', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-scotus-bop-src3', 'bd-20261022-scotus-bop', 'Supreme Court blocks Trump administration from ending transgender medical care for prisoners', 'https://www.deseret.com/politics/2026/10/21/supreme-court-blocks-trump-administration-from-ending-transgender-medical-care-for-prisoners/', 'Deseret News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-scotus-bop-src4', 'bd-20261022-scotus-bop', 'The Latest: Supreme Court rebuffs Trump restrictions on medical care for trans inmates', 'https://clickorlando.com/news/politics/2026/10/21/the-latest-trump-vance-announce-25m-whistleblower-program-to-encourage-reporting-of-alleged-fraud', 'The Associated Press (via WKMG ClickOrlando)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-scotus-bop-ev1', 'bd-20261022-scotus-bop', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-ne-wind', 'trump-administration-new-england-wind-permit-reconsider', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Trump administration moves to reopen approval of New England Wind off Massachusetts', 'The Justice Department asked a federal judge to send the 2024 permit back to Interior, the fourth offshore wind project targeted recently.', 'The Trump administration has asked a federal judge to let the Interior Department reconsider its own 2024 approval of New England Wind, a proposed wind farm off the Massachusetts coast, according to The Associated Press.

In a filing Tuesday in U.S. District Court for the District of Columbia, the Justice Department argued the permit should go back to Interior because the project was approved despite major adverse impacts. The case was brought by ACK for Whales, a group of Nantucket residents who argue the government failed to follow numerous laws.

## The project

| Developer | Avangrid |
| --- | --- |
| Turbines | Up to 129 |
| Capacity | Up to 2,600 megawatts |
| Homes powered | More than 900,000 a year |
| Status | Construction has not begun |

Avangrid declined to comment, the AP reported. Interior said the filing met a court briefing schedule and did not announce a policy change, according to The Boston Globe.

## A pattern along the coast

The administration is also seeking to revisit approvals for Revolution Wind off Rhode Island and Connecticut, which has finished construction, and the Maryland Offshore Wind Project near Ocean City, The Maritime Executive reported. A judge previously allowed the government to reconsider the permit for SouthCoast Wind, another Massachusetts project.

## Permitting deal at risk

Sen. Sheldon Whitehouse, D-R.I., warned the move could derail a bipartisan Senate permitting bill reached in September that has yet to get a vote. "This is how you blow up a permitting deal," he said, according to the AP.

The National Ocean Industries Association said reopening federal approvals creates uncertainty, while the Natural Resources Defense Council tied the administration''s actions to rising utility bills.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/b/b7/BLOCK_ISLAND_RHODE_ISLAND_WIND_TURBINE_SITE_-_NARA_-_17471619.jpg', 'An early wind turbine site on Block Island, R.I. Photo: U.S. National Archives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-22.sql', 7, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ne-wind-src1', 'bd-20261022-ne-wind', 'Trump administration wants to reconsider permit for Massachusetts offshore wind project', 'https://www.boston25news.com/news/politics/trump-administration/7QMLVVKY4YY6XJGUHMPRPFWOEU/', 'The Associated Press (via Boston 25 News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ne-wind-src2', 'bd-20261022-ne-wind', 'Trump administration wants to reconsider permit for Massachusetts offshore wind project', 'https://www.bostonglobe.com/2026/10/21/science/trump-offshore-wind-massachussetts/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ne-wind-src3', 'bd-20261022-ne-wind', 'Trump Administration Asks Court to Remand Second Offshore Wind Approval', 'https://maritime-executive.com/article/trump-administration-asks-court-to-remand-second-offshore-wind-approval', 'The Maritime Executive', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-ne-wind-ev1', 'bd-20261022-ne-wind', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-dem-lawsuit', 'schumer-jeffries-sue-trump-administration-election-officials-voter-rolls', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Schumer and Jeffries sue Trump administration over pressure on election officials', 'The suit invokes the Voting Rights Act''s ban on voter intimidation. The Justice Department says its actions are lawful.', 'Senate Democratic Leader Chuck Schumer and House Democratic Leader Hakeem Jeffries have sued the Trump administration, asking a federal judge to stop what they call threats against state and local election officials ahead of the Nov. 3 midterms.

The lawsuit was filed Tuesday in U.S. District Court for the District of Columbia, according to Democracy Docket. Other plaintiffs include three national Democratic Party organizations, the Nevada Democratic Party and a naturalized citizen voter from California. The defendants include President Donald Trump, Attorney General Todd Blanche, Homeland Security Secretary Markwayne Mullin and their departments.

## The claims

The complaint argues that threatening election officials with prosecution violates Section 11(b) of the Voting Rights Act, which bars voter intimidation and coercion. It asks the court to block such threats and to stop federal pressure on states to remove voters from their rolls.

The suit cites Trump''s warning that California election officials could go to jail, Just The News reported. It also points to a federal claim that 16,000 Nevada voters were noncitizens. The Department of Homeland Security later narrowed that figure to 185, and Nevada officials say their records show all 185 are citizens, according to Democracy Docket.

The plaintiffs argue the executive branch has no authority over how states maintain voter lists or decide who is qualified to vote, according to Just The News.

## The administration responds

The Justice Department rejected the claims and said its actions to protect elections have been lawful. Spokeswoman Kiersten Pels said federal law requires that only eligible citizens vote, Just The News reported.

The plaintiffs are represented by the Elias Law Group. Its chair, Marc Elias, founded Democracy Docket.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/5/56/Department_of_Homeland_Security%E2%80%99s_new_headquarters_is_ceremoniously_opened.jpg', 'Opening of the Department of Homeland Security headquarters in Washington. Photo: U.S. Department of Homeland Security / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-22.sql', 7, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-dem-lawsuit-src1', 'bd-20261022-dem-lawsuit', 'Democrats sue to block Trump admin from threatening the midterms', 'https://democracydocket.com/news-alerts/democrats-sue-to-block-trump-admin-from-threatening-the-midterms', 'Democracy Docket', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-dem-lawsuit-src2', 'bd-20261022-dem-lawsuit', 'Congressional Democratic leaders sue Trump admin over voter rolls ahead of 2026 midterms', 'https://justthenews.com/government/courts-law/congressional-democratic-leaders-sue-trump-admin-over-voter-rolls-ahead-2026', 'Just The News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-dem-lawsuit-src3', 'bd-20261022-dem-lawsuit', '2026 Midterm Elections live updates: Democratic lawsuit', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-south-carolina-democrats-october-21', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-dem-lawsuit-ev1', 'bd-20261022-dem-lawsuit', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-ohio-races', 'ohio-poll-brown-husted-acton-ramaswamy-ad', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Brown leads Husted by 5 in Ohio Senate poll as Ramaswamy ad draws GOP pushback', 'A Fox News poll finds the governor''s race within the margin of error, measured before a contested Ramaswamy ad became public.', 'Democrat Sherrod Brown leads Republican Sen. Jon Husted 52% to 47% among likely Ohio voters in a new Fox News poll, in a race that could help decide control of the Senate on Nov. 3.

The poll of 1,592 likely voters has a margin of error of plus or minus 2 points, Fox News reported. It put President Donald Trump''s job approval in Ohio at 43%.

| Race | Democrat | Republican |
| --- | --- | --- |
| U.S. Senate | Sherrod Brown 52% | Jon Husted 47% |
| Governor | Amy Acton 50% | Vivek Ramaswamy 48% |

## The governor''s race and the ad

Democrat Amy Acton''s 2-point edge over Republican Vivek Ramaswamy is within the margin of error. Fox News noted the poll was taken before a Ramaswamy campaign ad became public.

The ad features Acton''s estranged mother. Ramaswamy''s campaign confirmed it produced the spot and said it would spend about $4 million on it despite criticism from both parties, according to The Associated Press.

Husted said he would not have run the ad, Fox News reported. Vice President JD Vance defended it and said he was "disgusted" by the pushback, according to the AP. Trump said he knew nothing about the ad, Fox News reported.

## Voters are turning out

Early voting in Ohio is running more than 30% ahead of 2022, according to an AP analysis of Senate battleground states.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/23/Columbus,_Ohio_-_Highsmith_18.jpg', 'Columbus, Ohio. Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-22.sql', 6, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ohio-races-src1', 'bd-20261022-ohio-races', '2026 Midterm Elections live updates: Ohio Fox News Poll and Ramaswamy ad', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-south-carolina-democrats-october-21', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ohio-races-src2', 'bd-20261022-ohio-races', 'The Latest: Ramaswamy ad, early voting in Senate battlegrounds', 'https://clickorlando.com/news/politics/2026/10/21/the-latest-trump-vance-announce-25m-whistleblower-program-to-encourage-reporting-of-alleged-fraud', 'The Associated Press (via WKMG ClickOrlando)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-ohio-races-ev1', 'bd-20261022-ohio-races', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-pats-bears', 'patriots-bears-thursday-night-injuries-preview', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Short-handed Patriots take on the Bears tonight without both starting guards', 'New England rules out five players, including both starting guards and three cornerbacks, for the 8:15 p.m. kickoff at Soldier Field.', 'The Patriots play the Bears on Thursday night at Soldier Field without five players, including both starting guards, after a short week that followed Sunday''s 26-19 win over the Jets. Kickoff is 8:15 p.m. ET.

## Who''s out

| Patriots | Status |
| --- | --- |
| LG Alijah Vera-Tucker (hamstring) | Out |
| RG Ben Brown (knee) | Out |
| CB Carlton Davis III (neck) | Out |
| CB Karon Prunty (hamstring) | Out |
| CB Channing Canada (hamstring) | Out |
| RT Morgan Moses (foot) | Questionable |
| S Kevin Byard III (chest) | Questionable |
| S Craig Woodson (shoulder) | Questionable |
| LB Christian Elliss (chest) | Questionable |

Walter Rouse and Matt Pryor are expected to start at guard, according to the team. Charles Woods is expected to start at cornerback opposite Christian Gonzalez, The Boston Globe reported. Receiver A.J. Brown, who had an ankle issue, has no game designation.

The Patriots could also activate tackle Marcus Bryant from injured reserve, the team said.

## The Bears'' side

Chicago, which beat Atlanta on Sunday, ruled out running back Kyle Monangai and linebacker Jack Sanborn, the Bears said. Linebacker T.J. Edwards is doubtful, and cornerback Tyrique Stevenson is questionable after three full practices. Right guard Jonah Jackson is expected to play.

## What to watch

The Bears rank 29th in expected points added on first and second down, but their third-down defense allows conversions just 25.8% of the time, second-best in the league, according to Patriots.com. That points to an early run game and play-action for New England.

On the radio, Bob Socci and Scott Zolak have the call on 98.5 FM.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-22.sql', 8, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-pats-bears-src1', 'bd-20261022-pats-bears', 'Injury Report Analysis: Patriots rule out five players for Thursday Night Football vs. the Bears', 'https://www.patriots.com/news/injury-report-analysis-patriots-rule-out-five-players-for-thursday-night-football-vs-the-bears', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-pats-bears-src2', 'bd-20261022-pats-bears', 'Injury Update: Bears RG Jonah Jackson set to play vs. Patriots', 'https://www.chicagobears.com/news/injury-update-bears-rg-jonah-jackson-set-to-play-vs-patriots', 'Chicago Bears', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-pats-bears-src3', 'bd-20261022-pats-bears', 'Patriots rule out five players for Thursday''s game vs. Bears', 'https://www.bostonglobe.com/2026/10/21/sports/patriots-injuries-bears/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-pats-bears-ev1', 'bd-20261022-pats-bears', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-ws-game1', 'world-series-game-1-misiorowski-rasmussen-brewers-rays', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Misiorowski vs. Rasmussen: World Series Game 1 sets up an ace duel in Milwaukee', 'The Brewers'' MLB ERA leader starts Friday after 11 days off; the Rays counter with a right-hander who went 11-0 after the All-Star break.', 'The World Series opens Friday at 8 p.m. ET at American Family Field with a matchup of two of baseball''s best right-handers. It will be the first World Series game at the Milwaukee ballpark, according to MLB.com.

The Brewers named Jacob Misiorowski their Game 1 starter, CBS Sports reported. Drew Rasmussen is expected to start for Tampa Bay on regular rest, according to MLB.com and CBS Sports.

## The pitchers

| | Misiorowski (MIL) | Rasmussen (TB) |
| --- | --- | --- |
| Regular season | MLB-best 1.80 ERA, 252 strikeouts | 11-0, 1.73 ERA in 15 starts after the break |
| Postseason role | Started Game 1 of NLDS and NLCS | Started Game 1 of ALDS and ALCS |

Misiorowski threw a 104.8 mph pitch in the NLDS, the fastest postseason pitch of the pitch-tracking era, MLB.com reported. But he has not finished five innings in either playoff start, largely because of high pitch counts, and his swing-and-miss rate has fallen sharply in October, according to CBS Sports.

## Rest vs. rust

Milwaukee, which went 103-59 and holds home-field advantage, has played only eight games in the 25 days before the opener after a sweep of the Dodgers, CBS Sports noted. Tampa Bay (98-64) beat Cleveland in six games in the ALCS.

## Schedule (all games 8 p.m. ET on FOX)

| Game | Date | Site |
| --- | --- | --- |
| 1 | Fri., Oct. 23 | Milwaukee |
| 2 | Sat., Oct. 24 | Milwaukee |
| 3 | Mon., Oct. 26 | Tampa Bay |
| 4 | Tue., Oct. 27 | Tampa Bay |
| 5* | Wed., Oct. 28 | Tampa Bay |
| 6* | Fri., Oct. 30 | Milwaukee |
| 7* | Sat., Oct. 31 | Milwaukee |

*If necessary.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/9/90/2013_World_Series_color_guard_131023-G-VV362-837.jpg', 'A U.S. Coast Guard color guard at the 2013 World Series. Photo: U.S. Coast Guard / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-22.sql', 7, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ws-game1-src1', 'bd-20261022-ws-game1', 'When is Rays vs. Brewers World Series Game 1? Date, Time and Lineups', 'https://www.mlb.com/news/rays-brewers-world-series-game-1-starting-lineups-and-pitching-matchup', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ws-game1-src2', 'bd-20261022-ws-game1', 'What you need to know about the 2026 World Series', 'https://www.mlb.com/brewers/news/2026-mlb-world-series-faq-schedule-times-teams-and-more', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-ws-game1-src3', 'bd-20261022-ws-game1', 'Jacob Misiorowski gets World Series Game 1 start for Brewers', 'https://www.cbssports.com/mlb/news/world-series-game-1-jacob-misiorowski-brewers-start/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-ws-game1-ev1', 'bd-20261022-ws-game1', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-bruins-preds', 'bruins-predators-td-garden-preview', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins return home to face Predators after taking 7 of 8 points on the road', 'Boston (7-2-1) hosts Nashville at 7 p.m. Thursday, two nights after an overtime loss in Dallas ended its five-game winning streak.', 'The Bruins are back at TD Garden on Thursday night against the Nashville Predators, coming off a four-game road trip in which they collected seven of a possible eight points.

Puck drop is 7 p.m. ET on NESN, with streaming on NESN 360 and Fubo, according to NESN.

## How the trip ended

Boston''s five-game winning streak ended Tuesday with a 3-2 overtime loss in Dallas, Boston Hockey Now reported. Matt Poitras scored his fourth goal of the season and James Hagens his third. Mikko Rantanen answered with a hat trick for the Stars, finishing it with a power-play goal in overtime, 98.5 The Sports Hub reported. Jeremy Swayman made 22 saves, according to NESN.

| Team | Record | Last game |
| --- | --- | --- |
| Bruins | 7-2-1 | Lost 3-2 (OT) at Dallas, Tuesday |
| Predators | 3-2-3 | Beat St. Louis, Saturday |

## The opponent

Nashville arrives rested. The Predators have had four days off since their win over the Blues, according to NESN.

The Bruins flew home Wednesday after the trip, Boston Hockey Now reported.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-22.sql', 6, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-bruins-preds-src1', 'bd-20261022-bruins-preds', 'How to Watch Bruins vs. Predators Tonight', 'https://sports.yahoo.com/articles/watch-bruins-vs-predators-tonight-080001207.html', 'NESN (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-bruins-preds-src2', 'bd-20261022-bruins-preds', 'Bruins'' Win Streak Ends With Overtime Loss to Stars', 'https://bostonhockeynow.com/2026-10-20-bruins-win-streak-ends-with-overtime-loss-to-stars/', 'Boston Hockey Now', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-bruins-preds-src3', 'bd-20261022-bruins-preds', 'Bruins end road trip with overtime loss to Stars', 'https://985thesportshub.com/2026/10/20/bruins-stars-recap-reaction/', '98.5 The Sports Hub', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-bruins-preds-ev1', 'bd-20261022-bruins-preds', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261022-celtics-knicks', 'celtics-knicks-home-opener-td-garden', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Celtics open their home schedule Friday against the champion Knicks', 'Boston looks to bounce back from a blown 22-point lead in Detroit as Paul George follows a record debut and Jayson Tatum looks to find his shot.', 'The Celtics play their first home game of the season Friday at 7 p.m. at TD Garden against the New York Knicks, the defending NBA champions. Doors open at 6 p.m. for the general public, according to TD Garden.

New York won its first title since 1973 last season, NESN reported. The Knicks raised their championship banner at Madison Square Garden before their opener against Philadelphia on Tuesday, according to NY Knicks News.

## A rough start in Detroit

Boston lost its opener to the Pistons on Tuesday after leading by 22 points. Detroit scored 39 points in the fourth quarter to complete the comeback, NESN reported.

| Celtic | Opener line |
| --- | --- |
| Paul George | 12-of-21 shooting, seven 3-pointers |
| Jayson Tatum | 13 points, 11 assists, 4 rebounds; 6-of-23, 0-of-7 from 3 |

George set a franchise record for points in a Celtics debut, according to NESN. He joined Boston in a trade that sent Jaylen Brown to Philadelphia.

## Tatum''s return

Tatum is coming back from an Achilles injury that interrupted his previous season, and his shooting in the opener is the early question going into Friday, NESN noted. The Celtics reported no new injuries after the loss.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-22.sql', 6, 0, 'newsroom-assistant', '2026-10-22T10:45:00.000Z', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-celtics-knicks-src1', 'bd-20261022-celtics-knicks', 'Celtics vs. Knicks event page', 'https://www.tdgarden.com/events/detail/celtics-vs-knicks-26-27', 'TD Garden', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-celtics-knicks-src2', 'bd-20261022-celtics-knicks', 'Jayson Tatum''s Rough Celtics Opener Creates An Uncomfortable Question Before Knicks Visit', 'https://sports.yahoo.com/articles/jayson-tatums-rough-celtics-opener-104916551.html', 'NESN (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261022-celtics-knicks-src3', 'bd-20261022-celtics-knicks', 'Knicks Face Brutal 2026 Start Against 76ers and Celtics', 'https://nyknicksnews.com/knicks-2026-opening-schedule-76ers-celtics-championship-defense/', 'NY Knicks News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-22T10:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-22. Editor to confirm.', 'newsroom-assistant', '2026-10-22T10:45:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261022-celtics-knicks-ev1', 'bd-20261022-celtics-knicks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-22T10:45:00.000Z');
