-- Guides for 2026-10-17: service features for the guide sections, no affiliate links. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain or Creative Commons with credit; editor to confirm each image renders and its license.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-winter-dry-skin', 'winter-dry-skin-dermatologist-tips-new-england', 'newsroom', 'feature', 'beauty-hair', 'EDITORIAL_REVIEW', 0, 'Radiator season is coming. What dermatologists say to do about dry winter skin', 'The American Academy of Dermatology''s cold-weather advice comes down to warm water, thicker creams and fewer harsh products.', 'Once the heat comes on in Boston apartments and the wind picks up off the harbor, a lot of people start noticing tight, flaky skin. The American Academy of Dermatology (AAD) has published plain guidance for the months ahead.

## In the shower

The AAD advises bathing in warm water rather than hot, and skipping harsh antibacterial, deodorant or scented soaps. For the body, it points to creamy, gel or mousse cleansers, preferably without fragrance. For the face, it suggests gentle formulas and steering clear of alcohol-based products.

The academy''s main timing tip: put moisturizer on right after washing, while skin is still damp, so it helps hold water in.

## Switch to heavier moisturizers

According to the AAD:

- Ointments and creams tend to work better, and irritate less, than lotions.
- Products packed in tubes or tubs are usually thicker than those in pump bottles.
- Ingredients it lists for the body include glycerin, lanolin, mineral oil, petrolatum, shea butter and hyaluronic acid.
- A higher price does not necessarily mean a product works better.

## Other habits the academy suggests

- Cut back on glycolic, salicylic and other hydroxy-acid products, and on retinol, during winter, or use lower strengths.
- Wear lip balm and cover exposed skin outdoors.
- Consider a filtered, cool-mist humidifier in the bedroom.
- Bundle up in warmer clothes and blankets instead of cranking the thermostat.
- If skin is very dry, choose soft fabrics such as cotton or silk and fragrance-free detergent.
- Keep wearing broad-spectrum sunscreen, SPF 30 or higher, on the face, neck, ears and hands.

If home care does not help, the AAD recommends seeing a board-certified dermatologist.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/24/Grand_Teton_in_Winter-NPS.jpg', 'Photo: National Park Service / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-dry-skin-src1', 'bd-20261017-winter-dry-skin', 'Winter skin survival kit', 'https://www.aad.org/public/everyday-care/skin-care-basics/care/winter-skin-survival-kit', 'American Academy of Dermatology', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-dry-skin-src2', 'bd-20261017-winter-dry-skin', 'Cold weather and your skin', 'https://www.aad.org/news/cold-weather-and-your-skin', 'American Academy of Dermatology', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-winter-dry-skin-ev1', 'bd-20261017-winter-dry-skin', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-cosmetic-labels', 'how-to-read-cosmetic-labels-fda-guidance', 'newsroom', 'feature', 'beauty-hair', 'EDITORIAL_REVIEW', 0, 'How to read a cosmetic label: what FDA rules require, and what they don''t', 'Federal rules dictate where ingredients go and in what order, but words like ''hypoallergenic'' carry no legal definition.', 'Holiday gift sets and new winter moisturizers will soon fill store shelves. Before you buy, it helps to know what the U.S. Food and Drug Administration actually requires on a cosmetic label, and what is just marketing.

## What must be on the package

According to the FDA:

- The front panel must say what the product is and give an accurate net quantity.
- Ingredients must be listed on an information panel, in descending order of predominance, meaning the largest amounts come first.
- The label must name the company responsible and its place of business; if that company did not make the product, it should say "Manufactured for" or "Distributed by."
- Required warnings, such as for flammable products, and directions for safe use belong on the label.
- Products sold at retail must list ingredients even if marked for professional use only.

The FDA does not pre-approve cosmetic labels, and a label may not suggest FDA approval.

## Drug or cosmetic?

A product that claims to treat or prevent disease may be regulated as a drug. Items that are both, such as a moisturizer with sunscreen, must follow both sets of rules, with drug ingredients labeled separately.

## Claims to read skeptically

- **"Hypoallergenic":** The FDA says no federal standard defines the term, and companies need not prove the claim to the agency.
- **"Fragrance":** Scent ingredients can appear as a single word, since formulas may be trade secrets.
- **"Unscented":** The FDA warns these products may still contain fragrance ingredients added to mask other odors.

The agency says people sensitive to fragrance should check ingredient lists and choose fragrance-free products. Problems can be reported to the FDA at 1-888-INFO-FDA.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cosmetic-labels-src1', 'bd-20261017-cosmetic-labels', 'Cosmetics Labeling Regulations', 'https://www.fda.gov/labeling-regulations', 'U.S. Food and Drug Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cosmetic-labels-src2', 'bd-20261017-cosmetic-labels', '"Hypoallergenic" Cosmetics', 'https://www.fda.gov/cosmetics/cosmetics-labeling-claims/hypoallergenic-cosmetics', 'U.S. Food and Drug Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cosmetic-labels-src3', 'bd-20261017-cosmetic-labels', 'Fragrances in Cosmetics', 'https://fda.gov/cosmetics/cosmetic-ingredients/fragrances-cosmetics', 'U.S. Food and Drug Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-cosmetic-labels-ev1', 'bd-20261017-cosmetic-labels', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-dress-layers', 'how-to-dress-in-layers-new-england-cold-weather-service', 'newsroom', 'feature', 'fashion-style', 'EDITORIAL_REVIEW', 0, 'Dressing for a New England winter: the National Weather Service''s layering rules', 'Federal forecasters say several light layers, a windproof shell and covered extremities beat one heavy coat.', 'The first hard frosts are arriving across Massachusetts, and with them the annual question of how to dress for a commute that can swing from raw drizzle to biting wind. The National Weather Service (NWS) keeps its advice simple.

## Build in layers

The NWS recommends several layers of lightweight, loose-fitting, warm clothing rather than a single bulky garment. Layers trap warm air between them, and you can peel one off on a crowded T car or add one at a windy bus stop.

A winter statement from the agency''s New York office adds that the outermost layer should be wind- and waterproof.

## Cover the edges

According to the NWS:

- Wear a warm hat.
- Cover ears, nose, fingers and toes, which are most exposed.
- Choose mittens over gloves; the agency says they are warmer.
- If you get wet, change into dry clothes as soon as you are inside.

## Know the warning signs

| Condition | Signs the NWS lists |
|---|---|
| Frostbite | Redness or pain; white or grayish-yellow skin; firm or waxy feel; numbness |
| Hypothermia | Body temperature of 95°F or below; feeling cold and sluggish; trouble thinking clearly |

The agency notes hypothermia can happen at temperatures as high as 60°F when someone is wet or underdressed for a long time, a real concern on damp November days here.

For frostbite, the NWS says to get indoors, avoid rubbing the area and warm it gently, not with hot water or heating pads. It advises immediate medical help for suspected hypothermia.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Blizzard1_-_NOAA.jpg', 'Photo: NOAA / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-dress-layers-src1', 'bd-20261017-dress-layers', 'Winter Safety: During extreme cold', 'https://www.weather.gov/safety/cold-during', 'National Weather Service', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-dress-layers-src2', 'bd-20261017-dress-layers', 'Winter weather safety public information statement', 'https://www.weather.gov/okx/winterpns7', 'National Weather Service, New York, NY office', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-dress-layers-ev1', 'bd-20261017-dress-layers', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-textile-ban', 'massachusetts-textile-disposal-ban-donate-recycle-clothes', 'newsroom', 'feature', 'fashion-style', 'EDITORIAL_REVIEW', 0, 'Clearing out your closet? In Massachusetts, old clothes can''t go in the trash', 'A state ban on throwing away textiles applies even to torn and stained items, which can still be recycled if clean and dry.', 'Swapping summer clothes for winter gear often turns up a pile of things nobody will wear again. In Massachusetts, that pile does not belong in the trash.

