-- Newsroom drafts for 2026-10-24. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-cook-house', 'cook-political-report-shifts-19-house-races-democrats', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Cook Political Report shifts 19 House races toward Democrats with 10 days to go', 'The forecaster now rates enough seats as favoring Democrats to reach a 218-seat majority and sees a likely gain of 12 to 22 seats.', 'The Cook Political Report moved 19 more House races toward Democrats on Friday, 10 days before the Nov. 3 midterm elections.

None of the changes moved a race toward Republicans.

## What changed

Cook said Democrats are now favored outright in 218 seats, the number needed to control the House. Its likeliest outcome is a Democratic gain of between 12 and 22 seats.

According to The Rio Times, which summarized the update, that range would leave Democrats with 227 to 237 seats and Republicans with 198 to 208.

Among the changes Cook detailed:

| Race | Old rating | New rating |
| --- | --- | --- |
| Six races, four held by GOP incumbents | Toss Up | Lean Democrat |
| Kentucky 6th District (open) | Lean Republican | Toss Up |
| Texas 35th District (open) | Lean Republican | Toss Up |

The Republican incumbents moving to Lean Democrat include Reps. Juan Ciscomani of Arizona, Gabe Evans of Colorado, Jen Kiggans of Virginia and Derrick Van Orden of Wisconsin, The Rio Times reported. The other 11 changes were not itemized in the public summary.

## The money picture

The shifts follow moves by the Congressional Leadership Fund, the main super PAC aligned with House Republican leaders. Earlier in October it pulled out of four races and moved about $10 million into 16 others, The Rio Times reported.

Cook''s ratings are a forecast, not a result. Early voting is underway in many states, and every House seat is on the ballot on Election Day.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/21/Flickr_-_USCapitol_-_Cannon_House_Office_Building.jpg', 'The Cannon House Office Building on Capitol Hill. Photo: Architect of the Capitol / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-24.sql', 9, 1, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-cook-house-src1', 'bd-20261024-cook-house', 'The Cook Political Report Moves 19 More House Seats Towards Democrats', 'https://thecookpoliticalreport.substack.com/p/the-cook-political-report-moves-19', 'The Cook Political Report', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-cook-house-src2', 'bd-20261024-cook-house', 'Forecaster Moves 19 House Races to Democrats', 'https://www.riotimesonline.com/cook-report-shifts-19-house-races-democrats', 'The Rio Times', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-cook-house-ev1', 'bd-20261024-cook-house', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-canada-tariffs', 'trump-trims-canada-tariffs-plywood-paper-adds-carpets', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump lifts 50% tariffs on some Canadian goods, adds others, as Collins presses for Maine relief', 'Plywood, some paper products and seaweed come off the list on Oct. 30; carpets, paints and canoes go on.', 'President Donald Trump on Friday signed a proclamation that removes some Canadian products from his 50% tariff list and adds others, effective Oct. 30.

The White House described the move as refining the scope of tariffs it first imposed in July under Section 338 of the Tariff Act of 1930, a rarely used law that lets a president respond to what he finds is discrimination against U.S. commerce.

## What comes off, what goes on

| Removed from the tariff list | Added to the tariff list |
| --- | --- |
| Plywood sheets | Carpets |
| Some paper products | Paints and shampoos |
| Certain machinery and refrigeration equipment | Waste products |
| Certain packing crates and boxes | Cocoa powder, ice cream sticks |
| Fresh and dried seaweed | Chest freezers, air conditioners, canoes, archery gear |

The seaweed exemption and the list of added items come from Reuters reporting; the White House fact sheet lists the first four removals and says valves, carpets and waste products are among the additions.

## The Maine angle

Sen. Susan Collins, the Maine Republican locked in a tight reelection race with Democrat Troy Jackson, had urged the White House to address tariffs hurting Maine businesses and farmers, according to Reuters. She said the relief would help the state''s blueberry, potato, apple and seaweed producers.

Jackson said Trump''s trade fights had made life more expensive for Mainers and accused Collins of enabling them, Reuters reported.

## Background

