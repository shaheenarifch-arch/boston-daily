-- Section fill for 2026-10-17: drafts for every news section. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain or Creative Commons with credit; editor to confirm each image renders and its license.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-russia-sanctions-waiver', 'trump-waives-graham-act-russia-sanctions-tariffs', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump waives new Russia sanctions and tariffs days before they were due to start', 'An executive order suspends the main Russia measures in the Graham Act, drawing criticism from senators of both parties and from Ukraine''s president.', 'President Trump signed an executive order on Friday suspending the main Russia penalties in the Lindsey O. Graham Sanctioning Russia and Iran Act of 2026. The measures had been set to begin on Oct. 18, according to the order posted on the White House website.

Trump signed the law on Sept. 18. It is named for the late South Carolina senator, who pushed for it before he died in July, ABC News reported.

## What the order does

The order sets out the tariffs the law calls for and then waives them, along with most of its sanctions provisions. The waived measures include:

- A 500% tariff on goods from Russia
- 100% tariffs on goods from the five biggest buyers of Russian oil and gas that make new purchases
- 100% tariffs on the top five helpers of Russian oil sanctions evasion

Sanctions already imposed under earlier Russia-related orders are not affected, the White House text says. The president told Congress the waivers serve the national interest. They stay in place until he or the secretary of state decides further action is needed. The U.S. trade representative will monitor Russian energy purchases and report back.

## Reaction

White House spokesperson Taylor Rogers said enforcing the penalties now would hinder peace talks, ABC News reported. The network said Republican Sen. Thom Tillis called the move "beyond irresponsible," and Senate Democratic leader Chuck Schumer also criticized it. Republican Rep. Thomas Massie, who opposed the bill, welcomed the waiver.

Ukrainian President Volodymyr Zelenskyy said the decision does not stop the war, according to ABC News. In Moscow, Kremlin envoy Kirill Dmitriev praised the suspension, Outlook India reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg/1280px-January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg', 'Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 8, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-russia-sanctions-waiver-src1', 'bd-20261017-russia-sanctions-waiver', 'Implementing the Lindsey O. Graham Sanctioning Russia and Iran Act of 2026', 'https://www.whitehouse.gov/presidential-actions/2026/10/implementing-the-lindsey-o-graham-sanctioning-russia-and-iran-act-of-2026/', 'The White House', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-russia-sanctions-waiver-src2', 'bd-20261017-russia-sanctions-waiver', 'Trump signs order waiving Graham Act sanctions on Russia, drawing backlash from some lawmakers and Zelenskyy', 'https://abcnews.com/Politics/trump-signs-order-waiving-graham-act-sanctions-russia/story?id=137341529', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-russia-sanctions-waiver-src3', 'bd-20261017-russia-sanctions-waiver', 'Putin Envoy Calls Trump''s Russia Sanctions Waiver ''Historic Moment''', 'https://www.outlookindia.com/international/putin-envoy-dmitriev-trump-russia-sanctions-waiver', 'Outlook India', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-russia-sanctions-waiver-ev1', 'bd-20261017-russia-sanctions-waiver', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-epstein-bank-records', 'warren-garcia-epstein-wall-street-records-act-banks', 'newsroom', 'news_story', 'congress', 'EDITORIAL_REVIEW', 0, 'Democrats, joined by Massie, unveil bill targeting banks that served Jeffrey Epstein', 'The Epstein Wall Street Records Act would make federal financial regulators release their Epstein files and investigate the bankers involved.', 'A group of congressional Democrats, along with one Republican, introduced legislation on Thursday that would require federal regulators to disclose what they know about banks that did business with Jeffrey Epstein.

Sen. Elizabeth Warren of Massachusetts, the top Democrat on the Senate Banking Committee, and Rep. Robert Garcia of California, ranking Democrat on the House Oversight Committee, lead the Epstein Wall Street Records Act, according to a Senate Banking Committee minority release. Kentucky Republican Rep. Thomas Massie is among the lead sponsors.

## What the bill would do

The measure would direct the Federal Reserve, the FDIC, the Office of the Comptroller of the Currency and the SEC to:

- Release supervisory records on Epstein and his associates to Congress and the public
- Investigate connected banks and executives for possible violations
- Fine and bar executives who aided his finances, with possible Justice Department referrals

American Banker reported that 25 lawmakers back the bill, all Democrats except Massie. The release says regulators would not confirm to Warren whether they had opened investigations.

## Banks and the midterms

JPMorgan Chase, Deutsche Bank and Bank of America were sued by Epstein''s victims and together agreed to pay more than $437 million to settle, The New York Times reported in a story carried by The Boston Globe. JPMorgan told American Banker it did not knowingly enable illegal activity.

The bill is unlikely to pass this year, the Times reported. Democrats hope to win at least one chamber in November. If they do, Warren and Garcia would likely lead committees that plan to examine Epstein''s finances.

Both chambers are in recess until November.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Elizabeth_Warren,_official_portrait,_114th_Congress.jpg/1280px-Elizabeth_Warren,_official_portrait,_114th_Congress.jpg', 'Photo: United States Senate / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-epstein-bank-records-src1', 'bd-20261017-epstein-bank-records', 'Ranking Members Warren and Garcia Lead Bipartisan Lawmakers in Introducing Bill to Hold Bankers Who Financed Epstein Accountable', 'https://www.banking.senate.gov/newsroom/minority/ranking-members-warren-and-garcia-lead-bipartisan-lawmakers-in-introducing-bill-to-hold-bankers-who-financed-epstein-accountable', 'U.S. Senate Committee on Banking, Housing, and Urban Affairs (Minority)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-epstein-bank-records-src2', 'bd-20261017-epstein-bank-records', 'Bill would force bank regulators to disclose Epstein records', 'https://www.americanbanker.com/news/bill-would-force-bank-regulators-to-disclose-epstein-records', 'American Banker', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-epstein-bank-records-src3', 'bd-20261017-epstein-bank-records', 'Jeffrey Epstein, Democrats and the midterms (New York Times report)', 'https://www.bostonglobe.com/2026/10/15/nation/jeffrey-epstein-democrats-midterms/', 'The Boston Globe / The New York Times', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-epstein-bank-records-ev1', 'bd-20261017-epstein-bank-records', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-vacatur-petition', 'supreme-court-petition-courts-power-vacate-agency-rules', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Trump administration asks Supreme Court to limit judges'' power to void federal rules', 'A petition in a dispute over surprise medical bill rules asks the justices whether courts may wipe out agency regulations for everyone.', 'The Trump administration has asked the Supreme Court to decide whether federal judges may strike down an agency rule nationwide, a question that could reshape how regulations are challenged.

Solicitor General D. John Sauer filed the petition this week in *Department of Health and Human Services v. Texas Medical Association*, No. 26-491, according to the filing posted on the Supreme Court''s website. It asks whether the Administrative Procedure Act lets courts universally vacate rules found unlawful, and if so, when.

## The underlying case

The dispute involves rules carrying out the No Surprises Act, a law meant to shield patients from unexpected out-of-network bills. The challengers include the Texas Medical Association, a hospital and air ambulance companies.

SCOTUSblog reported this path through the courts:

- A federal district court in Texas sided with the challengers.
- A Fifth Circuit panel partly reversed that ruling.
- The full Fifth Circuit, in an Aug. 11 decision, vacated some of the provisions.

## The government''s argument

Sauer relies on the court''s 2025 ruling in *Trump v. CASA*, which curbed universal injunctions, SCOTUSblog reported. He argues the same reasoning should apply to vacating rules, and that the practice encourages forum shopping and floods courts with emergency litigation.

The Fifth Circuit had rejected the government''s warning that vacatur would cause practical problems, such as gaps in patient protections while rules are rewritten.

The challengers'' response is due Nov. 13, though that could be extended, according to SCOTUSblog. The justices have not said whether they will hear the case.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flickr_-_USCapitol_-_U.S._Supreme_Court_Building.jpg/1280px-Flickr_-_USCapitol_-_U.S._Supreme_Court_Building.jpg', 'Photo: Architect of the Capitol / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-vacatur-petition-src1', 'bd-20261017-vacatur-petition', 'Petition for a Writ of Certiorari, HHS v. Texas Medical Association, No. 26-491', 'https://www.supremecourt.gov/DocketPDF/26/26-491/429429/20261014091943719_TMA%20v.%20HHS%20Petition.pdf', 'Supreme Court of the United States', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-vacatur-petition-src2', 'bd-20261017-vacatur-petition', 'Trump administration asks justices to determine courts'' ability to vacate federal agency actions', 'https://www.scotusblog.com/2026/10/trump-administration-asks-justices-to-determine-courts-ability-to-vacate-federal-agency-actions/', 'SCOTUSblog', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-vacatur-petition-ev1', 'bd-20261017-vacatur-petition', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-measles-record-climb', 'us-measles-cases-top-4400-cdc-october-2026', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'US measles cases climb past 4,400 as yearly total nears double 2025''s', 'Federal health data show the count rose by more than 300 in a single week, with nearly all cases tied to outbreaks.', 'The number of confirmed measles cases in the United States this year has reached 4,410, according to figures the Centers for Disease Control and Prevention posted on Friday.