Since Nov. 1, 2022, state rules enforced by the Massachusetts Department of Environmental Protection (MassDEP) have banned textiles from disposal, or from being hauled away for disposal.

## What the ban covers

According to MassDEP, the rule applies to:

- Clothing and footwear
- Bedding, towels and curtains
- Fabric and similar items, including scraps

The key condition: items must be clean and dry to be accepted for reuse or recycling. Certain contaminated textiles are exempt under state regulations.

## Worn out still counts

You do not need a garment in good shape to keep it out of a landfill. MassDEP says nearly any clean, dry textile can be reused, repurposed or recycled, including ripped, stained or single items like a lone sock.

The agency cites an industry estimate that donated textiles break down roughly like this:

| Outcome | Share |
|---|---|
| Reused as clothing | About 45% |
| Wiping cloths | About 30% |
| Converted to fiber | About 20% |

## How to find a drop-off

MassDEP points residents to its Beyond the Bin Recycling Directory on the RecycleSmartMA website, which can be searched by material and location for donation, reuse and recycling sites.

The stakes are not small. The state estimates residents and businesses throw out about 230,000 tons of textiles a year, and says about 95% of it could have been donated, reused or recycled.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Trinity_Church,_Boston,_Massachusetts_LCCN2011630431.jpg/1280px-Trinity_Church,_Boston,_Massachusetts_LCCN2011630431.jpg', 'Photo: Carol M. Highsmith / Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-textile-ban-src1', 'bd-20261017-textile-ban', 'Clothing and Textile Recovery', 'https://www.mass.gov/guides/textile-recovery', 'Massachusetts Department of Environmental Protection', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-textile-ban-ev1', 'bd-20261017-textile-ban', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-white-mountains-hiking', 'late-season-white-mountains-hiking-safety-hikesafe', 'newsroom', 'feature', 'outdoor', 'EDITORIAL_REVIEW', 0, 'Heading to the White Mountains this fall? Pack for winter, officials say', 'New Hampshire''s hikeSafe code and Ten Essentials list are the baseline as days shorten and summits turn icy.', 'Late foliage and quiet trails draw plenty of Massachusetts hikers north in October and November. New Hampshire Fish and Game warns the mountains can feel like winter long before the calendar does.

In a fall safety item reported by The Conway Daily Sun, Fish and Game Lt. Todd Bogardus cautioned that colder temperatures, shorter days and early snow make the season riskier than summer.

## The hikeSafe code

The hiker responsibility code, promoted by Fish and Game and the White Mountain National Forest, asks hikers to:

- Learn the terrain, weather and conditions, and bring the right gear.
- Tell someone your route, return time and backup plan.
- Start and finish as a group, moving at the slowest member''s pace.
- Turn back when weather, fatigue or conditions call for it.
- Be ready to handle an injury or getting lost on your own.

## The Ten Essentials

Fish and Game lists: map, compass, warm clothing (including a wool hat), extra food and water, a flashlight or headlamp, matches or firestarters, a first aid and repair kit, a whistle, rain and wind gear, and a pocket knife.

For colder outings, it adds items such as an insulated parka, extra mittens, a balaclava and insulated boots. Above treeline, its list includes crampons, an ice axe, goggles and a face mask.

## The Hike Safe card

New Hampshire sells a voluntary Hike Safe card, $25 per person or $35 per family, valid through Dec. 31 of the year purchased. The state says holders are generally not liable for rescue costs, though people can still be billed if their actions meet criteria in state law. The card is not accepted outside New Hampshire.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/0/00/White_Mountain_NF_USFS_map.jpg', 'Photo: USDA Forest Service / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-white-mountains-hiking-src1', 'bd-20261017-white-mountains-hiking', 'Hiking Safety', 'https://www.wildlife.nh.gov/get-outside/hiking-safety', 'New Hampshire Fish and Game Department', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-white-mountains-hiking-src2', 'bd-20261017-white-mountains-hiking', 'Hike Safe this autumn: Be ready for winter-like conditions in the mountains', 'https://www.conwaydailysun.com/news/hike-safe-this-autumn-be-ready-for-winter-like-conditions-in-the-mountains/article_c7fffb1f-86da-598f-9468-ee6b50c5e3e8.html', 'The Conway Daily Sun', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-white-mountains-hiking-ev1', 'bd-20261017-white-mountains-hiking', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-blaze-orange', 'massachusetts-hunting-season-blaze-orange-hikers-2026', 'newsroom', 'feature', 'outdoor', 'EDITORIAL_REVIEW', 0, 'Hunting season is underway. Massachusetts urges hikers to wear blaze orange', 'Deer and pheasant seasons run into December; state wildlife officials say everyone in the woods should be easy to see.', 'Fall walks in Massachusetts woods now overlap with several hunting seasons, and MassWildlife is asking everyone outdoors, not only hunters, to wear blaze orange.

## Key 2026 dates

| Season (Zones 1-14 unless noted) | Dates |
|---|---|
| Deer, archery | Oct. 5 – Nov. 28 |
| Wild turkey, fall (Zones 1-13) | Oct. 5 – Nov. 28 |
| Pheasant | Oct. 17 – Dec. 31 |
| Deer, shotgun | Nov. 30 – Dec. 12 |
| Deer, primitive firearms | Dec. 14 – 31 |

Hunting is not allowed on Sundays in Massachusetts, which makes Sunday a good day for a walk if you''d rather avoid it.

## What hunters must wear

During shotgun deer season, and for deer hunters during primitive firearms season, state rules require at least 500 square inches of blaze orange on the chest, back and head, with an exemption for coastal waterfowl hunters in a blind or boat. Pheasant and quail hunters on certain stocked Wildlife Management Areas must wear an orange cap or hat.

## Tips for everyone else

According to MassWildlife:

- Wear a bright orange vest or hat, and skip earth tones and animal-colored clothing.
- Be most visible early in the morning and late in the afternoon, when hunters are most active.
- Keep dogs leashed and put an orange vest or bandana on them.
- Talk or whistle so hunters know you are there; if you hear shots, call out.
- Remember that MassWildlife lands, most state parks and forests and many town lands allow hunting.

Suspected wildlife violations can be reported to the Massachusetts Environmental Police at 1-800-632-8075.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-blaze-orange-src1', 'bd-20261017-blaze-orange', 'Wear blaze orange during hunting season', 'https://www.mass.gov/info-details/wear-blaze-orange-during-hunting-season', 'MassWildlife (Mass.gov)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-blaze-orange-src2', 'bd-20261017-blaze-orange', 'All outdoor users: Wear blaze orange during hunting seasons', 'https://www.mass.gov/news/all-outdoor-users-wear-blaze-orange-during-hunting-seasons', 'MassWildlife (Mass.gov)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-blaze-orange-src3', 'bd-20261017-blaze-orange', 'Safety tips for non-hunters', 'https://www.mass.gov/service-details/safety-tips-for-non-hunters', 'MassWildlife (Mass.gov)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-blaze-orange-src4', 'bd-20261017-blaze-orange', '2026 Hunting and Freshwater Fishing Season Summary', 'https://www.mass.gov/info-details/2026-hunting-and-freshwater-fishing-season-summary', 'MassWildlife (Mass.gov)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-blaze-orange-ev1', 'bd-20261017-blaze-orange', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-winter-car-prep', 'winter-car-prep-checklist-nhtsa-new-england', 'newsroom', 'feature', 'auto', 'EDITORIAL_REVIEW', 0, 'Get your car ready for a New England winter: a federal safety checklist', 'Tires, battery, wipers and an emergency kit top the list from federal road-safety regulators before the first snow arrives.', 'Snow season is coming to Greater Boston, and the National Highway Traffic Safety Administration says the time to prepare a vehicle is before the roads turn slick.

