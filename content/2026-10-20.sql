-- Newsroom drafts for 2026-10-20. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image have none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-doj-ca-voters', 'justice-department-charges-28-california-voting', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Justice Department charges 28 green-card holders in California voting cases', 'Federal prosecutors say the lawful permanent residents registered or voted illegally; state and county officials are fighting a wider federal push over their voter rolls.', 'The Justice Department on Monday announced charges against 28 lawful permanent residents in California, accusing them of election and immigration crimes two weeks before the Nov. 3 election.

According to the department, 11 people were arrested Monday under what it calls Operation Protect the Vote, run jointly by all four U.S. attorney''s offices in the state. All defendants are presumed innocent.

## The charges

Prosecutors allege a mix of offenses: falsely claiming citizenship on voter registration forms, lying on naturalization applications about past voting, and voting in a federal election as a noncitizen. The registration and naturalization counts carry up to five years in prison; the noncitizen voting misdemeanor carries up to one year.

| Federal district | Defendants |
| --- | --- |
| Central | 13 |
| Eastern | 6 |
| Northern | 5 |
| Southern | 4 |

## A larger fight over the rolls

The department said all 28 appear on a list of more than 20,000 suspected noncitizen registrants it gave California on Oct. 13. The state declined to set aside those voters'' mail ballots, and the federal government has sued.

NPR reported that many of the 28 did not appear to have voted, and some registered more than 20 years ago. California Secretary of State Shirley Weber has called the federal demands unlawful, and Los Angeles County lawyers argued that federal law bars removing voters wholesale this close to an election, NPR reported.

Research has not found noncitizen voting to be widespread, NPR noted. Over the past seven weeks, the department has charged 113 noncitizens in 20 states with voting or registration crimes, according to NPR.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-20.sql', 9, 1, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-doj-ca-voters-src1', 'bd-20261020-doj-ca-voters', 'Justice Department charges 28 foreign nationals in California with election crimes', 'https://www.justice.gov/opa/pr/justice-department-charges-28-foreign-nationals-california-election-crimes', 'U.S. Department of Justice', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-doj-ca-voters-src2', 'bd-20261020-doj-ca-voters', 'DOJ charges 28 in California with voting crimes as election tensions escalate', 'https://www.stlpr.org/npr/2026-10-19/doj-charges-28-in-california-with-voting-crimes-as-election-tensions-escalate', 'NPR (via St. Louis Public Radio)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-doj-ca-voters-src3', 'bd-20261020-doj-ca-voters', 'Operation Protect the Vote: federal sweep leads to 28 charges', 'https://abc7.com/post/federal-operation-targeting-alleged-noncitizen-voter-registration-underway-commerce-area/19954916/', 'ABC7 Los Angeles', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-doj-ca-voters-ev1', 'bd-20261020-doj-ca-voters', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-kansas-senate', 'trump-kansas-rally-marshall-hamilton-senate', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Trump rallies for Marshall in Kansas as a once-safe Senate seat draws a fight', 'The president''s first Kansas visit since 2018 came as Democrat Adam Hamilton, a Kansas City-area pastor, presses an unexpectedly competitive race.', 'President Donald Trump campaigned for Sen. Roger Marshall on Monday at Heartland Credit Union Arena in Park City, outside Wichita, his first Kansas visit since 2018, the Kansas Reflector reported.

The stop, with 15 days left before the Nov. 3 election, signals Republican concern about a seat long considered safe. Marshall faces Democrat Adam Hamilton, a Methodist minister, in a race Fox News described as once considered safely Republican.

## What was said

Trump spoke for about an hour and 40 minutes in an arena the Reflector estimated was about two-thirds full. He pressed border security, military strength and lower costs, and announced what he called a harvest fuel relief program to help farmers with diesel costs, which have topped $6 a gallon in Kansas, according to the Reflector.

He praised Marshall and attacked Hamilton as a radical, the Reflector reported. Fox News quoted him promising, "we''re going to reelect Roger Marshall."

Marshall, speaking first, warned that a loss in Kansas could hand Democrats the Senate.

## The Democrat''s response

A Hamilton campaign spokesman said the rally showed Marshall''s campaign is struggling and that Kansans are focused on fuel prices, health care access and corruption, the Reflector reported. In a video released Monday, Hamilton said Trump voters also have a place in his campaign.