The White House says Canada walked away from a near-final trade deal this summer and retaliated with tariffs on about $20 billion of U.S. exports. Reuters reported that Canada''s minister for U.S. trade, Dominic LeBlanc, said Ottawa was assessing the change and was ready to work with Washington.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/f/f8/CBP_International_Travel_Preclearance_Operations_in_Canada_(39844023192).jpg', 'U.S. Customs and Border Protection preclearance operations in Canada. Photo: U.S. Customs and Border Protection / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-24.sql', 8, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-canada-tariffs-src1', 'bd-20261024-canada-tariffs', 'Fact Sheet: President Donald J. Trump Further Modifies Canadian Products Subject to Tariffs Under Section 338', 'https://www.whitehouse.gov/fact-sheets/2026/10/fact-sheet-president-donald-j-trump-further-modifies-canadian-products-subject-to-tariffs-under-section-338/', 'The White House', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-canada-tariffs-src2', 'bd-20261024-canada-tariffs', 'Trump ends tariffs on some Canadian products, as Senator Collins faces close race', 'https://lufkindailynews.com/news_reuters/business/trump-ends-tariffs-on-some-canadian-products-as-senator-collins-faces-close-race/article_7c4e45b1-a312-52c3-96ac-71868bf531cf.html', 'Reuters (via The Lufkin Daily News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-canada-tariffs-ev1', 'bd-20261024-canada-tariffs', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-housing-order', 'trump-housing-order-mortgage-insurance-title-costs', 'newsroom', 'news_story', 'policy', 'EDITORIAL_REVIEW', 0, 'Trump order targets mortgage insurance and closing costs in latest housing push', 'The executive order calls for a mortgage insurance cancellation pilot, cheaper title alternatives on refinances and lower USDA and VA loan rates.', 'President Donald Trump signed an executive order on Thursday aimed at lowering the cost of buying and refinancing a home, the White House said.

The order, titled "Decreasing Housing Costs for the American People," leans mostly on federal housing agencies rather than new legislation.

## What the order does

According to the White House fact sheet:

- **Mortgage insurance.** The Federal Housing Finance Agency must set up a pilot to cancel borrowers'' mortgage insurance premiums once they reach required equity, measured by current market value.
- **Title insurance.** FHFA will make permanent a pilot that lets more borrowers use cheaper alternatives to title insurance, cutting closing costs on refinances.
- **Factory-built homes.** HUD and FHFA will co-chair a task force on manufactured housing to improve quality and lower costs.
- **Government loans.** The secretaries of Agriculture and Veterans Affairs must reduce interest rates on single-family home loans their departments make.

## What the industry says

HousingWire reported that a mortgage lenders'' trade group, the Community Home Lenders of America, praised the title, manufactured housing and veterans loan provisions. Analysts at KBW expect a limited market effect for now because the title change applies only to refinances, which make up about 7% of title premiums, HousingWire reported.

No deadlines were reported for the agencies.

## Part of a wider pitch

The White House tied the order to earlier steps, including a January order limiting large investors from buying single-family homes. Housing costs are among the pocketbook issues on the ballot as voters head into the Nov. 3 midterms.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/3/31/HUD_headquarters_building_(exterior_photos-_Robert_C._Weaver_Federal_Building)_-_DPLA_-_9998d0f84f324d85d3c02eaae7093aef.jpg', 'The Robert C. Weaver Federal Building, headquarters of the U.S. Department of Housing and Urban Development. Photo: U.S. Department of Housing and Urban Development / DPLA / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-24.sql', 7, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-housing-order-src1', 'bd-20261024-housing-order', 'Fact Sheet: President Donald J. Trump Decreases Housing Costs for Americans', 'https://www.whitehouse.gov/fact-sheets/2026/10/fact-sheet-president-donald-j-trump-decreases-housing-costs-for-americans/', 'The White House', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-housing-order-src2', 'bd-20261024-housing-order', 'Trump signs executive order targeting mortgage costs', 'https://www.housingwire.com/articles/trump-order-mortgage-insurance/', 'HousingWire', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-housing-order-ev1', 'bd-20261024-housing-order', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-dhs-voter-probe', 'judge-halts-dhs-noncitizen-voting-field-interviews-nine-states', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Judge halts DHS door-to-door noncitizen voting checks in nine states through Election Day', 'A federal judge found the agency''s target lists unreliable and its home visits likely intimidating to groups that help people vote.', 'A federal judge in California has ordered the Department of Homeland Security to stop election-related field interviews of likely U.S. citizens in nine states until polls close on Nov. 3.