## Under the hood and on the wheels

Cold air drops tire pressure, so NHTSA advises inflating to the automaker''s figure on the driver''s door-frame label or in the owner''s manual, not the maximum printed on the tire. Check pressure monthly with cold tires. Tread should measure at least 2/32 of an inch, and some manufacturers suggest replacing tires after six years regardless of wear.

- Have a mechanic test the battery, charging system and belts; cold saps starting power.
- Confirm coolant levels and look for leaks or worn hoses.
- Fill the washer reservoir with winter fluid that contains de-icer, and replace worn wiper blades.
- Check every exterior light, including flashers.
- Secure floor mats with their clips so they cannot jam the pedals.

Electric and hybrid drivers should expect reduced range in the cold. NHTSA suggests plugging in overnight to keep the battery in its best temperature range.

## Pack an emergency kit

- Shovel, snow brush and ice scraper
- Sand or cat litter for traction
- Jumper cables, flashlight, flares or warning markers
- First-aid kit, blankets, phone charger, water, food and needed medicine

## If you get stuck

Stay with the vehicle and avoid overexertion. Make sure the tailpipe is clear of snow, and run the engine only long enough to stay warm, because exhaust can build up carbon monoxide inside. Keep the dome light on so rescuers can spot you.

Parents should skip bulky coats under car-seat harnesses; buckle children in thin layers and put a blanket on top.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Blizzard2_-_NOAA.jpg', 'Photo: National Oceanic and Atmospheric Administration (NOAA) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-car-prep-src1', 'bd-20261017-winter-car-prep', 'Winter Driving Tips', 'https://nhtsa.gov/node/100081', 'National Highway Traffic Safety Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-winter-car-prep-ev1', 'bd-20261017-winter-car-prep', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-recall-vin-check', 'check-car-open-recalls-nhtsa-vin-lookup', 'newsroom', 'feature', 'auto', 'EDITORIAL_REVIEW', 0, 'Before winter driving, check your car for unrepaired safety recalls', 'A free federal lookup tells you in seconds whether your vehicle has an open recall, and the fix costs nothing at the dealer.', 'Before the winter driving season, the National Highway Traffic Safety Administration recommends a quick check, and it suggests repeating it twice a year.

## How the lookup works

NHTSA''s recall page accepts either a 17-character vehicle identification number or a license plate. If nothing is outstanding, the result reads zero unrepaired recalls for that VIN.

To find your VIN, look through the windshield at the lower driver''s side corner, or check your registration card. It may also be printed on your insurance card.

## What the search does not show

The tool has limits worth knowing:

- It covers safety recalls up to 15 years old, unless a manufacturer offers longer coverage.
- Recalls that were just announced may not list VINs yet.
- Some small, specialty and ultra-luxury makers are not included.
- Non-safety service campaigns and international-market vehicles are excluded.
- Repairs already completed do not appear.

Because VINs are added continuously, a clean result today does not rule out a recall next month. NHTSA offers a free SaferCar app and email alerts that flag new recalls for vehicles or equipment you register.

## Getting it fixed

Under federal rules, manufacturers must remedy a recalled defect by repairing or replacing the part or offering a refund, and in rare cases buying the vehicle back. Owners get a notice by mail and can contact a local dealer to schedule the repair at no charge.

The same NHTSA page also lets you search by brand for recalls on tires and child car seats, two items worth checking before holiday road trips.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Tire_components_--_NHTSA_The_Pneumatic_Tire.png', 'Photo: National Highway Traffic Safety Administration (NHTSA) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-recall-vin-check-src1', 'bd-20261017-recall-vin-check', 'Check for Recalls: Vehicle, Car Seat, Tire, Equipment', 'https://www.nhtsa.gov/recalls', 'National Highway Traffic Safety Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-recall-vin-check-src2', 'bd-20261017-recall-vin-check', 'Winter Driving Tips', 'https://nhtsa.gov/node/100081', 'National Highway Traffic Safety Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-recall-vin-check-ev1', 'bd-20261017-recall-vin-check', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-real-id-holidays', 'real-id-tsa-confirmid-fee-holiday-flights-massachusetts', 'newsroom', 'feature', 'travel', 'EDITORIAL_REVIEW', 0, 'Flying home for the holidays? Without a REAL ID, expect a $45 fee', 'Since February, travelers lacking a REAL ID or passport must pay for TSA identity verification, and Massachusetts licenses take weeks to arrive.', 'Travelers flying out of Logan for Thanksgiving or December holidays with an older Massachusetts license face an extra step at security this year.

## What changed

As of Feb. 1, 2026, passengers who arrive at a checkpoint without a federally accepted ID must enroll in TSA ConfirmID, according to the Massachusetts Registry of Motor Vehicles. The program costs $45, covers 10 days of travel and requires an identity check that takes roughly 10 to 30 minutes.

IDs that avoid the fee for domestic flights include:

- A REAL ID driver''s license or ID card
- A valid U.S. passport
- Other documents on TSA''s acceptable-ID list

## Getting a REAL ID in time

The RMV requires an in-person appointment, which can be booked through the myRMV online service center; AAA members can also book through AAA Northeast. Bring originals or certified copies of:

- Proof of lawful presence
- Two proofs of Massachusetts residency
- Proof of your full Social Security number
- Legal proof of any name change

The RMV says the card arrives by mail, typically within 10 to 14 business days, and advises allowing about three weeks. For a trip at Christmas, that means booking soon.

| Transaction | RMV fee |
|---|---|
| License renewal (standard or REAL ID) | $50 |
| Mass ID renewal | $25 |
| REAL ID upgrade before expiration | $25 |

You may renew up to a year before your card''s printed expiration date. Holders of a REAL ID-compliant credential can usually renew online, unless they changed their name or hold a limited-term card.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-real-id-holidays-src1', 'bd-20261017-real-id-holidays', 'MA RMV Reminds Residents that TSA Fees for Passengers without a REAL ID or Passport begin February 1', 'https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0', 'Massachusetts Registry of Motor Vehicles', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-real-id-holidays-ev1', 'bd-20261017-real-id-holidays', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-passport-wait-times', 'passport-processing-times-winter-travel-2026', 'newsroom', 'feature', 'travel', 'EDITORIAL_REVIEW', 0, 'Planning a winter trip abroad? Passport processing now takes 4 to 6 weeks', 'Routine applications take about a month or more, plus mailing time, so travelers eyeing February vacation should apply now.', 'New Englanders thinking about a warm-weather escape during school vacation week should check their passports today. The State Department''s latest figures, updated Oct. 5, 2026, show routine service is not instant.

## Current timelines

| Service | Processing time | Added cost |
|---|---|---|
| Routine | 4 to 6 weeks | None |
| Expedited | 2 to 3 weeks | $60 |
| Urgent (agency appointment) | Travel within 14 days | Appointment required |

Processing time does not include mail. The department warns it can take up to two weeks for an application to reach it and up to two more for the finished passport to arrive. Paying extra for one-to-three-day return delivery trims the back end.

In practice, a routine application mailed today could take roughly 10 weeks door to door in a worst case.

## If you are short on time