The CDC tally, current as of Thursday, Oct. 15, is up 330 from the 4,080 cases the agency reported a week earlier, based on that earlier count as reported by Reuters and CBS News.

## Where the numbers stand

According to the CDC page:

- **4,410** confirmed cases in 2026, reported by 47 jurisdictions
- **42** new outbreaks so far this year
- About **96%** of cases linked to outbreaks
- **2** confirmed measles deaths, a figure the agency says may change
- **2,289** cases in all of 2025, the previous high in three decades

## State responses

Pennsylvania has passed 1,000 cases this year and has reported five measles-associated deaths, CBS News reported. Reuters noted that the CDC recently changed the data source it uses to count measles deaths, a shift that has drawn scrutiny.

In New York, Gov. Kathy Hochul declared a state emergency earlier this month. According to CBS News, the order expands which health workers may give measles shots and lets nurses order tests.

## Vaccination status

About 95% of patients nationwide were unvaccinated or had an unknown vaccination status, CBS News reported, citing federal data. Reuters reported that roughly 10% of this year''s cases had required hospitalization as of early October.

Measles symptoms typically begin one to two weeks after exposure with a high fever, cough and runny nose, followed later by a rash, according to CBS News.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/CDC_Headquarters_PHIL_10693.tif/lossy-page1-1280px-CDC_Headquarters_PHIL_10693.tif.jpg', 'Photo: Centers for Disease Control and Prevention / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-measles-record-climb-src1', 'bd-20261017-measles-record-climb', 'Measles Cases and Outbreaks (Data and Research)', 'https://www.cdc.gov/measles/data-research/index.html', 'Centers for Disease Control and Prevention', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-measles-record-climb-src2', 'bd-20261017-measles-record-climb', 'US measles cases hit record for the year (CBS News, Oct. 9, 2026)', 'https://cbsnews.com/news/us-measles-cases-cdc-record/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-measles-record-climb-src3', 'bd-20261017-measles-record-climb', 'US measles cases rise to 4,080, CDC says', 'https://gvwire.com/2026/10/09/us-measles-cases-rise-to-4080-cdc-says/', 'Reuters (via GV Wire)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-measles-record-climb-ev1', 'bd-20261017-measles-record-climb', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-winter-outlook-elnino', 'noaa-winter-outlook-2026-2027-very-strong-el-nino', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'NOAA winter outlook: very strong El Niño favors mild North, wetter South', 'Federal forecasters expect a warmer-than-normal winter across much of the East, including the Northeast, and a stormier southern tier.', 'A very strong El Niño is expected to shape the coming winter across the United States, the National Oceanic and Atmospheric Administration said Thursday in its outlook for December 2026 through February 2027.

NOAA said the pattern is likely to push the jet stream south and east, favoring stormier weather across the southern states.

## What the outlook favors

- **Warmer than average:** the Pacific Northwest, northern California, the Midwest, the Mississippi Valley, much of the East and Alaska
- **Wetter than average:** the southern tier from the Southwest to the Southeast, and along the East Coast
- **Drier than average:** parts of the Great Lakes, the northern Mountain West, much of Alaska and Hawaii
- **Drought relief:** expected by the end of January in the Southwest, Southern Plains, Southeast and parts of the East Coast

ABC News reported that much of the Northeast falls in the area favored for above-normal temperatures. NOAA''s seasonal outlooks do not forecast snowfall, ABC noted, and the agency stresses that its maps show probabilities rather than certainties.

## A potentially historic event

The Weather Channel reported that waters in the eastern equatorial Pacific ran about 2.3 degrees Celsius above average last week. Citing NOAA''s Climate Prediction Center, it said there is an 83% chance of a historic event that would surpass previous El Niños dating to 1950.

The Weather Channel also noted that the Atlantic has produced just one hurricane this season, Isaias, which formed on Oct. 7, the latest first hurricane of the satellite era.

NOAA said its next monthly update to the outlook is scheduled for Nov. 19.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Blizzard1_-_NOAA.jpg', 'Photo: NOAA / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-outlook-elnino-src1', 'bd-20261017-winter-outlook-elnino', 'El Nino looms large over U.S. Winter Outlook', 'https://www.noaa.gov/news-release/el-nino-looms-large-over-us-winter-outlook', 'National Oceanic and Atmospheric Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-outlook-elnino-src2', 'bd-20261017-winter-outlook-elnino', 'NOAA forecasts a wet south and warmer north as El Nino impacts winter weather in the US', 'https://abcnews.com/US/noaa-forecasts-wet-south-warmer-north-el-nino/story?id=137288754', 'ABC News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-outlook-elnino-src3', 'bd-20261017-winter-outlook-elnino', 'What a historic super El Niño ahead means for your fall and winter', 'https://weather.com/2026/10/16/news/weather/super-el-nino-update-winter', 'The Weather Channel (weather.com)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-winter-outlook-elnino-ev1', 'bd-20261017-winter-outlook-elnino', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-markets-week-recap', 'stocks-week-oct-16-2026-nasdaq-worst-week-since-june-chip-selloff', 'newsroom', 'news_story', 'business', 'EDITORIAL_REVIEW', 0, 'Nasdaq sinks 4.5% for the week as chip stocks slide; Dow edges higher', 'Doubts about the durability of AI spending and hot inflation readings handed the S&P 500 and Nasdaq their worst week since June.', 'Technology stocks led Wall Street lower on Friday, capping a rough week for the Nasdaq and the S&P 500, according to the Associated Press.

The AP reported that chipmakers fell again as investors questioned how long the surge in spending on artificial intelligence infrastructure can last. Micron dropped 5.6% and Intel fell 5.8% on Friday, it said.

## How the indexes fared

| Index | Friday close | Day | Week | Year to date |
|---|---|---|---|---|
| S&P 500 | 7,659.44 | -1.1% | -1.9% | +11.9% |
| Dow Jones industrials | 52,002.41 | -0.3% | +0.7% | +8.2% |
| Nasdaq composite | 26,140.03 | -2.1% | -4.5% | +12.5% |
| Russell 2000 | 2,721.37 | -1.7% | -3.0% | +9.6% |

*Source: Associated Press, via ABC News*

## Rates and inflation in focus

Investopedia reported that hotter-than-expected consumer and producer price reports this week added pressure on the Federal Reserve, and that Fed Chair Kevin Warsh offered no signal on rates. The Bureau of Labor Statistics said Wednesday that consumer prices rose 3.7% in the 12 months through September, with core prices up 2.6%. Futures data cited by Investopedia showed traders putting high odds on a rate increase by December.

The 10-year Treasury yield ended above 5.09%, after briefly reaching 5.33% following Wednesday''s inflation data, Investopedia said.

Among other moves it reported:

- CoreWeave fell 12%, its second steep drop in three sessions
- Meta lost nearly 4% and Nvidia about 1.5%
- U.S. crude rose 3.4% to $101.35 a barrel on Middle East risks
- Gold futures gained 0.5% to about $4,190 an ounce

The Dow posted its second straight weekly gain, Investopedia noted, while overseas markets in Europe and Asia closed higher Friday, according to the AP.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/No_Known_Restrictions_Trading_Floor,_New_York_Stock_Exchange_(Highsmith_LOC)_(6718386525).jpg/1280px-No_Known_Restrictions_Trading_Floor,_New_York_Stock_Exchange_(Highsmith_LOC)_(6718386525).jpg', 'Photo: Carol M. Highsmith (Library of Congress) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-markets-week-recap-src1', 'bd-20261017-markets-week-recap', 'How major US stock indexes fared Friday 10/16/2026', 'https://abcnews.com/Business/wireStory/major-us-stock-indexes-fared-friday-10162026-137331951', 'Associated Press (via ABC News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-markets-week-recap-src2', 'bd-20261017-markets-week-recap', 'Markets News, Oct. 16, 2026: Nasdaq, S&P 500 End Lower, Post Weekly Losses; AI Stocks Fall; Dow Logs Weekly Gain', 'https://finance.yahoo.com/markets/stocks/articles/markets-news-oct-16-2026-103800633.html', 'Investopedia (via Yahoo Finance)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-markets-week-recap-src3', 'bd-20261017-markets-week-recap', 'How major US stock indexes fared Thursday 10/15/2026', 'https://www.lanacion.com.ar/usa/how-major-us-stock-indexes-fared-thursday-10152026-nid15102026/', 'Associated Press (via La Nacion)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-markets-week-recap-src4', 'bd-20261017-markets-week-recap', 'Consumer Price Index News Release (September 2026)', 'https://www.bls.gov/news.release/cpi.nr0.htm', 'U.S. Bureau of Labor Statistics', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-markets-week-recap-ev1', 'bd-20261017-markets-week-recap', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-jpmorgan-q3-earnings', 'jpmorgan-chase-third-quarter-2026-profit-15-3-billion', 'newsroom', 'news_story', 'business', 'EDITORIAL_REVIEW', 0, 'JPMorgan Chase posts $15.3 billion third-quarter profit as revenue rises 8%', 'The nation''s largest bank reported higher earnings than a year ago, led by gains in its investment banking and consumer units.', 'JPMorgan Chase earned $15.3 billion in the third quarter, up 6% from a year earlier, according to the bank''s earnings materials filed with the Securities and Exchange Commission.

