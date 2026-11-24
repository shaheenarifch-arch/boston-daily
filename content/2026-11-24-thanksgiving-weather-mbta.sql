-- Thanksgiving package follow-up (Nov. 24, 2026):
--  1) New draft: Thanksgiving coastal storm forecast for Boston (EDITORIAL_REVIEW; the editor approves it in the console).
--  2) "What's open and closed": the MBTA's confirmed Thanksgiving schedule and the $10 Commuter Rail holiday pass.
-- Story 2: if live, changed as a console-style Update (version + 1, public note, version snapshot, event);
-- if still a draft, the draft text is changed in place. Each statement is guarded so it runs at most once.

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261124-tg-weather', 'thanksgiving-2026-weather-boston-coastal-storm-rain-wind-forecast', 'newsroom', 'news_story', 'us', 'EDITORIAL_REVIEW', 0, 'Thanksgiving storm: Heavy rain, strong winds and coastal flooding expected in Boston', 'The National Weather Service says a coastal storm will hit Thanksgiving Day into Friday, with dry weather returning for the weekend trip home.', 'A strong coastal storm is expected to bring soaking rain, damaging wind gusts and coastal flooding to Boston and much of Southern New England from Thanksgiving Day into early Friday, the National Weather Service said Tuesday morning.

Forecasters at the weather service office in Norton said confidence remains high that the storm will hit Thanksgiving Day and Friday. The heaviest rain and strongest winds are most likely Thursday evening and overnight. Quieter, mainly dry weather is expected to return for the holiday weekend.