Travelers with an international trip within 14 calendar days can seek an in-person appointment at a passport agency, but they must show proof of that travel. The department notes processing times can lengthen during busy periods, so it is worth checking its page again before you file.

## A quick checklist

- Look at your passport''s expiration date now, and check entry rules for your destination.
- Decide whether routine service fits your travel date once mailing time is added.
- Budget the $60 expedite fee if your departure is within about two months.
- Keep proof of booked travel handy in case you need an urgent appointment.

A valid passport also works as identification for domestic flights.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-passport-wait-times-src1', 'bd-20261017-passport-wait-times', 'Processing Times for U.S. Passports', 'https://travel.state.gov/en/passports/apply/help/processing-time.html', 'U.S. Department of State', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-passport-wait-times-src2', 'bd-20261017-passport-wait-times', 'MA RMV Reminds Residents that TSA Fees for Passengers without a REAL ID or Passport begin February 1', 'https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0', 'Massachusetts Registry of Motor Vehicles', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-passport-wait-times-ev1', 'bd-20261017-passport-wait-times', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-heating-co-safety', 'home-heating-safety-carbon-monoxide-alarms-massachusetts', 'newsroom', 'feature', 'home-living', 'EDITORIAL_REVIEW', 0, 'Turning on the heat? Test CO alarms and clear vents, state fire officials say', 'Massachusetts fire officials list the steps that prevent heating fires and carbon monoxide poisoning as furnaces and stoves fire up.', 'As furnaces, boilers and wood stoves come back on, the Massachusetts Department of Fire Services offers a short list of habits that reduce both risks.

## Carbon monoxide: the invisible hazard

CO has no color or smell, so an alarm is the only reliable warning. State law, known as Nicole''s Law, requires CO alarms on every habitable level of a Massachusetts home.

- Test alarms monthly.
- Replace them every five to seven years, depending on the model; the manufacture date is on the back.
- After each storm, clear snow from dryer, furnace, boiler and fireplace vents, and never aim a snowblower at them.
- Never heat your home with a gas oven or stove.

Early symptoms include headache, fatigue, dizziness and nausea, and exposure during sleep is especially dangerous. If the alarm sounds, get outside and call 911.

## Fire prevention around heat sources

- Have the furnace and water heater checked by a professional every year.
- Have chimneys and flues inspected and cleaned annually, and use a fireplace screen.
- Keep anything that can burn at least 3 feet from space heaters, wood stoves and fireplaces.
- Store ashes in a lidded metal container placed well away from the house, garage and porch.
- Keep gasoline and paint supplies away from pilot lights.

## Space heater rules

Use a space heater only as a supplement, plug it directly into a wall outlet rather than an extension cord or power strip, and turn it off when you leave the room or go to bed. Portable kerosene and propane heaters are illegal for home use in Massachusetts, and new wood stoves require a building permit.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/6/61/Blizzard3_-_NOAA.jpg', 'Photo: National Oceanic and Atmospheric Administration (NOAA) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-heating-co-safety-src1', 'bd-20261017-heating-co-safety', 'Keep Warm, Keep Safe: Winter Home Heating Safety', 'https://www.mass.gov/doc/keep-warm-keep-safe-winter-home-heating-safety-english/download', 'Massachusetts Department of Fire Services', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-heating-co-safety-src2', 'bd-20261017-heating-co-safety', 'Winter Weather Advisory: Check CO Alarms and Keep Vents Clear of Snow', 'https://www.mass.gov/news/winter-weather-advisory-check-co-alarms-and-keep-vents-clear-of-snow', 'Massachusetts Department of Fire Services', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-heating-co-safety-ev1', 'bd-20261017-heating-co-safety', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-heating-assistance', 'massachusetts-heap-home-heating-assistance-2026-2027', 'newsroom', 'feature', 'home-living', 'EDITORIAL_REVIEW', 0, 'Massachusetts heating aid is open for winter: who qualifies and how to apply', 'The state''s Home Energy Assistance Program helps homeowners and renters pay for heat from November through April, with higher income limits than many expect.', 'Applications are open for the Massachusetts Home Energy Assistance Program, known as HEAP, which helps households pay part of their heating bills. The online application opened Oct. 1, and benefits apply to heating costs from Nov. 1 through April 30.

## Who qualifies

Household income must fall at or below 60% of the state''s estimated median income. Both homeowners and renters can apply, including tenants whose heat is included in the rent. Income is not the only factor, and local agencies make the final eligibility call.

| Household size | Maximum annual income (FY2027) |
|---|---|
| 1 | $53,585 |
| 2 | $70,073 |
| 3 | $86,561 |
| 4 | $103,049 |
| 5 | $119,536 |
| 6 | $136,024 |

## What it pays for

HEAP covers a portion of the cost of a home''s main heating source, whether oil, natural gas, electricity, propane, kerosene, wood or coal. Payments go straight to the heating vendor. Eligible households may also receive automatic discounts on gas and electric bills from investor-owned utilities.

## How to apply

Apply online through the state''s HEAP portal, in person at a local agency or by mail. First-time applicants must complete an intake appointment; returning households receive renewal forms and must reapply every year. Have these ready:

- Photo ID and a list of everyone in the household
- Heating bill information
- A lease, mortgage statement or other housing record
- Proof of income for the 30 days before you apply

The program is free. The state warns residents not to pay anyone who asks for an application fee. For help, call the Cold Relief Heatline at 800-632-8175 or dial 211.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Canterbury-west-Winter-Highsmith.jpeg/1280px-Canterbury-west-Winter-Highsmith.jpeg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-heating-assistance-src1', 'bd-20261017-heating-assistance', 'Learn about Home Energy Assistance (HEAP)', 'https://www.mass.gov/info-details/learn-about-home-energy-assistance-heap', 'Commonwealth of Massachusetts, Executive Office of Housing and Livable Communities', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-heating-assistance-ev1', 'bd-20261017-heating-assistance', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-garlic-bulbs-now', 'plant-garlic-spring-bulbs-october-massachusetts', 'newsroom', 'feature', 'garden', 'EDITORIAL_REVIEW', 0, 'October is garlic month: Plant cloves and spring bulbs before the ground freezes', 'Extension experts say a few hours of work this fall can pay off in a June garlic harvest and an April flower show.', 'If you want home-grown garlic next summer, the window is open now. UMass Extension''s home garden guidance names October as the month to put cloves in the ground in Massachusetts, ideally after a hard frost, so the plants can root before winter.

## Garlic basics from UMass Extension

Pick a bed that gets six to eight hours of direct sun, with deep, loose soil that drains well. The fact sheet suggests a soil pH around 6.5 to 7 and recommends testing the soil and working in well-aged compost before planting.

- Keep bulbs whole until planting day; splitting them early can cut yields.
- Choose the biggest, healthiest bulbs and plant each clove pointed end up, about 1 inch deep.
- Space cloves 3 to 5 inches apart, in double rows 6 to 8 inches apart.
- Once the ground freezes, spread 3 to 4 inches of straw over the bed to keep frost from heaving cloves out.

Hardneck types tend to have larger cloves that peel easily, while softneck garlic keeps longer in storage, the guide notes. Local nurseries, farm supply stores and regional garlic festivals are common places to find seed garlic.

## Spring bulbs follow a simple rule

For tulips, daffodils and other spring bloomers, a September 2026 column from University of Vermont Extension master gardener Deborah J. Benoit offers an easy depth guide: dig about three times as deep as the bulb is tall. A 2-inch bulb goes in a 6-inch hole, pointed side up.