The New York-based lender released the results on Tuesday, Oct. 13, RTTNews reported.

## Key figures

| Measure | 3Q 2026 | Change vs. 3Q 2025 |
|---|---|---|
| Net income | $15.3 billion | +6% |
| Diluted earnings per share | $5.57 | +10% |
| Reported net revenue | $50.2 billion | +8% |
| Provision for credit losses | $2.7 billion | -19% |

*Source: JPMorgan Chase financial supplement*

Compared with the second quarter, net income fell 28% from $21.2 billion, and reported revenue was down 13%, according to the supplement.

## Business lines

The filing shows year-over-year profit growth in each of the bank''s three main segments:

- **Commercial & Investment Bank:** $8.2 billion, up 20%
- **Consumer & Community Banking:** $5.7 billion, up 13%
- **Asset & Wealth Management:** $1.8 billion, up 11%

The bank''s estimated common equity tier 1 capital ratio, a key gauge of its financial cushion, was 13.9%, down from 14.2% in the prior quarter and 14.8% a year earlier, the supplement showed.

RTTNews reported that earnings per share rose from $5.07 in the year-ago quarter, while revenue climbed from $46.4 billion.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/First_Bank_of_the_United_States,_Philadelphia,_Pennsylvania_LCCN2011633532_(edited).jpg/1280px-First_Bank_of_the_United_States,_Philadelphia,_Pennsylvania_LCCN2011633532_(edited).jpg', 'Photo: Carol M. Highsmith (Library of Congress) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-jpmorgan-q3-earnings-src1', 'bd-20261017-jpmorgan-q3-earnings', 'JPMorgan Chase & Co. Form 8-K Exhibit 99.2: Earnings Release Financial Supplement, Third Quarter 2026', 'https://www.sec.gov/Archives/edgar/data/0000019617/000162828026065582/a3q26erfex992supplement.htm', 'JPMorgan Chase & Co. (SEC EDGAR)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-jpmorgan-q3-earnings-src2', 'bd-20261017-jpmorgan-q3-earnings', 'JPMorgan Chase & Co. Q3 Profit Rises', 'https://www.rttnews.com/3698459/jpmorgan-chase-co-q3-profit-rises.aspx', 'RTTNews', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-jpmorgan-q3-earnings-ev1', 'bd-20261017-jpmorgan-q3-earnings', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-aden-palace-attack', 'houthi-missiles-hit-yemen-presidential-palace-aden', 'newsroom', 'news_story', 'world', 'EDITORIAL_REVIEW', 0, 'Houthi missiles strike Yemen''s presidential palace in Aden; PM unharmed', 'The attack on the seat of Yemen''s internationally recognized government killed several people as the country''s civil war widens.', 'Houthi forces fired missiles at the Maashiq presidential palace compound in Aden on Thursday, striking the seat of Yemen''s internationally recognized government in the southern port city, according to Reuters and Agence France-Presse.

The prime minister and cabinet members at the complex were not hurt, Reuters reported, citing Yemen''s information minister, Moammar al-Eryani, who said five missiles were fired.

## Casualty figures vary

Early accounts of the toll differed and could not be independently confirmed:

- **Reuters**, citing two government officials: two security guards killed.
- **AFP**, citing government military sources: four killed and 10 wounded.
- **Later reports** compiled by Just Security, citing Yemeni health officials via The New York Times and Reuters: five killed and at least 16 injured.

Witnesses told Reuters they heard loud explosions near the palace, and an AFP journalist saw smoke rising from the site.

## Houthis cite Saudi target

The Houthi-run Saba news agency said the group targeted a military operations headquarters run by Saudi officers inside the compound, along with weapons depots. Reuters said it could not verify that claim. Government forces also reported ballistic missile fire toward the central city of Marib.

According to AFP, Yemen''s civil war flared again in July after a long truce collapsed. The Iran-backed Houthis have since seized territory along the Red Sea coast, and a government counteroffensive backed by Saudi air power has not reversed those gains. The South China Morning Post, carrying AFP''s report, said Riyadh blamed Tehran for the escalation, which unfolds against a wider regional war that began with US-Israeli strikes on Iran in February.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Port_of_Aden,_Yemen_from_ISS.jpg', 'Photo: NASA / International Space Station crew / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-aden-palace-attack-src1', 'bd-20261017-aden-palace-attack', 'Houthis attack presidential palace complex in Yemen''s Aden, PM unharmed -officials', 'https://www.gmanetwork.com/news/topstories/world/1006084/houthis-attack-presidential-palace-complex-in-yemen-s-aden-pm-unharmed-officials/story/', 'Reuters (via GMA News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-aden-palace-attack-src2', 'bd-20261017-aden-palace-attack', 'Houthi attack on presidential palace in Yemen''s Aden kills 4: Govt sources', 'https://www.khaleejtimes.com/world/mena/houthi-attack-yemen-aden-presidential-palace-deaths-injuries', 'AFP (via Khaleej Times)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-aden-palace-attack-src3', 'bd-20261017-aden-palace-attack', 'Houthis launch deadly attack on presidential palace in Yemen''s Aden', 'https://www.scmp.com/news/world/middle-east/article/3371065/houthis-launch-deadly-attack-presidential-palace-yemens-aden', 'South China Morning Post / AFP', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-aden-palace-attack-src4', 'bd-20261017-aden-palace-attack', 'Early Edition: October 16, 2026', 'https://www.justsecurity.org/161058/early-edition-october-16-2026/', 'Just Security', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-aden-palace-attack-ev1', 'bd-20261017-aden-palace-attack', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-alberta-referendum-vote', 'alberta-votes-monday-on-path-to-separation-referendum-carney', 'newsroom', 'news_story', 'world', 'EDITORIAL_REVIEW', 0, 'Alberta votes Monday on whether to start path toward leaving Canada', 'Prime Minister Mark Carney rallied in Calgary for unity ahead of an October 19 provincial vote that could set up a binding separation referendum.', 'Voters in Alberta go to the polls Monday, October 19, to decide whether the oil-rich province should remain in Canada or begin a legal process toward a binding referendum on separation, according to The Canadian Press and The Associated Press.

The AP noted the ballot is not a direct vote on independence. The separation question is the 10th of 10 questions put to voters by Premier Danielle Smith; the other nine deal with immigration and constitutional reform.

## Carney appeals in Calgary

Prime Minister Mark Carney addressed a "Forever Canadian" rally of thousands in Calgary on Thursday, The Canadian Press reported. The AP said he urged Albertans not to cast a protest vote, acknowledged grievances over federal energy policy, and said outside forces were trying to break Canada, without naming the United States.

Smith, who called the vote, has said she supports staying in Canada but that backing for separation is higher than she would like, according to the AP. Separatist campaigners told the AP they see the vote as leverage in talks with Ottawa.

## The vote by the numbers

Figures reported by The Canadian Press:

| Item | Figure |
|---|---|
| Eligible electors | nearly 3 million |
| Expected turnout | 80%–85% |
| Advance polling stations | 310 |
| Election-day stations | just over 1,400 |
| Mail-in ballots requested | about 658,000 |

Ballots will be counted by hand, with the separation question tallied first. Early results are expected after 8 p.m. local time Monday, with a final count in the early hours of Tuesday.

