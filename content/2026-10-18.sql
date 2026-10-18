-- Newsroom drafts for 2026-10-18. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain or Creative Commons with credit.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-press-secretary', 'katie-zacharia-out-as-white-house-press-secretary-after-five-days', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'White House press secretary Katie Zacharia is out after five days', 'Her lone briefing drew criticism and her legal credentials came under scrutiny. The White House has not named a replacement.', 'Katie Zacharia''s tenure as White House press secretary ended after about five days, leaving President Donald Trump without a chief spokesperson 16 days before the midterm elections.

Zacharia, a conservative commentator, had succeeded Karoline Leavitt, who resigned in August. Al Jazeera described her as the shortest-serving press secretary on record and the sixth to hold the job under Trump.

## What happened

Zacharia held one news conference, on Tuesday, Oct. 13. It ran about 14 minutes and she took three questions, Al Jazeera reported. The performance was widely panned, including by some Trump allies.

Questions then turned to her background. She holds a law degree and had described herself as an attorney, but she never passed a U.S. bar exam, according to Al Jazeera. Axios reported that Trump was surprised to learn that, after he had introduced her as a lawyer.

On Friday, Trump told reporters the press had treated her harshly and that he had advised her to "reconsider" the role. News outlets then confirmed she was leaving. Zacharia wrote on X that serving Trump had been "an honor."

## What comes next

The White House has given no official reason for her exit and has not named a successor. Trump told Fox News he is "not in a hurry" to fill the post, Al Jazeera reported.

The vacancy comes as the administration manages the conflict with Iran and as Republicans defend their House and Senate majorities on Nov. 3. A Fox News poll released last week put Trump''s approval at 36%, the lowest of either of his terms, according to Axios.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg/1280px-January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg', 'Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 9, 1, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-press-secretary-src1', 'bd-20261018-press-secretary', 'Why Trump''s latest White House press secretary lasted just five days', 'https://www.aljazeera.com/news/2026/10/17/why-trumps-latest-white-house-press-secretary-lasted-just-five-days', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-press-secretary-src2', 'bd-20261018-press-secretary', 'Trump ratchets up the chaos in an October barrage', 'https://www.axios.com/2026/10/17/trump-october-midterms-controversy', 'Axios', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-press-secretary-ev1', 'bd-20261018-press-secretary', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-omar-search', 'ilhan-omar-lawyers-demand-return-of-property-seized-in-home-search', 'newsroom', 'news_story', 'congress', 'EDITORIAL_REVIEW', 1, 'Omar''s lawyers demand return of phone and passport seized in federal search of her home', 'The Minnesota Democrat calls the probe political. The Justice Department says agents followed every court order.', 'Lawyers for Rep. Ilhan Omar, D-Minn., are demanding that federal prosecutors return property seized from her Washington home, escalating a fight over an investigation unfolding three weeks before the midterm elections.

## The search

Federal agents searched Omar''s home in Northeast Washington on Monday, Oct. 12, and seized her phone and passport, Al Jazeera reported. The Associated Press, citing a person briefed on the probe, reported that more than a dozen grand jury subpoenas have gone out from a grand jury in Minnesota, including to some of Omar''s relatives.

Investigators are reportedly examining possible fraud in immigration paperwork, the AP reported. The full scope of the inquiry is unclear. Jeanine Pirro, the U.S. attorney in Washington, told Fox News there are several investigations and that her office is also looking at Omar''s financial disclosures, according to the AP.

## The dispute

In a letter dated Friday, Omar''s attorneys, Amy Jeffress and Joshua Matz, asked for the property back and for audio and video of the search to be preserved, Al Jazeera reported. They argued the search was politically motivated and did not follow a magistrate judge''s instructions, including advance notice meant to protect a sitting member of Congress.

A Justice Department spokesperson, Emily Covington, said the letter was "riddled with false allegations and inaccuracies" and that officials complied with all court orders.

Omar called the search an attempt "to target political enemies," the AP reported. Trump, who attacked Omar at a Tennessee rally days earlier, said afterward the matter was up to the Justice Department.