Libertarian David Graham is also on the ballot. He has objected to being left out of a televised Marshall-Hamilton debate set for Wednesday.

## Next stop

Trump was scheduled to campaign Tuesday in Lubbock and Waco, Texas, with Senate nominee Ken Paxton, Fox News reported, citing RNC officials.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/e/e4/Crops_Kansas_AST_20010624.jpg', 'Kansas farmland seen from orbit. Image: NASA ASTER / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-20.sql', 8, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-kansas-senate-src1', 'bd-20261020-kansas-senate', 'In Kansas rally, Trump defends Marshall''s record and calls Hamilton a disgrace', 'https://kansasreflector.com/2026/10/19/in-kansas-rally-trump-defends-marshalls-record-and-calls-hamilton-a-disgrace/', 'Kansas Reflector', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-kansas-senate-src2', 'bd-20261020-kansas-senate', '2026 Midterm Elections: Trump campaigns in Kansas (live, Oct. 19)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-kansas-latino-voters-october-19', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-kansas-senate-ev1', 'bd-20261020-kansas-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-scotus-911', 'supreme-court-911-plea-deals-guantanamo', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Supreme Court leaves death penalty on the table for accused 9/11 plotters', 'The justices declined to hear appeals from Khalid Sheikh Mohammed and two co-defendants, letting the Pentagon''s 2024 cancellation of their plea deals stand.', 'The Supreme Court on Monday declined to take up appeals from Khalid Sheikh Mohammed and two other men accused of planning the Sept. 11, 2001, attacks, leaving in place a ruling that allowed the Pentagon to cancel their plea agreements.

The order means the death penalty remains possible for the three men, CNN and United Press International reported.

## How the deals unraveled

Military prosecutors reached the agreements in early 2024, and a military commission judge approved them, UPI reported. Under the terms, the men would have pleaded guilty to all charges in exchange for life sentences, with a public sentencing where survivors and victims'' relatives could face them.

Days later, then-Defense Secretary Lloyd Austin revoked the deals. Military courts ruled he lacked that authority, but the U.S. Court of Appeals for the D.C. Circuit sided with Austin in August, according to UPI. CNN reported that the appeals court found Austin had that power "indisputably."

## Who is affected

| Defendant | Status |
| --- | --- |
| Khalid Sheikh Mohammed | Held at Guantanamo Bay since 2006 |
| Walid bin Attash | Held at Guantanamo Bay |
| Mustafa Ahmed al-Hawsawi | Held at Guantanamo Bay |

## What comes next

Pretrial proceedings before the military commission can now continue, but a trial is unlikely before 2028, UPI reported. Georgetown law professor Steve Vladeck, who had urged the justices to hear the case, told UPI a trial in the near future is unlikely given unresolved issues.

Delays in the case have stemmed in part from disputes over evidence obtained through CIA torture, UPI reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/9/9c/US_Navy_040813-N-6939M-002_Commissions_building_courtroom_at_Guantanamo_Bay,_Cuba.jpg', 'Military commissions courtroom at Guantanamo Bay, 2004. Photo: U.S. Navy / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-20.sql', 7, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-scotus-911-src1', 'bd-20261020-scotus-911', 'Supreme Court backs Pentagon decision to throw out plea deals for 9/11 alleged conspirators', 'https://kvia.com/politics/cnn-us-politics/2026/10/19/supreme-court-backs-pentagon-decision-to-throw-out-plea-deals-for-9-11-alleged-conspirators/', 'CNN (via KVIA)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-scotus-911-src2', 'bd-20261020-scotus-911', 'Supreme Court denies appeal from alleged Sept. 11 planners', 'https://gephardtdaily.com/top-stories/supreme-court-denies-appeal-from-alleged-sept-11-planners/', 'United Press International (via Gephardt Daily)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-scotus-911-ev1', 'bd-20261020-scotus-911', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-vance-helene', 'vance-helene-relief-western-north-carolina', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Vance promises $858 million for Helene road repairs at North Carolina rally', 'The vice president campaigned in Hendersonville for Senate hopeful Michael Whatley, more than two years after the storm cut off western North Carolina.', 'Vice President JD Vance on Monday announced $858 million in additional Transportation Department money to rebuild roads in western North Carolina damaged by Hurricane Helene, using a campaign stop in Hendersonville to make the pledge.