The vote unfolds amid President Donald Trump''s trade war with Canada and his repeated talk of making it a US state, the AP reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/President_Donald_Trump_meets_with_Canadian_Prime_Minister_Mark_Carney_in_the_Oval_Office_(54502294823).jpg/1280px-President_Donald_Trump_meets_with_Canadian_Prime_Minister_Mark_Carney_in_the_Oval_Office_(54502294823).jpg', 'Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alberta-referendum-vote-src1', 'bd-20261017-alberta-referendum-vote', 'Canada''s Prime Minister Mark Carney says Alberta separation vote comes at ''worst time''', 'https://abcnews.com/Business/wireStory/canadas-prime-minister-mark-carney-alberta-separation-vote-137300441', 'The Associated Press (via ABC News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alberta-referendum-vote-src2', 'bd-20261017-alberta-referendum-vote', 'Warm welcome for Carney in Calgary stumping for unity as Alberta hurtles toward vote', 'https://www.ctvnews.ca/calgary/article/warm-welcome-for-carney-in-calgary-stumping-for-unity-as-alberta-hurtles-toward-vote/', 'The Canadian Press (via CTV News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alberta-referendum-vote-src3', 'bd-20261017-alberta-referendum-vote', 'What Albertans can expect when they go to vote', 'https://globalnews.ca/news/12098997/what-albertans-can-expect-when-they-go-to-vote/', 'The Canadian Press (via Global News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-alberta-referendum-vote-src4', 'bd-20261017-alberta-referendum-vote', 'More than 300 advance polls open across Alberta in historic referendum on separation', 'https://www.cp24.com/news/canada/2026/10/13/more-than-300-advance-polls-open-across-alberta-in-historic-referendum-on-separation/', 'The Canadian Press (via CP24)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-alberta-referendum-vote-ev1', 'bd-20261017-alberta-referendum-vote', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-burnham-scotland-speech', 'burnham-scotland-motherwell-speech-devolution-independence-referendum', 'newsroom', 'news_story', 'uk', 'EDITORIAL_REVIEW', 0, 'Burnham urges Scotland to move past independence, offers regional powers deal', 'Speaking in Motherwell as the SNP met in Aberdeen, the prime minister offered to devolve employment support and empower Scottish regions.', 'Prime Minister Andy Burnham used his first visit to Scotland since taking office to urge politicians to move beyond the independence debate, while offering Holyrood a deal to push powers down to Scotland''s regions and cities.

Speaking Friday at a college on the former Ravenscraig steelworks site in Motherwell, Burnham said far too much time was lost to constitutional rows, according to The Irish Times. The address came as the Scottish National Party held its annual conference in Aberdeen.

## What was offered

According to the published text of the speech on GOV.UK, Burnham proposed:

- A localized employment support model for Scotland, shaped by Holyrood.
- A new model of regional economic empowerment, designed with the Scottish government.
- Exploring regional control of research and innovation investment.
- £10 million for two defence technical colleges, which the Scottish government has agreed to match.

He said he would raise the offer at a National Economic Council meeting with the leaders of Scotland, Wales and Northern Ireland in the coming weeks.

## Referendum question

Asked about a second independence vote, Burnham said his view "won''t be changing" but did not explicitly rule one out, the Press Association reported. SNP figure Stephen Flynn told the party conference that Burnham had declined to rule out a referendum.

First Minister John Swinney said he would work with the UK government on empowering regions, The Irish Times reported, while rejecting a suggestion from Scottish Secretary Douglas Alexander that Holyrood was hoarding power. Conservative leader Kemi Badenoch, also in Scotland, said the SNP already had the powers it needed.

Swinney wants a referendum before 2031, the Press Association reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Official_portrait_of_Andy_Burnham_MP_2026_(cropped_3x4)_2.jpg/1280px-Official_portrait_of_Andy_Burnham_MP_2026_(cropped_3x4)_2.jpg', 'Photo: UK Parliament (official portrait) / Wikimedia Commons, CC BY 3.0', 'licensed', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-burnham-scotland-speech-src1', 'bd-20261017-burnham-scotland-speech', 'PM speech in Scotland: 16 October 2026', 'https://www.gov.uk/government/speeches/pm-speech-in-scotland-16-october-2026', 'GOV.UK (Prime Minister''s Office)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-burnham-scotland-speech-src2', 'bd-20261017-burnham-scotland-speech', 'Prime Minister makes offer to Holyrood to work together to empower Scottish regions', 'https://www.gov.uk/government/news/prime-minister-makes-offer-to-holyrood-to-work-together-to-empower-scottish-regions', 'GOV.UK (Prime Minister''s Office / Scotland Office)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-burnham-scotland-speech-src3', 'bd-20261017-burnham-scotland-speech', 'Andy Burnham urges Scotland to ''stop wasting time on independence drama''', 'https://www.irishtimes.com/world/uk/2026/10/16/andy-burnham-urges-scotland-to-stop-wasting-time-on-independence-drama/', 'The Irish Times', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-burnham-scotland-speech-src4', 'bd-20261017-burnham-scotland-speech', 'Move beyond constitutional questions, says Burnham in Scotland visit', 'https://uk.news.yahoo.com/move-beyond-constitutional-questions-says-141501501.html', 'Press Association (via Yahoo News UK)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-burnham-scotland-speech-src5', 'bd-20261017-burnham-scotland-speech', 'Burnham urged to ''bring it on'' and allow second Scottish independence vote', 'https://www.expressandstar.com/uk-news/burnham-urged-to-bring-it-on-and-allow-second-scottish-independence-vote-9288496', 'Press Association (via Express & Star)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-burnham-scotland-speech-ev1', 'bd-20261017-burnham-scotland-speech', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-uk-gdp-august', 'uk-economy-grows-0-1-percent-august-ons-budget-healey', 'newsroom', 'news_story', 'uk', 'EDITORIAL_REVIEW', 0, 'UK economy unexpectedly grows 0.1% in August ahead of Healey''s first budget', 'Official figures beat forecasts of a small contraction, though economists warn rising energy costs could slow growth later this year.', 'Britain''s economy grew 0.1% in August, the Office for National Statistics said Thursday, defying economists'' expectations of a 0.1% contraction, according to the Press Association and Euronews.

Growth slowed from 0.4% in July, but output rose 0.7% over the three months to August, the eighth straight three-month expansion, the ONS said.

## How the sectors performed

ONS figures for August:

| Sector | Monthly change |
|---|---|
| GDP | +0.1% |
| Services | 0.0% |
| Production | +0.8% |
| Construction | -0.2% |

The Press Association reported manufacturing rose 1.2%, helped by pharmaceuticals, while bars and restaurants fell 2.7%. Construction declined for a fourth straight month, according to the ONS. Euronews said computer programming was again the largest contributor to three-month growth.

## Budget backdrop

Chancellor John Healey called the data welcome news and said it showed resilience against global shocks, the Press Association reported. Healey delivers his first budget on October 28, according to Euronews, which said he has pledged fiscal discipline but has not said whether taxes will rise.

Economists struck a cautious note. Yael Selfin of KPMG told the Press Association that higher wholesale gas prices and long-term interest rates could weigh on households. Paul Dales of Capital Economics told Euronews that an expected rise in inflation, driven by energy costs linked to the Iran conflict, could dampen growth.

The next monthly GDP estimate is due November 12.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/c/c3/John_Healey,_United_Kingdom_Secretary_of_State_for_Defense_during_the_NATO_75th_Anniversary_Summit_in_Washington,_D.C._on_July_10,_2024_(cropped).jpg', 'Photo: U.S. Department of Defense / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-uk-gdp-august-src1', 'bd-20261017-uk-gdp-august', 'GDP monthly estimate, UK: August 2026', 'https://www.ons.gov.uk/economy/grossdomesticproductgdp/bulletins/gdpmonthlyestimateuk/august2026', 'Office for National Statistics', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-uk-gdp-august-src2', 'bd-20261017-uk-gdp-august', 'UK economy unexpectedly grows 0.1% in August', 'https://www.expressandstar.com/uk-news/uk-economy-unexpectedly-grows-01-in-august-9288557', 'Press Association (via Express & Star)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-uk-gdp-august-src3', 'bd-20261017-uk-gdp-august', 'UK economy unexpectedly grows despite fall in consumer spending', 'https://www.euronews.com/2026/10/15/uk-economy-unexpectedly-grows-despite-fall-in-consumer-spending', 'Euronews', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-uk-gdp-august-ev1', 'bd-20261017-uk-gdp-august', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-meta-github-breach', 'meta-github-breach-stolen-credential-source-code-1500-notified', 'newsroom', 'news_story', 'technology', 'EDITORIAL_REVIEW', 0, 'Meta says hackers used stolen login to take code from its GitHub repositories', 'The company is notifying about 1,500 people, mostly US employees, after personal data that should not have been stored there was also exposed.', 'Meta is notifying roughly 1,500 people after an outside group used an employee''s stolen credentials to get into some of the company''s GitHub code repositories, according to SecurityWeek, which first reported the company''s disclosure on Oct. 13.

Most of those affected are Meta employees in the United States, SecurityWeek reported. Notifications began going out Tuesday.

## What was taken

According to SecurityWeek and Cybernews, Meta said:

- About 99% of the data taken was business data, mainly software code for some of its products.
- The remaining 1% was personal information. Meta has not said what kinds.
- The personal data had been placed in the repositories by mistake, in violation of company policy, and much of what looked like personal data was synthetic or anonymized test data.

A Meta spokesperson told SecurityWeek the incident was "not a vulnerability in any Meta product" and that the company''s internal systems were not breached. Meta also said it found no evidence the attackers were specifically targeting its data.

## Response

Meta said it detected the intrusion a few weeks before notifying people, cut off the attackers'' access, and brought in GitHub and law enforcement. It has rotated secrets found in the affected repositories, is adding scanning to catch personal data uploaded by mistake, and is offering affected people credit and dark web monitoring, the outlets reported. Meta also said it is notifying regulators, without naming them.