U.S. District Judge Araceli Martinez-Olguin ruled late Wednesday in a lawsuit brought by nurses'' unions, voting groups and local governments, according to The Associated Press. She delayed the order until 5 p.m. Friday to give the administration time to appeal, CBS News reported.

## The states covered

California, Connecticut, Georgia, Missouri, Nevada, New York, Pennsylvania, Washington and Wisconsin.

## What the judge found

The case targets a DHS effort the AP said is known as the Unlawful Voter Initiative, aimed at finding noncitizens registered to vote.

- **Bad data.** The judge cited a high likelihood of error in how DHS built its target lists, noting there is no federal database of residents'' citizenship, the AP reported.
- **Intimidation.** She found the home visits likely violate the Voting Rights Act''s ban on intimidating people who help others vote or register, CBS News reported.
- **Limits.** Fox News reported that the judge did not find investigating noncitizen voting unlawful in itself, only the methods DHS used.

## The government''s side

DHS said it is focused on removing noncitizens who vote and has no plans to question people it believes are citizens, according to the AP and Fox News. Government lawyers argued the agency used the best data available.

Noncitizen voting in federal elections is a crime. It is rare, though cases have been documented, Fox News noted.

None of the reports reviewed said whether the administration had filed an appeal.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-24.sql', 8, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-dhs-voter-probe-src1', 'bd-20261024-dhs-voter-probe', 'Federal judge orders Trump administration to halt noncitizen voting investigation in 9 states', 'https://www.wistv.com/2026/10/23/federal-judge-orders-trump-administration-halt-noncitizen-voting-investigation-9-states/', 'The Associated Press (via WIS-TV)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-dhs-voter-probe-src2', 'bd-20261024-dhs-voter-probe', 'Judge rules against DHS''s policy of knocking on doors to track down possible noncitizen voters', 'https://www.cbsnews.com/news/judge-dhs-noncitizen-voters-ruling/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-dhs-voter-probe-src3', 'bd-20261024-dhs-voter-probe', 'Judge Martinez-Olguin blocks DHS noncitizen voting investigations', 'https://www.foxnews.com/politics/biden-appointed-judge-blocks-voter-fraud-probes-battleground-states-days-before-midterms', 'Fox News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-dhs-voter-probe-ev1', 'bd-20261024-dhs-voter-probe', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-ws-brewers-game1', 'brewers-hold-off-rays-3-2-world-series-game-1', 'newsroom', 'news_story', 'mlb', 'EDITORIAL_REVIEW', 0, 'Brewers hold off a ninth-inning Rays rally to win World Series Game 1, 3-2', 'Jacob Misiorowski threw the fastest pitch in World Series history, and Trevor Megill stranded the tying run. Game 2 is tonight in Milwaukee.', 'The Milwaukee Brewers beat the Tampa Bay Rays 3-2 on Friday night in Game 1 of the World Series, surviving a tense ninth inning before a sellout crowd at American Family Field.

It was Milwaukee''s first World Series game since 1982, according to The Associated Press.

## How it happened

Jackson Chourio scored on Christian Yelich''s one-out triple in the first inning, and William Contreras followed with a run-scoring single, the AP reported. Tampa Bay got one back in the fourth when Jonathan Aranda scored on a Liam Hicks groundout.

Chourio added a two-out RBI single in the seventh to make it 3-1.

In the ninth, the Rays loaded the bases. Hicks hit what looked like a game-ending double play, but replay showed shortstop Cooper Pratt''s foot was off the bag, and a run scored. Trevor Megill then struck out Jonny DeLuca with the tying and go-ahead runs aboard.

## The pitching

Brewers starter Jacob Misiorowski allowed one run over five innings. His first pitch of the night, 103.5 mph, was the fastest ever thrown in a World Series, the AP reported. Abner Uribe and Aaron Ashby combined for three scoreless innings. Contreras also threw out two runners trying to steal.

Rays starter Nick Martinez allowed two runs in five innings.

## What''s next

| Game | Date | Site | Time (ET) |
| --- | --- | --- | --- |
| 2 | Sat., Oct. 24 | Milwaukee | 8 p.m. |
| 3 | Mon., Oct. 26 | Tampa Bay | 8 p.m. |
| 4 | Tue., Oct. 27 | Tampa Bay | 8 p.m. |
| 5 | Wed., Oct. 28 | Tampa Bay | 8 p.m. |