Omar became a naturalized citizen in 2000, according to her House biography. The Justice Department has traditionally avoided overt investigative steps involving candidates close to an election, the AP noted.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Ilhan_Omar,_official_portrait,_116th_Congress.jpg/1280px-Ilhan_Omar,_official_portrait,_116th_Congress.jpg', 'Rep. Ilhan Omar, official portrait, 116th Congress. Photo: U.S. House of Representatives / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 8, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-omar-search-src1', 'bd-20261018-omar-search', 'AP report: Rep. Ilhan Omar''s phone seized and relatives subpoenaed in criminal probe', 'https://www.pbs.org/newshour/politics/ap-report-rep-ilhan-omars-phone-seized-and-relatives-subpoenaed-in-criminal-probe', 'The Associated Press (via PBS NewsHour)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-omar-search-src2', 'bd-20261018-omar-search', 'Ilhan Omar''s lawyers demand the return of property seized in house raid', 'https://www.aljazeera.com/news/2026/10/17/ilhan-omars-lawyers-demand-the-return-of-property-seized-in-house-raid', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-omar-search-ev1', 'bd-20261018-omar-search', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-house-control', 'johnson-predicts-gop-holds-house-jeffries-readies-100-day-plan', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Johnson predicts a narrow GOP hold on the House as Jeffries readies a 100-day plan', 'The speaker is touring 40 districts. Democrats are drafting an affordability agenda and lining up investigations if they win.', 'With 16 days until the Nov. 3 midterms, the two House leaders are each preparing to run the chamber.

## Johnson: a "working majority"

Speaker Mike Johnson, R-La., told The Associated Press that Republicans will keep control, though not by much. "It''s not going to be a giant majority," he said, predicting a working majority instead.

Johnson pointed to big crowds, strong recruits and nearly half a billion dollars raised for House Republicans, the AP reported. He plans to visit more than 20 states and 40 districts before Election Day; a recent stop in Maine included campaigning with former Gov. Paul LePage.

The AP noted the headwinds: voter frustration over prices and the war with Iran, and a recent move by Johnson to send lawmakers home early to avoid a forced vote on impeaching Defense Secretary Pete Hegseth.

## Jeffries: an affordability agenda

House Democratic Leader Hakeem Jeffries, who would become speaker if Democrats win, has set up five working groups to recommend steps for a first 100 days, The Christian Science Monitor reported:

| Working group |
| --- |
| Housing |
| Health care |
| Groceries and goods |
| Gas and utilities |
| Caregiving |

Democrats also plan oversight of the administration, including Trump family business dealings and the handling of Epstein-related files, the Monitor reported. Rep. Jamie Raskin, D-Md., said Democrats would "use every tool in the toolbox."

The Monitor noted the limits: most bills need 60 Senate votes, and overriding a presidential veto takes two-thirds of both chambers. Fox News reported that Jeffries''s 100-day agenda is being prepared in case Democrats take the chamber.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Speaker_Mike_Johnson_Official_Portrait.jpg/1280px-Speaker_Mike_Johnson_Official_Portrait.jpg', 'Speaker Mike Johnson, official portrait. Photo: Office of the Speaker of the House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 7, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-house-control-src1', 'bd-20261018-house-control', 'House Speaker Mike Johnson draws on faith as he fights to hold the Republican majority', 'https://www.pbs.org/newshour/politics/house-speaker-mike-johnson-draws-on-faith-as-he-fights-to-hold-the-republican-majority', 'The Associated Press (via PBS NewsHour)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-house-control-src2', 'bd-20261018-house-control', 'Democrats plan investigations, affordability efforts if they reclaim Congress', 'https://csmonitor.com/USA/Politics/2026/1015/congress-midterms-democrats-jeffries', 'The Christian Science Monitor', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-house-control-src3', 'bd-20261018-house-control', '2026 Midterm Elections: Trump rallies Republicans (live, Oct. 18)', 'https://www.foxnews.com/live-news/midterm-elections-2026-trump-republicans-democrats-october-18', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-house-control-ev1', 'bd-20261018-house-control', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-michigan-senate', 'michigan-senate-el-sayed-rogers-early-voting-oct-24', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Michigan''s open Senate race heats up as early voting nears', 'Trump has endorsed Republican Mike Rogers; Barack Obama is set to campaign for Democrat Abdul El-Sayed. Statewide early voting opens Oct. 24.', 'Michigan''s open U.S. Senate seat is drawing national attention in the final weeks of the campaign, with two former presidents weighing in and more than 2 million voters already asking for mail ballots.