Vance said the funds would go toward rebuilding eight major corridors, including Interstate 40 through the Pigeon River Gorge, according to WLOS and NC Newsline. NC Newsline reported that the Transportation Department announced $873 million in Helene relief for the state the same day and did not explain the difference between the figures.

## The campaign backdrop

The rally, at a warehouse that WLOS said drew roughly 200 to 300 people, was aimed at boosting Republican turnout. Vance campaigned for:

- **Michael Whatley**, the GOP nominee for the open U.S. Senate seat, who faces former Democratic Gov. Roy Cooper. Cook Political Report rates the race likely Democratic, NC Newsline reported.
- **Jennifer Balkcom**, a state lawmaker running in the 11th Congressional District against Democrat Jamie Ager.
- **Laurie Buckhout**, another Republican House candidate.

## The recovery dispute

Helene recovery has become a campaign issue. Whatley was named the administration''s recovery czar in January 2025; critics, including some Republicans, say he did little to secure federal help, NC Newsline reported. Whatley has blamed Cooper, saying he was unprepared for the disaster.

A Cooper campaign spokesperson said the former governor led the state through several major storms and secured state and federal recovery money, according to NC Newsline.

Election Day is Nov. 3.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/1/12/Hurricane_Helene_seen_from_the_ISS.jpg', 'Hurricane Helene viewed from the International Space Station, 2024. Photo: NASA / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-20.sql', 6, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-vance-helene-src1', 'bd-20261020-vance-helene', 'Vance touts $858M in Helene relief funding for Western North Carolina', 'https://ncnewsline.com/2026/10/19/vance-touts-858m-in-helene-relief-funding-for-western-north-carolina/', 'NC Newsline (States Newsroom)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-vance-helene-src2', 'bd-20261020-vance-helene', 'JD Vance campaigns for Republican candidates at western North Carolina rally', 'https://wlos.com/news/local/vice-president-jd-vance-campaigns-republican-candidates-gop-western-north-carolina-rally-hendersonville-midterm-elections-jennifer-balkcom-michael-whatley', 'WLOS', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-vance-helene-ev1', 'bd-20261020-vance-helene', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-ma-lt-gov', 'shawn-oliver-lieutenant-governor-oui-plea', 'newsroom', 'news_story', 'states', 'EDITORIAL_REVIEW', 0, 'GOP lieutenant governor nominee pleads not guilty after crash; his name stays on the ballot', 'Shawn Oliver ended his campaign after a New Bedford rollover, but state election officials say ballots are printed and early voting is underway.', 'Shawn Oliver, the Republican nominee for Massachusetts lieutenant governor, pleaded not guilty Monday to drunken-driving and related charges, a day after he ended his campaign, CBS Boston and WHDH reported.

Oliver, 42, a New Bedford city councilor, was arraigned in New Bedford District Court on charges of operating under the influence, negligent operation, a marked lanes violation and speeding. He was released on personal recognizance and is due back in court Nov. 16, CBS Boston reported. His license was suspended.

## What police say happened

Police say Oliver struck several parked cars and flipped his SUV on Dartmouth Street around 11:40 p.m. Saturday, according to CBS Boston. Police reports say he told officers he had at least two drinks at a local restaurant beforehand. He was treated for a head cut.

## The campaign

Oliver was running with gubernatorial nominee Mike Minogue. Minogue called on him to step aside, and Oliver suspended his campaign Sunday, saying the election should not be overshadowed by personal matters, WHDH reported.

## What it means for voters

| Question | Answer, per the Secretary of State''s office |
| --- | --- |
| Can Oliver''s name come off the ballot? | No. The withdrawal deadline was Sept. 4 and ballots are printed. |
| How many have voted already? | Nearly 300,000 as of Monday. |
| What if the ticket wins? | Oliver could decline the oath, leaving the office vacant. |

Minogue said he would ask Oliver to resign if they win, and his campaign is still asking voters to back the ticket, CBS Boston reported. A spokesperson for Gov. Maura Healey, the Democratic incumbent running with Lt. Gov. Kim Driscoll, declined to comment.