MLB lists Drew Rasmussen (2-0, 1.29 ERA this postseason) for Tampa Bay and Logan Henderson for Milwaukee in Game 2. All games air on Fox.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Reserve_A-10_Warthogs_Flyover_2023_World_Series_(8099146).jpg', 'Air Force Reserve A-10s fly over the 2023 World Series. Photo: U.S. Air Force Reserve / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-24.sql', 7, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-ws-brewers-game1-src1', 'bd-20261024-ws-brewers-game1', 'Brewers withstand Rays'' comeback attempt to win 3-2 in Game 1 of World Series', 'https://www.nbc26.com/sports/mlb/milwaukee-brewers/brewers-withstand-rays-comeback-attempt-to-win-3-2-in-game-1-of-world-series', 'The Associated Press (via NBC 26)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-ws-brewers-game1-src2', 'bd-20261024-ws-brewers-game1', 'Brewers Probable Pitchers', 'https://www.mlb.com/brewers/roster/probable-pitchers', 'MLB.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-ws-brewers-game1-ev1', 'bd-20261024-ws-brewers-game1', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-celtics-knicks', 'tatum-36-celtics-beat-knicks-home-opener', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Tatum scores 36 as Celtics hold off the Knicks 107-103 in their home opener', 'Boston nearly let a 10-point lead slip before Tatum hit two late shots. The Celtics host the Bulls on Monday.', 'Jayson Tatum scored 36 points and made the two biggest shots of the night as the Celtics beat the New York Knicks 107-103 on Friday in their home opener at TD Garden.

The win was Boston''s first of the season, evening its record at 1-1. The Knicks fell to 0-2.

## The finish

Boston led by 10 in the second half, but New York rallied to within 99-98 with 1:41 left, according to NBC Sports Boston.

Tatum answered with a long two from the corner, and after OG Anunoby made two free throws, Tatum hit a three to push the lead back to six. A Payton Pritchard free throw later gave the Celtics a two-possession cushion they held to the buzzer.

## By the numbers

| Celtics leader | Line |
| --- | --- |
| Jayson Tatum | 36 points, 9 rebounds, 7 assists |
| Neemias Queta | 15 points, 3 blocks off the bench |

Tatum led Boston in points, rebounds and assists, NBC Sports Boston reported.

## What''s next

The Celtics are off for the weekend and host the Chicago Bulls on Monday night at TD Garden.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-24.sql', 6, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-celtics-knicks-src1', 'bd-20261024-celtics-knicks', 'Celtics-Knicks recap: Jayson Tatum comes through in clutch for C''s first victory', 'https://www.nbcsportsboston.com/nba/boston-celtics/live-updates-celtics-hosting-knicks-in-bostons-home-opener/809129/', 'NBC Sports Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-celtics-knicks-src2', 'bd-20261024-celtics-knicks', 'New York Knicks vs Boston Celtics, Oct 23, 2026', 'https://www.nba.com/game/nyk-vs-bos-0022600008/box-score', 'NBA.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm. Page confirms the matchup, date and venue; the box score had not loaded when checked.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-celtics-knicks-ev1', 'bd-20261024-celtics-knicks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-bruins-sharks', 'bruins-host-sharks-atlantic-lead-pastrnak', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'First-place Bruins host Celebrini and the Sharks tonight at TD Garden', 'Boston brings an 8-2-1 record and the NHL''s second-stingiest defense into a 7 p.m. matchup with San Jose.', 'The Bruins put their Atlantic Division lead on the line Saturday night when the San Jose Sharks visit TD Garden at 7 p.m. The game airs on NESN.

Boston comes in at 8-2-1 with 17 points, first in the Atlantic, according to Fubo''s game preview. San Jose is 6-4-1 and has won two straight.

## Tale of the tape

| | Bruins | Sharks |
| --- | --- | --- |
| Record | 8-2-1 | 6-4-1 |
| Goals per game | 3.82 (4th) | 2.91 (17th) |
| Goals against per game | 2.00 (2nd) | 3.27 (21st) |
| Power play | 22.6% | 25.7% |
| Last 10 games | 7-2-1 | 5-4-1 |

