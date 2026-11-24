-- Local section: five Boston news drafts (Nov. 24, 2026). Loaded once into EDITORIAL_REVIEW; the editor approves each in the console before it is published.
-- Facts restated in Boston Daily's own words with attribution. Each story has its own Wikimedia Commons photo, checked against content/ and seed/ so none is reused; licenses read from each file page.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261124-local-hud-lawsuit', 'boston-sues-hud-mixed-status-families-public-housing-rule', 'newsroom', 'news_story', 'local', 'EDITORIAL_REVIEW', 0, 'Boston sues HUD over rule that could push mixed-status families out of public housing', 'The city and the Boston Housing Authority say the rule puts nearly 900 children in about 500 Boston families at risk of losing their homes. It is set to take effect Dec. 14.', 'The City of Boston and the Boston Housing Authority have joined other cities in a federal lawsuit against the U.S. Department of Housing and Urban Development (HUD) over a new rule on "mixed-status" families, households where some members are citizens or eligible immigrants and others are not.

The suit was filed Monday, Nov. 23, in the U.S. District Court for the District of Massachusetts, Boston.com reported. It asks a judge to throw out the rule and delay its Dec. 14 start date.

## What does the HUD rule change?

Under the old rules, a family could live in subsidized housing as long as at least one member was eligible, and the family''s aid was reduced to cover only the eligible members. The new rule, published in the [Federal Register](https://www.federalregister.gov/documents/2026/11/12/2026-23003/housing-and-community-development-act-of-1980-verification-of-eligible-status) on Nov. 12, ends that arrangement. It also:

- Requires every applicant and tenant, of any age, to verify U.S. citizenship or eligible immigration status. People over 62 were previously exempt.
- Requires housing authorities and owners to alert the Department of Homeland Security if they find a household member in violation of immigration law.

Refugees and asylees remain eligible. Undocumented immigrants, DACA recipients and people with Temporary Protected Status are not.

## How many Boston families are affected?

The city says nearly 900 children in about 500 families could lose public housing help. Mayor Michelle Wu called the rule "cruel and illegal" in a city statement.

## What do the city and HUD say?

The lawsuit argues HUD broke the Administrative Procedure Act by skipping required steps, going beyond its authority and acting in an "arbitrary and capricious" way.

HUD says the rule closes what it calls a "roommate loophole" and that nearly 200,000 tenants nationwide have incomplete or unknown eligibility status. HUD Secretary Scott Turner said the agency has "zero tolerance" for putting other groups ahead of U.S. citizens.

A separate class action was filed Nov. 19 by tenant and immigrant rights groups in Massachusetts.

## What should families do now?

Nothing changes before Dec. 14, and a court could delay the rule. Tenants with questions can contact the [Boston Housing Authority](https://www.bostonhousing.org/) or free legal help through [Massachusetts Law Reform Institute](https://www.mlri.org/) and [MassLegalHelp](https://www.masslegalhelp.org/housing). This story will be updated as the case moves forward.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Boston_City_Hall_exterior_02.jpg/1280px-Boston_City_Hall_exterior_02.jpg', 'Boston City Hall (file). Photo: andrewjsan / Wikimedia Commons, CC BY 2.0', 'licensed', 'newsroom', 'content/2026-11-24-local.sql', 7, 0, 'newsroom-assistant', '2026-11-24T19:30:00.000Z', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-hud-lawsuit-src1', 'bd-20261124-local-hud-lawsuit', 'Boston sues Trump Administration over new rule targeting immigrants in federally-subsidized housing', 'https://www.boston.com/news/local-news/2026/11/24/boston-housing-authority-lawsuit-department-housing-urban-development-hud/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-hud-lawsuit-src2', 'bd-20261124-local-hud-lawsuit', 'Housing and Community Development Act of 1980: Verification of Eligible Status (final rule)', 'https://www.federalregister.gov/documents/2026/11/12/2026-23003/housing-and-community-development-act-of-1980-verification-of-eligible-status', 'Federal Register', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-hud-lawsuit-src3', 'bd-20261124-local-hud-lawsuit', 'Complaint: mixed-status families rule (filed)', 'https://media.api.sf.gov/documents/Mixed_Status_Complaint_FILED.pdf', 'U.S. District Court filing', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261124-local-hud-lawsuit-ev1', 'bd-20261124-local-hud-lawsuit', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Local section draft from attributed reporting and primary sources; awaiting editor approval', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261124-local-dorchester-meals', 'dorchester-thanksgiving-meals-catholic-charities-united-way-2700-families', 'newsroom', 'news_story', 'local', 'EDITORIAL_REVIEW', 0, '2,700 Thanksgiving meals handed out on Columbia Road as Dorchester pantry demand jumps 40%', 'Catholic Charities Boston and United Way of Massachusetts Bay say need is rising as families lose SNAP benefits. More distributions are planned before Thursday.', 'Families lined up on Columbia Road in Dorchester on Saturday, Nov. 21, to pick up a turkey and all the fixings, as Catholic Charities Boston and the United Way of Massachusetts Bay handed out 2,700 Thanksgiving meals with help from The Greater Boston Food Bank, Boston 25 News reported.

## Why is the need growing?

Kelley Tuthill, president of Catholic Charities Boston, told Boston 25 that the agency''s Dorchester pantry has seen a 40% increase in people coming for food, and that hunger is getting worse each year.

Boston 25 reported that nearly 200,000 people in Massachusetts have lost SNAP benefits since July of last year, partly because of new eligibility limits and funding changes. One woman at the distribution said food is expensive and some neighbors have lost both SNAP and health insurance.

Marty Martinez, president and CEO of United Way of Massachusetts Bay, said the need is greatest around the holidays and urged people to think of their neighbors all year. Archbishop Richard Henning of Boston also attended.

## How many meals in total?

Organizers plan to give out 12,500 Thanksgiving meals in 13 communities across the region before the holiday.

## Where can I get food help this week?

- **Project Bread FoodSource Hotline:** call 1-800-645-8333 for help finding food near you, in many languages. [Project Bread](https://projectbread.org/get-help)
- **The Greater Boston Food Bank:** find a pantry or meal site near you. [Food finder](https://www.gbfb.org/need-food/)
- **Catholic Charities Boston:** [food pantry locations](https://www.ccab.org/)
- **SNAP help:** check or apply at [DTA Connect](https://dtaconnect.eohhs.mass.gov/) or call the DTA Assistance Line at 877-382-2363.

## How can I help?

The Greater Boston Food Bank, Catholic Charities and United Way all accept donations and volunteers through their websites.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Greater_Boston_Food_Bank%2C_March_2021.jpg/1280px-Greater_Boston_Food_Bank%2C_March_2021.jpg', 'The Greater Boston Food Bank warehouse (file). Photo: Todd Van Hoosear / Wikimedia Commons, CC BY-SA 2.0', 'licensed', 'newsroom', 'content/2026-11-24-local.sql', 7, 0, 'newsroom-assistant', '2026-11-24T19:30:00.000Z', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-dorchester-meals-src1', 'bd-20261124-local-dorchester-meals', 'Community partners join forces for Thanksgiving, distributing thousands of meals in Boston', 'https://www.boston25news.com/news/local/community-partners-join-forces-thanksgiving-distributing-thousands-meals-boston/A3TNMFWMDRCNVHFCZYBNCLKPMQ/', 'Boston 25 News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261124-local-dorchester-meals-ev1', 'bd-20261124-local-dorchester-meals', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Local section draft from attributed reporting and primary sources; awaiting editor approval', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261124-local-roxbury-mail', 'roxbury-post-office-audit-32000-delayed-mail-pieces', 'newsroom', 'news_story', 'local', 'EDITORIAL_REVIEW', 0, 'Federal audit finds more than 32,000 delayed pieces of mail at Roxbury post office in one day', 'Postal Service inspectors say managers reported only about a fifth of the delayed mail. Rep. Ayanna Pressley called the findings "damning."', 'Inspectors from the U.S. Postal Service Office of Inspector General (OIG) found more than 32,000 delayed mail pieces at the Roxbury Station post office during a visit on Sept. 1, Boston.com reported. Local managers had reported only about a fifth of them as delayed.

## What else did the audit find?

- About a quarter of the packages inspectors checked had been scanned incorrectly, which can make tracking information wrong.
- Safety and security problems, including a defibrillator locked inside an office where staff could not reach it quickly.

Across the post offices it checked that week, the OIG said delays often came from weak management oversight and poor communication and coordination, according to Boston.com.

## What does the Postal Service say?

Carissa Shea, the local USPS district manager, agreed with the findings, and her plan to fix them is included in the audit report, Boston.com reported. The OIG plans a summary report with recommendations across all of the inspections.

## A long-running complaint

Roxbury residents have complained about the branch for years. A 2024 letter from members of Congress cited waits of up to 45 minutes at the counter and mail delayed by up to four weeks. Rep. Ayanna Pressley called the new audit a "damning reflection" of what her constituents deal with every day.

## What can I do if my mail is late?

- **Report it to USPS:** use the [USPS Help page](https://www.usps.com/help/) or call 1-800-275-8777.
- **Track it:** [USPS Tracking](https://tools.usps.com/go/TrackConfirmAction_input) and the free [Informed Delivery](https://informeddelivery.usps.com/) service show what is on the way.
- **Contact your representative:** Rep. Pressley''s office helps constituents with federal agencies, including USPS. [Pressley.house.gov](https://pressley.house.gov/)
- **Report waste or misconduct:** the [USPS OIG hotline](https://www.uspsoig.gov/hotline).', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/United_States_Postal_Service_Grumman_LLV_mail_truck_2023_dllu.jpg/1280px-United_States_Postal_Service_Grumman_LLV_mail_truck_2023_dllu.jpg', 'A U.S. Postal Service delivery truck (file). Photo: Daniel Lu / Wikimedia Commons, CC BY-SA 4.0', 'licensed', 'newsroom', 'content/2026-11-24-local.sql', 7, 0, 'newsroom-assistant', '2026-11-24T19:30:00.000Z', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-roxbury-mail-src1', 'bd-20261124-local-roxbury-mail', 'USPS Inspectors find 32K+ delayed mail pieces at Roxbury post office in one day', 'https://www.boston.com/news/local-news/2026/11/19/united-states-postal-service-audit-roxbury-post-office/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261124-local-roxbury-mail-ev1', 'bd-20261124-local-roxbury-mail', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Local section draft from attributed reporting and primary sources; awaiting editor approval', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261124-local-mbta-2027', 'mbta-2027-construction-schedule-100-days-shutdowns-red-orange-green-lines', 'newsroom', 'news_story', 'local', 'EDITORIAL_REVIEW', 0, 'MBTA plans 100 days of shutdowns in 2027, down from 132 this year', 'Most work will happen on weekends. Here are the dates for the Red, Orange, Green, Blue and Mattapan lines and the Commuter Rail.', 'The MBTA plans about 100 days of service disruptions in 2027, most of them on weekends, the agency announced Thursday, Nov. 19. That is down from 132 days in 2026, 190 in 2025 and 274 in 2024.

The T says the drop reflects progress on repairs over the past few years. Dates can still shift because of weather or construction needs, and the MBTA says it will post notices and alternate travel options before each one. See the full list on the [MBTA''s announcement](https://www.mbta.com/news/2026-11-19/mbta-announces-2027-construction-schedule-significantly-fewer-planned-service).

## What is the work?

Signal upgrades on the Red and Orange lines, finishing signal work in the Green Line''s central tunnel before new trains arrive, track work, radio upgrades, station accessibility projects and bridge repairs. MBTA General Manager Phillip Eng said the focus is rebuilding track, modernizing signals, improving accessibility and safety.

## Key dates by line

**Red Line**
- Alewife to Kendall/MIT: Jan. 30-31
- JFK/UMass to Quincy Center: April 8-12
- Kendall/MIT to JFK/UMass: July 17-18 and July 24-25
- JFK/UMass to Braintree: Aug. 7-15

**Orange Line**
- Back Bay to Forest Hills: March 6-7
- North Station to Ruggles: May 15-23
- North Station to Back Bay: July 10-11 and Oct. 8-11

**Green Line**
- Symphony station: closed through spring 2029 for new elevators
- Central tunnel signal work (North Station, Kenmore, Babcock Street, Heath Street areas): several January, February and September weekends
- Government Center to Union Square and East Somerville: Nov. 13-21

**Blue Line**
- Bowdoin to Airport: June 18-27 and Oct. 23-24

**Mattapan Line**
- Ashmont to Mattapan: March 27-28 and April 3-4

**Commuter Rail:** work on the Needham, Newburyport/Rockport, Worcester, Providence/Stoughton, Franklin/Foxboro and Lowell lines through the year.

## How do I get alerts?

Sign up for free [T-Alerts](https://alerts.mbta.com/) by text or email, or check [mbta.com/alerts](https://www.mbta.com/alerts) before you ride.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Northbound_MBTA_Orange_Line_train_at_Sullivan_station.jpg/1280px-Northbound_MBTA_Orange_Line_train_at_Sullivan_station.jpg', 'An Orange Line train at Sullivan Square station (file). Photo: 4300streetcar / Wikimedia Commons, CC BY 4.0', 'licensed', 'newsroom', 'content/2026-11-24-local.sql', 7, 0, 'newsroom-assistant', '2026-11-24T19:30:00.000Z', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-mbta-2027-src1', 'bd-20261124-local-mbta-2027', 'MBTA announces 2027 construction schedule with significantly fewer planned service disruptions', 'https://www.mbta.com/news/2026-11-19/mbta-announces-2027-construction-schedule-significantly-fewer-planned-service', 'MBTA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-mbta-2027-src2', 'bd-20261124-local-mbta-2027', 'MBTA announces 2027 schedule, promising fewer shutdowns', 'https://www.boston.com/news/local-news/2026/11/19/mbta-announces-2027-schedule-promising-fewer-shutdowns/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261124-local-mbta-2027-ev1', 'bd-20261124-local-mbta-2027', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Local section draft from attributed reporting and primary sources; awaiting editor approval', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261124-local-thanksgiving-football', 'boston-latin-english-thanksgiving-football-2026-boston-schools-schedule', 'newsroom', 'news_story', 'local', 'EDITORIAL_REVIEW', 0, 'Latin vs. English, the nation''s oldest high school rivalry, kicks off Thanksgiving morning', 'Boston English won last year''s game 40-30. Here is when every Boston Public Schools team plays this holiday week.', 'Boston Latin School and The English High School meet on Thanksgiving morning, Thursday, Nov. 26, at 10 a.m., in the country''s oldest continuous high school football rivalry. The schools have played every Thanksgiving since 1887, except in 2020 during the pandemic.

The game is traditionally held at Harvard Stadium in Allston. Check with [Boston Public Schools Athletics](https://www.bostonpublicschools.org/athletics) for this year''s site and tickets.

## Who won last year?

English beat Latin 40-30 on Thanksgiving 2025, according to WBZ NewsRadio. Latin still holds the overall series lead.

## Boston Public Schools games this week

According to CBS News Boston''s Thanksgiving scoreboard:

- **Boston Latin Academy vs. O''Bryant:** Wednesday, Nov. 25, 1 p.m.
- **Chelsea vs. East Boston:** Wednesday, Nov. 25, 6 p.m.
- **Boston Latin vs. English:** Thursday, Nov. 26, 10 a.m.
- **TechBoston vs. Brighton/Kennedy:** Thursday, Nov. 26, 1 p.m.

Boston''s private schools also play Thursday: **Catholic Memorial vs. BC High** kicks off at 10 a.m.

## Weather warning

Thursday morning should be dry, but a coastal storm is expected to bring heavy rain and strong winds later in the afternoon and evening, according to the National Weather Service. Check the [NWS Boston forecast](https://www.weather.gov/box/) before you go.

Final scores will be posted on [CBS News Boston''s scoreboard](https://www.cbsnews.com/boston/news/massachusetts-thanksgiving-high-school-football-scores-2026/).', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Harvard_Stadium_end_view.jpg/1280px-Harvard_Stadium_end_view.jpg', 'Harvard Stadium, traditional home of the Latin-English game (file). Photo: T.S. Custadio / Wikimedia Commons, CC BY-SA 3.0', 'licensed', 'newsroom', 'content/2026-11-24-local.sql', 7, 0, 'newsroom-assistant', '2026-11-24T19:30:00.000Z', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-thanksgiving-football-src1', 'bd-20261124-local-thanksgiving-football', 'Massachusetts Thanksgiving high school football scoreboard 2026', 'https://www.cbsnews.com/boston/news/massachusetts-thanksgiving-high-school-football-scores-2026/', 'CBS News Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-thanksgiving-football-src2', 'bd-20261124-local-thanksgiving-football', 'Mass. High School Thanksgiving 2025 Football Rivalry Games Scores', 'https://wbznewsradio.iheart.com/content/2025-11-27-mass-high-school-thanksgiving-2025-football-rivalry-games-scores', 'WBZ NewsRadio', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-local-thanksgiving-football-src3', 'bd-20261124-local-thanksgiving-football', 'Boston Latin School football: Latin-English', 'https://sites.google.com/a/bostonpublicschools.org/boston-latin-school-football/latin-english', 'Boston Latin School', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T19:30:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T19:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261124-local-thanksgiving-football-ev1', 'bd-20261124-local-thanksgiving-football', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Local section draft from attributed reporting and primary sources; awaiting editor approval', '2026-11-24T19:30:00.000Z');