Election Day is Tuesday, Nov. 3.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-20.sql', 7, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-ma-lt-gov-src1', 'bd-20261020-ma-lt-gov', 'Shawn Oliver, former Massachusetts Lt. Gov. candidate charged in drunk driving crash, pleads not guilty', 'https://www.cbsnews.com/boston/news/shawn-oliver-arraignment-massachusetts-lieutenant-governor/', 'CBS Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-ma-lt-gov-src2', 'bd-20261020-ma-lt-gov', 'Shawn Oliver suspends Lt. Governor campaign after OUI arrest', 'https://whdh.com/news/shawn-oliver-suspends-lt-governor-campaign-after-oui-arrest/', 'WHDH 7News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-ma-lt-gov-ev1', 'bd-20261020-ma-lt-gov', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-rays-pennant', 'rays-beat-guardians-alcs-world-series-brewers', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Rays beat Guardians 7-3 to win the pennant; World Series vs. Brewers opens Friday', 'Freddy Peralta was named ALCS MVP as Tampa Bay won three straight. Either the Rays or the Brewers will win a first championship.', 'The Tampa Bay Rays are going to the World Series. They beat the Cleveland Guardians 7-3 in Game 6 of the American League Championship Series on Monday night at Tropicana Field, winning the series 4-2.

It is the Rays'' third pennant in 29 seasons, after 2008 and 2020, The Associated Press reported. They lost both of those World Series.

## How Game 6 went

Tampa Bay never trailed, Newsweek reported. Richie Palacios hit a two-run double in the second inning and Jonny DeLuca added a sacrifice fly in the third. After Cleveland closed within two, Junior Caminero hit a two-run homer in the seventh, his first career postseason home run, and Yandy Díaz added a two-run shot in the eighth, according to the AP.

Starter Freddy Peralta allowed one run over 5 1/3 innings and was named ALCS MVP, the AP reported. The Rays had trailed the series 1-0 and 2-1 before winning the last three games.

## A first-time champion

The Milwaukee Brewers swept the Los Angeles Dodgers in the NL Championship Series, according to MLB. It is the first World Series since 1980 in which neither team has won a title, the AP reported.

| Game | Date | Site |
| --- | --- | --- |
| 1 | Fri., Oct. 23 | Milwaukee |
| 2 | Sat., Oct. 24 | Milwaukee |
| 3 | Mon., Oct. 26 | Tampa Bay |
| 4 | Tue., Oct. 27 | Tampa Bay |
| 5* | Wed., Oct. 28 | Tampa Bay |
| 6* | Fri., Oct. 30 | Milwaukee |
| 7* | Sat., Oct. 31 | Milwaukee |

*If necessary. All games start at 8 p.m. ET on FOX, according to MLB.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-20.sql', 7, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-rays-pennant-src1', 'bd-20261020-rays-pennant', '2026 postseason schedule, results and how to watch', 'https://www.mlb.com/news/2026-mlb-playoff-and-world-series-schedule', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-rays-pennant-src2', 'bd-20261020-rays-pennant', 'Rays beat Guardians 7-3 and earn a trip to the World Series', 'https://www.nbcnewyork.com/mlb/rays-guardians-game-6-score/6560966/', 'The Associated Press (via NBC New York)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-rays-pennant-src3', 'bd-20261020-rays-pennant', 'The Rays eliminated the Guardians, setting the stage for a historic World Series', 'https://www.newsweek.com/sports/mlb/world-series-schedule-rays-brewers-mlb-12591350', 'Newsweek', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-rays-pennant-ev1', 'bd-20261020-rays-pennant', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-pats-bears', 'patriots-bears-thursday-night-short-week', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Banged-up Patriots turn around fast for Thursday night at Chicago', 'Fresh off a third straight win, New England (4-2) has three days to prepare for the Bears with four players hurt against the Jets.', 'The Patriots get little time to enjoy Sunday''s 26-19 win over the Jets. New England (4-2) visits the Chicago Bears on Thursday at 8:15 p.m. on Prime Video, according to the team''s schedule.

## The injury list

Four Patriots left the Jets game hurt, Sports Illustrated''s Bears site reported: receiver Romeo Doubs (shoulder), the team''s leader in catches; right tackle Morgan Moses (ankle); left guard Alijah Vera-Tucker (hamstring); and backup lineman Ben Brown (knee). Coach Mike Vrabel sounded unsure most would be ready on a short week.

Roundtable Sports, writing on Yahoo Sports, projected Walter Rouse and Mat Pryor at guard and rookie Caleb Lomu at right tackle if Moses cannot go.

On the positive side, cornerback Christian Gonzalez returned from a shoulder injury and held Garrett Wilson to five catches for 26 yards, according to Roundtable. Drake Maye threw for 235 yards and three touchdowns.