*League ranks and team stats as listed by Inside The Rink.*

## Players to watch

David Pastrnak leads Boston with 16 points (6 goals, 10 assists), Fubo reported, and has nine points over his last five games, according to Inside The Rink. Elias Lindholm has eight points.

For San Jose, Macklin Celebrini leads with 14 points and scored an overtime winner against Montreal. The Sharks are without several injured players, including Alexander Wennberg.

Boston leads the season series 1-0.

## Next up at home

After Saturday, the Bruins'' next home games are Oct. 31 against Chicago (1 p.m.) and Nov. 2 against Vegas (7 p.m.), according to TD Garden''s event listings.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-24.sql', 6, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-bruins-sharks-src1', 'bd-20261024-bruins-sharks', 'San Jose Sharks at Boston Bruins: where to watch, Oct. 24, 2026', 'https://www.fubo.tv/news/nhl/san-jose-sharks-at-boston-bruins-where-to-watch-stream-info-tv-channel-and-live-updates-october-24-2026/', 'Fubo News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-bruins-sharks-src2', 'bd-20261024-bruins-sharks', 'Sharks vs. Bruins: Start Time, TV & Preview, Oct. 24, 2026', 'https://insidetherink.com/stats/nhl/games/2026-10-24-sharks-at-bruins-2026020170/', 'Inside The Rink', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-bruins-sharks-src3', 'bd-20261024-bruins-sharks', 'Bruins events', 'https://www.tdgarden.com/events/category/bruins', 'TD Garden', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-bruins-sharks-ev1', 'bd-20261024-bruins-sharks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261024-pats-stretch', 'patriots-4-3-rest-of-schedule-dolphins-munich', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'At 4-3, the Patriots get a long break before Miami, Green Bay and a trip to Munich', 'After Thursday''s loss in Chicago, New England does not play again until Nov. 1. Here is the rest of the schedule.', 'The Patriots are 4-3 after Thursday night''s 30-24 loss to the Chicago Bears, which ended a three-game winning streak.

The quick Thursday turnaround now pays off: New England does not play again until Sunday, Nov. 1, when it visits the Miami Dolphins at 4:25 p.m. on CBS, according to the team''s official schedule.

## The season so far

| Date | Opponent | Result |
| --- | --- | --- |
| Sept. 9 | at Seattle | L 13-10 |
| Sept. 20 | Pittsburgh | W 20-3 |
| Sept. 27 | at Jacksonville | L 35-6 |
| Oct. 4 | at Buffalo | W 29-26 |
| Oct. 11 | Las Vegas | W 45-17 |
| Oct. 18 | N.Y. Jets | W 26-19 |
| Oct. 22 | at Chicago | L 30-24 |

## What''s ahead

| Date | Opponent | Kickoff (ET) |
| --- | --- | --- |
| Sun., Nov. 1 | at Miami | 4:25 p.m. |
| Sun., Nov. 8 | Green Bay | 4:25 p.m. |
| Sun., Nov. 15 | Detroit (in Munich) | 9:30 a.m. |
| — | Bye | — |
| Sun., Nov. 29 | at L.A. Chargers | 8:20 p.m. |
| Sun., Dec. 6 | Buffalo | 4:25 p.m. |
| Thu., Dec. 10 | Minnesota | 8:15 p.m. |
| Mon., Dec. 21 | at Kansas City | 8:15 p.m. |
| Sun., Dec. 27 | at N.Y. Jets | 1 p.m. |
| TBD | Denver | TBD |
| TBD | Miami | TBD |

The Nov. 15 game against the Lions is a home game played at FC Bayern Munich''s stadium in Germany. The bye comes after the trip.

Four of the final 10 games are on the road, and three are in prime time.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-24.sql', 5, 0, 'newsroom-assistant', '2026-10-24T10:15:00.000Z', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261024-pats-stretch-src1', 'bd-20261024-pats-stretch', 'Patriots 2026 Schedule', 'https://www.patriots.com/schedule/', 'New England Patriots', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-24T10:15:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-24. Editor to confirm.', 'newsroom-assistant', '2026-10-24T10:15:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261024-pats-stretch-ev1', 'bd-20261024-pats-stretch', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-24T10:15:00.000Z');