The seat is open because Democratic Sen. Gary Peters chose not to seek reelection. Democrat Abdul El-Sayed faces Republican Mike Rogers, a former congressman.

## The campaign

President Donald Trump endorsed Rogers in a video on Truth Social and sharply attacked El-Sayed, Fox News reported. At a rally at Birch Run Speedway, Rogers argued that El-Sayed''s energy plans would raise utility and gas bills, according to Fox. Former President Barack Obama is scheduled to campaign with El-Sayed in the coming days, Fox reported.

A Mitchell Research & Communications poll of likely voters taken Oct. 1 found El-Sayed at 45.6% and Rogers at 41.4%, with 6% undecided and a margin of error of 3.8 points, CBS Detroit reported. The pollster cautioned that the race could tighten, as past Michigan Senate contests have late in the campaign.

## Voting by the numbers

The Michigan Department of State reported these figures as of Oct. 13:

| Measure | Figure |
| --- | --- |
| Mail ballots requested | 2,083,240 |
| Mail ballots returned | 440,677 |
| Active registered voters | about 7.4 million |

Requests are up more than 20% from the same point before the 2022 midterm, the state said.

## Key dates

- **Oct. 19:** Online voter registration closes. In-person registration at local clerks continues through Election Day.
- **Oct. 24 to Nov. 1:** Statewide early in-person voting, at least eight hours a day.
- **Nov. 3:** Election Day. Mail ballots must reach the clerk or a drop box by 8 p.m.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Capitol_of_Michigan._Lansing_LCCN2003666435.jpg/1280px-Capitol_of_Michigan._Lansing_LCCN2003666435.jpg', 'Michigan State Capitol, Lansing. Photo: Detroit Publishing Co. / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 7, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-michigan-senate-src1', 'bd-20261018-michigan-senate', 'Three weeks before Election Day, 6 percent of voters have already cast their ballot', 'https://www.michigan.gov/sos/resources/news/2026/10/13/three-weeks-before-election-day-6-percent-of-voters-have-already-cast-their-ballot', 'Michigan Department of State', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-michigan-senate-src2', 'bd-20261018-michigan-senate', 'El-Sayed leads Rogers in Michigan Senate poll, but history says don''t call it yet', 'https://www.cbsnews.com/detroit/news/michigan-voter-poll-abdul-el-sayed-mike-rogers/', 'CBS Detroit', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-michigan-senate-src3', 'bd-20261018-michigan-senate', 'Texas, Minnesota candidates fuel latest 2026 midterm election news (live, Oct. 17)', 'https://www.foxnews.com/live-news/fiery-texas-house-race-minnesota-fraud-scandal-2026-midterm-elections-october-17', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-michigan-senate-ev1', 'bd-20261018-michigan-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-fcc-ad-rates', 'supreme-court-fcc-political-ad-rates-party-discount-stays', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Supreme Court keeps party ad discounts in place through the midterms', 'In a 7-2 order, the justices blocked a lower court''s 48-hour deadline for the FCC to rule on Democrats'' challenge.', 'Political parties can keep buying TV and radio time at discounted candidate rates through the Nov. 3 elections after a Supreme Court order this week.

## The order

In an unsigned order on Wednesday, Oct. 14, the court blocked a ruling by the 4th U.S. Circuit Court of Appeals that had given the Federal Communications Commission 48 hours to decide a challenge to its political advertising policy, Newsweek reported. The court said the appeals court''s use of an extraordinary writ was inappropriate and that the law does not set a deadline for the agency to act.

The vote was 7-2. Justices Sonia Sotomayor and Ketanji Brown Jackson would have denied the request and did not write separately, according to Newsweek.

## The dispute

Federal law requires broadcasters to sell ad time to candidates at their lowest rates in the weeks before an election. In March, the FCC''s Media Bureau told stations to extend that discount to parties running ads in coordination with candidates, and to some joint fundraising committees.

Four Democrats challenged the guidance: Sen. Jon Ossoff of Georgia, Rep. Kristen McDonald Rivet of Michigan, Sherrod Brown of Ohio and Roy Cooper of North Carolina, CBS News reported. The 4th Circuit set the policy aside in August, but the Supreme Court paused that decision on Sept. 4.

The justices did not decide whether the FCC''s reading of the law is correct, Newsweek noted.