Backfill, tamp lightly and water. A layer of mulch helps hold moisture and limits winter heaving, the column says.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-garlic-bulbs-now-src1', 'bd-20261017-garlic-bulbs-now', 'Growing Garlic: Getting Started', 'https://www.umass.edu/agriculture-food-environment/home-lawn-garden/fact-sheets/growing-garlic-getting-started', 'UMass Extension', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-garlic-bulbs-now-src2', 'bd-20261017-garlic-bulbs-now', 'Selecting and planting bulbs this fall', 'https://www.uvm.edu/extension/news/selecting-and-planting-bulbs-fall', 'University of Vermont Extension', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-garlic-bulbs-now-ev1', 'bd-20261017-garlic-bulbs-now', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-lanternfly-egg-hunt', 'spotted-lanternfly-egg-masses-massachusetts-fall-winter', 'newsroom', 'feature', 'garden', 'EDITORIAL_REVIEW', 0, 'Spotted lanternfly egg season is here. What Massachusetts wants you to do', 'With the invasive pest now confirmed in more than 145 communities, state officials are asking residents to scrape egg masses and check their cars.', 'The adult spotted lanternflies will soon be gone, but the next generation is already waiting on tree trunks, fences and patio furniture across the state.

In a Sept. 9, 2026 release, the Massachusetts Department of Agricultural Resources said the invasive planthopper has been confirmed in more than 145 cities and towns, in every region except Cape Cod and the Islands. Females start laying eggs in September, and the state is asking residents to destroy any egg masses they can reach through the fall and winter.

## What to look for

MDAR describes the egg masses as flat, gray or beige patches roughly an inch long that often resemble a smear of dried mud. They can turn up on almost any flat outdoor surface. WWLP-22News reported last fall that, according to MDAR, egg laying continues into late November and the eggs survive the winter.

## Your checklist

- **Scrape and destroy** egg masses within reach on bark, fences, stone, firewood and outdoor equipment.
- **Inspect your vehicle** before leaving an infested area so you don''t carry hitchhikers to a new town.
- **Manage host plants.** The state lists the invasive tree-of-heaven as the pest''s favorite host; grapevines, hops and fruit trees are also targets.
- **Check the map before reporting.** In heavily infested places such as Springfield, Worcester and Attleboro, reports are optional. In a town not yet on the state''s distribution map, take a photo and file a report at mass.gov/slf.

MDAR also publishes a management guide for homeowners in infested areas, available in English and 10 other languages on mass.gov.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Spotted_Lanternfly_(20180830-APHIS-LSC-1804).jpg/1280px-Spotted_Lanternfly_(20180830-APHIS-LSC-1804).jpg', 'Photo: U.S. Department of Agriculture, Animal and Plant Health Inspection Service (Lance Cheung) / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-lanternfly-egg-hunt-src1', 'bd-20261017-lanternfly-egg-hunt', 'State Agricultural Officials Urge Residents to Help Limit Spread of Spotted Lanternfly Across Massachusetts', 'https://www.mass.gov/news/state-agricultural-officials-urge-residents-to-help-limit-spread-of-spotted-lanternfly-across-massachusetts', 'Massachusetts Department of Agricultural Resources', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-lanternfly-egg-hunt-src2', 'bd-20261017-lanternfly-egg-hunt', 'Spotted Lanternfly', 'https://www.mass.gov/spotted-lanternfly', 'Commonwealth of Massachusetts', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-lanternfly-egg-hunt-src3', 'bd-20261017-lanternfly-egg-hunt', 'Spotted Lanternfly Management Guide for Infested Areas', 'https://www.mass.gov/lists/spotted-lanternfly-management-guide-for-homeowners-in-infested-areas', 'Massachusetts Department of Agricultural Resources', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-lanternfly-egg-hunt-src4', 'bd-20261017-lanternfly-egg-hunt', 'Invasive spotted lanternfly egg masses to survive Massachusetts winter', 'https://www.wwlp.com/news/local-news/invasive-spotted-lanternfly-egg-masses-to-survive-massachusetts-winter/amp/', 'WWLP-22News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-lanternfly-egg-hunt-ev1', 'bd-20261017-lanternfly-egg-hunt', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-halloween-pet-safety', 'halloween-pet-safety-candy-chocolate-xylitol-costumes', 'newsroom', 'feature', 'pets', 'EDITORIAL_REVIEW', 0, 'Trick-or-treat without a vet visit: Halloween safety tips for pets', 'Chocolate, sugar-free candy and a busy front door top the list of hazards, according to the ASPCA and the FDA.', 'Halloween is a treat for people and a minefield for pets. Here is what the ASPCA and the U.S. Food and Drug Administration say to watch for on Oct. 31.

## The candy problem

Chocolate is the classic danger. The FDA explains that cocoa contains theobromine and caffeine, stimulants that dogs process far more slowly than people. Darker and baking chocolate carry the most, and small dogs can get sick from less. Signs such as vomiting, diarrhea, a racing heart, restlessness or seizures can show up within a few hours.

Sugar-free sweets can be worse. The FDA warns that xylitol, a common sugar substitute, can trigger a dangerous drop in a dog''s blood sugar, sometimes within an hour. It turns up in gum, mints, some candy and baked goods, and certain nut butters.

## A pet-safe Halloween checklist

- Store the candy bowl and kids'' hauls out of reach; the ASPCA notes dogs can sniff out hidden stashes.
- Costume your pet only if it seems comfortable, and make sure the outfit doesn''t limit movement, sight or breathing. Remove small or dangling pieces that could be chewed.
- Keep lit jack-o''-lanterns and electrical cords away from curious paws and tails.
- During peak trick-or-treating, put all but the most social pets in a quiet room away from the door.
- Make sure pets wear ID, and use a reflective collar and secure leash on evening walks.

## If something goes wrong

If you think your pet ate something toxic, call your veterinarian or an emergency animal hospital right away. The ASPCA Animal Poison Control Center can be reached at (888) 426-4435.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 7, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-halloween-pet-safety-src1', 'bd-20261017-halloween-pet-safety', 'Halloween Safety Tips', 'https://www.aspca.org/pet-care/general-pet-care/halloween-safety-tips', 'ASPCA', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-halloween-pet-safety-src2', 'bd-20261017-halloween-pet-safety', 'Paws Off Xylitol; It''s Dangerous for Dogs', 'https://www.fda.gov/consumers/consumer-updates/paws-xylitol-its-dangerous-dogs', 'U.S. Food and Drug Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-halloween-pet-safety-src3', 'bd-20261017-halloween-pet-safety', 'Leave Chocolate Out of Rover''s Celebrations', 'https://www.fda.gov/animal-veterinary/animal-health-literacy/leave-chocolate-out-rovers-celebrations', 'U.S. Food and Drug Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-halloween-pet-safety-ev1', 'bd-20261017-halloween-pet-safety', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-cold-weather-pets', 'cold-weather-pet-safety-winter-tips-avma', 'newsroom', 'feature', 'pets', 'EDITORIAL_REVIEW', 0, 'Cold snaps are coming. Veterinarians'' winter checklist for dogs and cats', 'The American Veterinary Medical Association''s advice covers paws, antifreeze, frozen ponds and the cat hiding under your car.', 'New England''s first hard freezes are around the corner, and pets feel the cold too. The American Veterinary Medical Association''s cold-weather guidance boils down to three ideas: prepare early, know your animal''s limits and watch for winter hazards.

## Get ready now

- Ask your veterinarian which cold-weather risks apply to your pet, especially if it is young, old or has health issues.
- Put together an emergency kit with food, medication and supplies to get through a storm or a long power outage.
- Short-haired dogs, or any dog that seems chilled, may benefit from a sweater or coat. If you use booties, make sure they fit.
- Outdoor pets need an insulated shelter and water that isn''t frozen. When temperatures turn extreme, bring them inside.