The company has not identified the attackers or said how the credential was stolen. Cybernews noted that the breach follows a July incident in which a flaw in Instagram''s account recovery tool let hackers take over more than 20,000 accounts.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/1/10/A_NASA_computer_server_farm_-a.jpg', 'Photo: NASA / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-meta-github-breach-src1', 'bd-20261017-meta-github-breach', 'Meta Says Hackers Took Code, Personal Data of 1,500 in GitHub Breach', 'https://www.securityweek.com/meta-says-hackers-took-code-personal-data-of-1500-in-github-breach/', 'SecurityWeek', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-meta-github-breach-src2', 'bd-20261017-meta-github-breach', 'Personal data stolen from Meta''s GitHub: Why was it even there?', 'https://cybernews.com/security/meta-hack-github-personal-data/', 'Cybernews', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-meta-github-breach-ev1', 'bd-20261017-meta-github-breach', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-dprk-laptop-farms', 'justice-department-north-korean-it-worker-laptop-farms-texas-arrests', 'newsroom', 'news_story', 'technology', 'EDITORIAL_REVIEW', 0, 'FBI searches 40 Texas ''laptop farms'' in North Korean remote IT worker crackdown', 'Federal prosecutors charged two Americans and 10 China-based people in a scheme they say placed North Korean workers at more than 70 US companies.', 'The Justice Department on Oct. 13 announced arrests, an indictment and a wave of FBI searches aimed at what officials describe as North Korea''s practice of earning money through remote technology jobs at US companies.

According to the department, FBI agents searched more than 40 Texas homes suspected of being "laptop farms" from Sept. 21 to 25, in an effort called Operation Lonestar Roundup. Agents seized about 187 laptops and keyboard-video-mouse switching devices.

## The Ohio indictment

A four-count indictment in the Northern District of Ohio charges wire fraud, money laundering and identity theft. The department said:

| Item | Detail |
|---|---|
| Arrested | Michael James Bostelle (Pennsylvania), Juan Cecilio Pena Carrillo (Texas) |
| Also charged | 10 people based in China; two more defendants under seal |
| Period | 2019 to about July 2025 |
| Employers affected | More than 70 |
| Revenue | About $3 million |

Prosecutors allege that workers posed as Americans using stolen or fabricated identities, while US-based helpers kept company-issued laptops at their homes and sent earnings to accounts controlled by North Korea.

Reuters reported that the indictment names, but does not charge, another American who allegedly recruited and trained Bostelle and others. Attorneys for the two arrested men could not be reached for comment, Reuters said.

## Advice for employers

The department listed 11 fraudulent Gmail accounts it said were used in the schemes and urged companies to add them to their screening. The FBI also issued a public service announcement with guidance. The charges are allegations, and the defendants are presumed innocent.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/5/55/Cyber_Shield_2015_tests_Ohio%E2%80%99s_Computer_Network_Defense_Team_150320-Z-XR817-002.jpg', 'Photo: U.S. National Guard (Ohio National Guard) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-dprk-laptop-farms-src1', 'bd-20261017-dprk-laptop-farms', 'Justice Department Announces Coordinated Actions to Combat North Korean Remote IT Worker Schemes', 'https://justice.gov/opa/pr/justice-department-announces-coordinated-actions-combat-north-korean-remote-it-worker', 'U.S. Department of Justice', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-dprk-laptop-farms-src2', 'bd-20261017-dprk-laptop-farms', 'DOJ arrests 2, seizes 187 devices in North Korean laptop farm crackdown in Texas', 'https://gvwire.com/2026/10/13/doj-arrests-2-seizes-187-devices-in-north-korean-laptop-farm-crackdown-in-texas/', 'Reuters (via GV Wire)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-dprk-laptop-farms-ev1', 'bd-20261017-dprk-laptop-farms', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-states-sue-openai', 'eight-states-sue-openai-chatgpt-child-safety-consumer-protection', 'newsroom', 'news_story', 'ai', 'EDITORIAL_REVIEW', 0, 'Eight states sue OpenAI, alleging ChatGPT misled parents and harmed children', 'Attorneys general from Idaho to West Virginia filed separate consumer protection suits seeking penalties and court-ordered safeguards.', 'Attorneys general in eight states sued OpenAI on Oct. 14, alleging that the company deceived the public about the safety of its ChatGPT chatbot for children, according to Scripps News and the Idaho Capital Sun.

The states filed separate suits in their own courts:

- Arizona
- Arkansas
- Idaho
- Iowa
- Kansas
- Montana
- Nebraska
- West Virginia

Scripps News reported that the suits seek financial penalties and court-ordered safeguards for ChatGPT. They also cite research suggesting the chatbot may encourage delusions, give questionable medical advice and weaken critical thinking.

## The Idaho complaint

Idaho''s 107-page complaint, filed in Ada County district court, alleges violations of the state''s Consumer Protection Act, the Idaho Capital Sun reported. It accuses OpenAI of collecting personal data from children under 13 and of failing to warn users about risks tied to self-harm, violence and suicide.

The state is asking for $5,000 per violation, damages and restitution, according to the Capital Sun. It also wants OpenAI barred from testing advanced models outside a "secured, independently verified testing environment." None of the harm cases cited in the complaint originated in Idaho, the paper reported.

Idaho Attorney General Raúl Labrador said children''s safety should not be traded for profit, and he criticized what he called OpenAI''s "reckless priorities."

## OpenAI''s response

OpenAI spokesperson Drew Pusateri told the Capital Sun the company has built age-specific protections, including parental controls and break reminders, and will keep working with experts and states on AI policy.

Massachusetts is not among the eight states.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Hand_holding_smartphone_with_ChatGPT_(52917076309).jpg/1280px-Hand_holding_smartphone_with_ChatGPT_(52917076309).jpg', 'Photo: Jernej Furman / Wikimedia Commons, CC BY 2.0', 'licensed', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-states-sue-openai-src1', 'bd-20261017-states-sue-openai', 'OpenAI faces lawsuits from 8 states over ChatGPT''s impact on children', 'https://www.abc15.com/science-and-tech/artificial-intelligence/openai-faces-lawsuits-from-8-states-over-chatgpts-impact-on-children', 'Scripps News (via ABC15 Arizona)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-states-sue-openai-src2', 'bd-20261017-states-sue-openai', 'Idaho Attorney General Raúl Labrador sues OpenAI for alleged harms of ChatGPT', 'https://idahocapitalsun.com/?p=32631', 'Idaho Capital Sun', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-states-sue-openai-ev1', 'bd-20261017-states-sue-openai', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-gemini-4-argon', 'google-gemini-4-argon-wider-release-developers-subscribers', 'newsroom', 'news_story', 'ai', 'EDITORIAL_REVIEW', 0, 'Google opens its Gemini 4 Argon model to developers and paying subscribers', 'After a limited debut with cybersecurity partners, Google is offering the model through its API and apps at introductory prices through Nov. 30.', 'Google on Oct. 13 widened access to Gemini 4 Argon, its newest top-tier AI model, making it available to developers, businesses and paying consumers, according to posts on the company''s blog.

The release expands on a Sept. 30 unveiling in which Google gave the model only to a limited group of cybersecurity partners, the data science site Let''s Data Science reported.

## Where it is available

According to Google:

- Developers can use it through the paid tier of the Gemini API in Google AI Studio and in Android Studio.
- Google AI Pro and Ultra subscribers can use it in the Gemini app and in AI Mode in Search.
- Ultra subscribers also get it in Antigravity, Google''s agent-focused coding tool.

The company said it will give 10,000 selected scientists free access to its top Antigravity tier for six months.

## Pricing and claims

| | Through Nov. 30 | After |
|---|---|---|
| Input, per million tokens | $2 | $4 |
| Output, per million tokens | $10 | $20 |

In a post by Koray Kavukcuoglu, Google DeepMind''s senior vice president, the company said the model is built for long, multi-step work in coding, finance, law, cybersecurity and science. Google said it ranked first on the Vals Index, a benchmark of professional tasks, and resisted prompt-injection attacks better than rival systems.

Those results are reported by Google and its partners and have not been independently verified. Let''s Data Science noted that Google''s model card also lists limitations, including hallucinations and occasional timeouts.

Google said it tested the model under its Frontier Safety Framework and added layered defenses against misuse. Vetted cyber defenders can apply to use it without the usual cybersecurity guardrails.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/NASA_Pleiades_Supercomputer_(9616175099).jpg/1280px-NASA_Pleiades_Supercomputer_(9616175099).jpg', 'Photo: NASA / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-gemini-4-argon-src1', 'bd-20261017-gemini-4-argon', 'Gemini 4 Argon: Built to solve your hardest problems', 'https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-argon/', 'Google', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-gemini-4-argon-src2', 'bd-20261017-gemini-4-argon', 'Gemini 4 Argon is now available for developers.', 'https://blog.google/innovation-and-ai/technology/developers-tools/build-with-gemini-4-argon/', 'Google', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-gemini-4-argon-src3', 'bd-20261017-gemini-4-argon', 'Gemini 4 Argon is now available in the Gemini app', 'https://blog.google/innovation-and-ai/products/gemini-app/gemini-4-argon-availability/', 'Google', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-gemini-4-argon-src4', 'bd-20261017-gemini-4-argon', 'Google expands Gemini 4 Argon access across API and subscriber products', 'https://letsdatascience.com/news/google-releases-gemini-4-argon-for-scientific-computing-644a49ff', 'Let''s Data Science', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-gemini-4-argon-ev1', 'bd-20261017-gemini-4-argon', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-crs35-dragon-docks', 'spacex-crs-35-dragon-docks-space-station-final-solar-arrays', 'newsroom', 'news_story', 'science', 'EDITORIAL_REVIEW', 0, 'SpaceX cargo Dragon reaches space station with last set of new solar arrays', 'NASA''s 35th SpaceX resupply flight delivered more than 6,300 pounds of food, gear and experiments, plus the final pair of upgraded power wings.', 'A SpaceX Cargo Dragon docked with the International Space Station on Thursday morning, Oct. 15, two days after lifting off from Florida, NASA said.