## Reaction

An FCC spokesperson welcomed the order. Erin Chlopak of the Campaign Legal Center, which backs the Democrats, called it "disappointing and misguided." Republican National Committee Chairman Joe Gruters praised the court, The Daily Signal reported.

AdImpact projects political ad spending this cycle will reach $11.6 billion, according to The Daily Signal.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flickr_-_USCapitol_-_U.S._Supreme_Court_Building.jpg/1280px-Flickr_-_USCapitol_-_U.S._Supreme_Court_Building.jpg', 'Photo: Architect of the Capitol / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 6, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-fcc-ad-rates-src1', 'bd-20261018-fcc-ad-rates', 'Trump administration wins 7-2 Supreme Court ruling in political ad dispute', 'https://newsweek.com/supreme-court-hands-trump-admin-7-2-win-political-ad-dispute-12571324', 'Newsweek', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-fcc-ad-rates-src2', 'bd-20261018-fcc-ad-rates', 'Supreme Court ruling could impact the closing weeks of high-stakes midterm advertising battle', 'https://www.dailysignal.com/2026/10/15/supreme-court-ruling-could-impact-the-closing-weeks-of-high-stakes-midterm-advertising-battle/', 'The Daily Signal', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-fcc-ad-rates-src3', 'bd-20261018-fcc-ad-rates', 'Supreme Court sides with Republicans in fight over broadcast ad rates', 'https://www.cbsnews.com/news/supreme-court-sides-with-republicans-cheaper-broadcast-ad-rates/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-fcc-ad-rates-src4', 'bd-20261018-fcc-ad-rates', 'Federal Communications Commission v. Brown (26A476) case file', 'https://www.scotusblog.com/cases/federal-communication-commission-v-brown/', 'SCOTUSblog', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-fcc-ad-rates-ev1', 'bd-20261018-fcc-ad-rates', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-trump-dividend', 'trump-5000-dividend-checks-midterms-cost-congress', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Trump''s $5,000 check pledge: What it would cost and what it would take', 'The promise depends on Republicans keeping both chambers. Economists say it would cost about $1.2 trillion and need an act of Congress.', 'President Donald Trump has promised every American adult a $5,000 payment if Republicans keep control of the House and Senate on Nov. 3. Here is what is known about the plan.

## The promise

Trump announced the "Trump dividend" on Sept. 9 at a Republican gathering in Dallas, PBS NewsHour reported. He tied it to the economy''s performance and compared it to a company paying shareholders. Payments are pledged only if the GOP holds both chambers, and recipients would be expected to spend the money in the U.S., Newsweek reported.

## The cost

| Estimate | Figure |
| --- | --- |
| Eligible adult citizens | about 245 million |
| Total cost | about $1.2 trillion |
| Customs duties, fiscal 2025 | about $195 billion |

Sources: PBS NewsHour; Newsweek.

Administration officials have offered different answers on how to pay for it. Vice President JD Vance pointed to tariff revenue, Commerce Secretary Howard Lutnick said it would not be tax money, and economic adviser Kevin Hassett mentioned a budget reconciliation bill, Newsweek reported.

Erica York of the Tax Foundation told PBS the checks would use up almost all the revenue the current tariffs are projected to raise over a decade. The Supreme Court struck down most of Trump''s earlier tariffs in February.

## What it would take

Only Congress can authorize the spending. Sen. Bernie Moreno, R-Ohio, says he will introduce a bill after the election. Rep. Ralph Norman, R-S.C., has said he cannot support it without a way to pay for it, Newsweek reported.

Earlier pledges of $2,000 tariff checks and "DOGE dividend" payments were never sent, PBS noted.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg/1280px-January_2025_Official_Presidential_Portrait_of_Donald_J._Trump.jpg', 'Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 5, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-trump-dividend-src1', 'bd-20261018-trump-dividend', 'Trump promised $5,000 checks if Republicans win the midterms. How would that work?', 'https://www.pbs.org/newshour/politics/trump-promised-5000-checks-if-republicans-win-the-midterms-how-would-that-work', 'PBS NewsHour', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-trump-dividend-src2', 'bd-20261018-trump-dividend', 'Trump Admin''s varying answers on source of $5,000 checks', 'https://www.newsweek.com/trump-dividends-would-cost-1-22-trillion-how-find-money-12424329', 'Newsweek', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-trump-dividend-ev1', 'bd-20261018-trump-dividend', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-alcs-game4', 'rays-beat-guardians-alcs-game-4-series-tied-2-2', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Rays beat Guardians 7-3 to even the ALCS; Game 5 is Sunday in Cleveland', 'Yandy Díaz homered and Tampa Bay broke it open in the seventh after a costly Cleveland error. The winner meets Milwaukee in the World Series.', 'The American League Championship Series is down to a best-of-three.