## Know your pet''s limits

Cold tolerance varies from animal to animal. The AVMA suggests shortening walks on bitter days and calling your vet if a pet keeps shivering or becomes very sluggish after time outside.

## Winter hazards to avoid

| Hazard | What the AVMA advises |
|---|---|
| Animals sheltering in cars | Check under the vehicle, bang on the hood and honk before starting the engine |
| Antifreeze | Wipe up spills right away; it is toxic to animals |
| Ice melt and road salt | Choose pet-safe de-icers; wipe paws, legs and belly after walks |
| Frozen ponds and streams | Keep pets off the ice |
| Cold cars | Bring pets along only when necessary, and never leave them alone in a vehicle |

Check paws often for cracks, irritation or injury, and contact your veterinarian with any concerns.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cold-weather-pets-src1', 'bd-20261017-cold-weather-pets', 'Cold Weather Safety Tips for Pets', 'https://www.avma.org/sites/default/files/resources/ColdWeatherSafety.pdf', 'American Veterinary Medical Association', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-cold-weather-pets-ev1', 'bd-20261017-cold-weather-pets', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-fall-back-sleep', 'daylight-saving-time-ends-november-1-2026-sleep-tips', 'newsroom', 'feature', 'health-wellness', 'EDITORIAL_REVIEW', 0, 'Clocks fall back Nov. 1. How to protect your sleep through the switch', 'Daylight saving time ends at 2 a.m. on Sunday, Nov. 1, and federal health guidance offers simple habits to keep your rest on track.', 'Set a reminder: daylight saving time ends at 2 a.m. on Sunday, Nov. 1, 2026, when clocks move back to 1 a.m. standard time, ABC7 New York reported. Most phones adjust on their own, but stove clocks, car dashboards and older alarm clocks will need a hand.

The extra hour sounds like a gift, yet darker afternoons and a shifted schedule can throw off sleep for some people. It is a good moment to revisit basic sleep habits.

## How much sleep adults need

The Centers for Disease Control and Prevention lists these targets:

| Age | Recommended nightly sleep |
|---|---|
| 18 to 60 | 7 or more hours |
| 61 to 64 | 7 to 9 hours |
| 65 and older | 7 to 8 hours |

## CDC habits for better rest

- Go to bed and get up at the same times every day, weekends included.
- Keep the bedroom dark, quiet and cool.
- Put away phones, tablets and other screens about 30 minutes before bed.
- Skip heavy meals and alcohol close to bedtime.
- Avoid caffeine in the afternoon and evening.
- Stay physically active during the day.

Keeping your usual wake-up time on Sunday and Monday, rather than sleeping in, can help your routine settle into the new clock.

## When to get help

Occasional restless nights are common. If trouble falling or staying asleep lasts, or you feel very drowsy during the day, talk with your doctor or another clinician, who can look for underlying causes.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Main_Reading_Room._The_Rotunda_Clock_by_John_Flanagan._Library_of_Congress_Thomas_Jefferson_Building,_Washington,_D.C._LOC_8471101962.jpg/1280px-Main_Reading_Room._The_Rotunda_Clock_by_John_Flanagan._Library_of_Congress_Thomas_Jefferson_Building,_Washington,_D.C._LOC_8471101962.jpg', 'Photo: Library of Congress / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-fall-back-sleep-src1', 'bd-20261017-fall-back-sleep', 'About Sleep', 'https://www.cdc.gov/sleep/about/index.html', 'Centers for Disease Control and Prevention', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-fall-back-sleep-src2', 'bd-20261017-fall-back-sleep', 'Daylight saving time 2026 ending: When to ''fall back''', 'https://abc7ny.com/story/daylight-saving-time-2026-ending-when-fall-back/19913454/', 'ABC7 New York', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-fall-back-sleep-ev1', 'bd-20261017-fall-back-sleep', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-winter-activity', 'stay-active-winter-cdc-physical-activity-guidelines', 'newsroom', 'feature', 'health-wellness', 'EDITORIAL_REVIEW', 0, 'Don''t hibernate: How to hit federal exercise goals through a New England winter', 'The CDC''s activity targets can be broken into small pieces, and its cold-weather advice helps keep outdoor workouts safe.', 'Shorter days and icy sidewalks make it easy to slide into a sedentary winter. Federal guidelines offer a clear target, and a lot of flexibility in how you reach it.

## The weekly goal

According to the Centers for Disease Control and Prevention, adults should aim for:

| Activity | Weekly amount | Examples |
|---|---|---|
| Moderate aerobic | 150 minutes | Brisk walking |
| or vigorous aerobic | 75 minutes | Jogging, running |
| Muscle strengthening | At least 2 days | Work legs, hips, back, abdomen, chest, shoulders and arms |

A mix of moderate and vigorous activity also counts. The CDC stresses that some movement is better than none, and that the total can be split up, such as 30 minutes on five days, or shorter chunks spread through the week.

## Making it work in winter

- Pick activities you enjoy and can keep doing; the CDC says that makes habits stick.
- Plan your week ahead and keep a simple log; the CDC offers a free activity planner and printable diary.
- Fit in short bouts on days when the weather or daylight is limited.

## Dress for the cold

If you head outside, the CDC''s winter weather guidance recommends several loose layers, a water-resistant coat and boots, a hat, and a scarf or knit mask. Change out of damp or sweaty clothes quickly, since hypothermia can occur even above 40 degrees. On extremely cold days, stay indoors if you can.

## Check in first

The CDC advises talking with a doctor before starting vigorous exercise if you have been inactive or have a chronic condition such as heart disease, arthritis or diabetes.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/2/24/Grand_Teton_in_Winter-NPS.jpg', 'Photo: National Park Service / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-activity-src1', 'bd-20261017-winter-activity', 'Adult Activity: An Overview', 'https://www.cdc.gov/physical-activity-basics/guidelines/adults.html', 'Centers for Disease Control and Prevention', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-activity-src2', 'bd-20261017-winter-activity', 'Adding Physical Activity as an Adult', 'https://www.cdc.gov/physical-activity-basics/adding-adults/index.html', 'Centers for Disease Control and Prevention', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-winter-activity-src3', 'bd-20261017-winter-activity', 'Preventing Hypothermia', 'https://www.cdc.gov/winter-weather/prevention/index.html', 'Centers for Disease Control and Prevention', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-winter-activity-ev1', 'bd-20261017-winter-activity', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-turkey-thaw-timeline', 'thanksgiving-2026-turkey-thawing-times-usda-food-safety-guide', 'newsroom', 'feature', 'food-culture', 'EDITORIAL_REVIEW', 0, 'Thanksgiving 2026: When to Start Thawing the Turkey, and How to Cook It Safely', 'Federal food safety guidance says a big frozen bird can need most of a week in the refrigerator, so plan before Thanksgiving on Nov. 26.', 'Thanksgiving is Thursday, Nov. 26. A frozen turkey needs planning well ahead of the holiday week.

The U.S. Department of Agriculture''s Food Safety and Inspection Service lists three safe thawing methods: refrigerator, cold water or microwave. The counter and the garage are not on the list. Frozen poultry left at room temperature for more than two hours can reach the 40 to 140 degree range where bacteria multiply quickly.

## Thawing math

In the refrigerator, allow about 24 hours for every 4 to 5 pounds. Using that rule:

| Turkey weight | Refrigerator thaw (approx.) |
|---|---|
| 4 to 12 lbs | 1 to 3 days |
| 12 to 16 lbs | 3 to 4 days |
| 16 to 20 lbs | 4 to 5 days |
| 20 to 24 lbs | 5 to 6 days |

Once thawed, a turkey can stay in the fridge one or two more days before cooking. For a cold-water thaw, keep the bird in its wrapper, submerge it and change the water every 30 minutes. Plan on roughly 30 minutes per pound, then cook it right away. Microwave thawing should follow the oven maker''s instructions, with cooking right after.

## Cooking and leftovers

- Roast at an oven temperature of at least 325 degrees.
- Use a food thermometer in the thigh, the wing and the thickest part of the breast. The bird is safe at a minimum of 165 degrees.
- Bake stuffing in a separate dish, as USDA advises.
- Refrigerate leftovers within two hours, in shallow containers. Eat them within three to four days and reheat to 165 degrees.

Questions can go to the USDA Meat and Poultry Hotline at 1-888-674-6854.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/d/dc/11.09.11_Turkey_top_questions_blog_-_Flickr_-_USDAgov.jpg', 'Photo: U.S. Department of Agriculture / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-turkey-thaw-timeline-src1', 'bd-20261017-turkey-thaw-timeline', 'Let''s Talk Turkey: A Consumer Guide to Safely Roasting a Turkey', 'https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/poultry/lets-talk-turkey-roasting', 'USDA Food Safety and Inspection Service', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-turkey-thaw-timeline-src2', 'bd-20261017-turkey-thaw-timeline', 'USDA guidance on safely thawing a turkey', 'https://www.usda.gov/node/55388', 'U.S. Department of Agriculture', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-turkey-thaw-timeline-ev1', 'bd-20261017-turkey-thaw-timeline', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-cider-orchard-safety', 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda', 'newsroom', 'feature', 'food-culture', 'EDITORIAL_REVIEW', 0, 'Picking Apples This Fall? What to Know About Farm Cider Before You Pour a Cup', 'Apple picking in Massachusetts runs into November, but cider sold by the glass at farm stands does not have to carry the federal warning label.', 'Apple season is still going strong in Massachusetts. State agriculture officials list apple picking as running from August through November, and about 550 farms in the state grow apples on roughly 3,786 acres, according to a Sept. 17 release from the Healey-Driscoll administration that declared September Massachusetts Apple Month.

Before you head out, the Massachusetts Department of Agricultural Resources suggests calling the farm first. Crop availability changes from year to year with the weather, and hours vary. The state''s online farm locator at massnrc.org has a separate map for pick-your-own apples that can be sorted by distance.

## The cider question

The U.S. Food and Drug Administration says most juice sold in the United States is pasteurized or otherwise treated to kill harmful bacteria. Packaged juice that has not been treated must carry a warning label saying so.

There is an important exception for fall outings: juice or cider sold by the glass at orchards, farmers markets, roadside stands and juice bars is not required to have that label. Refrigerated cider at cider mills and some stores may also be untreated.

## Who should be careful

FDA says untreated juice poses the greatest risk to:

- Children
- Older adults
- Pregnant women
- People with weakened immune systems, including transplant patients and people with cancer, diabetes or HIV

If you are not sure, ask the seller whether the cider has been pasteurized or treated. Illness from contaminated juice usually shows up within one to three days. Symptoms can include vomiting, diarrhea, stomach pain and flu-like symptoms.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cider-orchard-safety-src1', 'bd-20261017-cider-orchard-safety', 'What You Need to Know About Juice Safety', 'https://www.fda.gov/food/buy-store-serve-safe-food/what-you-need-know-about-juice-safety', 'U.S. Food and Drug Administration', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cider-orchard-safety-src2', 'bd-20261017-cider-orchard-safety', 'Healey-Driscoll Administration Declares September as Massachusetts Apple Month', 'https://www.mass.gov/news/healey-driscoll-administration-declares-september-as-massachusetts-apple-month', 'Commonwealth of Massachusetts', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-cider-orchard-safety-src3', 'bd-20261017-cider-orchard-safety', 'Pick-Your-Own Farms', 'https://www.mass.gov/guides/pick-your-own-farms', 'Massachusetts Department of Agricultural Resources', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-cider-orchard-safety-ev1', 'bd-20261017-cider-orchard-safety', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-holiday-shopping-scams', 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips', 'newsroom', 'feature', 'deals', 'EDITORIAL_REVIEW', 0, 'How to Spot a Fake Online Deal Before Holiday Shopping Season Starts', 'Federal regulators say ads for cheap brand-name goods, demands for unusual payment methods and fake delivery texts are common warning signs.', 'Holiday sales are about to start, and so are the scams that come with them. The Federal Trade Commission says many shopping frauds start with a deal that looks too good to pass up.

## Red flags

- **Too-cheap social media ads.** Scammers pose as real companies and advertise brand-name goods at very low prices. The FTC says the link may go to a fake site, and buyers may get a counterfeit, a different product or nothing.
- **Odd payment demands.** A seller who insists on a gift card, wire transfer, payment app or cryptocurrency is probably running a scam, the agency says.
- **Delivery texts with links.** Fake messages that claim to be from the U.S. Postal Service, FedEx or DHL report a missed delivery or unpaid postage and link to copycat websites built to collect card numbers. To check on a package, go to the retailer''s site or your account yourself.

## Before you buy

- Search the seller''s name and web address along with words such as review, complaint or scam.
- Look up a phone number, website or business on the Better Business Bureau''s Scam Tracker, where consumers post reports that BBB reviews before publishing.
- Pay by credit card when you can. It lets you dispute charges for items that never arrive or are damaged or wrong.
- Save receipts and order confirmation numbers.
- Know the shipping rule: a seller has to ship by the date it promised, or give you the chance to cancel and get your money back.

## If something goes wrong

Forward scam texts to 7726 or use your phone''s report-junk option. Report fraud to the FTC at ReportFraud.ftc.gov, and consider filing a Scam Tracker report as well so other shoppers can see the warning.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/ApexBuildingHighsmith.jpg/1280px-ApexBuildingHighsmith.jpg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-holiday-shopping-scams-src1', 'bd-20261017-holiday-shopping-scams', 'How to avoid an online shopping scam this holiday season', 'https://consumer.ftc.gov/consumer-alerts/2025/11/how-avoid-online-shopping-scam-holiday-season', 'Federal Trade Commission', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-holiday-shopping-scams-src2', 'bd-20261017-holiday-shopping-scams', 'Think that text message is from USPS? It could be a scam', 'https://consumer.ftc.gov/consumer-alerts/2025/04/think-text-message-usps-it-could-be-scam', 'Federal Trade Commission', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-holiday-shopping-scams-src3', 'bd-20261017-holiday-shopping-scams', 'BBB Scam Tracker', 'https://www.bbb.org/scamtracker', 'Better Business Bureau', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-holiday-shopping-scams-ev1', 'bd-20261017-holiday-shopping-scams', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-mass-gift-card-rules', 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights', 'newsroom', 'feature', 'deals', 'EDITORIAL_REVIEW', 0, 'Gift Cards, Returns and Prices: Massachusetts Rules for Holiday Shoppers', 'State law sets a seven-year life for most gift cards and requires stores to post their return policies, among other protections.', 'Massachusetts shoppers have more protections than many realize. A consumer guide from the state Office of Consumer Affairs and Business Regulation lays out the main rules.

## Gift cards

- Most gift cards bought in Massachusetts are good for at least seven years and cannot carry fees, including dormancy fees. Cards issued by Visa and American Express are exempt from these rules.
- After you have used 90 percent of a card''s value, you can ask for the remaining balance in cash.
- Gift certificates must show an issue date and an expiration date, or those dates must be available online or on the receipt. If no dates are given, the certificate does not expire.