The spacecraft attached to the space-facing port of the station''s Harmony module at 10:27 a.m. EDT, according to NASA. Space.com reported the capsule made a roughly 51-hour chase to catch the orbiting lab.

## The mission at a glance

- **Mission:** SpaceX CRS-35, the company''s 35th commercial resupply run for NASA
- **Launch:** Oct. 13, 6:33 a.m. EDT, Falcon 9 from Space Launch Complex 40, Cape Canaveral Space Force Station (NASA)
- **Cargo:** More than 6,300 pounds for the Expedition 75 crew
- **Booster:** First stage B1096, on its eighth flight, landed near the pad, Spaceflight Now reported
- **Departure:** Scheduled for mid-November, with splashdown off California (NASA)

## Power upgrade wraps up

Dragon''s unpressurized trunk carried the last set of Roll-Out Solar Arrays, known as IROSAs, which NASA says will be installed later this fall. Spaceflight Now described them as the fourth and final pair bound for the station; astronauts will mount them during a series of spacewalks.

Inside the capsule, NASA listed hardware for making artificial retinas in microgravity, 3D heart tissue models for drug testing, brain organoids for neurodegenerative disease research, and materials to study how a new type of glass forms in space. Spaceflight Now counted equipment for more than 40 studies.

Space.com noted the arrival also brought spare parts for the Canadarm2 robotic arm, toilet components and a birthday surprise for NASA astronaut Anil Menon, who turned 50 that day.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/f/f7/ISS-31_SpaceX_Dragon_commercial_cargo_craft_approaches_the_ISS_-_crop.jpg', 'Photo: NASA (ISS Expedition 31 crew) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-crs35-dragon-docks-src1', 'bd-20261017-crs35-dragon-docks', 'SpaceX Dragon Docks with Science, Supplies, and Roll-Out Solar Arrays', 'https://www.nasa.gov/?p=1056486', 'NASA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-crs35-dragon-docks-src2', 'bd-20261017-crs35-dragon-docks', 'SpaceX launches NASA science and cargo to the International Space Station', 'https://spaceflightnow.com/2026/10/13/spacex-launches-nasa-science-and-cargo-to-the-international-space-station/', 'Spaceflight Now', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-crs35-dragon-docks-src3', 'bd-20261017-crs35-dragon-docks', 'SpaceX Cargo Dragon delivers more than 6,000 pounds of supplies to the ISS', 'https://www.space.com/space-exploration/launches-spacecraft/spacex-crs-35-iss-cargo-mission-docking', 'Space.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-crs35-dragon-docks-ev1', 'bd-20261017-crs35-dragon-docks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-el-nino-satellites', 'nasa-satellites-noaa-historic-strong-el-nino-2026', 'newsroom', 'news_story', 'science', 'EDITORIAL_REVIEW', 0, 'NASA satellites track what could be the strongest El Niño since 1950', 'Sea-level, temperature and ocean-color data show a powerful warm event building in the Pacific, as NOAA forecasters put the odds of a historic peak at 83%.', 'A warm-water event unfolding across the equatorial Pacific is showing up clearly from orbit, NASA said in an Oct. 15 update, as federal forecasters warn it may become the strongest El Niño on record since 1950.

NOAA''s Climate Prediction Center, in its Oct. 8 monthly discussion, kept an El Niño Advisory in place and called for a strong-to-very strong event likely lasting through January-March 2027.

## The numbers

| Measure | Value | Source |
|---|---|---|
| Latest monthly Niño-3.4 anomaly | +2.1°C | NOAA CPC |
| Chance of historic-strength event, Oct.-Dec. | 83% | NOAA CPC |
| Eastern Pacific surface temperatures | about 3°F above average | NASA |
| Sea level rise in some Pacific areas | up to 1 to 1.3 feet | NASA |

## What the satellites see

NASA traced the first signs to January, when a Kelvin wave, a slow pulse of water thousands of miles long, appeared near Micronesia. By early April such waves had reached the eastern Pacific.

The Sentinel-6 Michael Freilich satellite, which measures ocean height about every 10 days, recorded higher water in the east and levels 6 to 8 inches below normal near Indonesia and northern Australia. JPL scientist Josh Willis called Kelvin waves "the heartbeat of El Niño."

NASA''s PACE satellite, launched in 2024 and observing its first El Niño, found equatorial waters turning bluer as phytoplankton decline. Weaker trade winds reduce the upwelling of nutrients those organisms need, the agency said.

NOAA did not spell out U.S. winter impacts in the discussion. It said an event this large makes typical El Niño effects more likely, but not guaranteed, and pointed readers to its seasonal outlooks.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/1/16/Comparing_Sea_Level_During_El_Ni%C3%B1o_Events_(PIA26099).jpg', 'Photo: NASA/JPL-Caltech / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-el-nino-satellites-src1', 'bd-20261017-el-nino-satellites', 'NASA Satellites Observe Historic 2026 El Niño', 'https://science.nasa.gov/earth/nasa-satellites-observe-historic-2026-el-nino/', 'NASA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-el-nino-satellites-src2', 'bd-20261017-el-nino-satellites', 'ENSO: Recent Evolution, Current Status and Predictions / ENSO Diagnostic Discussion (Oct. 8, 2026)', 'https://www.cpc.ncep.noaa.gov/products/analysis_monitoring/enso_advisory/ensodisc.html?os=..', 'NOAA Climate Prediction Center', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-el-nino-satellites-ev1', 'bd-20261017-el-nino-satellites', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-foliage-weekend', 'new-england-fall-foliage-status-weekend-october-17-2026', 'newsroom', 'news_story', 'lifestyle', 'EDITORIAL_REVIEW', 0, 'Foliage shifts south: Northern Maine past peak as color heads for Massachusetts', 'State reports show the north woods fading while southern Maine, New Hampshire''s lower elevations and Massachusetts move into their best color.', 'New England''s leaf season is sliding south this weekend, with the far north largely done and southern New England coming into its own, according to state reports and local news coverage.

## Maine: south at peak, north fading

Maine''s Department of Agriculture, Conservation and Forestry said in its Oct. 14 update, likely its last of the season, that the state''s northern and western zones are past peak with high leaf drop. Zones 1, 2, 3 South and 4 South, covering much of the southern and coastal parts of the state, were listed at peak.

| Maine zone | Status (Oct. 14) | Leaf drop |
|---|---|---|
| 1, 2 | Peak | Moderate |
| 3 South | Peak | High |
| 4 South | Peak | Moderate |
| 3 North, 4 North, 5, 6, 7 | Past peak | Moderate to high |

Department spokesperson Gale Ross said a dusting of snow could still bring "snowliage" to northern Maine.

## New Hampshire and Massachusetts

NBC Boston reported on Oct. 15 that colors were in full display at Mount Monadnock in southern New Hampshire, and that its forecasters expect Massachusetts to hit its high point next week. Boston, the station said, should look like Monadnock does now in a few weeks.

The Boston Globe''s foliage tracker earlier in the week placed peak color in New Hampshire''s Great North Woods and much of Vermont, and said the Berkshires and northern Worcester County were starting to turn.

The state Department of Conservation and Recreation projected a mid-October statewide peak, with western Massachusetts first. Its interactive foliage map, linked from the DCR fall foliage page, lets visitors check conditions at specific state parks.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/0/04/Fall_Colors_in_New_England_(MODIS).jpg', 'Photo: NASA (MODIS satellite imagery) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-foliage-weekend-src1', 'bd-20261017-foliage-weekend', 'Maine Fall Foliage Report (Oct. 14, 2026)', 'https://www11.maine.gov/dacf/mfs/projects/fall_foliage/report/index.shtml', 'Maine Department of Agriculture, Conservation and Forestry', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-foliage-weekend-src2', 'bd-20261017-foliage-weekend', 'DCR Unveils 2026 Interactive Fall Foliage Map', 'https://www.mass.gov/news/dcr-unveils-2026-interactive-fall-foliage-map', 'Massachusetts Department of Conservation and Recreation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-foliage-weekend-src3', 'bd-20261017-foliage-weekend', 'The excellent fall foliage has people rushing to see the trees changing colors', 'https://www.nbcboston.com/news/local/mass-nh-fall-foliage-colors-2026/4031243/', 'NBC Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-foliage-weekend-src4', 'bd-20261017-foliage-weekend', 'Fall foliage tracker: Here''s where leaves are peaking right now across New England', 'https://www.bostonglobe.com/2026/10/07/metro/peak-fall-foliage-new-england-2026/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-foliage-weekend-ev1', 'bd-20261017-foliage-weekend', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-open-enrollment-dates', 'medicare-aca-health-connector-open-enrollment-dates-2027', 'newsroom', 'news_story', 'lifestyle', 'EDITORIAL_REVIEW', 0, 'Health plan season is here: Key dates for Medicare, ACA and the Health Connector', 'Medicare open enrollment began Oct. 15, the Massachusetts Health Connector opens Oct. 23 and HealthCare.gov follows Nov. 1 for 2027 coverage.', 'Fall shopping season for health insurance is underway. Medicare''s annual open enrollment started Thursday, Oct. 15, and marketplace windows for 2027 plans open in the coming weeks.