Forecasts can still change. Check the [National Weather Service Boston forecast](https://www.weather.gov/box/) before you travel.

## What is the Thanksgiving forecast for Boston?

- **Wednesday, Nov. 25:** Chilly, with highs in the 40s and mostly dry weather for the getaway.
- **Thanksgiving Day, Nov. 26:** Clouds increase and rain moves in during the afternoon and evening. The weather service gives Boston a chance of rain after 2 p.m., with a high near 46 and gusts as high as 38 mph.
- **Thursday night into Friday morning:** Heavy rain and strong winds. Rainfall totals of 1 to 2 inches are possible, and gusts of 50 to 60 mph are possible along the coast.
- **Friday, Nov. 27:** Rain ends during the day.
- **Saturday and Sunday:** Mainly dry, which helps the busy return trip.

## Will there be coastal flooding?

It is possible. The storm arrives with high astronomical tides, so the weather service warns of coastal flooding and beach erosion, along with dangerous marine conditions in Boston Harbor and Narragansett Bay. People who live along the shore should follow local emergency officials and secure outdoor items before Thursday.

## How will the storm affect Thanksgiving travel?

- **Driving:** Leave on Wednesday if you can. MassDOT expects the heaviest Wednesday traffic between 10 a.m. and 6 p.m. Driving home late Thursday night means heavy rain, strong wind and possible flooding on low roads.
- **Flying:** Strong winds and low clouds can delay flights at Logan Airport on Thursday night and Friday morning. Check your flight status in the airline''s app before you leave home. MassDOT says more than 1 million passengers are expected at Logan over the holiday period.
- **Power outages:** Gusts of 50 mph or more can bring down branches and power lines. Charge your phone and keep flashlights handy, especially if you are cooking for a crowd.
- **Interior New England:** Some higher elevations away from the coast could see snow or ice.

## Frequently asked questions

### Will it rain on Thanksgiving in Boston?

Yes, most likely in the afternoon and evening. The heaviest rain and strongest winds are expected Thursday night into Friday morning.

### When is the best time to drive for Thanksgiving in Massachusetts?

Wednesday is expected to be dry. Avoid driving late Thursday night, when heavy rain and strong winds are most likely.

### Will the weekend weather be better?

Yes. The weather service expects mainly dry weather for Saturday and Sunday, the busiest days for the trip home.

This story will be updated as the forecast changes.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Highway_Operations_Center%2C_New_Traffic_Cameras%2C_November_2012_%288221801770%29.jpg/1280px-Highway_Operations_Center%2C_New_Traffic_Cameras%2C_November_2012_%288221801770%29.jpg', 'MassDOT''s Highway Operations Center monitors traffic cameras across Massachusetts (file). Photo: MassDOT / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-11-24-thanksgiving-weather-mbta.sql', 9, 0, 'newsroom-assistant', '2026-11-24T15:00:00.000Z', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-tg-weather-src1', 'bd-20261124-tg-weather', 'Area Forecast Discussion, NWS Boston/Norton, Nov. 24, 2026', 'https://forecast.weather.gov/product.php?site=BOX&issuedby=BOX&product=AFD&format=CI&version=1&highlight=off&glossary=1', 'National Weather Service', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-tg-weather-src2', 'bd-20261124-tg-weather', 'Thanksgiving weather in Massachusetts could bring heavy rain', 'https://www.yahoo.com/news/weather-news/articles/thanksgiving-weather-massachusetts-could-bring-183603379.html', 'Yahoo News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-tg-weather-src3', 'bd-20261124-tg-weather', 'Thanksgiving forecast: Here''s what Boston meteorologists are saying about the potential for rain', 'https://www.boston.com/weather/local-news/2026/11/23/boston-ma-thanksgiving-weather-forecast-2026/', 'Boston.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-tg-weather-src4', 'bd-20261124-tg-weather', 'Thanksgiving travel forecast: Storms on both coasts could snarl busiest travel days', 'https://yahoo.com/news/weather-news/article/thanksgiving-travel-forecast-storms-on-both-coasts-could-snarl-the-busiest-travel-days-including-thanksgiving-day-162647805.html', 'Yahoo News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-tg-weather-src5', 'bd-20261124-tg-weather', 'MassDOT Releases 2026 Thanksgiving Holiday Travel Advisory', 'https://www.mass.gov/news/massdot-releases-2026-thanksgiving-holiday-travel-advisory', 'MassDOT', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261124-tg-weather-src6', 'bd-20261124-tg-weather', 'Avoid these times: When Thanksgiving traffic will be worst in Massachusetts', 'https://www.boston25news.com/news/local/avoid-these-times-when-thanksgiving-traffic-will-be-worst-massachusetts/UWEAFQL7LNCLZFW2QH4VYFBC2E/', 'Boston 25 News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261124-tg-weather-ev1', 'bd-20261124-tg-weather', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Thanksgiving package: weather story draft; awaiting editor approval', '2026-11-24T15:00:00.000Z');

-- bd-20261120-tg-open-closed: live → Update
UPDATE stories SET body = REPLACE(body, 'Yes, on a reduced schedule. The MBTA lists Thanksgiving Day, Thursday, Nov. 26, on its [holiday service page](https://www.mbta.com/holiday) and posts the final schedule there. In recent years, subway, bus and The RIDE service ran on a Sunday schedule on Thanksgiving, Commuter Rail ran a weekend schedule, and there was no ferry service. We will update this story when the MBTA confirms this year''s plan.', 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.'), version = version + 1, last_updated_at = '2026-11-24T15:00:00.000Z', status = CASE WHEN status = 'CORRECTED' THEN 'CORRECTED' ELSE 'UPDATED' END, updated_at = '2026-11-24T15:00:00.000Z' WHERE id = 'bd-20261120-tg-open-closed' AND instr(body, 'Yes, on a reduced schedule. The MBTA lists Thanksgiving Day, Thursday, Nov. 26, on its [holiday service page](https://www.mbta.com/holiday) and posts the final schedule there. In recent years, subway, bus and The RIDE service ran on a Sunday schedule on Thanksgiving, Commuter Rail ran a weekend schedule, and there was no ferry service. We will update this story when the MBTA confirms this year''s plan.') > 0 AND instr(body, 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.') = 0 AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_versions (id, story_id, version, change_type, headline, dek, body, note, editor, created_at) SELECT 'bd-20261120-tg-open-closed-v-20261124', id, version, 'update', headline, dek, body, 'Updated with the MBTA''s confirmed Thanksgiving Day schedule and its $10 Commuter Rail holiday pass.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z' FROM stories WHERE id = 'bd-20261120-tg-open-closed' AND last_updated_at = '2026-11-24T15:00:00.000Z' AND status IN ('UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_notices (id, story_id, kind, note, editor, created_at) SELECT 'bd-20261120-tg-open-closed-n-20261124', id, 'update', 'Updated with the MBTA''s confirmed Thanksgiving Day schedule and its $10 Commuter Rail holiday pass.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z' FROM stories WHERE id = 'bd-20261120-tg-open-closed' AND last_updated_at = '2026-11-24T15:00:00.000Z' AND status IN ('UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) SELECT 'bd-20261120-tg-open-closed-ev-20261124', id, 'PUBLISHED', status, 'newsroom-assistant', 'Update: Updated with the MBTA''s confirmed Thanksgiving Day schedule and its $10 Commuter Rail holiday pass.', '2026-11-24T15:00:00.000Z' FROM stories WHERE id = 'bd-20261120-tg-open-closed' AND last_updated_at = '2026-11-24T15:00:00.000Z' AND status IN ('UPDATED','CORRECTED');
-- bd-20261120-tg-open-closed: still a draft → change the draft text
UPDATE stories SET body = REPLACE(body, 'Yes, on a reduced schedule. The MBTA lists Thanksgiving Day, Thursday, Nov. 26, on its [holiday service page](https://www.mbta.com/holiday) and posts the final schedule there. In recent years, subway, bus and The RIDE service ran on a Sunday schedule on Thanksgiving, Commuter Rail ran a weekend schedule, and there was no ferry service. We will update this story when the MBTA confirms this year''s plan.', 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.'), updated_at = '2026-11-24T15:00:00.000Z' WHERE id = 'bd-20261120-tg-open-closed' AND instr(body, 'Yes, on a reduced schedule. The MBTA lists Thanksgiving Day, Thursday, Nov. 26, on its [holiday service page](https://www.mbta.com/holiday) and posts the final schedule there. In recent years, subway, bus and The RIDE service ran on a Sunday schedule on Thanksgiving, Commuter Rail ran a weekend schedule, and there was no ferry service. We will update this story when the MBTA confirms this year''s plan.') > 0 AND instr(body, 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.') = 0 AND status NOT IN ('PUBLISHED','UPDATED','CORRECTED','UNPUBLISHED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) SELECT 'bd-20261120-tg-open-closed-src-20261124-1', 'bd-20261120-tg-open-closed', 'Holiday Service Schedules', 'https://www.mbta.com/holidays', 'MBTA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z' WHERE EXISTS (SELECT 1 FROM stories WHERE id = 'bd-20261120-tg-open-closed' AND instr(body, 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.') > 0);
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) SELECT 'bd-20261120-tg-open-closed-src-20261124-2', 'bd-20261120-tg-open-closed', 'MassDOT Releases 2026 Thanksgiving Holiday Travel Advisory', 'https://www.mass.gov/news/massdot-releases-2026-thanksgiving-holiday-travel-advisory', 'MassDOT', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z' WHERE EXISTS (SELECT 1 FROM stories WHERE id = 'bd-20261120-tg-open-closed' AND instr(body, 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.') > 0);
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) SELECT 'bd-20261120-tg-open-closed-src-20261124-3', 'bd-20261120-tg-open-closed', 'New England may see the first dip in Thanksgiving travel this year since COVID', 'https://www.wgbh.org/news/local/2026-11-23/new-england-may-see-the-first-dip-in-thanksgiving-travel-this-year-since-covid', 'GBH News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-24T15:00:00.000Z', 'Checked by the newsroom assistant on 2026-11-24. Editor to confirm.', 'newsroom-assistant', '2026-11-24T15:00:00.000Z' WHERE EXISTS (SELECT 1 FROM stories WHERE id = 'bd-20261120-tg-open-closed' AND instr(body, 'Yes, on a reduced schedule. On Thanksgiving Day, Thursday, Nov. 26, the MBTA says:

- **Subway, bus and The RIDE** run on a Sunday schedule.
- **Commuter Rail** runs on a weekend schedule on every line.
- **Ferries** do not run.

The MBTA is also selling a **$10 Commuter Rail holiday pass**, good for unlimited Commuter Rail travel from Thanksgiving through Sunday, Nov. 29. Check the [MBTA holiday service page](https://www.mbta.com/holidays) for details and any changes.') > 0);