## Returns

No state law requires stores to take back items. But a store must post its return policy clearly so you can read it before paying, and staff cannot misstate it. Defective items are different: the store must accept them, and you can choose a repair, a replacement or a refund. Store credit issued for a return must be good for at least seven years.

## Prices and ads

- Grocery items must ring up at the lowest price shown on the item, the shelf tag or an ad.
- A store has to honor an advertised price, even a wrong one, until it posts a correction.
- If an advertised item sells out, the store generally has to sell it to you at the sale price once it is back in stock or offer a comparable substitute.
- An ad that just says sale must offer at least 10 percent off items priced at $200 or less.

Pricing complaints about stores other than grocers go to the Attorney General''s consumer hotline at 617-727-8400.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/John_F._Kennedy_statue_outside_the_Capitol,_Boston,_Massachusetts_LCCN2011630418.jpg/1280px-John_F._Kennedy_statue_outside_the_Capitol,_Boston,_Massachusetts_LCCN2011630418.jpg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 5, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-mass-gift-card-rules-src1', 'bd-20261017-mass-gift-card-rules', 'A Massachusetts Consumer Guide to Shopping Rights', 'https://www.mass.gov/guides/a-massachusetts-consumer-guide-to-shopping-rights', 'Massachusetts Office of Consumer Affairs and Business Regulation', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-mass-gift-card-rules-ev1', 'bd-20261017-mass-gift-card-rules', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-fafsa-2027-28-open', 'fafsa-2027-28-now-open-steps-massachusetts-students-families', 'newsroom', 'feature', 'education-careers', 'EDITORIAL_REVIEW', 0, 'The 2027-28 FAFSA Is Already Open. Here''s How to Get It Done', 'The federal aid form opened in late September, its earliest launch yet, giving students starting college next fall a head start.', 'Families with a student heading to college or trade school next fall can file now. The 2027-28 Free Application for Federal Student Aid has been available on StudentAid.gov since late September. The Education Department posted the news in a Sept. 23 announcement, about a week ahead of the traditional Oct. 1 start.

The National News Desk, in a report carried by KATV and other Sinclair stations, said this is the earliest launch ever and the second year in a row the form opened before October. The department says the form takes about 15 minutes on average.

The 2027-28 form covers aid for classes from July 1, 2027, through June 30, 2028.

## Steps to finish

- **Start at StudentAid.gov.** The form is filed online through the department''s student aid site.
- **Invite contributors.** Parents or a spouse who must provide information can be invited by email or text message.
- **List your schools.** The schools you add receive your FAFSA information. The form can also show earnings outcomes for schools you are considering.
- **Watch for processing.** Most forms process right away, but some take one to three days. You can then review your FAFSA Submission Summary.
- **No need to refile.** Students who filed during the department''s early test period do not have to submit again.

## Don''t wait

Colleges and states set their own priority dates for grants, and some aid is first come, first served. Massachusetts students should check the deadlines for state aid such as MASSGrant with the state Department of Higher Education, and they should also confirm each college''s own dates.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/LOC_Main_Reading_Room_Highsmith.jpg/1280px-LOC_Main_Reading_Room_Highsmith.jpg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-fafsa-2027-28-open-src1', 'bd-20261017-fafsa-2027-28-open', '2027-28 FAFSA Form Now Available', 'https://financialaidtoolkit.ed.gov/tk/announcement-detail.jsp?id=fafsa-updates', 'U.S. Department of Education, Federal Student Aid', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-fafsa-2027-28-open-src2', 'bd-20261017-fafsa-2027-28-open', 'Education Department opens 2027-28 FAFSA early, marking program''s earliest launch', 'https://katv.com/news/nation-world/education-department-opens-2027-28-fafsa-early-marking-programs-earliest-launch', 'The National News Desk / KATV', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-fafsa-2027-28-open-ev1', 'bd-20261017-fafsa-2027-28-open', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261017-jobs-report-masshire', 'september-2026-jobs-report-massachusetts-unemployment-masshire-help', 'newsroom', 'feature', 'education-careers', 'EDITORIAL_REVIEW', 0, 'Hiring Slows Nationally as Mass. Holds at 4.3%: What Job Seekers Can Do Now', 'The latest federal and state jobs reports point to a slow labor market, and the state''s free MassHire career centers can help job seekers.', 'The job market is still growing, but slowly. U.S. employers added just 29,000 jobs in September, according to the Bureau of Labor Statistics. The national unemployment rate was 4.2 percent. BLS also revised earlier figures down: July now shows a loss of 10,000 jobs, and the July and August totals together came in 60,000 below earlier estimates.

## The numbers

| Measure | Latest |
|---|---|
| U.S. jobs added, September | 29,000 |
| U.S. unemployment rate | 4.2% |
| Long-term unemployed (27+ weeks) | 1.9 million |
| Avg. hourly pay, private sector | $37.81 (up 3.0% in a year) |
| Mass. unemployment rate, September | 4.3% |
| Mass. jobs added, September | 3,500 |

Health care, construction and manufacturing led national gains. In Massachusetts, the state labor office reported job gains in financial activities, professional and business services, and trade and transportation. State labor force participation rose to 65.4 percent.

More than a quarter of unemployed Americans have been looking for work for at least six months, so it can pay to get help early.

## Where to get help

Massachusetts runs more than 25 MassHire Career Centers, including MassHire Downtown Boston at 75 Federal St. and MassHire Boston ABCD in Roxbury. They offer:

- Job search and career planning help
- Workshops on resumes and interviews
- Information on training and education
- Local labor market data

Job seekers can also build a profile on the state''s MassHire JobQuest site and look for hiring events. The next national report comes out Nov. 6, and October figures for Massachusetts follow on Nov. 20.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/2006_JFKennedy_FederalBuilding_Boston_byHighsmith_LC_01581v.jpg/1280px-2006_JFKennedy_FederalBuilding_Boston_byHighsmith_LC_01581v.jpg', 'Photo: Carol M. Highsmith / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-17-guides.sql', 6, 0, 'newsroom-assistant', '2026-10-18T03:30:00.000Z', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-jobs-report-masshire-src1', 'bd-20261017-jobs-report-masshire', 'The Employment Situation, September 2026', 'https://www.bls.gov/news.release/archives/empsit_10022026.htm', 'U.S. Bureau of Labor Statistics', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-jobs-report-masshire-src2', 'bd-20261017-jobs-report-masshire', 'Massachusetts Gains Jobs, Labor Force Continues to Grow in September', 'https://www.mass.gov/news/massachusetts-gains-jobs-labor-force-continues-to-grow-in-september', 'Massachusetts Executive Office of Labor and Workforce Development', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-jobs-report-masshire-src3', 'bd-20261017-jobs-report-masshire', 'MassHire Department of Career Services', 'https://www.mass.gov/orgs/masshire-department-of-career-services', 'Commonwealth of Massachusetts', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261017-jobs-report-masshire-src4', 'bd-20261017-jobs-report-masshire', 'MassHire Department of Career Services Locations', 'https://www.mass.gov/orgs/masshire-department-of-career-services/locations', 'Commonwealth of Massachusetts', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-18T03:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-17. Editor to confirm.', 'newsroom-assistant', '2026-10-18T03:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261017-jobs-report-masshire-ev1', 'bd-20261017-jobs-report-masshire', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Service guide drafted from official sources; awaiting editor approval', '2026-10-18T03:30:00.000Z');