## The calendar

| Program | Window | Source |
|---|---|---|
| Medicare | Oct. 15 – Dec. 7, 2026 | Medicare.gov, CMS |
| Mass. Health Connector | Oct. 23, 2026 – Jan. 23, 2027 | Boston Globe, HealthInsurance.org |
| HealthCare.gov | Nov. 1 – Jan. 15 | HealthCare.gov |

On HealthCare.gov, Dec. 15 is the last day to pick or change a plan for coverage starting Jan. 1, the site says.

## Medicare changes for 2027

During the Medicare window, enrollees can switch between Original Medicare and Medicare Advantage, or join, drop or change drug plans, according to Medicare.gov. Changes take effect Jan. 1, and the plan must receive a request by Dec. 7.

The Associated Press, in a report published by ABC News, said the annual Part D out-of-pocket cap rises to $2,400 from $2,100, and the standard deductible climbs to $700 from $615. The AP also reported some Medicare Advantage plans are leaving certain areas or trimming extras such as dental.

## Massachusetts outlook

The Boston Globe reported in September that about 350,000 residents hold individual Connector coverage, and that unsubsidized non-group premiums are set to rise an average of 12.4% in 2027. The Globe said roughly 30,000 to 35,000 lawfully present noncitizen enrollees are expected to lose federal premium tax credits on Jan. 1.

Medicare.gov notes that people who switch to Original Medicare may need a separate drug plan, and that there are limits on when Medigap supplemental coverage can be added.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/8/8d/Dr._Donald_Berwick,_Administrator_of_the_Centers_for_Medicare_and_Medicaid_Services_(CMS),_talks_with_Washington_DC_seniors_about_Medicare%27s_Open_Enrollment_period_(2).jpg', 'Photo: U.S. Department of Health and Human Services / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-open-enrollment-dates-src1', 'bd-20261017-open-enrollment-dates', 'Open Enrollment', 'https://www.medicare.gov/health-drug-plans/open-enrollment', 'Medicare.gov (CMS)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-open-enrollment-dates-src2', 'bd-20261017-open-enrollment-dates', '2027 Medicare Advantage and Part D Landscape State-by-State Fact Sheets', 'https://www.cms.gov/files/document/2027-medicare-advantage-part-d-landscape-state-state-fact-sheets.pdf', 'Centers for Medicare & Medicaid Services', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-open-enrollment-dates-src3', 'bd-20261017-open-enrollment-dates', 'When can you get health insurance? (Dates and deadlines)', 'https://www.healthcare.gov/quick-guide/dates-and-deadlines/', 'HealthCare.gov', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-open-enrollment-dates-src4', 'bd-20261017-open-enrollment-dates', 'New Medicare season begins, but some shifts will arrive in 2027', 'https://abcnews.com/Business/wireStory/new-medicare-season-begins-shifts-arrive-2027-137299296', 'Associated Press (via ABC News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-open-enrollment-dates-src5', 'bd-20261017-open-enrollment-dates', 'Premiums up, subsidies at risk as Massachusetts Health Connector open enrollment nears', 'https://www.bostonglobe.com/2026/09/14/business/premiums-subsidies-massachusetts-health-connector-open-enrollment/', 'The Boston Globe', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-open-enrollment-dates-src6', 'bd-20261017-open-enrollment-dates', 'ACA Open Enrollment Guide: When is the ACA''s next open enrollment period?', 'https://www.healthinsurance.org/obamacare-enrollment-guide/when-is-the-acas-next-open-enrollment-period/', 'HealthInsurance.org', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-open-enrollment-dates-ev1', 'bd-20261017-open-enrollment-dates', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-street-fighter-boxoffice', 'street-fighter-box-office-opening-you-can-see-everything-documentary', 'newsroom', 'news_story', 'entertainment', 'EDITORIAL_REVIEW', 0, '''Street Fighter'' leads box office as Holmes documentary draws crowds', 'Paramount''s video game adaptation is on track for about $31 million, while A24''s Elizabeth Holmes documentary is beating expectations by a wide margin.', 'Paramount''s "Street Fighter" is headed for first place at the domestic box office this weekend. The real surprise is a nearly three-hour documentary about Elizabeth Holmes.

The Capcom adaptation, made with Legendary, took in about $13 million on Friday, a total that includes Thursday previews, from 3,575 theaters in North America. Industry estimates point to an opening of about $31 million, according to Martin Cid Magazine and Hollywood Outbreak, both citing trade reports. Those figures are studio estimates as of Saturday. Final numbers come out Monday.

## A documentary breakout

A24''s "You Can See Everything," which follows the Theranos founder, earned about $5.5 million Friday from only 855 screens. It is now projected to make about $12 million to $14 million for the weekend, according to Martin Cid Magazine. Pre-release forecasts had it at $7 million to $8 million. Martin Cid Magazine, citing Deadline, reports that the total would be the second-best opening ever for a documentary, behind "Fahrenheit 9/11." Showbiz411 also put the film''s Friday at $5.5 million.

## Weekend estimates

| Film | Distributor | Friday | Projected weekend |
|---|---|---|---|
| Street Fighter | Paramount | $13M | ~$31M |
| You Can See Everything | A24 | $5.5M | ~$12M+ |
| Other Mommy | n/a | $2.5M | ~$7.9M |
| Whalefall | 20th Century/Disney | $3.0M | ~$7M |
| Sense and Sensibility | Focus Features | $3.3M | ~$6.7M |

*Studio estimates as of Saturday, Oct. 17, per Hollywood Outbreak and Martin Cid Magazine.*

"Street Fighter" cost a net $82 million to make. Audiences gave it a B- CinemaScore, according to Martin Cid Magazine. "Sense and Sensibility" earned an A-. In its second weekend, the horror film "Other Mommy" is approaching $44 million in domestic ticket sales.

The Numbers'' Thursday chart shows how quiet the market was before the new films opened. The Indian action film "Jailer 2" led Thursday with $2 million.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Grauman%27s_Chinese_Theatre,_by_Carol_Highsmith_fixed_%26_straightened.jpg/1280px-Grauman%27s_Chinese_Theatre,_by_Carol_Highsmith_fixed_%26_straightened.jpg', 'Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-street-fighter-boxoffice-src1', 'bd-20261017-street-fighter-boxoffice', 'Street Fighter Box Office: $31M Win, but the Sold-Out Ticket Is A24''s Holmes Doc', 'https://www.martincid.com/movies/street-fighter-box-office-you-can-see-everything-sold-out/', 'Martin Cid Magazine', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-street-fighter-boxoffice-src2', 'bd-20261017-street-fighter-boxoffice', '''Street Fighter'' Dominates Box Office With Big $31M Debut', 'https://www.hollywoodoutbreak.com/2026/10/17/street-fighter-dominates-box-office-with-big-31m-debut/', 'Hollywood Outbreak', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-street-fighter-boxoffice-src3', 'bd-20261017-street-fighter-boxoffice', 'Box Office: "Street Fighter" Takes $13 Mil Opening, Strange "You Can See Everything" Has $5.5 Mil Haul', 'https://www.showbiz411.com/2026/10/17/box-office-street-fighter-takes-13-mil-opening-strange-you-can-see-everything-has-5-5-mil-haul-despite-3-hour-run-time-sony-confuses-social', 'Showbiz411', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-street-fighter-boxoffice-src4', 'bd-20261017-street-fighter-boxoffice', 'Daily Domestic Box Office Chart for Thursday, October 15, 2026', 'https://www.the-numbers.com/daily-box-office-chart', 'The Numbers', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-street-fighter-boxoffice-ev1', 'bd-20261017-street-fighter-boxoffice', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-beatles-swift-charts', 'beatles-rubber-soul-returns-billboard-200-top-10-taylor-swift-drake', 'newsroom', 'news_story', 'entertainment', 'EDITORIAL_REVIEW', 0, 'Beatles'' ''Rubber Soul'' returns to top 10 as Taylor Swift holds No. 1', 'A special-edition reissue sends the 1965 album to No. 4 on the Billboard 200, behind Taylor Swift and Drake.', 'A Beatles album first released in 1965 is back in the top 10 of the Billboard 200. It sits behind two of the biggest names in current pop.

