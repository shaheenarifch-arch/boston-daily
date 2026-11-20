-- Thanksgiving 2026 package (editor-approved plan, Nov. 19, 2026).
-- 7 news stories, 1 opinion column draft, 1 hub guide and 1 labeled Affiliate partner guide.
-- Everything loads as EDITORIAL_REVIEW drafts; the editor approves each story in the console before it is published.
-- Every hero image is a real photo with recorded rights, used nowhere else on the site.
-- The weather story is written separately on Nov. 24 so the forecast is current.

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-travel', 'thanksgiving-travel-2026-boston-logan-busiest-days-gas-prices', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'Thanksgiving travel 2026: Record gas prices possible, and Logan''s busiest days', 'AAA expects a slight dip in holiday travelers after three record years, with pricier flights and Thanksgiving Day gas that could cost more than ever.', 'AAA projects 81.5 million Americans will travel at least 50 miles from home over the Thanksgiving holiday period, from Tuesday, Nov. 24, through Monday, Nov. 30. That is about 121,000 fewer travelers than last year, a 0.1% dip that ends a three-year streak of record Thanksgiving travel.

AAA said higher travel costs are part of the reason for the small decline, but travelers are unlikely to notice much difference on the roads or at airports.

## How will most people travel?

Driving still dominates. AAA expects 72.9 million people to travel by car, slightly fewer than last year''s 73.1 million.

- **Flying:** About 5.96 million travelers are expected to take domestic flights, down 0.2%. Round-trip domestic fares booked through AAA average $800, 17% more than last year.
- **Buses, trains and cruises:** About 2.6 million people, up 4.1%, the only category AAA expects to grow.

## Will gas prices set a Thanksgiving record?

They could. The national average was $3.69 a gallon on Nov. 20, according to AAA. If prices hold, Thanksgiving Day gas would be the most expensive on record, topping the previous Thanksgiving Day high of $3.58 set in 2022.

## What are the busiest days at Logan Airport?

In recent years, the TSA and AAA Northeast have said the Tuesday and Wednesday before Thanksgiving are the busiest outbound days at Logan, and the Sunday after the holiday is typically one of the busiest days of the entire year. Early morning, from about 5 to 7 a.m., is usually the most crowded time at security checkpoints.

Travelers should:

- Arrive at least two hours before a domestic flight, as the TSA recommends.
- Check flight status in the airline''s app before leaving home.
- Pack food carefully: solid foods such as pies can go through security, but gravy, cranberry sauce and other liquids over 3.4 ounces belong in checked bags under [TSA rules](https://www.tsa.gov/travel/security-screening/whatcanibring/all).

## Will air traffic problems affect the holiday?

A problem with air traffic control communications and radar feeds on Friday, Nov. 13, led the Federal Aviation Administration to impose a nationwide ground stop that lasted more than four hours, the Associated Press reported. Officials said the system would likely be back to normal before the Thanksgiving rush.

## What about the roads in Massachusetts?

Last year, MassDOT said Tuesday, Wednesday and the Sunday after Thanksgiving were expected to be the busiest days on Massachusetts roads, with Thanksgiving Day itself one of the best days of the week to drive. Expect a similar pattern this year. Check [Mass511](https://mass511.com) for live traffic and incident reports before you leave.

## Frequently asked questions

### How many people will travel for Thanksgiving 2026?

AAA projects 81.5 million Americans will travel at least 50 miles from home between Nov. 24 and Nov. 30, slightly fewer than the 81.6 million last year.

### What is the busiest day to fly out of Boston for Thanksgiving?

The Tuesday and Wednesday before Thanksgiving are typically the busiest departure days at Logan, and the Sunday after the holiday is usually the busiest day for returning travelers.

### How much are Thanksgiving flights in 2026?

Round-trip domestic flights booked through AAA for the holiday average $800, up 17% from last year.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Planes_on_the_tarmac_at_Logan_International_Airport_Terminal_B_2022.jpg/1280px-Planes_on_the_tarmac_at_Logan_International_Airport_Terminal_B_2022.jpg', 'Planes at Logan International Airport, Terminal B (file). Photo: Chris Rycroft / Wikimedia Commons, CC BY 2.0', 'licensed', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 9, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src1', 'bd-20261120-tg-travel', 'AAA: Thanksgiving travel forecast 2026 (via Lodging Magazine)', 'https://lodgingmagazine.com/?p=129588', 'Lodging Magazine', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src2', 'bd-20261120-tg-travel', 'AAA: 81.5 million Americans expected to travel for Thanksgiving; nearly 90% will drive', 'https://abc3340.com/news/nation-world/aaa-815-million-americans-expected-to-travel-for-thanksgiving-nearly-90-will-drive', 'The National News Desk (via ABC 33/40)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src3', 'bd-20261120-tg-travel', 'AAA: Over 81 million Americans expected to travel for Thanksgiving', 'https://www.foxweather.com/lifestyle/more-than-81-million-americans-expected-travel-thanksgiving-despite-fewer-drivers-flyers', 'FOX Weather', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src4', 'bd-20261120-tg-travel', 'Gasoline could set a Thanksgiving Day price record', 'https://www.ttnews.com/articles/gasoline-thanksgiving-price', 'Associated Press (via Transport Topics)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src5', 'bd-20261120-tg-travel', 'AAA Thanksgiving travel, Nov. 16, 2026', 'https://www.wtvr.com/news/local-news/richmond/aaa-thanksgiving-travel-nov-16-2026', 'WTVR CBS 6', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src6', 'bd-20261120-tg-travel', 'Massachusetts Thanksgiving traffic: busiest days at Logan', 'https://axios.com/local/boston/2025/11/21/massachusetts-thanksgiving-traffic-2025', 'Axios Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src7', 'bd-20261120-tg-travel', 'What can I bring?', 'https://www.tsa.gov/travel/security-screening/whatcanibring/all', 'Transportation Security Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-travel-src8', 'bd-20261120-tg-travel', 'MassDOT to discuss Thanksgiving travel (2025)', 'https://www.nbcboston.com/news/local/massdot-to-discuss-thanksgiving-travel-watch-live-at-10/3850075/', 'NBC Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-travel-ev1', 'bd-20261120-tg-travel', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-dinner-cost', 'thanksgiving-dinner-cost-2026-farm-bureau-survey-turkey-prices', 'newsroom', 'news_story', 'business', 'EDITORIAL_REVIEW', 0, 'Thanksgiving dinner costs $58.63 for 10 this year, the first increase since 2022', 'The American Farm Bureau Federation''s annual survey found turkey up 10%, while the total meal remains below the 2022 record.', 'A classic Thanksgiving dinner for 10 people will cost an average of $58.63 this year, or about $5.86 per person, according to the American Farm Bureau Federation''s 41st annual survey. That is up about 6% from last year''s $55.18 and marks the first overall increase since prices hit a record $64.05 in 2022.

This year''s total is still $5.42, or 8.5%, below that 2022 peak, the Farm Bureau said.

## Why is Thanksgiving dinner more expensive this year?

Turkey drove most of the increase. A 16-pound turkey averaged $23.68 in the survey, up 10% from $21.30 last year.

Apart from turkey, the Farm Bureau found higher prices for several other holiday staples, including boneless ham, milk, dinner rolls, sweet potatoes, russet potatoes, frozen peas and frozen green beans. Prices for several other items in the survey fell slightly.

AFBF Deputy Chief Economist Faith Parum, Ph.D., said "high diesel prices and a shortage of farm labor have taken a toll" on farms, adding that U.S. families still spend a smaller share of their income on food than people in most other countries.

## How does the survey work?

Volunteer shoppers in all 50 states and Puerto Rico checked prices in stores and online during the first week of November, without special coupons or combined-purchase deals. The classic menu covers turkey, stuffing, sweet potatoes, rolls, peas, cranberries, a vegetable tray and pumpkin pie with whipped cream, in amounts that serve 10.

The Farm Bureau calls the survey informal. It is a national average, so prices in Greater Boston can be higher or lower depending on the store.

## How can you save on Thanksgiving dinner?

- **Compare weekly circulars** from local supermarkets. Many stores discount turkeys in the days before the holiday, sometimes with a minimum purchase.
- **Buy frozen.** Frozen turkeys usually cost less per pound than fresh birds. Allow about one day of refrigerator thawing for every 4 to 5 pounds, according to the [USDA](https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/poultry/lets-talk-turkey-roasting).
- **Shop early in Massachusetts.** State blue laws keep supermarkets closed on Thanksgiving Day, so finish shopping by Wednesday.

## Frequently asked questions

### How much does Thanksgiving dinner cost in 2026?

The American Farm Bureau Federation''s survey puts a classic Thanksgiving dinner for 10 at $58.63, or about $5.86 per person.

### How much is a turkey this Thanksgiving?

A 16-pound turkey averaged $23.68 in the 2026 survey, up 10% from last year.

### Is Thanksgiving dinner the most expensive ever?

No. Despite this year''s increase, the meal is 8.5% below the 2022 record of $64.05.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Our_%28Almost_Traditional%29_Thanksgiving_Dinner.jpg/1280px-Our_%28Almost_Traditional%29_Thanksgiving_Dinner.jpg', 'A Thanksgiving dinner plate (file). Photo: Ms Jones / Wikimedia Commons, CC BY 2.0', 'licensed', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 8, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-dinner-cost-src1', 'bd-20261120-tg-dinner-cost', 'Thanksgiving Dinner Cost Ticks Upward in 2026', 'https://www.fb.org/intel/markets/thanksgiving-dinner-cost-ticks-upward-in-2026', 'American Farm Bureau Federation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-dinner-cost-src2', 'bd-20261120-tg-dinner-cost', 'Cost of Thanksgiving Dinner Increases, Remains Below 2022 Record High', 'https://www.oklahomafarmreport.com/2026/11/18/cost-of-thanksgiving-dinner-increases-remains-below-2022-record-high/', 'Oklahoma Farm Report', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-dinner-cost-src3', 'bd-20261120-tg-dinner-cost', 'Thanksgiving dinner will cost more this year, survey says', 'https://spectrumlocalnews.com/us/snplus/human-interest/2026/11/18/thanksgiving-dinner-will-cost-more-this-year', 'Spectrum News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-dinner-cost-src4', 'bd-20261120-tg-dinner-cost', 'Thanksgiving Dinner for 10 Costs $58.63, Farm Bureau Says', 'https://southernmarylandchronicle.com/2026/11/18/farm-bureau-2026-thanksgiving-dinner-cost-58-63-for-10/', 'Southern Maryland Chronicle', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-dinner-cost-src5', 'bd-20261120-tg-dinner-cost', 'Thanksgiving Dinner Cost Analysis: Moderate Decline (2025 survey)', 'https://www.fb.org/intel/markets/thanksgiving-dinner-cost-analysis-moderate-decline', 'American Farm Bureau Federation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-dinner-cost-src6', 'bd-20261120-tg-dinner-cost', 'Let''s Talk Turkey: A Consumer Guide to Safely Roasting a Turkey', 'https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/poultry/lets-talk-turkey-roasting', 'USDA Food Safety and Inspection Service', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-dinner-cost-ev1', 'bd-20261120-tg-dinner-cost', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-open-closed', 'whats-open-closed-thanksgiving-2026-massachusetts-blue-laws', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'What''s open and closed on Thanksgiving 2026 in Massachusetts', 'Blue laws keep supermarkets, liquor stores and most retailers closed on Thursday, Nov. 26. Here is what you can still find open.', 'Thanksgiving falls on Thursday, Nov. 26, and in Massachusetts that means most stores will be closed. The state is one of only a few with "blue laws" that bar most retail businesses from opening on Thanksgiving and Christmas.

Full commerce restrictions apply on Thanksgiving Day, according to the Secretary of the Commonwealth''s office. The state Department of Labor Standards has said it will not issue statewide approval for businesses to open on Thanksgiving Day 2026.

## What is closed on Thanksgiving in Massachusetts?

- **Supermarkets and big-box stores.** Grocery chains and large retailers stay closed statewide. Finish your shopping by Wednesday night.
- **Liquor stores.** State law requires them to close on Thanksgiving Day.
- **Banks, post offices and government offices.** Thanksgiving is a federal and state holiday. There is no regular mail delivery.
- **Registry of Motor Vehicles and city and town halls.** Closed for the holiday.

## What is open on Thanksgiving?

Some types of businesses are exempt from the blue laws, but hours vary, so call ahead.

- **Gas stations**
- **Pharmacies.** Many CVS and Walgreens stores close or keep shorter hours, so check your local store.
- **Restaurants**, which may also serve alcohol on site
- **Small convenience stores.** Food stores with no more than three people working at one time, including the owner, may open.
- **Hotels, florists and pet stores**

## Is the MBTA running on Thanksgiving?

Yes, on a reduced schedule. The MBTA lists Thanksgiving Day, Thursday, Nov. 26, on its [holiday service page](https://www.mbta.com/holiday) and posts the final schedule there. In recent years, subway, bus and The RIDE service ran on a Sunday schedule on Thanksgiving, Commuter Rail ran a weekend schedule, and there was no ferry service. We will update this story when the MBTA confirms this year''s plan.

## Are stores open on Black Friday?

Yes. The blue-law restrictions apply only to Thanksgiving Day itself. Stores can reopen on Friday, Nov. 27, and many open early for Black Friday sales.

## Frequently asked questions

### Are grocery stores open on Thanksgiving in Massachusetts?

No. Massachusetts blue laws keep supermarkets closed on Thanksgiving Day. Some small convenience stores may open.

### Can you buy alcohol on Thanksgiving in Massachusetts?

Liquor stores must close on Thanksgiving Day. Restaurants that are open can still serve alcohol on site.

### Is mail delivered on Thanksgiving?

No. Post offices are closed and there is no regular mail delivery on Thanksgiving, a federal holiday.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Outbound_MBTA_Red_Line_train_approaching_South_Station.jpg/1280px-Outbound_MBTA_Red_Line_train_approaching_South_Station.jpg', 'An MBTA Red Line train approaching South Station (file). Photo: Xb-70 / Wikimedia Commons, public domain', 'public_domain', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 8, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src1', 'bd-20261120-tg-open-closed', 'Holiday information: legal holidays and business restrictions', 'https://www.sec.state.ma.us/divisions/cis/holiday-info.htm', 'Secretary of the Commonwealth of Massachusetts', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src2', 'bd-20261120-tg-open-closed', 'Permits for opening on Thanksgiving Day and Christmas Day 2026', 'https://www.mass.gov/doc/holiday-permits-for-opening-on-thanksgiving-day-christmas-day-2026/download', 'Massachusetts Department of Labor Standards', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src3', 'bd-20261120-tg-open-closed', 'Holiday Service Schedules', 'https://www.mbta.com/holiday', 'MBTA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src4', 'bd-20261120-tg-open-closed', 'MassDOT advisory: Thanksgiving holiday travel (2025)', 'https://www.mass.gov/news/massdot-advisory-thanksgiving-holiday-travel-0', 'MassDOT', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src5', 'bd-20261120-tg-open-closed', 'What''s open and what''s closed on Thanksgiving in Massachusetts?', 'https://www.cbsnews.com/boston/news/stores-supermarkets-pharmacies-thanksgiving-open-closed-massachusetts', 'CBS Boston', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src6', 'bd-20261120-tg-open-closed', 'Why grocery stores will be closed on Thanksgiving in Massachusetts', 'https://rock929rocks.com/2025/11/17/why-grocery-stores-will-be-closed-on-thanksgiving-in-massachusetts-rhode-island/', 'Rock 92.9', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-open-closed-src7', 'bd-20261120-tg-open-closed', 'Why most Massachusetts stores must close on Thanksgiving Day', 'https://wbsm.com/massachusetts-stores-must-close-thanksgiving/', 'WBSM', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-open-closed-ev1', 'bd-20261120-tg-open-closed', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-nfl', 'nfl-thanksgiving-2026-schedule-times-how-to-watch', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'NFL Thanksgiving 2026: All five games, kickoff times and how to watch', 'The league adds its first Thanksgiving Eve game this year, and the Bills host the Chiefs in Thursday night''s finale.', 'Thanksgiving week football gets bigger this year. The NFL has scheduled five games over three days, including its first-ever Thanksgiving Eve game, the traditional Thanksgiving Day tripleheader and the fourth annual Black Friday game.

## What is the NFL Thanksgiving schedule for 2026?

| Day | Game | Kickoff (ET) | TV / streaming |
| --- | --- | --- | --- |
| Wednesday, Nov. 25 | Green Bay Packers at Los Angeles Rams | 8 p.m. | Netflix |
| Thursday, Nov. 26 | Chicago Bears at Detroit Lions | 1 p.m. | CBS, Paramount+ |
| Thursday, Nov. 26 | Philadelphia Eagles at Dallas Cowboys | 4:30 p.m. | FOX, FOX One |
| Thursday, Nov. 26 | Kansas City Chiefs at Buffalo Bills | 8:20 p.m. | NBC, Peacock |
| Friday, Nov. 27 | Denver Broncos at Pittsburgh Steelers | 3 p.m. | Prime Video |

## What to watch for

- **Packers at Rams (Wednesday):** The new Thanksgiving Eve game puts Jordan Love against Matthew Stafford, the 2025 NFL MVP, at SoFi Stadium.
- **Bears at Lions:** An NFC North rivalry game. Chicago won the division last season for the first time since 2018, while Detroit finished 9-8 and missed the playoffs.
- **Eagles at Cowboys:** The annual Dallas home game features one of the NFC East''s fiercest rivalries.
- **Chiefs at Bills:** The night game matters most to New England fans. Buffalo is a Patriots division rival in the AFC East, so the result could shape the AFC East race.

## Do the Patriots play on Thanksgiving?

No. The Patriots are not among this year''s Thanksgiving week games. Check the [NFL schedule](https://www.nfl.com/schedules/) for their next kickoff.

## Why do the Lions and Cowboys always play on Thanksgiving?

The Detroit Lions have hosted a Thanksgiving game since 1934, and the Dallas Cowboys joined as hosts in 1966. The NFL added a third Thanksgiving game in 2006, a Black Friday game in 2023 and, this year, a Thanksgiving Eve game.

## Frequently asked questions

### What NFL games are on Thanksgiving 2026?

Bears at Lions at 1 p.m. ET on CBS, Eagles at Cowboys at 4:30 p.m. ET on FOX and Chiefs at Bills at 8:20 p.m. ET on NBC.

### Is there an NFL game on Thanksgiving Eve?

Yes. For the first time, the NFL scheduled a Thanksgiving Eve game: the Packers at the Rams on Wednesday, Nov. 25, at 8 p.m. ET on Netflix.

### What is the Black Friday NFL game in 2026?

The Denver Broncos visit the Pittsburgh Steelers on Friday, Nov. 27, at 3 p.m. ET on Prime Video.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/DetroitLionsRunningPlay-2007.jpg/1280px-DetroitLionsRunningPlay-2007.jpg', 'The Detroit Lions run a play during their Thanksgiving Day game at Ford Field, Nov. 22, 2007 (file). Photo: Dave Hogg / Wikimedia Commons, CC BY 2.0', 'licensed', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 8, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-nfl-src1', 'bd-20261120-tg-nfl', 'NFL Thanksgiving schedule 2026: Chiefs-Bills, Eagles-Cowboys and Bears-Lions', 'https://www.nbcchicago.com/news/sports/nfl/nfl-thanksgiving-schedule-2026-chiefs-bills-eagles-cowboys-bears-lions/', 'NBC Chicago', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-nfl-src2', 'bd-20261120-tg-nfl', 'NFL Thanksgiving schedule 2026 (Bay Area edition)', 'https://www.nbcbayarea.com/news/sports/nfl/nfl-thanksgiving-schedule-2026-chiefs-bills-eagles-cowboys-bears-lions/4084663/', 'NBC Bay Area', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-nfl-src3', 'bd-20261120-tg-nfl', '2026 NFL Thanksgiving Games: Schedule, Teams, How to Watch', 'https://www.foxsports.com/stories/nfl/2026-nfl-thanksgiving-games-schedule-teams-how-watch', 'FOX Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-nfl-src4', 'bd-20261120-tg-nfl', 'NFL 2026 schedule: Thanksgiving week expands again, five games headline holiday slate', 'https://cbssports.com/nfl/news/nfl-thanksgiving-schedule-2026-games/', 'CBS Sports', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-nfl-src5', 'bd-20261120-tg-nfl', '2026 NFL schedule release: Packers-Rams, Chiefs-Bills, Broncos-Steelers highlight Thanksgiving Week', 'https://www.nfl.com/_amp/thanksgiving-2026-nfl-schedule-release', 'NFL.com', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-nfl-ev1', 'bd-20261120-tg-nfl', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-events', 'boston-thanksgiving-events-2026-turkey-trots-plymouth-parade', 'newsroom', 'feature', 'lifestyle', 'EDITORIAL_REVIEW', 0, 'Thanksgiving 2026 in Greater Boston: Turkey trots, the Plymouth parade and more', 'From the Franklin Park Turkey Trot to America''s Hometown Thanksgiving Parade, here is how to spend the holiday weekend around Boston.', 'Thanksgiving week in Greater Boston starts early. Plymouth holds its famous parade the Saturday before the holiday, and dozens of turkey trots across Massachusetts give runners and walkers a way to earn their dinner.

## When is the Plymouth Thanksgiving parade?

America''s Hometown Thanksgiving Parade is on **Saturday, Nov. 21, 2026**, in Plymouth. The parade steps off from Plymouth Rock at 10 a.m., and it is free to watch.

The organizers say this year''s celebration also marks the nation''s 250th anniversary. The parade is known for its historical theme, with floats and marchers representing each century of American history instead of giant cartoon balloons. Check [usathanksgiving.com](https://usathanksgiving.com) for the full weekend schedule, parking and shuttle details.

## Where can I run a turkey trot near Boston?

- **Franklin Park Turkey Trot, Boston (Dorchester).** The largest Thanksgiving Day race in the city starts at 9 a.m. on Thursday, Nov. 26, at the Franklin Park Golf Clubhouse. Race-day number pickup begins at 7:30 a.m. Registration costs about $42 for adults and $21 for ages 6 to 17, including fees, and children 5 and under run free. [Register on RunSignup](https://runsignup.com/fpc5k).
- **Norwood Turkey Trot.** The 40th running is on Sunday, Nov. 22.
- **Wellesley Turkey Trot.** Thanksgiving morning, Nov. 26.
- **Hingham Turkey Trot.** Thanksgiving morning, Nov. 26.
- **Bedford Turkey Trot.** 8 a.m. on Thanksgiving Day.
- **Newburyport Maudslay Turkey Trot 5K.** Thanksgiving morning at Maudslay State Park. This year it combines with the Will Run for Pie 5K into one race.

Many races sell out, so register online before race day.

## What else is happening Thanksgiving week?

- **National Day of Mourning, Plymouth.** United American Indians of New England hold their annual National Day of Mourning on Cole''s Hill, above Plymouth Rock, at noon on Thanksgiving Day. The event, held since 1970, remembers Native Americans and the impact of colonization.
- **NFL on TV.** Five games run from Wednesday night through Black Friday. See our [Thanksgiving football guide](/story/nfl-thanksgiving-2026-schedule-times-how-to-watch).
- **Volunteering.** Food banks and pantries need help before and after the holiday. See [how to help this Thanksgiving](/story/how-to-help-thanksgiving-2026-greater-boston-food-banks-volunteer).

Event details can change. Check with organizers before you go.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Turkey_Trot_2021-_5K_for_Turkey_Day_%286954063%29.jpg/1280px-Turkey_Trot_2021-_5K_for_Turkey_Day_%286954063%29.jpg', 'Runners start a Thanksgiving turkey trot 5K (file). Photo: U.S. Air Force / Wikimedia Commons, public domain', 'public_domain', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 7, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src1', 'bd-20261120-tg-events', 'America''s Hometown Thanksgiving Celebration announces plans for Thanksgiving Parade 2026', 'https://www.newsfilecorp.com/release/305137/Americas-Hometown-Thanksgiving-Celebration-Announces-Plans-for-Thanksgiving-Parade-2026', 'America''s Hometown Thanksgiving Celebration (via Newsfile)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src2', 'bd-20261120-tg-events', 'Plymouth Thanksgiving parade 2026 weekend guide', 'https://pixidia.com/?p=92566', 'Pixidia', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src3', 'bd-20261120-tg-events', 'Franklin Park Turkey Trot', 'https://www.franklinparkcoalition.org/featured-events/turkey-trot/', 'Franklin Park Coalition', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src4', 'bd-20261120-tg-events', 'Franklin Park Turkey Trot registration', 'https://runsignup.com/fpc5k', 'RunSignup', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src5', 'bd-20261120-tg-events', 'Franklin Park Turkey Trot race details', 'https://racematcher.com/race/franklin-park-turkey-trot-ma', 'RaceMatcher', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src6', 'bd-20261120-tg-events', 'Turkey Trots in Massachusetts 2026', 'https://legionreport.com/massachusetts-turkey-trots/', 'Legion Report', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src7', 'bd-20261120-tg-events', 'Bedford MA Turkey Trot', 'https://raceroster.com/events/2026/165708/bedford-ma-turkey-trot', 'Race Roster', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-events-src8', 'bd-20261120-tg-events', 'Will Run for Pie / Newburyport Maudslay Turkey Trot 2026', 'https://runsignup.com/Race/MA/Newbuyport/WCRCWildTurkeyTrot5kRunWalk', 'RunSignup', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-events-ev1', 'bd-20261120-tg-events', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-help', 'how-to-help-thanksgiving-2026-greater-boston-food-banks-volunteer', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 1, 'How to help this Thanksgiving: Food banks and volunteering in Greater Boston', 'The Greater Boston Food Bank expects to distribute a record number of meals this year. Here is how to give, volunteer or find food.', 'For many families in Massachusetts, the holiday table is harder to fill this year. The Greater Boston Food Bank, the largest hunger-relief organization in New England, said in June that it expects to distribute about 94 million meals in 2026, about 260,000 a day and roughly 2 million more than last year.

The food bank also said it would put a record of nearly $65 million toward buying food this year.

## How can I donate to a food bank in Greater Boston?

- **Give money.** Food banks can buy food in bulk at far lower prices than shoppers pay, so cash donations usually stretch furthest. The Greater Boston Food Bank says a $750,000 matching gift from its board will double donations during its [holiday campaign](https://www.gbfb.org/holidays/).
- **Give to a local pantry.** The food bank supplies hundreds of local pantries and meal programs across Eastern Massachusetts. Many accept food and money directly.
- **Host a food drive** at work or school. Ask the pantry first which items it needs most.

## Where can I volunteer at Thanksgiving?

Holiday volunteer shifts fill quickly, but help is needed all year, including in December and January, when donations often drop.

- [The Greater Boston Food Bank](https://www.gbfb.org/) runs volunteer shifts at its Boston distribution center.
- [Catholic Charities Boston](https://www.ccab.org/) holds Thanksgiving meal distributions. Last year it gave out 4,000 holiday meals at five locations in Dorchester, Brockton, Lynn, Lowell and South Boston.
- Local churches, mosques, synagogues and community centers often run holiday meals and need drivers, cooks and servers.

## Where can I get help with food?

If you need food for the holiday or beyond, the City of Boston''s Office of Food Justice publishes a Thanksgiving resource guide through its partners, and the Greater Boston Food Bank lists pantries and meal sites on [its website](https://www.gbfb.org/). Statewide, [Project Bread](https://www.projectbread.org/) can connect you with food resources and help you apply for SNAP benefits.

## How do I avoid charity scams?

Scammers take advantage of holiday generosity. The Massachusetts Office of Consumer Affairs and Business Regulation advises researching a charity before you give, even when a request sounds urgent, and never donating by gift card, wire transfer or cryptocurrency.

## Frequently asked questions

### What is the best way to help a food bank at Thanksgiving?

Money usually goes furthest, because food banks buy in bulk. Volunteering and organized food drives also help.

### Can I volunteer on Thanksgiving Day?

Some meal programs need help on the day, but shifts fill early. Food banks also need volunteers in the weeks after the holiday.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Delaware_Nat%E2%80%99l_Guard_aids_food_bank_amid_COVID-19_%2850042117192%29.jpg/1280px-Delaware_Nat%E2%80%99l_Guard_aids_food_bank_amid_COVID-19_%2850042117192%29.jpg', 'Volunteers sort food at a food bank (file). Photo: Delaware National Guard / Wikimedia Commons, public domain', 'public_domain', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 8, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-help-src1', 'bd-20261120-tg-help', 'The Greater Boston Food Bank responds to the rise in hunger with $6.3 million investment', 'https://www.gbfb.org/news/press-releases/6-3-million-grants/', 'The Greater Boston Food Bank', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-help-src2', 'bd-20261120-tg-help', 'Turn Hunger into Hope This Season', 'https://www.gbfb.org/holidays/', 'The Greater Boston Food Bank', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-help-src3', 'bd-20261120-tg-help', 'Catholic Charities Boston distributes 4,000 Thanksgiving meals to families in need (2025)', 'https://www.ccab.org/news/this-turkey-means-a-lot-catholic-charities-boston-distributes-4000-thanksgiving-meals-to-families-in-need/', 'Catholic Charities Boston', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-help-src4', 'bd-20261120-tg-help', 'Catholic Charities Boston to distribute 4,000 Thanksgiving meals (2025 locations)', 'https://www.ccab.org/news/catholic-charities-boston-to-distribute-4000-thanksgiving-meals-as-local-demand-soars-due-to-rising-living-costs-and-snap-benefits-uncertainty/', 'Catholic Charities Boston', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-help-src5', 'bd-20261120-tg-help', 'Mayor Wu announces increased efforts to support families during holidays', 'https://www.boston.gov/news/mayor-wu-announces-increased-efforts-support-families-during-holidays-including-annual-turkey', 'City of Boston', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-help-src6', 'bd-20261120-tg-help', 'Outsmart scammers this holiday season', 'https://www.mass.gov/news/outsmart-scammers-this-holiday-season', 'Massachusetts Office of Consumer Affairs and Business Regulation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-help-ev1', 'bd-20261120-tg-help', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-black-friday', 'black-friday-2026-holiday-shopping-forecast-scams-tips', 'newsroom', 'news_story', 'business', 'EDITORIAL_REVIEW', 0, 'Black Friday 2026: Holiday sales forecast to top $1 trillion, and how to avoid scams', 'Most shoppers plan to do the bulk of their buying over Thanksgiving weekend, the National Retail Federation says. Here is what to know before you shop.', 'Holiday shoppers are expected to spend more this year even as they watch their budgets. The National Retail Federation forecasts that U.S. retail sales in November and December will grow 4.2% from last year, to $1.013 trillion. Holiday sales rose 3.1% to $972 billion in 2025.

NRF said inflation is part of the increase and expects retailers to compete hard on price for careful shoppers. It also expects retailers to hire 325,000 to 375,000 seasonal workers.

## When will most people shop?

Thanksgiving weekend is still the main event. In NRF''s October survey, 64% of consumers said they were likely to do most of their holiday shopping over the Thanksgiving weekend, in line with 63% a year earlier.

Last year, a record 202.9 million people shopped in stores or online over the five days from Thanksgiving through Cyber Monday, according to NRF. Black Friday was the most popular day.

## Are stores in Massachusetts open on Black Friday?

Yes. Blue laws close most Massachusetts stores on Thanksgiving Day, but they can open on Friday, Nov. 27. Check individual store hours, since many open early. See [what''s open and closed on Thanksgiving](/story/whats-open-closed-thanksgiving-2026-massachusetts-blue-laws).

## How can I avoid holiday shopping scams?

Fake stores, phony delivery texts and too-good-to-be-true deals spike around Black Friday. The Massachusetts Office of Consumer Affairs and Business Regulation and the Federal Trade Commission recommend these steps:

- **Check the seller.** Search the store''s name with words like "scam" or "complaint" before buying from a site you don''t know, and type web addresses yourself instead of clicking ads.
- **Pay with a credit card.** Credit cards give you stronger rights to dispute a charge. Be wary of any seller that asks for payment by gift card, wire transfer or cryptocurrency.
- **Ignore surprise delivery texts.** Track packages through the retailer''s or carrier''s own website or app.
- **Watch for porch pirates.** If a package is stolen, contact the seller or carrier and file a report with your local police department.
- **Report fraud** at [ReportFraud.ftc.gov](https://reportfraud.ftc.gov).

## Smart shopping tips

- **Compare prices** across a few retailers before you buy. A "doorbuster" price is not always the lowest of the season.
- **Read the return policy** before you pay, and keep receipts. Holiday return windows and restocking fees vary by store.
- **Set a budget** and stick to it, especially with buy now, pay later plans.

## Frequently asked questions

### When is Black Friday 2026?

Black Friday is Friday, Nov. 27, 2026. Cyber Monday is Nov. 30.

### How much will Americans spend this holiday season?

The National Retail Federation forecasts November and December retail sales of $1.013 trillion, up 4.2% from 2025.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/2008-08-28_Black_Friday_shoppers_at_Wal-Mart.jpg/1280px-2008-08-28_Black_Friday_shoppers_at_Wal-Mart.jpg', 'Black Friday shoppers at a Walmart store in Durham, N.C., Nov. 28, 2008 (file). Photo: Ildar Sagdejev / Wikimedia Commons, CC BY-SA 4.0', 'licensed', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 8, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src1', 'bd-20261120-tg-black-friday', '2026 winter holiday forecast highlights', 'https://nrf.com/holiday', 'National Retail Federation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src2', 'bd-20261120-tg-black-friday', 'Consumers remain the bright spot heading into the holidays', 'https://nrf.com/blog/consumers-remain-the-bright-spot-heading-into-the-holidays', 'National Retail Federation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src3', 'bd-20261120-tg-black-friday', 'Affordability Shapes Winter Holiday Shopping: NRF Holiday Survey', 'https://www.retailtouchpoints.com/?p=621794', 'Retail TouchPoints', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src4', 'bd-20261120-tg-black-friday', 'NRF forecasts holiday sales growth will outpace last year, topping $1 trillion', 'https://shop-eat-surf-outdoor.com/news/nrf-forecasts-holiday-sales-growth-will-outpace-last-year-topping-1-trillion/623867/', 'Shop-Eat-Surf', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src5', 'bd-20261120-tg-black-friday', 'Record high 203 million people shopped Thanksgiving weekend, NRF says', 'https://m.washingtontimes.com/news/2025/dec/2/record-high-203-million-people-shopped-thanksgiving-weekend-says/', 'The Washington Times', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src6', 'bd-20261120-tg-black-friday', 'Outsmart scammers this holiday season', 'https://www.mass.gov/news/outsmart-scammers-this-holiday-season', 'Massachusetts Office of Consumer Affairs and Business Regulation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-black-friday-src7', 'bd-20261120-tg-black-friday', 'How to avoid an online shopping scam this holiday season', 'https://consumer.ftc.gov/consumer-alerts/2025/11/how-avoid-online-shopping-scam-holiday-season', 'Federal Trade Commission', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-black-friday-ev1', 'bd-20261120-tg-black-friday', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-column', 'thanksgiving-2026-gratitude-boston-neighbors-column', 'newsroom', 'opinion', 'columns', 'EDITORIAL_REVIEW', 0, 'This Thanksgiving, let gratitude go one step further', 'Saying thanks around the table is a good start. The best way to honor the holiday is to make sure our neighbors have a table, too.', 'Every November, Massachusetts tells the story of the first Thanksgiving as if it belonged to us. In a way, it does. A short drive down the coast in Plymouth, the holiday''s oldest American story is part of the landscape.

But Thanksgiving was never only about the meal. It is about noticing what we have and remembering who helped us get here.

For many of us, that list is long. It includes parents and grandparents who made sacrifices we only understood later. It includes teachers, nurses, bus drivers and grocery workers. It includes the neighbors who shoveled our walks and the strangers who held the door. For those of us who came to this country from somewhere else, it includes a nation that gave our families a chance.

This year, gratitude should come with a second step.

The Greater Boston Food Bank expects to distribute about 94 million meals in 2026, a record. That number is not an abstraction. It is the retiree stretching a fixed income, the family paying more for rent and heat, and the worker whose hours were cut. A Thanksgiving dinner for 10 costs about 6% more than last year, according to the American Farm Bureau Federation. For families already counting every dollar, that difference matters.

So here is my request for this Thanksgiving.

Before the turkey goes in the oven, give something. Send a donation to a local food pantry. Sign up for a volunteer shift in December, when the holiday rush is over and the shelves start to empty. Invite someone who would otherwise eat alone. Check on the elderly neighbor down the street.

None of this takes much. All of it matters.

We will spend Thursday giving thanks for the people around our own tables. Let''s also give thanks by making room for one more.

Happy Thanksgiving from all of us at Boston Daily.

*This article represents the opinion of Shaheen Arif, Editor of Boston Daily.*', 'Shaheen Arif | Editor, Boston Daily', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Boston_Common_November_2016_001.jpg/1280px-Boston_Common_November_2016_001.jpg', 'Boston Common in November (file). Photo: King of Hearts / Wikimedia Commons, CC BY-SA 4.0', 'licensed', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 7, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-column-src1', 'bd-20261120-tg-column', 'Column submitted by the author', NULL, 'Shaheen Arif, Editor, Boston Daily', 'editor', 'ORIGINAL', 1, 0, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-column-src2', 'bd-20261120-tg-column', 'The Greater Boston Food Bank responds to the rise in hunger with $6.3 million investment', 'https://www.gbfb.org/news/press-releases/6-3-million-grants/', 'The Greater Boston Food Bank', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-column-src3', 'bd-20261120-tg-column', 'Thanksgiving Dinner Cost Ticks Upward in 2026', 'https://www.fb.org/intel/markets/thanksgiving-dinner-cost-ticks-upward-in-2026', 'American Farm Bureau Federation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-column-ev1', 'bd-20261120-tg-column', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-hub', 'thanksgiving-2026-boston-guide', 'newsroom', 'feature', 'us', 'EDITORIAL_REVIEW', 0, 'Thanksgiving 2026 in Boston: Your complete holiday guide', 'Travel, what''s open, dinner costs, football, turkey trots, Black Friday and how to help, all in one place.', 'Thanksgiving is Thursday, Nov. 26. Here is everything Boston Daily is covering for the holiday week, from the roads and airports to the dinner table and the football schedule. We will add new stories as the week goes on.

## Key dates

| Date | What''s happening |
| --- | --- |
| Saturday, Nov. 21 | America''s Hometown Thanksgiving Parade in Plymouth, 10 a.m. |
| Tuesday, Nov. 24 | AAA''s holiday travel period begins |
| Wednesday, Nov. 25 | Busiest getaway day; first NFL Thanksgiving Eve game |
| Thursday, Nov. 26 | Thanksgiving Day; most Massachusetts stores closed |
| Friday, Nov. 27 | Black Friday |
| Sunday, Nov. 29 | Typically the busiest return travel day |
| Monday, Nov. 30 | Cyber Monday; AAA''s travel period ends |

## Getting there

- [Thanksgiving travel 2026: Record gas prices possible, and Logan''s busiest days](/story/thanksgiving-travel-2026-boston-logan-busiest-days-gas-prices)
- [What''s open and closed on Thanksgiving 2026 in Massachusetts](/story/whats-open-closed-thanksgiving-2026-massachusetts-blue-laws)

## At the table

- [Thanksgiving dinner costs $58.63 for 10 this year, the first increase since 2022](/story/thanksgiving-dinner-cost-2026-farm-bureau-survey-turkey-prices)

## Things to do

- [Thanksgiving 2026 in Greater Boston: Turkey trots, the Plymouth parade and more](/story/boston-thanksgiving-events-2026-turkey-trots-plymouth-parade)
- [NFL Thanksgiving 2026: All five games, kickoff times and how to watch](/story/nfl-thanksgiving-2026-schedule-times-how-to-watch)

## Shopping

- [Black Friday 2026: Holiday sales forecast to top $1 trillion, and how to avoid scams](/story/black-friday-2026-holiday-shopping-forecast-scams-tips)

## Giving back

- [How to help this Thanksgiving: Food banks and volunteering in Greater Boston](/story/how-to-help-thanksgiving-2026-greater-boston-food-banks-volunteer)

## Opinion

- [This Thanksgiving, let gratitude go one step further](/story/thanksgiving-2026-gratitude-boston-neighbors-column), by Shaheen Arif, Editor

Have a Thanksgiving story or tip for our newsroom? Email [editor@bostondaily.us](mailto:editor@bostondaily.us).', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/The_Mayflower_II_in_Plymouth_Harbor%2C_Plymouth_MA.jpg/1280px-The_Mayflower_II_in_Plymouth_Harbor%2C_Plymouth_MA.jpg', 'The Mayflower II in Plymouth Harbor (file). Photo: John Phelan / Wikimedia Commons, CC BY 3.0', 'licensed', NULL, NULL, 'newsroom', 'content/2026-11-20-thanksgiving.sql', 10, 1, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-hub-src1', 'bd-20261120-tg-hub', 'AAA: Thanksgiving travel forecast 2026 (via Lodging Magazine)', 'https://lodgingmagazine.com/?p=129588', 'Lodging Magazine', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-hub-src2', 'bd-20261120-tg-hub', 'America''s Hometown Thanksgiving Celebration announces plans for Thanksgiving Parade 2026', 'https://www.newsfilecorp.com/release/305137/Americas-Hometown-Thanksgiving-Celebration-Announces-Plans-for-Thanksgiving-Parade-2026', 'America''s Hometown Thanksgiving Celebration (via Newsfile)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-hub-ev1', 'bd-20261120-tg-hub', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261120-tg-picks', 'thanksgiving-black-friday-special-picks-2026', 'partner_commerce', 'blog_post', 'lifestyle', 'EDITORIAL_REVIEW', 0, 'Thanksgiving and Black Friday Special Picks: Hosting, travel and gift ideas', 'Shopping guides from across our network for setting the table, getting there and starting your holiday gift list.', 'Hosting this year, heading out of town or getting a head start on Black Friday? These shopping guides from the GetServices.ai network can help. Prices and offers change often, so check each retailer''s site for current deals and return policies.

## Set the table

- **[BedBathBuy](https://bedbathbuy.trade)**: Bedding and bath picks for guest rooms, plus soft towels and linens before the family arrives.
- **[Home Wellness Deals](https://homewellnessdeals.com)**: Home and kitchen deals for the busiest cooking week of the year.

## Dress for the holiday

- **[WomenStyle](https://womenstyle.win)**: Women''s fashion, beauty, hair, shoes and jewelry for holiday gatherings.
- **[Curated4Her](https://curated4her.com)**: Curated shopping for women, from cozy layers to gifts.
- **[Needed.men](https://needed.men)**: Menswear and essentials.
- **[Maison Aurelia](https://jewllery.store)**: Jewelry gift ideas to get ahead of December.

## Getting there

- **[FlyHorizons](https://flyhorizons.online)**: Travel ideas and deals for holiday trips.
- **[SkyToDoor](https://skytodoor.com)**: Flights, hotels and ground transport in one place.
- **[DriveZone Nexus](https://drivezone.nexus)**: Car tech for long holiday drives.

## Black Friday deals

- **[CouponDepots](https://coupondepots.info)**: Verified coupons and deals from popular retailers.
- **[Outdoor Sports Fun](https://outdoorsports.fun)**: Outdoor gear for the long weekend.
- **[Pets Cool Stuff](https://petscoolstuff.trade)**: Gear and treats for the pets at the party.

Looking for news about the holiday? See our [Thanksgiving 2026 guide](https://bostondaily.us/story/thanksgiving-2026-boston-guide).', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Liat_Portal_for_Foodie_Disorder_-_Thanksgiving_dinner_spread.jpg/1280px-Liat_Portal_for_Foodie_Disorder_-_Thanksgiving_dinner_spread.jpg', 'A Thanksgiving dinner spread (file). Photo: Liat Portal / Wikimedia Commons, CC BY-SA 4.0', 'licensed', 'Affiliate', 'This guide contains affiliate links. Boston Daily may earn a commission if you buy through them, at no extra cost to you. The sites listed are part of the GetServices.ai network, which also publishes Boston Daily.', 'manual', 'content/2026-11-20-thanksgiving.sql', 6, 0, 'newsroom-assistant', '2026-11-20T04:00:00.000Z', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261120-tg-picks-src1', 'bd-20261120-tg-picks', 'Recommended businesses: GetServices.ai network', 'https://bostondaily.us/businesses', 'Boston Daily', 'editor', 'ORIGINAL', 1, 1, '2026-11-20T04:00:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-19. Editor to confirm.', 'newsroom-assistant', '2026-11-20T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261120-tg-picks-ev1', 'bd-20261120-tg-picks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving 2026 package draft; awaiting editor approval', '2026-11-20T04:00:00.000Z');