## The Bears

Chicago beat Atlanta 31-23 in Week 6 as Caleb Williams completed 30 of 36 passes for 305 yards in his return from injury, SI reported. The Bears have their own concerns: guard Jonah Jackson (hip) may miss the game, and defensive end Montez Sweat is serving the second game of a two-game suspension.

## What''s ahead

| Week | Date | Opponent | Kickoff (ET) | TV |
| --- | --- | --- | --- | --- |
| 7 | Thu., Oct. 22 | at Chicago | 8:15 p.m. | Prime Video |
| 8 | Sun., Nov. 1 | at Miami | 4:25 p.m. | CBS |
| 9 | Sun., Nov. 8 | Green Bay | 4:25 p.m. | FOX |
| 10 | Sun., Nov. 15 | Detroit (in Munich) | 9:30 a.m. | FOX |

Source: Patriots.com', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-20.sql', 6, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-pats-bears-src1', 'bd-20261020-pats-bears', 'Patriots 2026 Schedule', 'https://www.patriots.com/schedule/', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-pats-bears-src2', 'bd-20261020-pats-bears', 'Monday Morning Game Notes: Patriots face tough test against Bears on short week', 'https://sports.yahoo.com/articles/monday-morning-game-notes-patriots-130041446.html', 'Roundtable Sports (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-pats-bears-src3', 'bd-20261020-pats-bears', 'Bears facing Patriots roster with even worse injury luck this week on TNF', 'https://www.si.com/nfl/bears/onsi/bears-patriots-nfl-week-7', 'Sports Illustrated (Bears On SI)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-pats-bears-ev1', 'bd-20261020-pats-bears', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261020-bruins-dallas', 'bruins-dallas-stars-sixth-straight', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins chase a sixth straight win in Dallas, with a goalie duel on tap', 'Boston brings a five-game winning streak to American Airlines Center, where Jake Oettinger and Jeremy Swayman meet Tuesday night.', 'The Bruins take a five-game winning streak into Dallas on Tuesday night to face the Stars at American Airlines Center. The game is on ESPN, according to Fox Sports.

Boston won on back-to-back nights over the weekend: 4-2 over Anaheim on Friday and 4-1 over the winless Los Angeles Kings on Saturday, when Marat Khusnutdinov scored the winner with 6:24 left, The Sports Leader reported. Matt Poitras assisted for his fifth point in five games.

## The streak

| Result | Opponent |
| --- | --- |
| W 6-1 | at Utah |
| W 5-1 | at Philadelphia |
| W 6-3 | San Jose |
| W 4-2 | Anaheim |
| W 4-1 | Los Angeles |

Source: Fox Sports

## Goalies in focus

Dallas'' Jake Oettinger leads the NHL with three shutouts and carries a .952 save percentage, The Sports Leader reported. Jeremy Swayman is at .934 for Boston, and Michael DiPietro has also contributed in net.

Boston is scoring 3.8 goals a game and allowing 2.1; Dallas is scoring 2.4 and allowing 1.5, according to Fox Sports. David Pastrnak leads the Bruins with 12 points.

## Lineup notes

Pavel Zacha, who missed Saturday with an upper-body injury, rejoined the team Monday. Jonathan Aspirot filled in on defense for Nikita Zadorov on Saturday with three blocked shots and five hits, The Sports Leader reported.

For Dallas, Roope Hintz practiced Monday after leaving Saturday''s 4-0 win over Chicago with a hand injury, and newly signed veteran David Perron, 38, could debut.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-20.sql', 5, 0, 'newsroom-assistant', '2026-10-20T10:30:00.000Z', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-bruins-dallas-src1', 'bd-20261020-bruins-dallas', 'Bruins chase sixth straight win against Stars', 'https://www.thesportsleader.com/2026/10/19/bruins-chase-sixth-straight-win-against-stars/', 'The Sports Leader', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261020-bruins-dallas-src2', 'bd-20261020-bruins-dallas', 'Boston Bruins vs. Dallas Stars, Oct. 20, 2026: game preview', 'https://www.foxsports.com/nhl/boston-bruins-vs-dallas-stars-oct-20-2026-game-boxscore-44702', 'Fox Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-20T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-20. Editor to confirm.', 'newsroom-assistant', '2026-10-20T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261020-bruins-dallas-ev1', 'bd-20261020-bruins-dallas', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-20T10:30:00.000Z');