"Rubber Soul" re-entered the chart dated Oct. 17 at No. 4 with 58,000 equivalent album units, according to Parade. About 50,000 of those units came from traditional album sales. Parade linked the jump to the Special Edition reissue that came out Oct. 2. The set includes new stereo and Dolby Atmos mixes plus outtakes and demos that had never been released.

## Swift stays on top

Taylor Swift''s "The Life of a Showgirl" stayed at No. 1. According to VOI, citing Variety and Luminate data, the album earned 93,000 units in the tracking week that ended Oct. 8, down 46% from the week before. The "Encore" edition, with four new songs, has helped keep it in first place. VOI also reports that Swift has now spent 100 career weeks at No. 1. That is the most for any solo act and trails only the Beatles'' 132.

Drake''s "HABIBTI" climbed to No. 2 with 71,000 units, according to VOI. A chart listing posted by CreativeDisc shows the album jumped from No. 116 the previous week.

## The top five

| Rank | Album | Artist | Last week |
|---|---|---|---|
| 1 | The Life of a Showgirl | Taylor Swift | 1 |
| 2 | HABIBTI | Drake | 116 |
| 3 | you seem pretty sad for a girl so in love | Olivia Rodrigo | 2 |
| 4 | Rubber Soul | The Beatles | Re-entry |
| 5 | I''m The Problem | Morgan Wallen | 4 |

*Billboard 200 dated Oct. 17, 2026, per CreativeDisc''s chart listing.*

Parade noted that this is the first time the Beatles, Drake and Swift have all appeared in the top 10 together.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-sections.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-beatles-swift-charts-src1', 'bd-20261017-beatles-swift-charts', 'The Beatles Join Taylor Swift and Drake in the Top 10 With a 1965 Album', 'https://parade.com/news/the-beatles-join-taylor-swift-and-drake-in-the-top-10-with-a-1965-album', 'Parade', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-beatles-swift-charts-src2', 'bd-20261017-beatles-swift-charts', 'Taylor Swift Hits 100 Weeks at the Top of the Billboard 200, The Beatles Still Top', 'https://voi.id/en/musik/598201', 'VOI', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-beatles-swift-charts-src3', 'bd-20261017-beatles-swift-charts', 'Billboard 200 - 17 October 2026', 'https://creativedisc.com/2026/10/billboard-200-17-october-2026/', 'CreativeDisc', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-beatles-swift-charts-src4', 'bd-20261017-beatles-swift-charts', 'The Beatles, Drake, ''Hamilton,'' More: Chart Highlights for Oct. 17, 2026', 'https://www.billboard.com/lists/beatles-drake-hamilton-chart-highlights-oct-17-2026/', 'Billboard', 'web', 'PRIMARY_SOURCE', 0, 1, '2026-10-18T03:30:00.000Z', 'Official page: open it, confirm, then tick Verified.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-beatles-swift-charts-ev1', 'bd-20261017-beatles-swift-charts', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-celtics-opener-preview', 'celtics-2026-27-season-opener-pistons-tatum-george-preview', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Celtics open retooled season Tuesday in Detroit, with Brown now in Philadelphia', 'Boston starts the 2026-27 season against the Pistons, with Jayson Tatum and newcomer Paul George leading a roster reshaped by the Jaylen Brown trade.', 'The Celtics open the 2026-27 regular season Tuesday afternoon, Oct. 20, in Detroit. The roster looks very different from the one that finished last season.

The game against the Pistons tips off at 3 p.m. ET on NBC and Peacock and starts the league''s opening-day tripleheader, according to NBA.com. The league describes it as a matchup of last season''s top two seeds in the East. Boston went 56-26 last season and finished second in the conference before losing in the first round.

## A new supporting cast

The biggest offseason change was the trade that sent Jaylen Brown to the Philadelphia 76ers. NBA.com''s season preview called it the largest trade of the summer. Boston added Paul George, who is expected to start next to Jayson Tatum, along with guard Mike Conley, Dillon Mitchell and rookie Chris Cenac Jr. Former Knicks center Mitchell Robinson signed a three-year deal to strengthen the frontcourt.

Tatum''s health is the key question. He missed the first 62 games of last season while recovering from a torn Achilles tendon. According to NBA.com, he played in 22 regular-season and playoff games after returning but could not finish the postseason. Joe Mazzulla is back as head coach.

## Opening stretch

| Date | Opponent | Site | Time (ET) |
|---|---|---|---|
| Tue., Oct. 20 | Detroit Pistons | Detroit | 3 p.m. (NBC/Peacock) |
| Fri., Oct. 23 | New York Knicks | TD Garden | 7 p.m. (Prime) |

The home opener three days later brings the defending champion Knicks to TD Garden, according to NBC Sports Boston. It also marks Robinson''s first game against his former team. Brown returns to Boston with the 76ers on Jan. 21.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/TD_Garden.JPG/1280px-TD_Garden.JPG', 'Photo: Nywalton / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-celtics-opener-preview-src1', 'bd-20261017-celtics-opener-preview', '2026-27 Season Preview: Boston Celtics', 'https://www.nba.com/news/2026-27-season-preview-bos', 'NBA.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-celtics-opener-preview-src2', 'bd-20261017-celtics-opener-preview', 'Starting 5: Regular season countdown, American Express Tip-Off guide', 'https://www.nba.com/news/starting-5-october-13-2026', 'NBA.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-celtics-opener-preview-src3', 'bd-20261017-celtics-opener-preview', 'Printable Celtics schedule 2026-27: Dates, times, opponents', 'https://www.nbcsportsboston.com/nba/boston-celtics/printable-celtics-schedule-2026-27-dates-times-opponents/799171/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-celtics-opener-preview-ev1', 'bd-20261017-celtics-opener-preview', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-bc-beats-pitt', 'boston-college-beats-pittsburgh-27-21-first-acc-win', 'newsroom', 'news_story', 'college-football', 'EDITORIAL_REVIEW', 0, 'Boston College rallies past Pitt, 27-21, for first ACC win of season', 'After falling behind 12-0, the Eagles scored 21 straight points behind Mason McKenzie''s career-high 295 passing yards and held on to beat the Panthers.', 'Boston College dug out of an early 12-0 hole and beat Pittsburgh 27-21 on Saturday at Alumni Stadium. It was the Eagles'' first ACC victory this season.

The homecoming win evened BC at 3-3 overall and 1-2 in the conference. Pitt fell to 5-2 and 2-2, according to Boston College Athletics.

## Slow start, quick answer

Pitt freshman Corey Dailey, starting in place of injured quarterback Mason Heintschel, threw a 75-yard touchdown to Cataurus Hicks on the first play from scrimmage. A blocked punt that ended in a safety and a field goal put the Panthers up 12-0, CBS Pittsburgh reported.

BC then scored 21 straight points. Bo MacCormack III ran in from a yard out. Javarius Green caught an 11-yard touchdown with 51 seconds left in the half for a 14-12 lead, according to Boston.com. Mason McKenzie found Landon Wright for a 69-yard score 46 seconds into the third quarter.

Evan Dickens'' 1-yard run made it 27-18 early in the fourth. Antonio Chadha kicked his fourth field goal to pull Pitt within six, and Charlie Comella''s interception with 1:34 left sealed it.

## By the numbers

| | BC | Pitt |
|---|---|---|
| Total yards | 398 | 392 |
| Passing | 295 | 193 |
| Rushing | 103 | 199 |
| Turnovers forced | 3 | 2 |

McKenzie finished 17 of 28 for 295 yards, a career high, with two touchdowns and two interceptions. Wright had 122 receiving yards. Carter Davis led the defense with 11 tackles, and KP Price added 10 tackles and an interception. Pitt was penalized 13 times for 133 yards, CBS Pittsburgh noted.

The win came three days after general manager Kenyatta Watson left unexpectedly, Boston.com reported. BC plays at Georgia Tech next Saturday at 3:30 p.m. on ACC Network.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-sections.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-bc-beats-pitt-src1', 'bd-20261017-bc-beats-pitt', 'Eagles Defeat Pittsburgh on Homecoming Weekend', 'https://bceagles.com/news/2026/10/17/football-eagles-defeat-pittsburgh-on-homecoming-weekend', 'Boston College Athletics', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-bc-beats-pitt-src2', 'bd-20261017-bc-beats-pitt', 'Boston College hangs on to beat Pittsburgh for first ACC win of the season', 'https://www.boston.com/sports/college-sports/2026/10/17/boston-college-pittsburgh-acc-football-score/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-bc-beats-pitt-src3', 'bd-20261017-bc-beats-pitt', 'Pitt can''t hold on to early leads, falls 27-21 to Boston College', 'https://www.cbsnews.com/pittsburgh/news/pitt-boston-college-score-saturday/', 'CBS Pittsburgh', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-bc-beats-pitt-ev1', 'bd-20261017-bc-beats-pitt', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