Tampa Bay beat Cleveland 7-3 on Saturday night at Progressive Field to tie the series at two games apiece, a day after rain postponed Game 4.

## How it happened

Cleveland scored first, but Rays starter Nick Martinez settled in and retired 11 straight batters into the fifth inning, according to MLB.com. Yandy Díaz drove the offense with a double and a two-run home run.

The Rays pulled away with three runs in the seventh after Jonathan Aranda''s ground-ball single got past right fielder Chase DeLauter for an error, MLB.com reported. Cleveland used seven pitchers in a planned bullpen game; Foster Griffin covered 3 2/3 innings in relief.

"Now, it''s a three-game series," Guardians manager Stephen Vogt said.

## What''s next

| Game | Date | Site | Time (ET) |
| --- | --- | --- | --- |
| Game 5 | Sun., Oct. 18 | Cleveland | 5 p.m. |
| Game 6* | Mon., Oct. 19 | Tampa Bay | 8 p.m. |
| Game 7* | Tue., Oct. 20 | Tampa Bay | 8 p.m. |

*If necessary. All games on TBS and HBO Max, according to NBC10 Philadelphia.

Parker Messick starts Game 5 for Cleveland against Tampa Bay ace Drew Rasmussen, MLB.com reported. In a best-of-seven tied 2-2, the Game 5 winner has taken the series 46 of 69 times.

The ALCS winner faces the Milwaukee Brewers, who swept the Los Angeles Dodgers in the NLCS. The World Series opens Friday, Oct. 23, in Milwaukee.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Progressive_Field.jpg/1280px-Progressive_Field.jpg', 'Progressive Field, Cleveland. Photo: Jsawczuk / Wikimedia Commons (public domain)', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 7, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-alcs-game4-src1', 'bd-20261018-alcs-game4', 'Guardians lose Game 4 of ALCS to Rays', 'https://www.mlb.com/guardians/news/guardians-lose-game-4-2026-alcs-rays', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-alcs-game4-src2', 'bd-20261018-alcs-game4', 'Guardians vs. Rays updated schedule as 2026 ALCS Game 4 postponed', 'https://www.nbcphiladelphia.com/mlb/updated-guardians-rays-alcs-schedule/4481064/', 'NBC10 Philadelphia', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-alcs-game4-ev1', 'bd-20261018-alcs-game4', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-bruins-kings', 'bruins-beat-kings-4-1-fifth-straight-win-pastrnak', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins beat Kings 4-1 for their fifth straight win', 'Marat Khusnutdinov broke a tie late in the third period and Jeremy Swayman made 25 saves. Boston is 7-2-0.', 'The Bruins finished a California back-to-back with their fifth consecutive win, beating the Los Angeles Kings 4-1 on Saturday night at Crypto.com Arena.

## How it happened

Los Angeles scored 31 seconds into the game on a goal by Alex Laferriere. David Pastrnak tied it 2:43 into the second period, according to NHL.com.

Marat Khusnutdinov put Boston ahead with 6:24 left in regulation. Elias Lindholm and JJ Peterka added empty-net goals in the final two minutes.

Jeremy Swayman stopped 25 shots. Anton Forsberg made 24 saves for the Kings.

## By the numbers

| | Bruins | Kings |
| --- | --- | --- |
| Record | 7-2-0 | 0-4-2 |
| Streak | 5 straight wins | 6 games without a win |
| Saves | Swayman, 25 | Forsberg, 24 |

Pastrnak has points in five straight games, with four goals and six assists in that span, NHL.com reported. The Kings have scored one goal in each of their last four games.

The win came a night after Boston rallied from a 2-0 deficit to beat the Anaheim Ducks 4-2, a game in which Frederic Brunet scored his first NHL goal, NESN reported. Pavel Zacha and Nikita Zadorov were out of the lineup.

## Up next

The Bruins visit the Dallas Stars on Tuesday, Oct. 20, at 8 p.m. ET on NESN.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/TD_Garden.JPG/1280px-TD_Garden.JPG', 'TD Garden, Boston. Photo: Nywalton / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-18.sql', 6, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-bruins-kings-src1', 'bd-20261018-bruins-kings', 'Bruins break tie in third, keep Kings winless', 'https://www.nhl.com/news/boston-bruins-los-angeles-kings-game-recap-october-17-2026', 'NHL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-bruins-kings-src2', 'bd-20261018-bruins-kings', 'Bruins vs. Kings score updates and highlights', 'https://nesn.com/boston-bruins/news/bruins-vs-kings-score-updates-highlights-nhl-game/32a4c9a9079bc45b940ffb0e', 'NESN', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-bruins-kings-ev1', 'bd-20261018-bruins-kings', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261018-patriots-jets', 'patriots-jets-gameday-aj-brown-activated-injury-report', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'Gameday: A.J. Brown is back as the Patriots host the Jets at 1 p.m.', 'New England activated its star receiver from injured reserve. Cornerback Carlton Davis III is out, and Breece Hall sits for New York.', 'The Patriots get their top receiver back Sunday when they host the New York Jets at Gillette Stadium at 1 p.m. ET.

New England activated A.J. Brown from injured reserve on Saturday, the National Football Post reported. Brown sprained his ankle in the season-opening loss to Seattle and has missed four games. The three-time Pro Bowl pick was traded to New England from Philadelphia in the offseason.

## Where things stand

The Patriots are 3-2 after wins over Buffalo and Las Vegas, and scored 45 points against the Raiders last week. The Jets are 2-3, according to the National Football Post.

## Injury report

The teams listed these players on Friday''s final report, according to Patriots.com:

| Team | Out | Questionable |
| --- | --- | --- |
| Patriots | CB Carlton Davis III (neck), Karon Prunty (hamstring) | LT Will Campbell (knee), RB TreVeyon Henderson (ankle), LB Christian Elliss (chest), S Craig Woodson (shoulder), CB Channing Canada (hamstring) |
| Jets | RB Breece Hall (quad), WR Adonai Mitchell (finger), EDGE Joseph Ossai (ankle) | None listed |

Cornerback Christian Gonzalez came off the report and is expected to play, Patriots.com said. If Campbell cannot go, rookie Caleb Lomu, who played the final 43 snaps against the Raiders, is the likely fill-in at left tackle. With Hall out, the Jets will lean on Braelon Allen.

## Short week ahead

The game opens a stretch of two games in five days. New England faces the Chicago Bears on Thursday night, Oct. 22, Boston.com reported.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Gillette_Stadium02.jpg/1280px-Gillette_Stadium02.jpg', 'Gillette Stadium, Foxborough. Photo: Bernard Gagnon / Wikimedia Commons, CC BY-SA 3.0', 'licensed', 'newsroom', 'content/2026-10-18.sql', 6, 0, 'newsroom-assistant', '2026-10-18T10:30:00.000Z', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-patriots-jets-src1', 'bd-20261018-patriots-jets', 'Injury Report Analysis: Christian Gonzalez expected to play, A.J. Brown officially questionable for Sunday''s game vs. Jets', 'https://www.patriots.com/news/injury-report-analysis-christian-gonzalez-expected-to-play-a-j-brown-officially-questionable-for-sunday-s-game-vs-jets', 'New England Patriots (Patriots.com)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-patriots-jets-src2', 'bd-20261018-patriots-jets', 'Patriots activate star WR A.J. Brown off injured reserve', 'https://www.nationalfootballpost.com/2026/10/17/patriots-activate-star-wr-aj-brown-off-injured-reserve', 'National Football Post', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261018-patriots-jets-src3', 'bd-20261018-patriots-jets', 'A.J. Brown health update ahead of Jets, Bears games', 'https://www.boston.com/sports/new-england-patriots/2026/10/16/new-england-patriots-a-j-brown-nfl-football-health-jets-bears/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-18. Editor to confirm.', 'newsroom-assistant', '2026-10-18T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261018-patriots-jets-ev1', 'bd-20261018-patriots-jets', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-18T10:30:00.000Z');
