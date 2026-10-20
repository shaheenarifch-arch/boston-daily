-- Expanded evergreen service stories (2026-10-19): 24 short features rewritten to 840-1,000 words with sourced sections and an FAQ.
-- Facts researched from the linked primary sources; each body attributes them inline. Stories are marked UPDATED so readers see the update stamp.
-- New sources are added to story_sources (skipped when the URL is already listed). Editor notes for each story are in the PR description.

-- check-car-open-recalls-nhtsa-vin-lookup
UPDATE stories SET body = 'The National Highway Traffic Safety Administration''s free online recall lookup shows in seconds whether a vehicle has an unrepaired safety recall, using either its 17-character vehicle identification number or its license plate. Recall repairs cost owners nothing, and NHTSA recommends checking twice a year, making the weeks before the first New England snowfall a good time to look.

## How do I check my car for recalls?

1. Go to [NHTSA''s recall lookup](https://www.nhtsa.gov/recalls).
2. Enter the vehicle''s 17-character VIN or its license plate number.
3. Review any open recalls listed for that specific vehicle, along with instructions for getting the repair.

Plate searches pull data from state motor vehicle agencies, and NHTSA cautions that plate results may reflect a previous owner''s vehicle, so the VIN is the more precise option. The tool can also check up to 100 VINs at once.

The same site lets users search by year, make and model to see recalls, investigations and owner complaints, and it can look up recalls on tires, car seats and other equipment.

## Why might the lookup miss a recall?

A clean result is not a permanent all-clear. According to NHTSA, the VIN and plate search:

- Does not show recalls that have already been repaired
- Generally leaves out recalls more than 15 years old, unless the automaker offers longer coverage
- May not yet list every affected VIN for a very recent recall
- Does not include recalls from small manufacturers, customer service campaigns or vehicles sold outside the U.S.

That is why NHTSA suggests checking again periodically. Its free SaferCar app for iPhone and Android sends an alert when a recall is issued for a vehicle or product the owner has entered, and NHTSA also offers recall alerts by email.

## Who pays for a recall repair?

The manufacturer does. Automakers must remedy a recalled safety defect by repairing it, replacing the part, offering a refund or, in rare cases, buying the vehicle back, according to NHTSA. Registered owners are notified by mail and can schedule the free repair at a local dealer.

NHTSA defines a safety defect as a problem that poses a risk to motor vehicle safety and may exist across a group of vehicles of the same design. Examples in the agency''s [owner guide](https://www.nhtsa.gov/sites/nhtsa.gov/files/documents/mvdefectsandrecalls_808795.pdf) include steering parts that break suddenly, fuel system leaks that can cause fires, accelerator controls that stick and air bags that deploy when they should not. Problems such as a broken radio or air conditioner, normal wear on brake pads or batteries, and cosmetic rust are generally not treated as safety defects. If a dealer will not perform a recall repair, the same guide advises contacting the manufacturer.

## What does a "do not drive" recall mean?

Some recalls are serious enough that the automaker tells owners to park the vehicle until it is fixed. In August 2024, for example, Ford and Mazda issued "do not drive" warnings for more than 457,000 older vehicles with unrepaired Takata air bags, according to an [NHTSA consumer alert](https://www.nhtsa.gov/press-releases/consumer-alert-ford-mazda-issue-do-not-drive-warnings-more-457000-vehicles-recalled). At the time, NHTSA had confirmed 27 U.S. deaths linked to the rupturing air bags. Both automakers offered free towing, mobile repair and, if needed, loaner vehicles.

Owners who get a "do not drive" notice should not drive the vehicle until the repair is done and should contact a dealer right away.

## How common are vehicle recalls?

Very common. NHTSA''s [2025 annual recalls report](https://www.nhtsa.gov/sites/nhtsa.gov/files/2026-03/2025-annual-recalls-report.pdf), published in March 2026, counted 997 recalls last year covering about 31.27 million vehicles and equipment items. Of those, 891 were vehicle recalls affecting about 29.26 million vehicles. The rest involved equipment, child car seats and tires.

Many recalled vehicles go unrepaired. The report put the average vehicle recall completion rate at 73.4% for 2024, the most recent year it measured, meaning roughly one in four recalled vehicles had not been repaired.

## What else should I check before winter driving?

NHTSA''s [winter driving tips](https://nhtsa.gov/node/100081) start with a recall check, then cover the basics:

- **Tires.** Cold air lowers tire pressure. Inflate to the pressure on the driver''s door frame label or in the owner''s manual, not the number on the tire itself, and check monthly. Tread should be at least 2/32 of an inch.
- **Battery.** Have a mechanic test the battery, charging system and belts. Cold also reduces electric vehicle range.
- **Visibility.** Keep washer fluid with de-icer topped off and replace worn wiper blades.
- **Emergency kit.** Carry a shovel, ice scraper, sand or kitty litter, jumper cables, flashlight, blankets, a phone charger, water, food and medicine, and keep the gas tank close to full.

If stranded in snow, NHTSA says to stay with the car, keep the exhaust pipe clear and run the engine only briefly for heat to limit carbon monoxide risk.

## Frequently asked questions

### Is a recall repair really free?

Yes. Federal rules require the manufacturer to fix a recalled safety defect at no cost to the owner, usually through a dealer.

### How often should I check my car for recalls?

NHTSA recommends checking at least twice a year. The free SaferCar app can send alerts automatically.

### Why doesn''t a recall show up for my car?

The lookup does not show completed repairs, generally excludes recalls more than 15 years old and may not yet include every VIN for a new recall. Small manufacturers'' recalls are not listed.

### Can I check a used car for recalls before buying it?

Yes. Enter the vehicle''s VIN in NHTSA''s lookup to see whether any recalls remain unrepaired.

### How do I report a vehicle safety problem?

File a complaint through NHTSA''s "Report a Safety Problem" page. NHTSA uses complaints to decide whether to open investigations, which can lead to recalls.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'check-car-open-recalls-nhtsa-vin-lookup' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-971fdfdb5382ef5a', id, 'Check for Recalls: Vehicle, Car Seat, Tire, Equipment', 'https://www.nhtsa.gov/recalls', 'National Highway Traffic Safety Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'check-car-open-recalls-nhtsa-vin-lookup' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nhtsa.gov/recalls');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d948bdb571910723', id, 'Winter Driving Tips', 'https://nhtsa.gov/node/100081', 'National Highway Traffic Safety Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'check-car-open-recalls-nhtsa-vin-lookup' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://nhtsa.gov/node/100081');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-78a5fccfefdaa416', id, '2025 Annual Report: Safety Recalls', 'https://www.nhtsa.gov/sites/nhtsa.gov/files/2026-03/2025-annual-recalls-report.pdf', 'National Highway Traffic Safety Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'check-car-open-recalls-nhtsa-vin-lookup' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nhtsa.gov/sites/nhtsa.gov/files/2026-03/2025-annual-recalls-report.pdf');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-a6108e9d48c4e75d', id, 'Consumer Alert: Ford, Mazda Issue ''Do Not Drive'' Warnings for More Than 457,000 Vehicles with Recalled Takata Air Bags', 'https://www.nhtsa.gov/press-releases/consumer-alert-ford-mazda-issue-do-not-drive-warnings-more-457000-vehicles-recalled', 'National Highway Traffic Safety Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'check-car-open-recalls-nhtsa-vin-lookup' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nhtsa.gov/press-releases/consumer-alert-ford-mazda-issue-do-not-drive-warnings-more-457000-vehicles-recalled');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-507918fd093ef1d9', id, 'Motor Vehicle Safety Defects and Recalls: What Every Vehicle Owner Should Know', 'https://www.nhtsa.gov/sites/nhtsa.gov/files/documents/mvdefectsandrecalls_808795.pdf', 'National Highway Traffic Safety Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'check-car-open-recalls-nhtsa-vin-lookup' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nhtsa.gov/sites/nhtsa.gov/files/documents/mvdefectsandrecalls_808795.pdf');

-- cold-weather-pet-safety-winter-tips-avma
UPDATE stories SET body = 'No pet should spend long stretches outdoors when temperatures drop below freezing, according to the American Veterinary Medical Association, and Massachusetts law bars leaving a dog outside at all once a weather advisory, warning or watch is issued. With the first cold snaps of the season on the way as of Oct. 19, now is the time to prepare.

## How cold is too cold for dogs and cats?

There is no single cutoff. The AVMA''s [cold weather safety page](https://www.avma.org/resources-tools/pet-owners/petcare/cold-weather-animal-safety) says a pet''s tolerance depends on its coat, body fat, activity level and health. Long-haired and thick-coated dogs handle cold better, but they are still at risk in severe weather.

Some animals need extra care, according to the AVMA:

- **Short-haired pets**, which lose body heat faster.
- **Short-legged dogs**, whose bellies are more likely to brush snow-covered ground.
- **Very young, very old and arthritic pets.** Older animals with arthritis may also slip and fall on ice.
- **Pets with diabetes, heart disease, kidney disease or hormonal disorders** such as Cushing''s disease, which can make it harder to regulate body temperature.

The AVMA''s [printable checklist](https://www.avma.org/sites/default/files/resources/ColdWeatherSafety.pdf) suggests asking your veterinarian which cold-weather risks apply to your animal, shortening walks on very cold days and considering a sweater or coat for short-coated dogs. Keep a few dry ones on hand, since a wet coat can make a dog colder.

## What are the signs of hypothermia in pets?

Watch for whining, shivering, anxiety, weakness, slowing down or stopping, and looking for warm places to burrow, the AVMA says. Bring the animal inside right away and call a veterinarian if you suspect hypothermia.

Frostbite is harder to spot and may not be obvious until a few days after the injury. Contact a vet immediately if you think your pet has it.

## Is it illegal to leave a dog outside in the cold in Massachusetts?

Under [Massachusetts General Laws Chapter 140, Section 174E](https://malegislature.gov/Laws/GeneralLaws/PartI/TitleXX/Chapter140/Section174E), a dog may not be left outside when a weather advisory, warning or watch has been issued, or when conditions such as extreme cold, wind, snow or rain pose a risk given the dog''s breed, age or health. Brief tethering of up to 15 minutes is allowed, but the dog cannot be left unattended.

The same law also says:

- A dog may not be tethered more than five hours in a 24-hour period, or outdoors between 10 p.m. and 6 a.m.
- Dogs younger than six months may not be tethered outside.
- An outdoor shelter must have a roof, a solid floor and at least three enclosed sides, a weather-blocking entrance, clean bedding and access to clean water.
- Penalties start with a written warning or a fine of up to $50 and rise to up to $500 for repeat violations, with possible impoundment or loss of ownership.

## How do I protect my dog''s paws from salt and ice?

Check paws often for cracked or bleeding pads, the AVMA says. Sudden limping on a walk can signal an injury or ice packed between the toes, and trimming the hair between toes may cut down on ice buildup. Booties can help if they fit well.

After each walk, wipe or wash your dog''s feet, legs and belly to remove snow, salt and de-icing chemicals before the dog licks them off. Use pet-safe de-icers on your own steps and walkways.

## What other winter hazards should pet owners watch for?

- **Antifreeze.** Its main ingredient, ethylene glycol, tastes sweet, and only a small amount can be fatal, according to the [ASPCA](https://www.aspca.org/news/digging-deeper-getting-facts-dangers-antifreeze-and-your-pets). Signs such as vomiting, unsteadiness, increased thirst and seizures can begin within a few hours. An antidote exists, but treatment must start fast. Clean spills right away and store containers out of reach.
- **Warm engines.** Outdoor and feral cats may crawl into engine compartments for warmth. Before starting the car, check underneath, bang on the hood and honk the horn.
- **Cold cars.** A parked car can chill a pet quickly. Take pets along only when necessary and never leave them alone in a vehicle.
- **Frozen ponds and lakes.** Ice may not hold a dog''s weight, and the AVMA warns that trying to rescue a dog that falls through can put the owner in danger too.
- **Home heating.** Space heaters can burn pets or start a fire if knocked over. The AVMA recommends a furnace check before winter and carbon monoxide detectors.

For storms and power outages, the AVMA advises keeping at least five days of food, water and medications for each pet. Snow and ice can mask familiar scents, so make sure your pet wears a collar with current ID and that any microchip registration has up-to-date contact information.

## Frequently asked questions

### How long can a dog stay outside in the cold?

It depends on the dog''s coat, size, age and health. The AVMA says no pet should be left outside for long periods in below-freezing weather and recommends shorter walks on very cold days.

### Can I leave my dog tied up outside during a winter storm in Massachusetts?

No. State law prohibits leaving a dog outside once a weather advisory, warning or watch is issued, apart from supervised tethering of up to 15 minutes.

### Do outdoor pets need more food in winter?

Outdoor pets burn more calories to stay warm and may need more food, according to the AVMA. Ask your veterinarian about your pet''s needs.

### What should I do if my pet licks antifreeze?

Get to a veterinarian immediately and bring the product container. The ASPCA says an antidote exists, but treatment must begin as soon as possible.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'cold-weather-pet-safety-winter-tips-avma' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-4cc895571d7b4a0f', id, 'Cold Weather Safety Tips for Pets (PDF)', 'https://www.avma.org/sites/default/files/resources/ColdWeatherSafety.pdf', 'American Veterinary Medical Association', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'cold-weather-pet-safety-winter-tips-avma' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.avma.org/sites/default/files/resources/ColdWeatherSafety.pdf');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-964347aafc297448', id, 'Cold weather animal safety', 'https://www.avma.org/resources-tools/pet-owners/petcare/cold-weather-animal-safety', 'American Veterinary Medical Association', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'cold-weather-pet-safety-winter-tips-avma' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.avma.org/resources-tools/pet-owners/petcare/cold-weather-animal-safety');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-b8cf1930ccb2b3ba', id, 'General Laws Part I, Title XX, Chapter 140, Section 174E', 'https://malegislature.gov/Laws/GeneralLaws/PartI/TitleXX/Chapter140/Section174E', 'Massachusetts Legislature', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'cold-weather-pet-safety-winter-tips-avma' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://malegislature.gov/Laws/GeneralLaws/PartI/TitleXX/Chapter140/Section174E');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d65783e11b086b3d', id, 'Digging Deeper: Getting the Facts on the Dangers of Antifreeze and Your Pets', 'https://www.aspca.org/news/digging-deeper-getting-facts-dangers-antifreeze-and-your-pets', 'ASPCA', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'cold-weather-pet-safety-winter-tips-avma' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.aspca.org/news/digging-deeper-getting-facts-dangers-antifreeze-and-your-pets');

-- daylight-saving-time-ends-november-1-2026-sleep-tips
UPDATE stories SET body = 'Daylight saving time ends at 2 a.m. on Sunday, Nov. 1, 2026, when clocks in Massachusetts and most of the country move back one hour to 1 a.m. That means an extra hour in bed that night, followed by brighter mornings and much earlier sunsets. Sleep experts say a few small changes in the days before and after can help your body adjust.

## When does daylight saving time end in 2026?

Clocks fall back at 2 a.m. local time on **Sunday, Nov. 1**, becoming 1 a.m. standard time, [ABC7 New York reported](https://abc7ny.com/story/daylight-saving-time-2026-ending-when-fall-back/19913454/). The American Academy of Sleep Medicine notes that daylight saving time ends on the first Sunday in November.

Smartphones and most computers update on their own. Stove clocks, car dashboards and older alarm clocks usually need to be changed by hand. The American Academy of Sleep Medicine suggests resetting clocks on Saturday evening and then going to bed at your usual time.

Not every state changes. Most of Arizona and Hawaii stay on standard time all year, as do several U.S. territories, according to ABC7. A bill to end the twice-yearly switch, the Sunshine Protection Act of 2025, passed the U.S. House but had stalled in the Senate as of early October, the station reported.

## How much sleep do adults need?

The [CDC](https://www.cdc.gov/sleep/about/index.html) recommends:

- **Ages 18 to 60:** 7 or more hours a night
- **Ages 61 to 64:** 7 to 9 hours
- **Ages 65 and older:** 7 to 8 hours

The American Academy of Sleep Medicine advises adults to get at least seven hours and teens at least eight in the nights before and after the time change.

## How do I adjust to the time change?

The American Academy of Sleep Medicine''s [daylight saving time guidance](https://sleepeducation.org/resources/daylight-saving-time/) offers a plan for the fall switch:

1. **Shift gradually.** If you are generally well rested, move bedtime 15 to 20 minutes later each night for several nights before Nov. 1.
2. **Use the extra hour if you need it.** People who are chronically short on sleep should not push bedtime later; the group says they can simply take the bonus hour.
3. **Move your routines.** Shift meals and other daily habits toward the new schedule.
4. **Manage morning light.** Limit bright light early in the morning until your target wake-up time so your body clock adjusts.
5. **Rest up Sunday night** so you start the work week rested.

Keeping your usual wake-up time on Sunday and Monday can also help anchor the new schedule.

## What daily habits help you sleep better?

The CDC''s habits for better sleep apply all year, but they matter most during a schedule change:

- Go to bed and get up at the same times every day, including weekends.
- Keep the bedroom quiet, relaxing and cool.
- Put away phones, tablets and other screens about 30 minutes before bed.
- Avoid large meals and alcohol close to bedtime.
- Skip caffeine in the afternoon and evening.
- Get regular exercise and eat a healthy diet.

Dr. Daniel Barone of Weill Cornell Medicine''s Center for Sleep Medicine also recommends getting outside into sunlight early in the day after the change and keeping regular mealtimes, according to [Weill Cornell''s tips for the return to standard time](https://weillcornell.org/news/fall-back-tips-for-handling-the-return-to-standard-time).

## Can the end of daylight saving time affect your mood?

For some people, yes. Earlier sunsets arrive as days are already getting shorter. The [National Institute of Mental Health](https://www.nimh.nih.gov/health/publications/seasonal-affective-disorder) says the most common form of seasonal affective disorder, a type of depression that returns each year, usually begins in late fall or early winter and eases in spring. The risk is higher for people who live farther north, and NIMH names New England as an example.

Treatments can include light therapy, talk therapy, medication and vitamin D, according to NIMH, which advises talking with a health care provider about symptoms. Anyone in crisis can call or text **988**, the Suicide and Crisis Lifeline.

The sleep academy notes that teens and night-shift workers may have a harder time with clock changes because many already struggle to get enough sleep. It supports ending seasonal time changes in favor of permanent standard time, which it says better fits the body''s natural rhythms.

## When should I see a doctor about sleep problems?

The CDC recommends talking with a health care provider if you regularly have trouble sleeping or notice signs of a sleep disorder such as insomnia, restless legs syndrome, narcolepsy or sleep apnea. A provider may suggest a sleep diary or a sleep study. Feeling very drowsy during the day despite enough time in bed is also worth raising with a clinician.

## Frequently asked questions

### What time do clocks change on Nov. 1, 2026?

Clocks move back from 2 a.m. to 1 a.m. local time on Sunday, Nov. 1, 2026.

### Do we gain or lose an hour when daylight saving time ends?

You gain an hour. Clocks fall back, so the night of Oct. 31 into Nov. 1 is one hour longer.

### How can I adjust my sleep before the time change?

The American Academy of Sleep Medicine suggests moving bedtime 15 to 20 minutes later for several nights beforehand, shifting meals to match, and resetting clocks Saturday evening before going to bed at your usual time.

### How many hours of sleep do adults need?

The CDC recommends 7 or more hours for adults 18 to 60, 7 to 9 hours for ages 61 to 64, and 7 to 8 hours for those 65 and older.

### When does daylight saving time start again?

Clocks spring forward one hour at 2 a.m. on Sunday, March 14, 2027, according to the time-zone site [time.is](https://time.is/en/DST_2027).', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-3aca513bf2120a54', id, 'About Sleep', 'https://www.cdc.gov/sleep/about/index.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/sleep/about/index.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-bbe05c78ce91125c', id, 'Daylight saving time 2026 ending: When to ''fall back''', 'https://abc7ny.com/story/daylight-saving-time-2026-ending-when-fall-back/19913454/', 'ABC7 New York', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://abc7ny.com/story/daylight-saving-time-2026-ending-when-fall-back/19913454/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-44635f47967ed1c7', id, 'Daylight Saving Time', 'https://sleepeducation.org/resources/daylight-saving-time/', 'American Academy of Sleep Medicine (Sleep Education)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://sleepeducation.org/resources/daylight-saving-time/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-10e7c0129434f9d4', id, 'Fall Back: Tips for Handling the Return to Standard Time', 'https://weillcornell.org/news/fall-back-tips-for-handling-the-return-to-standard-time', 'Weill Cornell Medicine', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://weillcornell.org/news/fall-back-tips-for-handling-the-return-to-standard-time');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-f2d6d1441bd783a1', id, 'Seasonal Affective Disorder', 'https://www.nimh.nih.gov/health/publications/seasonal-affective-disorder', 'National Institute of Mental Health', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nimh.nih.gov/health/publications/seasonal-affective-disorder');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-10822abe8b650b74', id, 'Daylight Saving Time 2027', 'https://time.is/en/DST_2027', 'time.is', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'daylight-saving-time-ends-november-1-2026-sleep-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://time.is/en/DST_2027');

-- fafsa-2027-28-now-open-steps-massachusetts-students-families
UPDATE stories SET body = 'The 2027-28 Free Application for Federal Student Aid is open now on StudentAid.gov, covering college and career school costs from July 1, 2027, through June 30, 2028. The form launched in late September, about a week ahead of the usual Oct. 1 start, and Massachusetts students should aim to file by **May 1, 2027**, the state''s priority date listed on the federal form. The Education Department says most people finish in about 15 minutes.

## When did the 2027-28 FAFSA open?

The form went live on StudentAid.gov in late September 2026, the earliest launch in the program''s history, according to [reporting by The National News Desk, carried by KATV](https://katv.com/news/nation-world/education-department-opens-2027-28-fafsa-early-marking-programs-earliest-launch). The previous record was Sept. 24, 2025. Federal law requires the form to be available by Oct. 1, and this is the second year in a row it has opened before that date.

Nicholas Kent, the Education Department''s under secretary for higher education, said the department does not want students "leaving money on the table." The early start gives students and colleges more time to review aid offers before enrollment decisions, a contrast with the delayed launch in 2023 that squeezed financial aid timelines.

## What is the FAFSA deadline for 2027-28?

There are three deadlines to track, according to [Federal Student Aid''s guide to FAFSA deadlines](https://studentaid.gov/articles/3-fafsa-deadlines/):

- **College deadlines** are set by each school and are usually the earliest. Some colleges set priority dates for the best aid packages.
- **State deadlines** vary. The [2027-28 FAFSA form](https://studentaid.gov/sites/default/files/2027-28-fafsa-form.pdf) lists May 1, 2027, as the Massachusetts date for priority consideration.
- **The federal deadline** is June 30, 2028. That is the last day the government will accept a 2027-28 form.

Federal Student Aid advises filing well before state and school deadlines, because some of that money is limited and can run out.

## How do Massachusetts students qualify for MASSGrant?

MASSGrant is the state''s main need-based grant, run by the Massachusetts Department of Higher Education''s Office of Student Financial Assistance. According to the [state''s MASSGrant page](https://www.mass.edu/osfa/programs/massgrant.asp), students generally must:

- Be a U.S. citizen, permanent resident or eligible noncitizen.
- Have lived in Massachusetts for at least one year before the start of the term.
- Enroll full time, meaning at least 12 credits, in a certificate, associate or bachelor''s program at an eligible school.
- Not already hold a bachelor''s degree, and not be in default on student loans.
- Show financial need based on the Student Aid Index from the FAFSA.

Award amounts vary with a student''s Student Aid Index and the type of school. Students who cannot file the FAFSA are encouraged to complete the Massachusetts Application for State Financial Aid, known as the MASFA.

The state''s MASSGrant page listed June 30, 2026, as its filing deadline for the 2026-27 year. As of Oct. 19, a 2027-28 date had not been posted there, so families should check the page and their colleges'' own deadlines.

## What do I need to fill out the FAFSA?

Before starting, gather these items:

1. **A StudentAid.gov account (FSA ID)** for the student and for each contributor, such as a parent or spouse. According to [USA.gov](https://www.usa.gov/fafsa), a new FSA ID can be used right away to sign a first FAFSA, though other uses may take up to three days while Social Security information is confirmed.
2. **2025 tax information.** The 2027-28 form asks about income from the 2025 tax year.
3. **A list of schools.** Online filers can list up to 20 colleges, according to the form. Students who have not chosen yet should include every school they are considering; they can add or remove schools later.

Students can invite contributors, such as parents or a spouse, by email or text to add their information to the form.

## What happens after I submit?

Most forms process right away, while some take one to three days, according to the [Education Department''s announcement on the Financial Aid Toolkit](https://financialaidtoolkit.ed.gov/tk/announcement-detail.jsp?id=fafsa-updates). Students can then view their FAFSA Submission Summary, and the information is sent to the schools they listed. Students who submitted successfully during the department''s early testing period do not need to file again.

Colleges use the FAFSA data to build aid offers. Students who miss a deadline should contact the school''s financial aid office, Federal Student Aid says; a Federal Pell Grant may still be possible, but state and school aid become less likely.

## Where can families get help with the FAFSA?

- **Federal Student Aid:** StudentAid.gov/fafsahelp, or 1-800-4-FED-AID (1-800-433-3243), according to the 2027-28 form.
- **High school counselors and college financial aid offices** can answer questions about school-specific deadlines.

Submitting the FAFSA is free. USA.gov notes that families usually do not need to pay a company for help with financial aid.

## Frequently asked questions

### Is the 2027-28 FAFSA open now?

Yes. The form opened on StudentAid.gov in late September 2026, its earliest launch ever, and covers the July 1, 2027, to June 30, 2028, award year.

### What is the Massachusetts FAFSA deadline?

The 2027-28 FAFSA form lists May 1, 2027, as the Massachusetts date for priority consideration. Individual colleges may set earlier deadlines.

### What tax year does the 2027-28 FAFSA use?

It uses 2025 tax and income information.

### Do I need to refile if I submitted during the testing period?

No. The Education Department says students who successfully submitted during the early testing period do not need to submit again.

### How long does the FAFSA take?

The Education Department says the form takes about 15 minutes on average. Most submissions process immediately, though some take up to three days.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-07481380f83ea670', id, '2027-28 FAFSA Form Now Available', 'https://financialaidtoolkit.ed.gov/tk/announcement-detail.jsp?id=fafsa-updates', 'U.S. Department of Education, Federal Student Aid', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://financialaidtoolkit.ed.gov/tk/announcement-detail.jsp?id=fafsa-updates');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-cf1be3dad7028f48', id, 'Education Department opens 2027-28 FAFSA early, marking program''s earliest launch', 'https://katv.com/news/nation-world/education-department-opens-2027-28-fafsa-early-marking-programs-earliest-launch', 'The National News Desk / KATV', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://katv.com/news/nation-world/education-department-opens-2027-28-fafsa-early-marking-programs-earliest-launch');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-bef09d8402bedc62', id, '3 FAFSA Deadlines You Need To Know Now', 'https://studentaid.gov/articles/3-fafsa-deadlines/', 'Federal Student Aid, U.S. Department of Education', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://studentaid.gov/articles/3-fafsa-deadlines/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-93db21d0ae12b3b0', id, '2027-28 FAFSA Form (PDF)', 'https://studentaid.gov/sites/default/files/2027-28-fafsa-form.pdf', 'Federal Student Aid, U.S. Department of Education', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://studentaid.gov/sites/default/files/2027-28-fafsa-form.pdf');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-609f3e6125253746', id, 'MASSGrant', 'https://www.mass.edu/osfa/programs/massgrant.asp', 'Massachusetts Department of Higher Education, Office of Student Financial Assistance', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.edu/osfa/programs/massgrant.asp');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-1a8740986f59652b', id, 'Free Application for Federal Student Aid (FAFSA)', 'https://www.usa.gov/fafsa', 'USA.gov', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'fafsa-2027-28-now-open-steps-massachusetts-students-families' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.usa.gov/fafsa');

-- halloween-pet-safety-candy-chocolate-xylitol-costumes
UPDATE stories SET body = 'Halloween falls on Saturday, Oct. 31, and the biggest dangers for pets sit in the candy bowl: chocolate and sugar-free sweets made with xylitol. If a pet eats either, call a veterinarian right away or reach the ASPCA Animal Poison Control Center at (888) 426-4435, which answers 24 hours a day, 365 days a year.

## Why is chocolate dangerous for dogs?

Chocolate contains theobromine and caffeine, stimulants that affect the nervous system and heart. Dogs process them much more slowly than people do, so the effects last longer, according to the [FDA''s chocolate guidance](https://www.fda.gov/animal-veterinary/animal-health-literacy/leave-chocolate-out-rovers-celebrations). Theobromine is the main culprit.

The darker the chocolate, the greater the risk. The FDA lists approximate theobromine levels per ounce:

| Type of chocolate | Theobromine per ounce |
|---|---|
| Unsweetened baking chocolate | 364 mg |
| Dark chocolate (70% to 85% cacao) | 227 mg |
| Semisweet chocolate chips | 136 mg |
| Milk chocolate | 57 mg |

## How much chocolate is toxic to a dog?

Size matters. The FDA says mild signs can appear at about 9 milligrams of theobromine per pound of body weight, and severe signs at about 18 milligrams per pound. In the agency''s example, 6 ounces of semisweet chips might cause mild to moderate illness in a 60-pound dog but could cause severe, possibly fatal illness in a 6-pound dog without treatment.

Symptoms can start within a few hours and include:

- Vomiting and diarrhea
- A racing heart, restlessness and hyperactivity
- Increased thirst or urination
- Muscle spasms and seizures

Some dogs also develop pancreatitis, a painful inflammation of the pancreas.

## What is xylitol and why is it dangerous for dogs?

Xylitol is a sugar substitute that may also be labeled birch sugar or wood sugar. The [FDA''s xylitol warning](https://www.fda.gov/consumers/consumer-updates/paws-xylitol-its-dangerous-dogs) says it can show up in sugar-free gum, mints and candy, including some chocolate bars, as well as baked goods, some peanut and nut butters, chewable vitamins and toothpaste.

In dogs, xylitol can trigger a surge of insulin that sends blood sugar plunging, sometimes within 10 to 60 minutes. Untreated, that can quickly become life-threatening. Signs include vomiting followed by weakness, staggering, collapse and seizures. Because serious effects may not show for 12 to 24 hours, the FDA advises taking a dog to a veterinarian even before symptoms appear. Cats seem less affected, partly because they tend not to eat sweets.

## Are raisins and other Halloween treats bad for pets?

Yes. Raisins can cause kidney failure, according to the [AVMA''s Halloween safety page](https://www.avma.org/public/PetCare/Pages/halloween.aspx), which advises against sharing any Halloween treats with pets because it is often impossible to tell what a treat contains.

The AVMA also recommends keeping glow sticks, batteries, decorations and costume pieces out of reach. Glow stick liquid tastes bad and can cause drooling or odd behavior but is unlikely to do serious harm. Other items can cause choking or internal injury.

## Are Halloween costumes safe for pets?

Only if your pet is comfortable in one. The [ASPCA''s Halloween tips](https://www.aspca.org/pet-care/general-pet-care/halloween-safety-tips) suggest a trial run before the holiday and say a costume should not restrict movement, sight, breathing or the ability to bark or meow. Check for small or dangling pieces that could be chewed off and swallowed. If your pet seems stressed, the ASPCA suggests a festive bandana instead. The AVMA adds that a pet in costume should never be left unsupervised.

## How do I keep my pet safe during trick-or-treating?

- **Keep candy out of reach.** Dogs can sniff out hidden stashes.
- **Use a quiet room.** Unless your pet is very social, keep it away from the front door during peak trick-or-treating hours, with a favorite toy or food puzzle.
- **Check ID.** A collar, current ID tag and microchip help a pet that slips out an open door get home, the AVMA says.
- **Be visible.** For evening walks, the ASPCA recommends a reflective collar and a secure leash.
- **Watch the flames.** Pets can knock over lit jack-o''-lanterns and start a fire, and kittens are especially likely to get burned. Keep cords out of reach.

If you suspect your pet ate something toxic, call your vet or an emergency animal hospital first, or the ASPCA''s [Animal Poison Control Center](https://www.aspca.org/pet-care/animal-poison-control). The ASPCA says a consultation fee may apply.

## Frequently asked questions

### What should I do if my dog ate Halloween candy?

Call your veterinarian, an emergency animal hospital or the ASPCA Animal Poison Control Center at (888) 426-4435. If the candy was sugar-free, the FDA says to get your dog to a vet right away, even if it seems fine.

### What kind of chocolate is most dangerous for dogs?

Unsweetened baking chocolate and dark chocolate contain the most theobromine, according to the FDA. Milk chocolate has far less, but it can still sicken a small dog.

### How fast does xylitol affect dogs?

Blood sugar can fall within 10 to 60 minutes of eating xylitol, the FDA says, and some serious effects may not appear for 12 to 24 hours.

### Is it safe to put my pet in a Halloween costume?

It can be, if the pet tolerates it and the costume fits without blocking movement, sight or breathing. Skip it if your pet seems distressed.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'halloween-pet-safety-candy-chocolate-xylitol-costumes' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-ee9d4deb3c054706', id, 'Halloween Safety Tips', 'https://www.aspca.org/pet-care/general-pet-care/halloween-safety-tips', 'ASPCA', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'halloween-pet-safety-candy-chocolate-xylitol-costumes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.aspca.org/pet-care/general-pet-care/halloween-safety-tips');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-dc4345ad512e9b1c', id, 'Paws Off Xylitol; It''s Dangerous for Dogs', 'https://www.fda.gov/consumers/consumer-updates/paws-xylitol-its-dangerous-dogs', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'halloween-pet-safety-candy-chocolate-xylitol-costumes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/consumers/consumer-updates/paws-xylitol-its-dangerous-dogs');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-623fd13d8c700ad9', id, 'Leave Chocolate Out of Rover''s Celebrations', 'https://www.fda.gov/animal-veterinary/animal-health-literacy/leave-chocolate-out-rovers-celebrations', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'halloween-pet-safety-candy-chocolate-xylitol-costumes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/animal-veterinary/animal-health-literacy/leave-chocolate-out-rovers-celebrations');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-0aef31baa9575ba5', id, 'Animal Poison Control', 'https://www.aspca.org/pet-care/animal-poison-control', 'ASPCA', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'halloween-pet-safety-candy-chocolate-xylitol-costumes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.aspca.org/pet-care/animal-poison-control');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-4a41c3e304f8a333', id, 'Halloween pet safety', 'https://www.avma.org/public/PetCare/Pages/halloween.aspx', 'American Veterinary Medical Association', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'halloween-pet-safety-candy-chocolate-xylitol-costumes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.avma.org/public/PetCare/Pages/halloween.aspx');

-- home-heating-safety-carbon-monoxide-alarms-massachusetts
UPDATE stories SET body = 'As furnaces, boilers and wood stoves come back on this fall, Massachusetts fire officials are urging residents to test smoke and carbon monoxide alarms, get heating equipment serviced and keep a three-foot clear zone around anything that produces heat. Heating equipment is the leading source of carbon monoxide in the home and the second leading cause of residential fires, State Fire Marshal Jon M. Davine said in a Nov. 10, 2025 safety reminder.

## What does Massachusetts law require for carbon monoxide alarms?

Massachusetts requires carbon monoxide detectors in most residential buildings under a statute known as Nicole''s Law, according to the state''s [summary of carbon monoxide detector law](https://www.mass.gov/info-details/massachusetts-law-about-carbon-monoxide-detectors). The law is named for Nicole Garofalo, a 7-year-old who died in her Plymouth home in January 2005 after snow drifts blocked an outside heating vent, according to the Department of Fire Services.

State fire officials say alarms belong on every level of the home, including outside sleeping areas. The Department of Fire Services describes the requirement as covering every habitable level of a Massachusetts residence.

## How often should I test and replace CO alarms?

The Department of Fire Services'' [winter heating safety guide](https://www.mass.gov/doc/keep-warm-keep-safe-winter-home-heating-safety-english/download) recommends:

- Testing smoke and CO alarms once a month
- Changing alkaline batteries twice a year, when the clocks change
- Replacing smoke alarms 10 years after the manufacture date

For carbon monoxide alarms, the state''s most recent guidance says to replace them every 5 to 10 years, depending on the model, so check the manufacture date on each unit. The fire marshal''s office also recommends buying alarms that carry the mark of an independent testing lab, such as UL or Intertek/ETL.

## What are the symptoms of carbon monoxide poisoning?

Carbon monoxide cannot be seen, smelled or tasted, so a working alarm is the main warning. Common symptoms include headache, dizziness, weakness, upset stomach, vomiting, chest pain and confusion, according to the [Centers for Disease Control and Prevention](https://www.cdc.gov/carbon-monoxide/about/index.html), which describes them as often "flu-like." People who are asleep can die before they notice any symptoms.

The CDC says more than 400 Americans die each year from unintentional carbon monoxide poisoning not linked to fires, more than 100,000 visit an emergency room and more than 14,000 are hospitalized. In Massachusetts, fire departments found carbon monoxide at more than 4,700 non-fire calls in 2024, according to the Department of Fire Services.

If a CO alarm sounds, get everyone outside and call 911, state fire officials say.

## How do I keep heating vents clear of snow?

Blocked vents and flues can let carbon monoxide build to dangerous levels indoors. After a storm, the Department of Fire Services advises residents to:

- Learn where the home''s dryer, furnace and other exhaust vents are
- Clear those vents while shoveling
- Avoid blowing snow onto vents with a snowblower

Other common sources of indoor carbon monoxide are easy to avoid. Never use a gas stove or oven to heat the home, state officials say. The CDC warns never to run a generator inside a home or garage, even with doors open, and to keep it more than 20 feet from windows, doors and vents. It also warns against running a car in an attached garage.

## How do I prevent a heating fire?

Massachusetts recorded more than 6,400 heating fires from 2020 through 2024, causing eight deaths, 153 injuries and more than $52 million in damage, according to the [state fire marshal''s November 2025 release](https://www.mass.gov/news/with-cold-weather-on-the-way-state-fire-marshal-urges-heating-fire-safety). State fire officials recommend:

- Having furnaces, water heaters and oil burners professionally serviced every year
- Having chimneys and flues inspected and cleaned every year
- Keeping anything that can burn at least three feet from furnaces, stoves and fireplaces
- Burning only dry hardwood in wood stoves and fireplaces, and using a screen or keeping the stove door closed
- Letting ashes cool completely, then putting them in a metal container at least 10 feet from the building

If you smell gas, leave right away, do not touch electrical switches and call 911 from outside.

## Are space heaters and kerosene heaters legal in Massachusetts?

Electric space heaters are allowed but should only supplement the main heating system. State fire officials say to keep them three feet from anything that can burn, plug them directly into a wall outlet rather than an extension cord or power strip, and turn them off when leaving the room or going to sleep. Look for a model with a testing-lab label and automatic shut-off.

Unvented kerosene heaters and portable propane heaters are not permitted for residential use in Massachusetts, according to the Department of Fire Services.

Residents who are struggling to pay for heat or keep equipment maintained may qualify for the state''s Home Energy Assistance Program. The state''s Cold Relief Heatline is 800-632-8175.

## Frequently asked questions

### Where should carbon monoxide alarms go?

On every level of the home, including outside bedrooms, according to the Massachusetts Department of Fire Services.

### How often should carbon monoxide alarms be replaced?

The state fire marshal''s office now advises replacing CO alarms every 5 to 10 years, depending on the model. Check the manufacture date on the alarm and follow the maker''s instructions.

### What should I do if my carbon monoxide alarm goes off?

Get everyone out of the home and call 911 from outside, state fire officials say.

### Can I use a portable propane or kerosene heater indoors?

No. Portable propane heaters and unvented kerosene heaters are not permitted for home use in Massachusetts.

### How far should a space heater be from furniture or curtains?

At least three feet from anything that can burn, according to the Department of Fire Services.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'home-heating-safety-carbon-monoxide-alarms-massachusetts' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-77e8a59dd0be060b', id, 'Keep Warm, Keep Safe: Winter Home Heating Safety', 'https://www.mass.gov/doc/keep-warm-keep-safe-winter-home-heating-safety-english/download', 'Massachusetts Department of Fire Services', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'home-heating-safety-carbon-monoxide-alarms-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/doc/keep-warm-keep-safe-winter-home-heating-safety-english/download');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d95bab57b8a40b7a', id, 'Winter Weather Advisory: Check CO Alarms and Keep Vents Clear of Snow', 'https://www.mass.gov/news/winter-weather-advisory-check-co-alarms-and-keep-vents-clear-of-snow', 'Massachusetts Department of Fire Services', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'home-heating-safety-carbon-monoxide-alarms-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/winter-weather-advisory-check-co-alarms-and-keep-vents-clear-of-snow');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-f68f094ab742483d', id, 'With Cold Weather on the Way, State Fire Marshal Urges Heating Fire Safety', 'https://www.mass.gov/news/with-cold-weather-on-the-way-state-fire-marshal-urges-heating-fire-safety', 'Massachusetts Department of Fire Services', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'home-heating-safety-carbon-monoxide-alarms-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/with-cold-weather-on-the-way-state-fire-marshal-urges-heating-fire-safety');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-cc4ba8d12425fdff', id, 'Massachusetts law about carbon monoxide detectors', 'https://www.mass.gov/info-details/massachusetts-law-about-carbon-monoxide-detectors', 'Mass.gov (Trial Court Law Libraries)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'home-heating-safety-carbon-monoxide-alarms-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/massachusetts-law-about-carbon-monoxide-detectors');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-c02b89f745aaba87', id, 'Carbon Monoxide Poisoning Basics', 'https://www.cdc.gov/carbon-monoxide/about/index.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'home-heating-safety-carbon-monoxide-alarms-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/carbon-monoxide/about/index.html');

-- how-to-dress-in-layers-new-england-cold-weather-service
UPDATE stories SET body = 'The National Weather Service''s advice for cold days is simple: wear several loose, lightweight layers instead of one heavy coat, top them with a shell that blocks wind and water, and cover your head, ears, nose, fingers and toes. With a New England winter on the way, those habits are the first defense against frostbite and hypothermia, two conditions that can set in faster than many people expect.

## Why are layers better than one heavy coat?

According to the [National Weather Service''s extreme cold safety guidance](https://www.weather.gov/safety/cold-during), several loose, lightweight and warm layers are the way to dress for the cold. Layers also make it easy to adjust as conditions change. You can unzip or shed one on a crowded MBTA train and add it back on a windy platform.

The weather service''s [New York office](https://www.weather.gov/okx/winterpns7) adds a detail that matters on the coast: the **outer layer should block wind and water**. A damp or wind-pierced top layer undercuts everything underneath it.

The Centers for Disease Control and Prevention gives similar advice in its [guidance on preventing frostbite](https://www.cdc.gov/winter-weather/prevention/preventing-frostbite.html), recommending several layers of loose-fitting clothing, a water-resistant coat and water-resistant boots.

## How should I layer for cold weather, step by step?

Based on the federal guidance, a practical approach looks like this:

1. **Start with light, loose layers.** The weather service and the CDC both call for loose-fitting clothing in several layers.
2. **Add warm middle layers** you can easily remove when you go indoors or start moving.
3. **Finish with a wind- and water-resistant shell.** This is the layer that keeps the wind from stripping away heat and keeps snow and sleet off.
4. **Cover your head and neck.** The weather service recommends a warm hat, and the CDC suggests a scarf or knit mask over the face and mouth.
5. **Protect hands and feet.** The weather service says mittens are better than gloves. Pair them with water-resistant boots.

## Which body parts need the most protection?

The weather service singles out the ears, nose, fingers and toes. The CDC adds the cheeks and chin, noting that these are the spots most often hit by frostbite and should be kept covered in warm, dry clothing.

Staying dry is part of staying warm. If you get wet, the weather service says to change into dry clothes as soon as you are back inside. The CDC notes that hypothermia can happen even above 40 degrees when someone is chilled by rain, sweat or cold water.

## What is wind chill, and why does it matter in Boston?

Wind chill describes how cold it feels on exposed skin when wind speeds up heat loss. According to the [National Weather Service''s wind chill chart](https://www.weather.gov/safety/cold-wind-chill-chart), an air temperature of 0 degrees with a 15 mph wind produces a wind chill of 19 below, cold enough for exposed skin to freeze in 30 minutes. Wind chill affects people and animals; it does not drop objects like pipes or car radiators below the actual air temperature.

That is why a wind-blocking outer layer matters so much along the coast and in open areas.

The weather service has also renamed its cold alerts. Its former wind chill products are now called the **Cold Weather Advisory**, **Extreme Cold Watch** and **Extreme Cold Warning**, according to an [explainer from the agency''s Lincoln, Illinois, office](https://www.weather.gov/ilx/extremecold-change), because dangerous cold can occur even when the wind is calm. The thresholds for each alert vary by region.

## What are the warning signs of frostbite and hypothermia?

**Frostbite.** The weather service and the CDC list these signs:

- Redness or pain, which may come first
- White or grayish-yellow skin
- Skin that feels unusually firm or waxy
- Numbness

Because frozen skin goes numb, people may not notice frostbite until someone else points it out, the CDC says.

**Hypothermia.** A body temperature below 95 degrees is a medical emergency. The weather service says anyone who is at or below that temperature, or who seems cold and sluggish or has trouble thinking clearly, should get medical care right away. It can happen in temperatures as warm as 60 degrees with long exposure or in water. Older adults may not feel the cold or shiver effectively.

## What should I do if someone has frostbite or hypothermia?

For frostbite, the weather service advises:

- Get indoors as soon as possible. Until then, do not rub the area; tuck hands into armpits and add layers.
- Remove rings, watches and tight jewelry.
- Warm the area in a warm, not hot, bath. Avoid heating pads, hot water bottles, stoves, heaters and hair dryers.
- Do not break blisters, and get to a hospital if skin turns blue or gray, swells badly or feels hard and numb.

For hypothermia, call for an ambulance first. Move the person somewhere heated, warm the center of the body first and handle them gently. The agency says to begin CPR if the person is unconscious.

## Frequently asked questions

### Are mittens warmer than gloves?

The National Weather Service says mittens are better than gloves for keeping hands warm in the cold.

### Can you get hypothermia when it is above freezing?

Yes. The weather service says hypothermia can occur at temperatures as warm as 60 degrees, especially in water or after long exposure without proper clothing.

### What replaced the wind chill advisory?

The National Weather Service now issues a Cold Weather Advisory, an Extreme Cold Watch and an Extreme Cold Warning in place of its former wind chill alerts.

### What should the outer layer of a winter outfit do?

According to the weather service''s New York office, the outer layer should block wind and water.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'how-to-dress-in-layers-new-england-cold-weather-service' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-86e92308d3d2f6f2', id, 'Winter Safety: During extreme cold', 'https://www.weather.gov/safety/cold-during', 'National Weather Service', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-dress-in-layers-new-england-cold-weather-service' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.weather.gov/safety/cold-during');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-36832e9f50937927', id, 'Winter weather safety public information statement', 'https://www.weather.gov/okx/winterpns7', 'National Weather Service, New York, NY', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-dress-in-layers-new-england-cold-weather-service' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.weather.gov/okx/winterpns7');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-b46e274323e9938b', id, 'Wind Chill Chart', 'https://www.weather.gov/safety/cold-wind-chill-chart', 'National Weather Service', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-dress-in-layers-new-england-cold-weather-service' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.weather.gov/safety/cold-wind-chill-chart');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-ab07b19e6f5c2cba', id, 'Changes to Extreme Cold products', 'https://www.weather.gov/ilx/extremecold-change', 'National Weather Service, Lincoln, IL', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-dress-in-layers-new-england-cold-weather-service' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.weather.gov/ilx/extremecold-change');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-7335df4370925422', id, 'Preventing Frostbite', 'https://www.cdc.gov/winter-weather/prevention/preventing-frostbite.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-dress-in-layers-new-england-cold-weather-service' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/winter-weather/prevention/preventing-frostbite.html');

-- how-to-read-cosmetic-labels-fda-guidance
UPDATE stories SET body = 'Federal rules require every cosmetic sold to consumers to carry a product identity and net quantity on the front, plus an ingredient list in descending order of predominance, the name and location of the responsible company, and any required warnings, according to the U.S. Food and Drug Administration. What those rules do not do is define popular marketing words. "Hypoallergenic," for instance, has no federal standard, and the FDA does not approve cosmetic labels before products reach store shelves.

## What information is required on a cosmetic label?

The [FDA''s cosmetics labeling regulations page](https://www.fda.gov/labeling-regulations) splits the required details between two parts of the package.

On the **principal display panel**, the side shoppers usually see first:

- A statement of identity that tells you what the product is and what it does, through a common name, descriptive name or illustration.
- An accurate statement of net quantity, by weight, measure or count.

On the **information panel**, usually the back or side:

- The ingredient list, in descending order of predominance.
- The name and place of business of the manufacturer, packer or distributor. If that company did not make the product, the label should say "Manufactured for" or "Distributed by."
- Directions for safe use and other material facts.
- Any required warning or caution statements, displayed prominently.

The FDA says the bottom of a package generally is not an acceptable place for the ingredient list. Required wording must be in English, except in places where another language is predominant, such as Puerto Rico.

## How do you read a cosmetic ingredient list?

Ingredients appear from the largest amount to the smallest, so the first few items make up most of the product. Shoppers who know they react to a specific substance can scan the list to avoid it, a step the FDA itself recommends.

Two exceptions are worth knowing:

1. **"Fragrance" or "flavor" can stand in for many chemicals.** According to the [FDA''s page on fragrances in cosmetics](https://fda.gov/cosmetics/cosmetic-ingredients/fragrances-cosmetics), the federal packaging law that requires ingredient lists cannot be used to force companies to reveal trade secrets. Fragrance formulas are often complex mixtures treated that way, so they may be listed with a single word.
2. **"Professional use only" does not mean no list.** Products sold at retail to consumers must still list ingredients even if marked for professional use, the FDA says.

## Does the FDA approve cosmetics or their labels?

No. The FDA does not approve cosmetics or their ingredients before they go on the market, with the exception of some color additives, according to the agency''s overview of [cosmetics and U.S. law](https://www.fda.gov/cosmetics/cosmetics-laws-regulations/cosmetics-us-law). It also does not pre-approve labels. The company named on the package is responsible for making sure the product is safe and properly labeled.

Because of that, a label may not suggest FDA approval. The agency says such a claim makes a product misbranded. More broadly, the FDA''s explainer on [adulterated and misbranded cosmetics](https://www.fda.gov/cosmetics/cosmetics-laws-regulations/key-terms-cosmetics-regulation-interstate-commerce-adulterated-and-misbranded) says labeling that is false or misleading in any particular, leaves out required information or hides it where an ordinary shopper is unlikely to read it, or uses a deceptively filled container also counts as misbranding.

## Is it a cosmetic or a drug?

The answer depends on what the product claims to do. A product that makes therapeutic claims, such as treating or preventing disease, may be regulated as a drug. Some products are both. A moisturizer with sunscreen is a common example.

For those dual products, the FDA says the label must meet both sets of rules: drug ingredients are listed under over-the-counter drug requirements, and the cosmetic ingredients are listed separately in descending order.

## What do "hypoallergenic" and "unscented" really mean?

**Hypoallergenic.** According to the [FDA''s guidance on hypoallergenic cosmetics](https://www.fda.gov/cosmetics/cosmetics-labeling-claims/hypoallergenic-cosmetics), there are no federal standards or definitions for the word, and companies do not have to submit proof to the agency. The FDA tried to set a standard in the 1970s, but a federal appeals court in Washington, D.C., struck the rule down. The agency adds that products carrying the label generally use the same basic ingredients as others, and no cosmetic can be guaranteed never to cause a reaction.

**Unscented.** A product labeled "unscented" may still contain fragrance ingredients added to mask the smell of other ingredients, the FDA says. Shoppers worried about sensitivities are advised to look for fragrance-free products and read ingredient lists carefully.

Change is underway. A 2022 federal law, the Modernization of Cosmetics Regulation Act, directs the FDA to set fragrance allergen labeling requirements, but the agency lists those rules as still to be established, according to its [MoCRA page](https://www.fda.gov/cosmetics/cosmetics-laws-regulations/modernization-cosmetics-regulation-act-2022-mocra).

## How do I report a bad reaction to a cosmetic?

The FDA''s [guidance on reporting cosmetic complaints](https://www.fda.gov/cosmetics/cosmetics-compliance-enforcement/how-report-cosmetic-product-related-complaint) says to stop using the product and contact a health care provider first. Then report the problem in one of three ways:

- Online through the MedWatch voluntary reporting form, which the agency prefers.
- On paper, using consumer Form FDA 3500B, by mail or fax.
- By phone, through the Food and Cosmetics Information Center at 1-888-SAFEFOOD (1-888-723-3366), option 4.

Reportable problems include rashes, redness, burns, hair loss and infections, as well as product defects such as an odd smell, a change in color or foreign material.

## Frequently asked questions

### Does "hypoallergenic" on a cosmetic label mean anything?

Not legally. The FDA says there is no federal definition of the term, and companies do not have to prove the claim to the agency.

### Why does my lotion just say "fragrance" on the label?

Fragrance formulas are often trade secrets, so federal rules allow them to be listed as "fragrance" rather than ingredient by ingredient.

### Is "unscented" the same as "fragrance-free"?

No. The FDA says unscented products may contain masking fragrance ingredients, and it suggests choosing fragrance-free products if you are sensitive.

### Can a cosmetic say it is FDA approved?

No. The FDA does not approve cosmetic labels, and a label suggesting FDA approval makes a product misbranded.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-2321f05461b7e1b0', id, 'Cosmetics Labeling Regulations', 'https://www.fda.gov/labeling-regulations', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/labeling-regulations');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-f3dd18f4d0bec777', id, '"Hypoallergenic" Cosmetics', 'https://www.fda.gov/cosmetics/cosmetics-labeling-claims/hypoallergenic-cosmetics', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/cosmetics/cosmetics-labeling-claims/hypoallergenic-cosmetics');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-aefd9aa22c5b7769', id, 'Fragrances in Cosmetics', 'https://fda.gov/cosmetics/cosmetic-ingredients/fragrances-cosmetics', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://fda.gov/cosmetics/cosmetic-ingredients/fragrances-cosmetics');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-0ba2c5b22abd72a6', id, 'Cosmetics & U.S. Law', 'https://www.fda.gov/cosmetics/cosmetics-laws-regulations/cosmetics-us-law', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/cosmetics/cosmetics-laws-regulations/cosmetics-us-law');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-1f7ccd4b0dc3306a', id, 'Key Terms for Cosmetics Regulation: Interstate Commerce, Adulterated, and Misbranded', 'https://www.fda.gov/cosmetics/cosmetics-laws-regulations/key-terms-cosmetics-regulation-interstate-commerce-adulterated-and-misbranded', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/cosmetics/cosmetics-laws-regulations/key-terms-cosmetics-regulation-interstate-commerce-adulterated-and-misbranded');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-65ed592ff068e766', id, 'Modernization of Cosmetics Regulation Act of 2022 (MoCRA)', 'https://www.fda.gov/cosmetics/cosmetics-laws-regulations/modernization-cosmetics-regulation-act-2022-mocra', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/cosmetics/cosmetics-laws-regulations/modernization-cosmetics-regulation-act-2022-mocra');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-2daa6753b61181f8', id, 'How to Report a Cosmetic Product Related Complaint', 'https://www.fda.gov/cosmetics/cosmetics-compliance-enforcement/how-report-cosmetic-product-related-complaint', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-read-cosmetic-labels-fda-guidance' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/cosmetics/cosmetics-compliance-enforcement/how-report-cosmetic-product-related-complaint');

-- how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips
UPDATE stories SET body = 'Most fake online deals share the same warning signs, according to the Federal Trade Commission: a brand-name product advertised far below its usual price, a seller who wants payment by gift card or cryptocurrency, and an urgent text about a package. With holiday promotions already arriving as of Oct. 19, a few minutes of checking before checkout can keep shoppers from losing money.

## What are the warning signs of a fake online deal?

Scammers work online year-round but are especially active on social media, the FTC says in its [holiday shopping alert](https://consumer.ftc.gov/consumer-alerts/2025/11/how-avoid-online-shopping-scam-holiday-season). A common setup is an ad that imitates a real company and offers a popular product at a steep discount. People who click and pay may receive a knockoff, an item that does not match the ad, or nothing.

Red flags to watch for:

- **A price far below what established retailers charge** for the same brand-name item.
- **Limited payment options.** The FTC says a seller that accepts only gift cards, wire transfers, payment apps or cryptocurrency is probably a scammer.
- **Delivery texts you did not expect.** Messages about a missed delivery, unpaid postage or a need to update shipping preferences often link to look-alike sites built to collect card numbers and personal details, according to the [FTC''s text-scam warning](https://consumer.ftc.gov/consumer-alerts/2025/04/think-text-message-usps-it-could-be-scam). The texts may claim to come from USPS, FedEx or DHL.
- **Requests for sensitive information.** Layla D''Emilia, Massachusetts undersecretary of consumer affairs, told [Western Mass News](https://www.westernmassnews.com/2025/12/18/officials-be-vigilant-scammers-while-shopping-online/) in December 2025 that legitimate companies and banks will not ask for a Social Security number, bank account number or password.

## How common are online shopping scams?

They are the most frequently reported scam in Better Business Bureau data. In the BBB''s [2025 Scam Tracker Risk Report](https://bbbmarketplacetrust.org/wp-content/uploads/2026/08/2025-Risk-Report.pdf), online purchase scams made up 28.4% of all scams published to BBB Scam Tracker in 2025, the largest share of any type. Of those reports, 89.3% involved a loss of money, and the median loss was $68. The BBB ranked online purchase scams as the third-riskiest scam type overall, up from fourth the year before.

## How can I tell if an online store is legitimate?

A little research goes a long way:

1. **Search the seller.** The FTC recommends searching the company name and the website address from the ad along with words such as "review," "complaint" or "scam."
2. **Check BBB Scam Tracker.** The [Scam Tracker database](https://www.bbb.org/scamtracker) can be searched by website, business name, phone number or email address. The BBB says it reviews each report before posting it.
3. **Confirm the web address.** D''Emilia warned that fake sites can be designed to look like well-known retailers, so make sure you are on the company''s real site.
4. **Track packages yourself.** Instead of tapping a link in a text, the FTC advises checking the order status through the retailer or account you used to buy the item.

## What is the safest way to pay for online purchases?

Use a credit card when you can. The FTC says credit card users can dispute charges for items that never arrive, arrive damaged or are not what was ordered, as well as duplicate charges. D''Emilia also recommended a credit card over a debit card tied to a checking account, because fraudulent credit charges can be stopped faster.

Keep your receipt and order confirmation number. The FTC says those records can help you recover money if a purchase goes wrong.

## What are my rights if an online order never ships?

A federal rule sets deadlines. Under the FTC''s Mail, Internet, or Telephone Order Merchandise Rule, a seller must ship within the time it promised. If no time was stated, the seller must have a reasonable basis to expect it can ship within 30 days, according to the [FTC''s business guide to the rule](https://ftc.gov/business-guidance/resources/business-guide-ftcs-mail-internet-or-telephone-order-merchandise-rule).

When a seller cannot ship on time, it must notify the buyer and offer a choice: accept the delay or cancel for a full refund. For orders paid by credit card, cash, check or money order, the guide says refunds are due within seven working days after the order is canceled.

## Where do I report an online shopping scam in Massachusetts?

- **Scam texts:** Use your phone''s option to report junk, or forward the message to 7726, the FTC says.
- **Fraud and lost money:** File a report with the FTC at ReportFraud.ftc.gov.
- **Warn other shoppers:** Submit a report to BBB Scam Tracker.
- **State help:** The [Massachusetts Office of Consumer Affairs and Business Regulation](https://mass.gov/consumer) lists consumer information specialists at 617-973-8787, available Monday, Wednesday and Friday from 9 a.m. to 3 p.m.

## Frequently asked questions

### Is it a scam if a seller only accepts gift cards or cryptocurrency?

Very likely. The FTC says a seller that will take only gift cards, wire transfers, payment apps or cryptocurrency is probably running a scam.

### What should I do with a text saying my package could not be delivered?

Do not tap the link or reply with information. Check the order status directly with the retailer, then report the message through your phone or forward it to 7726.

### How long does an online seller have to ship my order?

The seller must ship by the date it advertised. If no date was given, the FTC rule expects shipment within 30 days, and you can cancel for a refund if the seller cannot meet the deadline.

### Where can I check whether a website has been reported as a scam?

BBB Scam Tracker lets anyone search reported scams by website, business name, phone number or email address.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-6e625afbc1036002', id, 'How to avoid an online shopping scam this holiday season', 'https://consumer.ftc.gov/consumer-alerts/2025/11/how-avoid-online-shopping-scam-holiday-season', 'Federal Trade Commission', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://consumer.ftc.gov/consumer-alerts/2025/11/how-avoid-online-shopping-scam-holiday-season');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-3f2dd75451d5d75e', id, 'Think that text message is from USPS? It could be a scam', 'https://consumer.ftc.gov/consumer-alerts/2025/04/think-text-message-usps-it-could-be-scam', 'Federal Trade Commission', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://consumer.ftc.gov/consumer-alerts/2025/04/think-text-message-usps-it-could-be-scam');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-54394cf59aef4630', id, 'Business Guide to the FTC''s Mail, Internet, or Telephone Order Merchandise Rule', 'https://ftc.gov/business-guidance/resources/business-guide-ftcs-mail-internet-or-telephone-order-merchandise-rule', 'Federal Trade Commission', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://ftc.gov/business-guidance/resources/business-guide-ftcs-mail-internet-or-telephone-order-merchandise-rule');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-4ef62ceec213d7f3', id, 'BBB Scam Tracker', 'https://www.bbb.org/scamtracker', 'Better Business Bureau', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.bbb.org/scamtracker');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-306e5836a646763f', id, '2025 BBB Scam Tracker Risk Report', 'https://bbbmarketplacetrust.org/wp-content/uploads/2026/08/2025-Risk-Report.pdf', 'BBB Institute for Marketplace Trust', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://bbbmarketplacetrust.org/wp-content/uploads/2026/08/2025-Risk-Report.pdf');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-a09c514088747867', id, 'Officials: Be vigilant for scammers while shopping online', 'https://www.westernmassnews.com/2025/12/18/officials-be-vigilant-scammers-while-shopping-online/', 'Western Mass News', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.westernmassnews.com/2025/12/18/officials-be-vigilant-scammers-while-shopping-online/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-62081513469e512a', id, 'Office of Consumer Affairs and Business Regulation', 'https://mass.gov/consumer', 'Commonwealth of Massachusetts', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'how-to-spot-fake-online-deals-holiday-shopping-scams-ftc-tips' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://mass.gov/consumer');

-- late-season-white-mountains-hiking-safety-hikesafe
UPDATE stories SET body = 'Hikers driving north from Massachusetts this fall should pack as if it were winter, according to New Hampshire Fish and Game, because cold, ice and early snow can reach the White Mountains well before the calendar says so. The state''s hikeSafe code and its Ten Essentials gear list are the baseline, and the voluntary Hike Safe card, $25 for an individual or $35 for a family, is good through Dec. 31 of the year it is bought.

## Is it safe to hike the White Mountains in late fall?

It can be, with the right preparation. New Hampshire Fish and Game Lt. Todd Bogardus told The Conway Daily Sun that each season brings its own risks and that "winter-like conditions can come early to the mountains" in autumn, so hikers should be ready for conditions far different from summer, according to [the paper''s report](https://www.conwaydailysun.com/news/hike-safe-this-autumn-be-ready-for-winter-like-conditions-in-the-mountains/article_c7fffb1f-86da-598f-9468-ee6b50c5e3e8.html).

The summits can be extreme by November. The [Mount Washington Observatory''s recap of November 2024](https://mountwashington.org/november-2024-by-the-numbers/) recorded a gust of 121 mph on Nov. 24, 2024, a low of 7°F on Nov. 30, and 39.8 inches of snow and sleet for the month at the summit.

Conditions near the trailhead can be misleading. The Appalachian Mountain Club notes that higher elevations can be much colder than the valleys below, so a mild morning in the notch says little about the ridge.

## What is the hikeSafe code?

The hikeSafe Hiker Responsibility Code, promoted by [New Hampshire Fish and Game](https://www.wildlife.nh.gov/get-outside/hiking-safety) and the White Mountain National Forest, asks hikers to:

1. **Know before you go.** Learn the terrain, conditions, weather and your own equipment before you start.
2. **Leave your plans.** Tell someone where you are going, the route you will take, when you expect to return and what your emergency plans are.
3. **Stay together.** Start as a group, hike as a group and finish as a group, moving at the pace of the slowest person.
4. **Turn back.** Know your limits and postpone the hike if weather or conditions turn bad.
5. **Plan for emergencies.** Do not assume someone will rescue you; know how to get yourself out.
6. **Share the code** with others.

## What should I pack for a fall hike in New Hampshire?

Fish and Game''s Ten Essentials are:

- Map
- Compass
- Warm clothing, such as a sweater or pile jacket, long pants and a wool hat
- Extra food and water
- Flashlight or headlamp
- Matches or fire starters
- First aid or repair kit
- Whistle
- Rain and wind jacket and pants
- Pocket knife

For colder trips, the agency adds extra warm layers, including an insulated parka, extra mittens, a balaclava, insulated boots, overmitts and snowshoes. Above treeline, it adds crampons, an ice axe, goggles and a face mask.

## How do I deal with short days, ice and fallen leaves?

The [Appalachian Mountain Club''s late-fall hiking advice](https://www.outdoors.org/resources/amc-outdoors/outdoor-resources/shoulder-safety-be-prepared-and-have-fun-on-your-late-fall-hike/) focuses on a few seasonal hazards:

- **Daylight:** Start early. It gets dark sooner under the trees than in the open, so carry a headlamp and spare batteries.
- **Footing:** Fallen leaves can hide rocks, roots and holes. Slow down and leave extra time.
- **Ice and snow:** Carry traction spikes and make sure they fit your boots snugly. As the day warms, snow can ball up under spikes and make descents risky.
- **Water:** Hydration tubes can freeze. Insulated bottles are a safer bet.
- **Warmth:** Bring hats, gloves or mittens, non-cotton layers, heavier socks and extra snacks to help keep body heat up.

Hypothermia does not require freezing temperatures. The [CDC](https://www.cdc.gov/winter-weather/prevention/index.html) says it can happen above 40°F when someone is chilled by rain, sweat or cold water, and it lists hikers among the people at higher risk.

## What is the Hike Safe card and do I need one?

The Hike Safe card is voluntary. According to New Hampshire Fish and Game:

- It costs **$25 per person** or **$35 per family**, and it is valid for the calendar year through **Dec. 31**.
- Cardholders generally are not liable to repay the cost of a rescue, though exceptions under state law can still apply.
- People who already hold a current New Hampshire hunting or fishing license, or an OHRV, snowmobile or boat registration, get the same protection.
- The card applies only in New Hampshire and also covers activities such as paddling and cross-country skiing.

Money from the card supports the state''s Search and Rescue Fund. A card bought now, in late October, covers only the rest of 2026, so hikers planning trips into next year will need a new one in January.

## Frequently asked questions

### Do I need microspikes to hike in the White Mountains in October or November?

Snow and ice can show up early, so the Appalachian Mountain Club suggests carrying traction spikes on late-fall hikes. Above treeline, New Hampshire Fish and Game''s list adds crampons and an ice axe.

### How much does a Hike Safe card cost?

It costs $25 for an individual or $35 for a family and is valid through Dec. 31 of the year purchased, according to New Hampshire Fish and Game.

### Does the Hike Safe card cover hikes in Massachusetts or Vermont?

No. New Hampshire Fish and Game says the card is valid only in New Hampshire.

### Can you get hypothermia in fall if it''s not freezing?

Yes. The CDC says hypothermia can occur at temperatures above 40°F if a person gets chilled from rain, sweat or cold water.

### What should I do before I leave for a hike?

Under the hikeSafe code, tell someone your route, your expected return time and your emergency plans, and check the weather and trail conditions before starting.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'late-season-white-mountains-hiking-safety-hikesafe' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-20859373e5cfe953', id, 'Hiking Safety', 'https://www.wildlife.nh.gov/get-outside/hiking-safety', 'New Hampshire Fish and Game Department', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'late-season-white-mountains-hiking-safety-hikesafe' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.wildlife.nh.gov/get-outside/hiking-safety');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-85fb4392deacaf10', id, 'Hike Safe this autumn: Be ready for winter-like conditions in the mountains', 'https://www.conwaydailysun.com/news/hike-safe-this-autumn-be-ready-for-winter-like-conditions-in-the-mountains/article_c7fffb1f-86da-598f-9468-ee6b50c5e3e8.html', 'The Conway Daily Sun', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'late-season-white-mountains-hiking-safety-hikesafe' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.conwaydailysun.com/news/hike-safe-this-autumn-be-ready-for-winter-like-conditions-in-the-mountains/article_c7fffb1f-86da-598f-9468-ee6b50c5e3e8.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-894ad10aa78b7679', id, 'Shoulder Season: Be Prepared and Have Fun on Your Late-Fall Hike', 'https://www.outdoors.org/resources/amc-outdoors/outdoor-resources/shoulder-safety-be-prepared-and-have-fun-on-your-late-fall-hike/', 'Appalachian Mountain Club', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'late-season-white-mountains-hiking-safety-hikesafe' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.outdoors.org/resources/amc-outdoors/outdoor-resources/shoulder-safety-be-prepared-and-have-fun-on-your-late-fall-hike/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-5a2f67fbcf4b72c6', id, 'November 2024 by the Numbers', 'https://mountwashington.org/november-2024-by-the-numbers/', 'Mount Washington Observatory', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'late-season-white-mountains-hiking-safety-hikesafe' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://mountwashington.org/november-2024-by-the-numbers/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-72de82bde1e6caae', id, 'Preventing Hypothermia', 'https://www.cdc.gov/winter-weather/prevention/index.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'late-season-white-mountains-hiking-safety-hikesafe' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/winter-weather/prevention/index.html');

-- massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda
UPDATE stories SET body = 'Apple picking in Massachusetts runs from August into November, and many orchards pour fresh cider for visitors. Cider sold by the glass at orchards, farmers markets and roadside stands does not have to carry the federal warning label for untreated juice, according to the Food and Drug Administration, so the simplest safety step is to ask the seller whether it was pasteurized.

## When is apple picking season in Massachusetts?

The state''s [pick-your-own farm guide](https://www.mass.gov/guides/pick-your-own-farms) lists apple picking from August through November at more than 80 farms, with dozens of varieties. Pumpkin picking runs September through October at more than 60 farms.

Apples are a major crop here. About 550 Massachusetts farms grow apples on 3,786 acres, according to a Sept. 17 [state announcement](https://www.mass.gov/news/healey-driscoll-administration-declares-september-as-massachusetts-apple-month) declaring September Massachusetts Apple Month, which cited the most recent USDA Census of Agriculture. The state estimated production at about 765,000 bushels, or more than 32 million pounds, with a farm-gate value of more than $42 million.

Weather changes what is ready to pick from year to year, so the Massachusetts Department of Agricultural Resources recommends calling a farm before you go. The department''s MassGrown farm locator map lists orchards, farm stands and farmers markets.

## Is unpasteurized apple cider safe to drink?

It carries a risk. The FDA''s [juice safety guide](https://www.fda.gov/food/buy-store-serve-safe-food/what-you-need-know-about-juice-safety) says most juice sold in the U.S. is pasteurized or otherwise treated to kill harmful bacteria, but untreated juice can contain germs that cause serious illness.

New England has seen it happen. In October 1996, unpasteurized cider was tied to an E. coli O157:H7 outbreak with 14 cases in Connecticut, two of them involving hospitalization for a serious kidney complication, according to a [CDC report](https://www.cdc.gov/mmwr/preview/mmwrhtml/00045558.htm) published in January 1997. The same report described a separate outbreak of the parasite Cryptosporidium in Cortland County, New York, linked to cider from a local mill, with 31 confirmed or suspected cases.

## Who should avoid untreated cider?

The FDA says the risk is highest for:

- Children
- Older adults
- Pregnant women
- People with weakened immune systems, including transplant recipients and people with HIV/AIDS, cancer or diabetes

For these groups, the agency warns, illness from untreated juice can be serious or even deadly.

## How can I tell if farm cider is pasteurized?

Look for the label, but know its limits:

- **Packaged untreated juice sold in stores** must carry a warning stating that it has not been pasteurized and may contain harmful bacteria, the FDA says.
- **Cider sold by the glass** at orchards, farmers markets, roadside stands, juice bars and some restaurants is exempt from that warning.
- **A cold jug is not proof.** Untreated juice is most likely to be in the refrigerated section, the FDA says, but pasteurized juice can be refrigerated too.
- **Ask.** If you are not sure, the FDA suggests asking the seller whether the cider was treated.

Massachusetts adds requirements for packaged cider. Under state food rules ([105 CMR 500.016](https://www.law.cornell.edu/regulations/massachusetts/105-CMR-500-016)), licensed wholesale cider makers must discard wormy or rotten fruit, wash and brush apples before pressing, bottle in new containers, and label cider "Keep Refrigerated" with a statement of how pathogens were controlled, such as pasteurization or UV light treatment, or other FDA-approved wording.

## Can I make fresh cider safer at home?

The University of Maine Cooperative Extension''s [safe cider guidance](https://extension.umaine.edu/food-health/?p=13181) says heating cider to 155 degrees Fahrenheit for 10 seconds is a home method for reducing the risk. It also advises:

1. Using only sound apples and skipping any that are spoiled, moldy or damaged.
2. Storing cider in clean, sanitized containers in the refrigerator at 40 degrees or colder.
3. Not leaving cider at room temperature for two hours or more.

The extension notes that heating does not kill every microorganism, and that patulin, a mold toxin that can form in cider, can survive pasteurization.

For freshly picked apples, the FDA recommends washing hands with soap for at least 20 seconds, rinsing fruit under running water without soap or produce wash, cutting away bruised spots and drying the fruit with a clean towel.

## What are the symptoms of food poisoning from cider?

Illness usually starts one to three days after consuming contaminated food or drink, but it can begin within 20 minutes or as long as six weeks later, according to the FDA. Symptoms include vomiting, diarrhea and stomach pain, and some people develop fever, headache and body aches that can be mistaken for the flu.

## Frequently asked questions

### Does cider at Massachusetts farm stands have to be pasteurized?

Federal rules do not require a warning label on cider sold by the glass at orchards, farm stands or farmers markets, so untreated cider can be served there. Ask the seller whether it was pasteurized or treated.

### Is cider in the refrigerated case always pasteurized?

No. The FDA says untreated juice is most likely to be found in refrigerated cases, though treated juice may be refrigerated as well. Check the label or ask.

### How soon would I get sick from contaminated cider?

Usually within one to three days, according to the FDA, though symptoms can appear as soon as 20 minutes or as late as six weeks after exposure.

### How long does apple picking last in Massachusetts?

The state lists apple picking from August through November. Call the farm ahead, since weather affects what is available.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-19ed4ac0514ccef6', id, 'What You Need to Know About Juice Safety', 'https://www.fda.gov/food/buy-store-serve-safe-food/what-you-need-know-about-juice-safety', 'U.S. Food and Drug Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fda.gov/food/buy-store-serve-safe-food/what-you-need-know-about-juice-safety');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-8a6c6d8265bf6911', id, 'Healey-Driscoll Administration Declares September as Massachusetts Apple Month', 'https://www.mass.gov/news/healey-driscoll-administration-declares-september-as-massachusetts-apple-month', 'Commonwealth of Massachusetts', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/healey-driscoll-administration-declares-september-as-massachusetts-apple-month');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-8d568bac6294c01b', id, 'Pick-Your-Own Farms', 'https://www.mass.gov/guides/pick-your-own-farms', 'Massachusetts Department of Agricultural Resources', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/guides/pick-your-own-farms');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-4b82539c2cc6990b', id, 'Outbreaks of Escherichia coli O157:H7 Infection and Cryptosporidiosis Associated with Drinking Unpasteurized Apple Cider -- Connecticut and New York, October 1996', 'https://www.cdc.gov/mmwr/preview/mmwrhtml/00045558.htm', 'CDC, Morbidity and Mortality Weekly Report', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/mmwr/preview/mmwrhtml/00045558.htm');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-bf793397b4967e84', id, '105 CMR 500.016 - Supplemental Regulations for the Production of Juice and Apple Cider', 'https://www.law.cornell.edu/regulations/massachusetts/105-CMR-500-016', 'Legal Information Institute, Cornell Law School (Code of Massachusetts Regulations)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.law.cornell.edu/regulations/massachusetts/105-CMR-500-016');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-e860c725a9ab43e8', id, 'Safe Cider Know-How', 'https://extension.umaine.edu/food-health/?p=13181', 'University of Maine Cooperative Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-apple-picking-cider-safety-unpasteurized-juice-fda' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://extension.umaine.edu/food-health/?p=13181');

-- massachusetts-gift-card-return-policy-price-accuracy-shopper-rights
UPDATE stories SET body = 'Most gift cards bought in Massachusetts must stay valid for at least seven years and cannot carry fees, and stores are free to set their own return policies as long as they disclose them clearly before you buy, according to the state''s Office of Consumer Affairs and Business Regulation. Grocery stores also must charge the lowest price shown on an item, shelf tag or ad. Here is what holiday shoppers should know before the season''s biggest spending weeks.

## How long are gift cards good for in Massachusetts?

Under Massachusetts rules, a gift card purchased in the state must be good for **seven years** and cannot carry fees, including dormancy fees, according to the state''s [consumer guide to shopping rights](https://www.mass.gov/guides/a-massachusetts-consumer-guide-to-shopping-rights). Cards issued by Visa and American Express are exempt because they are backed by a federal bank.

Two other gift card rules are worth remembering:

- **Cash back for small balances.** Once you have used 90% of a card''s value, you can either spend the rest or ask for the remaining balance in cash.
- **Gift certificates need dates.** A gift certificate must show when it was issued and when it expires, or those dates must be available online or on the sales receipt. If no dates are given, the certificate does not expire.

## Do stores in Massachusetts have to accept returns?

Not always. Massachusetts has no law requiring a specific return policy, the state''s consumer affairs office says. A store can set its own rules as long as the policy is clearly disclosed in the store where you can read it before buying.

Some protections apply no matter what the policy says:

- Salespeople cannot misstate the return policy or refuse to honor it during the disclosed return period.
- Store credit issued for a return must be redeemable for at least seven years from the date it was issued.
- Defective merchandise must be taken back. You are entitled to choose a repair, a replacement or a refund.

## What if an item rings up wrong at the grocery store?

Food stores must charge the lowest price displayed on the product, shelf tag or advertisement, according to the state''s [price accuracy information page](https://www.mass.gov/price-accuracy-information). Under [Section 184C of the state''s item pricing law](https://malegislature.gov/Laws/GeneralLaws/PartI/TitleXV/Chapter94/Section184C), if a scanner charges more than the lowest advertised or displayed price:

- For an item whose lowest price is **$10 or less**, the shopper gets one unit free.
- For an item priced **above $10**, the shopper pays the lowest price minus $10 for one unit.
- Additional units of the same item are sold at the lowest price.

The law makes exceptions for tampering and for obvious "gross errors," in which the displayed price is less than half the checkout price and the store did not intend to sell at that price in the previous 30 days. The consumer guide adds that stores in the scanner waiver program must post their price accuracy guarantees at each checkout lane.

Some fast-moving items are exempt from individual price stickers, including gallons and half-gallons of milk, eggs, fruit, vegetables and greeting cards.

## Does a store have to honor an advertised price?

Yes, in most cases. According to the consumer guide, a store must honor an advertised price, even a mistaken one, until it corrects the error in the same type of advertising or with corrective signs in the store.

Other advertising rules:

1. **"Sale" has to mean something.** If an ad does not state the actual savings, the discount must be at least 10% for items regularly priced at $200 or less, and at least 5% for items above $200.
2. **Rain checks.** If a store runs out of an advertised special, it generally must let you buy it at the sale price when it is restocked, or offer a comparable substitute. That rule does not apply if the ad said quantities were limited or if demand exceeded what the store could reasonably expect.
3. **No price drops after purchase.** If an item goes on sale after you buy it, the law does not require the store to refund the difference, though some stores do as a courtesy.

## Where do I file a shopping complaint in Massachusetts?

Where to go depends on the problem:

- **Grocery pricing and scanner errors:** the [Division of Standards](https://www.mass.gov/orgs/division-of-standards), which enforces the item pricing law for food stores, at (617) 727-3480, weekdays from 9 a.m. to 5 p.m., or through its online complaint form.
- **Pricing at non-grocery stores and other consumer problems:** the Attorney General''s Consumer Hotline at (617) 727-8400, staffed weekdays from 8 a.m. to 4 p.m. Complaints can also be [filed online with the Attorney General''s Office](https://www.mass.gov/how-to/file-a-consumer-complaint) or by mail.
- **General questions:** consumer information specialists at the Office of Consumer Affairs and Business Regulation, 617-973-8787, Monday, Wednesday and Friday from 9 a.m. to 3 p.m.

## Frequently asked questions

### Do Massachusetts gift cards expire?

Most gift cards bought in Massachusetts must be valid for at least seven years and cannot charge fees. Visa and American Express gift cards are exempt from the state rule.

### Can I get cash for a small gift card balance in Massachusetts?

Yes. After you have used 90% of a gift card''s value, you can ask for the remaining balance in cash.

### Can a store refuse a return in Massachusetts?

Yes, if its policy is clearly posted and says so. Defective items are the exception: the store must offer a repair, replacement or refund.

### What happens if I am overcharged at a Massachusetts grocery store?

The store must charge the lowest displayed price. Under state law, when a scanner overcharges, an item priced $10 or less is free, and an item over $10 is discounted by $10, with some exceptions.

### Does store credit expire in Massachusetts?

Store credit issued for a returned item must be redeemable for at least seven years from the date it was issued.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-814ba5565026306f', id, 'A Massachusetts Consumer Guide to Shopping Rights', 'https://www.mass.gov/guides/a-massachusetts-consumer-guide-to-shopping-rights', 'Massachusetts Office of Consumer Affairs and Business Regulation', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/guides/a-massachusetts-consumer-guide-to-shopping-rights');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-14676923fc484bf0', id, 'Price Accuracy Information', 'https://www.mass.gov/price-accuracy-information', 'Massachusetts Division of Standards', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/price-accuracy-information');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-0866ce79268d93a4', id, 'General Laws, Chapter 94, Section 184C', 'https://malegislature.gov/Laws/GeneralLaws/PartI/TitleXV/Chapter94/Section184C', 'Massachusetts Legislature', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://malegislature.gov/Laws/GeneralLaws/PartI/TitleXV/Chapter94/Section184C');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-e2a1d78dd0420c8d', id, 'Division of Standards', 'https://www.mass.gov/orgs/division-of-standards', 'Massachusetts Office of Consumer Affairs and Business Regulation', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/orgs/division-of-standards');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-9d8e95557c5b2e23', id, 'File a consumer complaint', 'https://www.mass.gov/how-to/file-a-consumer-complaint', 'Massachusetts Attorney General''s Office', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-gift-card-return-policy-price-accuracy-shopper-rights' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/how-to/file-a-consumer-complaint');

-- massachusetts-heap-home-heating-assistance-2026-2027
UPDATE stories SET body = 'Massachusetts'' Home Energy Assistance Program, known as HEAP or fuel assistance, began taking applications Oct. 1 for the 2026-2027 heating season, and benefits apply to heating costs from Nov. 1 through April 30. Homeowners and renters qualify if household income is at or below 60% of the state''s estimated median income, which works out to $103,049 a year for a family of four under the state''s fiscal 2027 limits.

## Who qualifies for fuel assistance in Massachusetts?

Eligibility depends on household size and combined gross annual income, according to [Mass.gov''s HEAP page](https://www.mass.gov/info-details/learn-about-home-energy-assistance-heap), run by the Executive Office of Housing and Livable Communities. Both owners and renters can apply, including tenants whose heat is included in the rent.

The state''s maximum annual income limits for fiscal 2027 are:

- 1 person: $53,585
- 2 people: $70,073
- 3 people: $86,561
- 4 people: $103,049
- 5 people: $119,536
- 6 people: $136,024
- 7 people: $139,116
- 8 people: $142,207
- 9 people: $145,299
- 10 people: $148,390

Not every type of income counts toward those limits, the state says, so households near the cutoff should check with their local agency, which makes the final eligibility decision.

## What does HEAP pay for?

HEAP covers part of a household''s main heating cost, whether that is oil, natural gas, electricity, propane, kerosene, wood or coal. Payments go straight to the heating vendor rather than to the household.

The state does not publish a fixed benefit amount. Benefit levels depend on federal funding from the U.S. Department of Health and Human Services and on whether a household receives a housing subsidy, according to Mass.gov.

Two other benefits come with approval:

- **Utility discounts.** Eligible customers of investor-owned electric and gas utilities automatically receive a discounted rate on their bills.
- **Heating system repairs.** The state''s Heating System Repair & Replacement Program, called HEARTWAP, provides emergency repair or replacement of heating systems for low-income households. A HEAP application also serves as the HEARTWAP application.

The program typically helps more than 150,000 Massachusetts households, covering more than 300,000 people, each winter, according to a [Dec. 3, 2025 announcement from Gov. Maura Healey''s office](https://www.mass.gov/news/governor-healey-announces-that-federal-heating-assistance-funding-is-now-available). Last season, federal money was delayed by the federal government shutdown and was not released until Dec. 2, 2025; the state used leftover federal funds from the prior year to cover heating emergencies in the meantime.

## How do I apply for fuel assistance in Massachusetts?

There are three ways to apply, according to the state:

1. **Online**, through the HEAP Client Application Portal linked from Mass.gov.
2. **In person**, at the local agency that serves your community.
3. **By mail**.

First-time applicants must complete an intake appointment with their local agency. Households that received help last year should get a renewal application in the mail, but everyone must reapply each year. Mass.gov offers an agency lookup tool for finding the right office.

Local agencies have been urging people to apply early. In Hampden County, the Valley Opportunity Council began calling past applicants and mailing applications in early September, and more than 20,000 western Massachusetts households received help last season, [Western Mass News reported](https://www.westernmassnews.com/2026/08/25/local-agency-urges-families-think-ahead-heat-assistance/) in August.

## What documents do I need for HEAP?

Gather these before applying, according to Mass.gov:

- A photo ID for the head of household, such as a driver''s license
- A list of everyone who lives in the home
- Heating bill information, such as the company name and account number
- Housing information, such as a current lease or mortgage statement
- Proof of income for the 30 days before the application date, such as pay stubs or pension statements

HEAP is free. The state warns residents not to pay anyone who asks for an "application fee."

## Can my gas or electric be shut off in winter?

Massachusetts has a winter shutoff protection. From Nov. 15 to March 15, a gas or electric company cannot shut off service needed to heat a home without permission from the Department of Public Utilities if the household is experiencing financial hardship, according to [Mass.gov''s utility shutoff guidance](https://www.mass.gov/service-details/when-am-i-protected-from-having-my-utilities-shut-off).

Financial hardship protections also apply year-round when someone in the home is seriously ill, when there is an infant under 12 months old, or when all adults are 65 or older and a minor child lives there. Households where everyone is 65 or older are protected from gas and electric shutoffs without DPU permission, regardless of hardship.

To use these protections, call the utility first and be ready to show proof, such as a doctor''s note or documentation of income. If service is not restored, the state directs residents to the DPU at 617-737-2836 or 877-886-5066.

Oil, propane and wood deliveries have no specific legal shutoff protections, according to the state. Customers should contact their provider and, if needed, file a complaint with the attorney general''s consumer office.

## Frequently asked questions

### When can I apply for fuel assistance in Massachusetts?

Applications for the 2026-2027 season opened Oct. 1, 2026. Benefits cover heating costs from Nov. 1, 2026, through April 30, 2027.

### Can renters get HEAP?

Yes. Renters can apply, including those whose heat is included in their rent, as long as they meet the income limits.

### How much fuel assistance will I get?

The state does not set a fixed amount. Benefits depend on household income and size, housing subsidies, and the federal funding Massachusetts receives each year.

### Do I have to reapply every year?

Yes. Returning households receive a renewal form by mail, but every household must apply again each season.

### Who can I call for help?

The state''s Cold Relief Heatline is 800-632-8175. Residents can also dial 211 for help around the clock, with translation available.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'massachusetts-heap-home-heating-assistance-2026-2027' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-92b6a492dddf261c', id, 'Learn about Home Energy Assistance (HEAP)', 'https://www.mass.gov/info-details/learn-about-home-energy-assistance-heap', 'Mass.gov / Executive Office of Housing and Livable Communities', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-heap-home-heating-assistance-2026-2027' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/learn-about-home-energy-assistance-heap');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-9e365147951751b1', id, 'Governor Healey Announces That Federal Heating Assistance Funding Is Now Available', 'https://www.mass.gov/news/governor-healey-announces-that-federal-heating-assistance-funding-is-now-available', 'Office of Gov. Maura Healey (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-heap-home-heating-assistance-2026-2027' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/governor-healey-announces-that-federal-heating-assistance-funding-is-now-available');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-3f1c6e07d854eb76', id, 'When am I protected from having my utilities shut off?', 'https://www.mass.gov/service-details/when-am-i-protected-from-having-my-utilities-shut-off', 'Mass.gov', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-heap-home-heating-assistance-2026-2027' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/service-details/when-am-i-protected-from-having-my-utilities-shut-off');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-4734534c95523977', id, 'Local agency urges families to think ahead for heat assistance', 'https://www.westernmassnews.com/2026/08/25/local-agency-urges-families-think-ahead-heat-assistance/', 'Western Mass News', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-heap-home-heating-assistance-2026-2027' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.westernmassnews.com/2026/08/25/local-agency-urges-families-think-ahead-heat-assistance/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-38f23fc60e6585d6', id, 'HEAP payment assistance (Massachusetts gas)', 'https://www.nationalgrid.com/us/ma/gas/home/billing-payments/help-making-payments/payment-assistance-programs/heap', 'National Grid', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-heap-home-heating-assistance-2026-2027' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nationalgrid.com/us/ma/gas/home/billing-payments/help-making-payments/payment-assistance-programs/heap');

-- massachusetts-hunting-season-blaze-orange-hikers-2026
UPDATE stories SET body = 'Several Massachusetts hunting seasons are open as of Oct. 19, and more start later this fall, so MassWildlife is asking everyone who uses the woods to wear blaze orange, not just hunters. Archery deer season runs through Nov. 28, pheasant season through Dec. 31, and shotgun deer season runs Nov. 30 to Dec. 12, according to the state''s 2026 season summary. Hunting is not allowed on Sundays.

## When is hunting season in Massachusetts in 2026?

The dates below come from MassWildlife''s [2026 hunting season summary](https://www.mass.gov/info-details/2026-hunting-and-freshwater-fishing-season-summary) and apply statewide in Zones 1-14 unless noted:

- **Archery deer:** Oct. 5 to Nov. 28
- **Fall wild turkey (Zones 1-13):** Oct. 5 to Nov. 28
- **Pheasant and quail:** Oct. 17 to Dec. 31
- **Ruffed grouse:** Oct. 17 to Nov. 28
- **Cottontail rabbit and snowshoe hare:** Oct. 17 to Feb. 27, 2027
- **Gray squirrel:** Sept. 8 to Feb. 27, 2027
- **Black bear:** Sept. 7 to Dec. 12
- **Shotgun deer:** Nov. 30 to Dec. 12
- **Primitive firearms deer:** Dec. 14 to 31

Pheasant, quail, rabbit and gray squirrel hunting closes during shotgun deer season, the summary notes.

Duck hunters are out too. Under MassWildlife''s [migratory game bird regulations](https://www.mass.gov/service-details/migratory-game-bird-hunting-regulations), the 2026-27 duck season opens Oct. 10 in the Central and Coastal zones and Oct. 12 in the Berkshire zone, with split seasons running into January.

## What time of day do hunters hunt?

Deer hunting hours begin a half hour before sunrise and end a half hour after sunset, according to the state''s [deer hunting regulations](https://www.mass.gov/service-details/deer-hunting-regulations). MassWildlife says hunters are often most active in early morning and late afternoon, when light is low, which is when walkers most need to stand out.

## Why should hikers wear blaze orange?

Blaze orange is easy for people to see against brown and green woods, and MassWildlife says deer cannot pick out red or orange against that background, so the color does not hurt a hunter''s chances.

Massachusetts has a long history with the color. In an Oct. 6 [news release](https://www.mass.gov/news/all-outdoor-users-wear-blaze-orange-during-hunting-seasons), MassWildlife said a 1959 study at Fort Devens, led by the agency''s information officer Jack Woolner, found blaze orange was the most visible color in the woods under varied conditions. Massachusetts became the first state to require it for hunters, and more than 40 states now have some blaze orange rule, the agency said.

MassWildlife credits hunter education and blaze orange rules with a steep drop in hunting-related injuries over the past 50 years, citing the International Hunter Education Association. It also stresses that orange supports, but does not replace, safe hunting practices.

## What are the blaze orange rules for hunters?

According to MassWildlife''s [blaze orange guidance](https://www.mass.gov/info-details/wear-blaze-orange-during-hunting-season):

- During **shotgun deer season**, all hunters must wear at least **500 square inches** of blaze orange on the chest, back and head.
- During **primitive firearms season**, deer hunters must meet the same 500-square-inch rule.
- Coastal waterfowl hunters in a blind or boat are exempt from both.
- Hunters on Wildlife Management Areas where pheasant or quail are stocked must wear a blaze orange hat or cap during those seasons, with exceptions for waterfowl hunters in a blind or boat and raccoon and opossum hunters at night.

Non-hunters are not legally required to wear orange, but the state recommends it for anyone outdoors during hunting seasons.

## How can non-hunters stay safe in the woods?

MassWildlife''s [safety tips for non-hunters](https://www.mass.gov/service-details/safety-tips-for-non-hunters) include:

1. **Be seen.** Wear a bright orange hat or vest, and skip earth tones and animal-colored clothing.
2. **Protect pets.** Keep dogs leashed and put an orange vest or bandana on them.
3. **Make noise.** Talk or whistle as you walk. If you see a hunter or hear shots, call out so they know where you are.
4. **Plan ahead.** Check season dates and the rules for the property you plan to visit.
5. **Stay courteous.** Avoid confrontations. Harassing hunters is against state law.

State rules also set buffer zones. Under MassWildlife''s [general hunting regulations](https://www.mass.gov/info-details/general-hunting-regulations), hunters may not fire within 150 feet of a state or hard-surfaced highway, and they may not hunt within 500 feet of a dwelling or building in use unless the owner or occupant gives permission.

## Where is hunting allowed in Massachusetts?

Hunting is permitted on MassWildlife lands, including Wildlife Management Areas, as well as most state parks and forests and many town-owned properties, depending on local rules, according to the agency. Walkers who would rather avoid hunters can choose places where hunting is not allowed, go out on Sundays, or wait until seasons close.

To report a suspected fish or wildlife violation, MassWildlife directs the public to the Massachusetts Environmental Police at 1-800-632-8075.

## Frequently asked questions

### Do hikers have to wear blaze orange in Massachusetts?

No law requires it for non-hunters, but MassWildlife recommends that everyone in the woods wear blaze orange during hunting seasons.

### Is there hunting on Sundays in Massachusetts?

No. Hunting is prohibited on Sundays statewide, MassWildlife says, which makes Sunday a common choice for walkers who want to avoid hunters.

### When is shotgun deer season in 2026?

Shotgun deer season runs Nov. 30 to Dec. 12, 2026, in all zones, according to MassWildlife''s season summary. Primitive firearms deer season follows Dec. 14 to 31.

### Should my dog wear orange?

Yes. MassWildlife recommends keeping pets leashed and putting them in a blaze orange vest or bandana during hunting seasons.

### How much orange do deer hunters have to wear?

During shotgun season, and for deer hunters during primitive firearms season, at least 500 square inches on the chest, back and head, MassWildlife says.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-60eaf00a292293a5', id, '2026 Hunting and Freshwater Fishing Season Summary', 'https://www.mass.gov/info-details/2026-hunting-and-freshwater-fishing-season-summary', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/2026-hunting-and-freshwater-fishing-season-summary');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-16f9788b4b2ad8d8', id, 'Wear blaze orange during hunting season', 'https://www.mass.gov/info-details/wear-blaze-orange-during-hunting-season', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/wear-blaze-orange-during-hunting-season');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-86f5e991d10a3b71', id, 'All outdoor users: Wear blaze orange during hunting seasons', 'https://www.mass.gov/news/all-outdoor-users-wear-blaze-orange-during-hunting-seasons', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/all-outdoor-users-wear-blaze-orange-during-hunting-seasons');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-450c2183299bad12', id, 'Safety tips for non-hunters', 'https://www.mass.gov/service-details/safety-tips-for-non-hunters', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/service-details/safety-tips-for-non-hunters');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-18cf2728615b48c5', id, 'Migratory game bird hunting regulations', 'https://www.mass.gov/service-details/migratory-game-bird-hunting-regulations', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/service-details/migratory-game-bird-hunting-regulations');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-5a41a4a336f9cf5c', id, 'Deer hunting regulations', 'https://www.mass.gov/service-details/deer-hunting-regulations', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/service-details/deer-hunting-regulations');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-829a2a450926a0af', id, 'General hunting regulations', 'https://www.mass.gov/info-details/general-hunting-regulations', 'MassWildlife (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-hunting-season-blaze-orange-hikers-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/general-hunting-regulations');

-- massachusetts-textile-disposal-ban-donate-recycle-clothes
UPDATE stories SET body = 'Old clothes, shoes, sheets and towels do not belong in the trash in Massachusetts. Since Nov. 1, 2022, state rules enforced by the Massachusetts Department of Environmental Protection have banned textiles from disposal, and that covers ripped, stained and worn-out items too. As long as fabric is clean and dry, it can be donated or sent to a textile recycler instead.

## What does the Massachusetts textile ban cover?

According to [MassDEP''s clothing and textile recovery guide](https://www.mass.gov/guides/textile-recovery), textiles may not be thrown away or hauled off for disposal anywhere in the state. The ban covers:

- Clothing and footwear
- Bedding, towels and curtains
- Fabric of any kind, including scraps of all sizes

The rule is part of the state''s solid waste regulations, known as 310 CMR 19.000, and MassDEP points readers there for detailed definitions, including which contaminated textiles are exempt.

## Can I throw away torn or stained clothes?

Generally, no. MassDEP says worn, torn and stained items still have value to textile recyclers, so they should be recovered, not trashed. A single sock, a T-shirt with a hole or a faded bath towel all count.

The key condition is that the items be **clean and dry**. MassDEP says textiles must meet that standard to be accepted for reuse or recycling.

Pickup programs spell out what they accept in similar terms. Cambridge''s curbside textile program, for example, takes clean and dry items even with stains or missing buttons, along with shoes, hats, belts, bags and linens, according to the [City of Cambridge](https://cambridgema.gov/textiles).

## Which textiles are exempt from the ban?

Some items can still go in the trash. According to [MassDEP''s mattress and textile waste ban FAQ](https://www.mass.gov/doc/frequently-asked-questions-mattress-textile-waste-ban/download):

- Textiles contaminated with mold, bodily fluids, insects, oil or hazardous substances are excluded.
- Used shop rags and wiping cloths are treated as contaminated.
- Pillows, cushions and rugs are not considered textiles for purposes of the ban.
- Retiring a U.S. flag in a ceremony under the U.S. Flag Code is exempt.

In the mattress section of the same FAQ, MassDEP says it generally does not issue waste ban enforcement to individuals and typically focuses on businesses, institutions, municipalities and haulers. Cities and towns are expected to comply with the textile ban, which shapes what curbside trash programs will take.

## Where can I donate or recycle clothes in Massachusetts?

The state''s main search tool is the [Beyond the Bin Recycling Directory](https://www.recyclesmartma.org/beyond-the-bin-search/) on the RecycleSmartMA website, a MassDEP service. Users pick a material category or keyword, enter a location and get a list of places that resell, reuse, recycle or repurpose items. Listings are self-reported, so the site advises calling ahead.

Other options depend on where you live:

1. **Town drop-off bins or transfer stations.** Most Massachusetts communities offer drop-off collection.
2. **Curbside pickup.** Some cities and towns contract with textile collectors to pick up bags at the door. In Cambridge, the service is free, but residents must schedule a pickup in advance.
3. **One-day collection events.** Many towns host periodic textile drives.
4. **Retail take-back programs.** MassDEP keeps a partial list of stores that accept certain used items.

A MassDEP fact sheet covering 2025, published in August 2026, found that among Massachusetts municipalities reporting their collection method, 80% offer drop-off collection only, 3% offer curbside pickup only and 17% offer both. About 30% also hold one-day collection events. Check your city or town''s recycling page for details.

## What happens to clothes after they are donated?

Donated textiles are sorted by grade. An industry breakdown cited by MassDEP estimates that about 45% are reused as clothing, about 30% become wiping cloths and about 20% are processed into fiber-grade material.

That is why even unwearable items matter. A shirt too worn to resell can still become a wiping cloth or fiber.

## How much clothing do Massachusetts residents throw away?

MassDEP estimates residents and businesses throw out about 230,000 tons of textiles each year, roughly 5% of the state''s trash based on 2022 waste data. The agency estimates about 95% of that could have been donated, reused or recycled.

Recovery is happening, but the numbers show room to grow. According to the [MassDEP 2025 textile tonnage fact sheet](https://www.mass.gov/doc/massdep-fact-sheet-2025-textile-tonnages/download), 18 of the largest textile recovery vendors reported collecting 49,878 tons in 2025, down 2% from 2024. Municipal programs diverted another 8,657 tons in 2025, up from 8,122 tons the year before.

## Frequently asked questions

### Is it illegal to throw clothes in the trash in Massachusetts?

Textiles, including clothing, shoes, bedding, towels and curtains, have been banned from disposal in Massachusetts since Nov. 1, 2022. MassDEP says it generally does not issue waste ban enforcement to individuals, focusing instead on businesses, institutions, municipalities and haulers.

### Can I donate clothes with holes or stains?

Yes. MassDEP says worn, torn and stained textiles can still be recycled, as long as they are clean and dry.

### What if my clothes are moldy or soiled?

Textiles contaminated with mold, bodily fluids, insects, oil or hazardous substances are excluded from the ban and may be thrown away, according to MassDEP''s FAQ.

### Can pillows and rugs go in the trash?

Yes. MassDEP''s FAQ says pillows, cushions and rugs are not treated as textiles under the ban.

### How do I find a textile drop-off near me?

Search the Beyond the Bin Recycling Directory on RecycleSmartMA by material and location, or check your city or town''s recycling webpage for drop-off sites, curbside pickup and collection events.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'massachusetts-textile-disposal-ban-donate-recycle-clothes' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-dbb12dd71c8476d5', id, 'Clothing and Textile Recovery', 'https://www.mass.gov/guides/textile-recovery', 'Massachusetts Department of Environmental Protection', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-textile-disposal-ban-donate-recycle-clothes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/guides/textile-recovery');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-ca4e969ae8c56c6e', id, 'Frequently Asked Questions: Mattress & Textile Waste Ban', 'https://www.mass.gov/doc/frequently-asked-questions-mattress-textile-waste-ban/download', 'Massachusetts Department of Environmental Protection', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-textile-disposal-ban-donate-recycle-clothes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/doc/frequently-asked-questions-mattress-textile-waste-ban/download');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-39165a2b2dcd5ecf', id, 'MassDEP Fact Sheet: 2025 Textile Tonnages', 'https://www.mass.gov/doc/massdep-fact-sheet-2025-textile-tonnages/download', 'Massachusetts Department of Environmental Protection', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-textile-disposal-ban-donate-recycle-clothes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/doc/massdep-fact-sheet-2025-textile-tonnages/download');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-7ab640aa0679a220', id, 'Beyond the Bin Search Directory', 'https://www.recyclesmartma.org/beyond-the-bin-search/', 'RecycleSmartMA (MassDEP)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-textile-disposal-ban-donate-recycle-clothes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.recyclesmartma.org/beyond-the-bin-search/');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-b42309ccf37f76f6', id, 'Textiles', 'https://cambridgema.gov/textiles', 'City of Cambridge', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'massachusetts-textile-disposal-ban-donate-recycle-clothes' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://cambridgema.gov/textiles');

-- passport-processing-times-winter-travel-2026
UPDATE stories SET body = 'Routine U.S. passport applications are taking 4 to 6 weeks to process and expedited applications 2 to 3 weeks, according to the State Department''s processing-times page, last updated Oct. 5. Mailing time is not included and can add up to two weeks in each direction, so travelers planning a trip abroad for the holidays or February vacation should apply now.

## How long does it take to get a passport right now?

The [State Department''s processing-times page](https://travel.state.gov/en/passports/apply/help/processing-time.html) lists three speeds:

- **Routine:** 4 to 6 weeks, at no extra charge
- **Expedited:** 2 to 3 weeks, for an extra $60
- **Urgent travel:** an in-person appointment at a passport agency for people with proof of international travel within 14 calendar days

Those estimates start when the application arrives, not when it is mailed. The State Department says it can take up to two weeks for an application to reach it and up to two weeks for a finished passport to arrive by mail. In a worst case, a routine application could take about 10 weeks from mailbox to mailbox. The agency notes that processing times shift with demand and that mail times vary by region.

## When is the best time to apply for a passport?

Now is a good window. The State Department says its busiest stretch runs from late winter through summer and suggests applying between October and December.

A few steps help avoid delays:

1. Check the expiration date on every family member''s passport before booking a trip.
2. Look up the entry requirements for your destination country before booking.
3. Respond quickly if the State Department sends a letter or email asking for more information. Missing details can extend processing.
4. Watch for status emails, or check progress at passportstatus.state.gov.

## How much does a passport cost in 2026?

The [State Department''s fee page](https://travel.state.gov/en/passports/apply/help/fees.html), last updated March 19, 2026, lists these costs:

- **First-time adult passport book:** $130 application fee plus a $35 acceptance fee, for $165
- **First-time adult passport card:** $30 plus $35, for $65
- **Adult renewal:** $130 for a book, $30 for a card or $160 for both
- **Child under 16, passport book:** $100 plus $35, for $135
- **Expedited service:** $60 extra
- **One- to three-day return delivery:** $26.87 extra, not available for card-only applications

## Can I renew my passport online?

Many adults can. The State Department''s [online renewal page](https://travel.state.gov/en/passports/renew-replace/online.html), last updated Sept. 30, says applicants must meet all of these conditions:

- Be 25 or older
- Be renewing a 10-year passport that expires within a year or expired less than five years ago
- Not be changing a name, sex or other personal information
- Not be traveling for at least six weeks after submitting
- Be in a U.S. state or territory when applying
- Have the passport in hand, undamaged and not reported lost or stolen

Online renewals are routine service only and cannot be expedited when submitted. If travel plans change afterward, applicants can call 877-487-2778 to ask for expedited service or faster delivery. Applicants should not mail in the old passport, which is canceled once the online application is submitted.

## What if I need a passport in the next two weeks?

Travelers leaving within 14 calendar days, or who need a foreign visa within 28 days, can request an appointment at a passport agency, including the [Boston Passport Agency](https://travel.state.gov/en/passports/apply/get-fast/make-appointment/boston.html).

According to the State Department''s [appointment page](https://travel.state.gov/en/passports/apply/get-fast/make-appointment.html), last updated Oct. 15, people who have not yet applied book through the Online Passport Appointment System. It can schedule up to seven people in one household, and a chosen slot is held for 15 minutes. People who already applied should call 877-487-2778, which is staffed 8 a.m. to 10 p.m. Eastern on weekdays and 10 a.m. to 3 p.m. on weekends.

Appointments are free. The State Department says any request for payment to book one should be treated as fraud, and it warns that it is not affiliated with third-party booking services and may not honor their appointments.

## Do I need a passport for domestic flights?

No, but it helps. A valid U.S. passport is an accepted ID at airport security. Since Feb. 1, 2026, travelers without a REAL ID, passport or other accepted identification must pay a $45 TSA ConfirmID fee to verify their identity, according to the [Massachusetts Registry of Motor Vehicles](https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0).

## Frequently asked questions

### How long does it take to get a passport in October 2026?

Routine processing takes 4 to 6 weeks and expedited processing 2 to 3 weeks, according to the State Department as of Oct. 5. Add up to two weeks of mailing time on each end.

### How much does it cost to expedite a passport?

Expedited service costs $60 on top of regular fees. One- to three-day return delivery is an extra $26.87.

### Can I renew my passport online if I''m traveling soon?

Not if the trip is within six weeks of applying. Online renewal is routine service only and requires that applicants have no travel planned for at least six weeks.

### How do I check my passport application status?

The State Department emails status updates to the address on the application. Applicants can also check at passportstatus.state.gov.

### Is there a passport agency in Boston?

Yes. The Boston Passport Agency serves travelers with international trips within 14 days or who need a foreign visa within 28 days. An appointment is required.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'passport-processing-times-winter-travel-2026' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-07eff20607897208', id, 'Processing Times for U.S. Passports', 'https://travel.state.gov/en/passports/apply/help/processing-time.html', 'U.S. Department of State', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'passport-processing-times-winter-travel-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://travel.state.gov/en/passports/apply/help/processing-time.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-a0fef8908d12153b', id, 'Passport Fees', 'https://travel.state.gov/en/passports/apply/help/fees.html', 'U.S. Department of State', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'passport-processing-times-winter-travel-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://travel.state.gov/en/passports/apply/help/fees.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d82d6e733d963029', id, 'Renew Your Passport Online', 'https://travel.state.gov/en/passports/renew-replace/online.html', 'U.S. Department of State', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'passport-processing-times-winter-travel-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://travel.state.gov/en/passports/renew-replace/online.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-452681a20c995200', id, 'Make an Appointment at a Passport Agency', 'https://travel.state.gov/en/passports/apply/get-fast/make-appointment.html', 'U.S. Department of State', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'passport-processing-times-winter-travel-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://travel.state.gov/en/passports/apply/get-fast/make-appointment.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-44d33c60a152752d', id, 'Boston Passport Agency', 'https://travel.state.gov/en/passports/apply/get-fast/make-appointment/boston.html', 'U.S. Department of State', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'passport-processing-times-winter-travel-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://travel.state.gov/en/passports/apply/get-fast/make-appointment/boston.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-a7fa88c47ac51c82', id, 'MA RMV Reminds Residents that TSA Fees for Passengers without a REAL ID or Passport begin February 1', 'https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0', 'Massachusetts Registry of Motor Vehicles', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'passport-processing-times-winter-travel-2026' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0');

-- plant-garlic-spring-bulbs-october-massachusetts
UPDATE stories SET body = 'October is the month to plant garlic in Massachusetts, according to UMass Extension, ideally after a hard frost so the cloves can root before winter. Tulips, daffodils and other spring-flowering bulbs also go in now, and most hardy bulbs can be planted until the ground freezes, according to University of Illinois Extension.

## When should I plant garlic in Massachusetts?

[UMass Extension''s garlic fact sheet](https://www.umass.edu/agriculture-food-environment/home-lawn-garden/fact-sheets/growing-garlic-getting-started) lists October as planting time. Getting cloves in the ground after a hard frost gives the crop a head start when growth resumes in spring. Early spring planting can still produce a decent crop, the fact sheet says.

The payoff comes the following summer. UMass Extension advises cutting off the young flower stalks, called scapes, in June so the plant puts more energy into the bulb. Harvest usually arrives in August, once about a third of the leaves have turned yellow or brown.

## How do I get the soil ready for garlic?

Garlic wants a sunny spot and soil that drains well. According to UMass Extension, the bed should have:

- At least 6 to 8 hours of direct sun
- Loose, deep, fertile soil with good drainage
- A soil pH between 6.5 and 7
- Plenty of organic matter, such as well-aged compost or a green manure crop tilled under in summer

The fact sheet recommends a soil test first and following its results for lime and fertilizer. Without a test, it suggests a balanced fertilizer such as 10-10-10 at 3 pounds per 100 square feet.

## How deep and how far apart do you plant garlic cloves?

UMass Extension lays out a simple routine:

1. Keep bulbs whole until planting day. Breaking them apart too early reduces the harvest.
2. Choose the largest, healthiest cloves. Big cloves grow big bulbs.
3. Set each clove about 1 inch deep with the pointed end up.
4. Space cloves 3 to 5 inches apart in double rows that are 6 to 8 inches apart, leaving 18 to 30 inches between beds.
5. After the ground freezes, cover the bed with 3 to 4 inches of straw.

The straw is not just for looks. It evens out temperature swings and keeps freeze-thaw cycles from heaving cloves out of the soil. Through spring, the plants need generous water and nitrogen while leaves develop, and the mulch helps hold moisture and hold back weeds.

## Should I grow hardneck or softneck garlic?

The two main types behave differently in the kitchen and in storage. Softneck garlic keeps much longer after harvest, according to UMass Extension. Hardneck types tend to have larger cloves that are easier to peel, and some have a stronger bite but store poorly.

For planting stock, it points to regional garlic festivals, local nurseries and farm supply stores, along with mail-order catalogs. Many growers also save their best bulbs from each harvest to replant the next fall.

## How deep should I plant tulips and daffodils?

Extension guidance lines up on a rule of thumb: plant a bulb about two and a half to three times as deep as it is tall. [University of Vermont Extension](https://www.uvm.edu/extension/news/selecting-and-planting-bulbs-fall) gives the example of a 2-inch bulb going into a 6-inch hole. [University of Illinois Extension](https://extension.illinois.edu/flowers/planting-bulbs) says large bulbs such as tulips and daffodils can go about 8 inches deep, while small bulbs need only 3 to 4 inches.

A few more pointers from extension services:

- Pick bulbs that are firm and free of mold, according to UVM Extension.
- Set them pointed end up, cover with soil and water them in.
- Choose a spot with full sun and excellent drainage, since soggy soil can rot bulbs while they are dormant, according to [Penn State Extension](https://extension.psu.edu/plant-bulbs-in-the-fall-for-a-spring-celebration). Beds under deciduous trees work because bulbs bloom before the trees leaf out.
- Add mulch after planting. UVM Extension says it holds moisture and softens the winter temperature swings that can heave bulbs to the surface.
- After flowers fade in spring, leave the green leaves in place so the bulb can store energy for next year, Penn State Extension advises.

## How do I keep squirrels, voles and deer from eating my bulbs?

Freshly planted bulbs are an easy meal. Chipmunks, squirrels, voles, mice and deer often go after them in late fall and winter when other food runs short, according to [UNH Extension](https://extension.unh.edu/node/3477). Tulips take the most damage, and crocus to a lesser degree.

UNH Extension suggests building cages from half-inch galvanized hardware cloth, setting the bulbs inside, and burying the cage at the normal planting depth. Repellents applied to the soil can help but need frequent reapplication, especially after rain. The same guidance notes that bone meal can draw rodents that dig up bulbs.

Some bulbs are rarely eaten. UNH Extension lists daffodils, snowdrops, glory-of-the-snow, Siberian squill, grape hyacinth and allium as usually safe without extra protection, though animals may still dig them up. Clemson Cooperative Extension notes that daffodils are poisonous, which is why deer tend to leave them alone, while tulips are a deer favorite.

## Frequently asked questions

### Is it too late to plant bulbs in November?

Usually not. University of Illinois Extension says most hardy spring bulbs can be planted until the ground is frozen.

### When should I mulch garlic?

Wait until the ground freezes, then spread 3 to 4 inches of straw over the bed, according to UMass Extension. The mulch limits temperature swings and frost heaving.

### When is garlic ready to harvest?

UMass Extension says garlic is ready when about one-third of the leaves are yellow or brown, typically in August. Cure the bulbs for about two weeks in a warm, dry, airy spot before storing them.

### Should I cut off garlic scapes?

Yes. Cutting the young scapes in June helps the plant build larger bulbs, according to UMass Extension.', dek = 'Extension experts say cloves and bulbs planted now, before the ground freezes, set up a summer garlic harvest and a spring flower show.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-f01466d2c46b7ca0', id, 'Growing Garlic: Getting Started', 'https://www.umass.edu/agriculture-food-environment/home-lawn-garden/fact-sheets/growing-garlic-getting-started', 'UMass Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.umass.edu/agriculture-food-environment/home-lawn-garden/fact-sheets/growing-garlic-getting-started');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-ba8dc88e61589a89', id, 'Selecting and planting bulbs this fall', 'https://www.uvm.edu/extension/news/selecting-and-planting-bulbs-fall', 'University of Vermont Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.uvm.edu/extension/news/selecting-and-planting-bulbs-fall');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-965900cc66b9d659', id, 'Planting Bulbs', 'https://extension.illinois.edu/flowers/planting-bulbs', 'University of Illinois Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://extension.illinois.edu/flowers/planting-bulbs');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-702256fde2cc2852', id, 'Plant Bulbs in the Fall for a Spring Celebration', 'https://extension.psu.edu/plant-bulbs-in-the-fall-for-a-spring-celebration', 'Penn State Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://extension.psu.edu/plant-bulbs-in-the-fall-for-a-spring-celebration');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-3c0aa0b916a252ba', id, 'How can I keep wildlife from eating my new bulbs?', 'https://extension.unh.edu/node/3477', 'UNH Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://extension.unh.edu/node/3477');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-de420ce706ee2e56', id, 'Planting Deer Resistant Fall Bulbs', 'https://hgic.clemson.edu/planting-deer-resistant-fall-bulbs/', 'Clemson Cooperative Extension (HGIC)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'plant-garlic-spring-bulbs-october-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://hgic.clemson.edu/planting-deer-resistant-fall-bulbs/');

-- real-id-tsa-confirmid-fee-holiday-flights-massachusetts
UPDATE stories SET body = 'Travelers who arrive at Logan International Airport, or any U.S. airport, for a domestic flight without a REAL ID, passport or other accepted ID must pay $45 for TSA ConfirmID, an identity check that covers 10 days of travel. The fee took effect Feb. 1, 2026, according to the Massachusetts Registry of Motor Vehicles, and a new REAL ID card can take about three weeks to arrive after an RMV appointment, so holiday flyers who need one should book soon.

## What is TSA ConfirmID and how much does it cost?

TSA ConfirmID is the fee-based identity verification process for people who reach the security checkpoint without an acceptable ID. It costs $45, covers a 10-day travel period and takes roughly 10 to 30 minutes, according to a [January 2026 RMV announcement](https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0).

Travel magazine Afar, in a [report updated Jan. 28](https://www.afar.com/magazine/new-tsa-rule-would-result-in-a-fine-for-not-having-a-real-id), described how the process works based on TSA''s announcement:

- The fee is paid online in advance, and travelers enter their travel start date, legal name, address and date of birth.
- A receipt is emailed and must be shown at the checkpoint, on paper or on a phone.
- One payment covers any number of flights within the 10-day window.
- The fee is nonrefundable, and paying it does not guarantee that a traveler''s identity will be verified. Those who cannot be verified may be turned away from the secure area.
- Travelers who wait to start the process at the checkpoint could face delays of 30 minutes or more.

Afar also reported TSA''s estimate that about 94% of travelers already use a compliant ID.

## Which IDs let me skip the $45 fee?

A Massachusetts REAL ID driver''s license or Mass ID works, as does a valid U.S. passport, according to the RMV. TSA''s full list of acceptable documents also includes a U.S. passport card, a trusted traveler card such as Global Entry, a permanent resident card and a Department of Defense ID, among others, as reported by Afar.

A Massachusetts REAL ID has a star in the top right corner; standard licenses do not, according to [Mass.gov''s REAL ID page](https://www.mass.gov/info-details/real-id-in-massachusetts). The temporary paper license issued while a new card is in the mail is not accepted by TSA.

More than 65% of Massachusetts residents, or over 3.67 million people, already hold a REAL ID, the RMV said in January.

## How do I get a REAL ID in Massachusetts?

A REAL ID requires an in-person visit. According to the RMV:

1. Start the application through the RMV Online Service Center, using a MyMassGov account.
2. Book an appointment at an RMV Service Center, or at an AAA Northeast branch if you are a member. Walk-ins are taken when slots are open.
3. Bring original or certified documents. Laminated documents are not accepted.

The documents required are:

- One proof of lawful presence in the U.S., such as a passport or birth certificate
- One proof of your full Social Security number, such as a Social Security card or W-2
- Two proofs of Massachusetts residency, such as a lease, mortgage statement or utility bill
- Legal proof of any name change, such as a marriage certificate, divorce decree or court order, if your name differs from your lawful-presence document

## How long does a REAL ID take, and what does it cost?

The card arrives by mail, typically within 10 to 14 business days, and the RMV recommends allowing about three weeks after the appointment. For travelers flying for Thanksgiving on Nov. 26, that leaves little margin.

RMV fees, as listed on Mass.gov:

- Driver''s license renewal, standard or REAL ID: $50
- Mass ID renewal: $25
- Upgrading to a REAL ID before your license expires: $25
- Replacing a REAL ID license or Mass ID: $25

Licenses can be renewed up to a year before the printed expiration date. People who already hold a REAL ID can usually renew online unless they have changed their name or have a limited-term REAL ID, the RMV says.

## What if my REAL ID won''t arrive before my flight?

A valid U.S. passport is accepted for domestic flights, so travelers who already have one can use it instead. Those without either document will need to go through ConfirmID and pay the $45 fee. Passports take far longer than a REAL ID: routine processing currently runs 4 to 6 weeks plus mailing time, according to the [State Department](https://travel.state.gov/en/passports/apply/help/processing-time.html).

"We want everyone to be able to get through airport security as quickly and smoothly as possible," Registrar of Motor Vehicles Colleen Ogilvie said in January, encouraging residents to check their ID before booking travel.

## Frequently asked questions

### How much is the TSA fee without a REAL ID?

$45. It covers identity verification for a 10-day travel period and has applied since Feb. 1, 2026.

### Is the TSA ConfirmID fee refundable?

No. The fee is nonrefundable and does not guarantee that a traveler''s identity will be verified, according to Afar''s reporting on TSA''s rules.

### Can I fly with the temporary paper license from the RMV?

No. Mass.gov says TSA does not accept the temporary paper REAL ID issued while the permanent card is being mailed.

### How can I tell if my license is a REAL ID?

Look for a star in the top right corner of a Massachusetts license or Mass ID. Standard cards do not have it.

### How long does it take to get a REAL ID in Massachusetts?

The card usually arrives in 10 to 14 business days after the RMV appointment. The RMV advises allowing about three weeks.', dek = 'Flyers without a REAL ID or passport pay $45 for TSA identity checks, and a new Massachusetts REAL ID can take about three weeks to arrive by mail.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'real-id-tsa-confirmid-fee-holiday-flights-massachusetts' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d21f3ed407aebdb8', id, 'MA RMV Reminds Residents that TSA Fees for Passengers without a REAL ID or Passport begin February 1', 'https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0', 'Massachusetts Registry of Motor Vehicles', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'real-id-tsa-confirmid-fee-holiday-flights-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/ma-rmv-reminds-residents-that-tsa-fees-for-passengers-without-a-real-id-or-passport-begin-february-1-0');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-dc98aa4750848b80', id, 'REAL ID in Massachusetts', 'https://www.mass.gov/info-details/real-id-in-massachusetts', 'Mass.gov / Massachusetts RMV', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'real-id-tsa-confirmid-fee-holiday-flights-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/real-id-in-massachusetts');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-27c8a94db8c7a1c7', id, 'Still Don''t Have a Real ID? You''ll Need to Pay a Fee to Get Through the Airport Starting in February', 'https://www.afar.com/magazine/new-tsa-rule-would-result-in-a-fine-for-not-having-a-real-id', 'Afar', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'real-id-tsa-confirmid-fee-holiday-flights-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.afar.com/magazine/new-tsa-rule-would-result-in-a-fine-for-not-having-a-real-id');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-05e55d4450d6e28f', id, 'Processing Times for U.S. Passports', 'https://travel.state.gov/en/passports/apply/help/processing-time.html', 'U.S. Department of State', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'real-id-tsa-confirmid-fee-holiday-flights-massachusetts' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://travel.state.gov/en/passports/apply/help/processing-time.html');

-- september-2026-jobs-report-massachusetts-unemployment-masshire-help
UPDATE stories SET body = 'Massachusetts employers added 3,500 jobs in September and the state''s unemployment rate held at 4.3%, according to preliminary figures released Oct. 16 by the state''s Executive Office of Labor and Workforce Development. Nationally, hiring nearly stalled: U.S. payrolls grew by just 29,000 and the jobless rate was 4.2%, the U.S. Bureau of Labor Statistics reported Oct. 2. For people looking for work, the state''s free MassHire Career Centers remain the main place to get hands-on help.

## What did the September 2026 jobs report show?

The [BLS Employment Situation report for September](https://www.bls.gov/news.release/archives/empsit_10022026.htm) described employment as little changed over the month. Some key numbers:

- **29,000** jobs added nationwide in September.
- **4.2%** national unemployment rate, with about 7.1 million people out of work.
- **61.8%** labor force participation rate.
- Average hourly pay for private-sector workers reached $37.81, up 3.0% from a year earlier.

Health care (+17,000), construction (+11,000) and manufacturing (+9,000) led the gains, according to the BLS. Financial activities lost about 7,000 jobs, and nursing and residential care facilities shed about 9,000 within the broader health care category.

Earlier months also looked weaker on a second look. The BLS revised July from a gain of 21,000 to a loss of 10,000, and trimmed August from 162,000 to 133,000. Together, the two months came in 60,000 jobs lower than first reported.

## How is the Massachusetts job market doing?

The state''s picture was somewhat brighter. According to the [Executive Office of Labor and Workforce Development''s September release](https://www.mass.gov/news/massachusetts-gains-jobs-labor-force-continues-to-grow-in-september), Massachusetts:

- Added 3,500 payroll jobs in September, after a revised loss of 5,600 in August.
- Kept its unemployment rate at 4.3%, slightly above the national rate.
- Saw labor force participation rise to 65.4%, which is 3.6 percentage points above the U.S. rate.
- Grew its labor force by 8,400, with 7,800 more residents working and 600 more unemployed.

Financial activities (+2,500), professional and business services (+2,400) and trade, transportation and utilities (+2,000) posted the largest monthly gains. Over the year since September 2025, the state has added 16,300 payroll jobs, 13,000 of them in the private sector.

Mark Rembert, chief economist at the agency''s Department of Economic Research, pointed to "several positive labor market signals" in September, noting that the labor force posted its biggest one-month increase in more than two years.

## Why are people staying unemployed longer?

Long job searches are a growing concern. The BLS counted 1.9 million long-term unemployed in September, meaning people who had been looking for work for 27 weeks or more. That group made up 27.1% of everyone unemployed, or more than one in four job seekers nationwide.

A slow-hiring market tends to stretch out searches even when layoffs stay modest. That makes structured help, like resume reviews, training leads and employer introductions, more useful the longer a search runs.

## What free help does MassHire offer Massachusetts job seekers?

The [MassHire Department of Career Services](https://www.mass.gov/orgs/masshire-department-of-career-services) says the state has more than 25 career centers. Its [locations directory](https://www.mass.gov/orgs/masshire-department-of-career-services/locations) lists 28 sites, including the MassHire Downtown Boston Career Center at 75 Federal St. and the MassHire Boston ABCD Career Center at 10 Malcolm X Blvd. in Roxbury.

Services at the centers include:

- One-on-one job search and career planning help.
- Workshops on resumes, interviewing and career planning.
- Information on training and education programs.
- State and local labor market data.
- Hiring events where job seekers can meet employers, many of which require a free JobQuest account, according to the state''s [hiring events page](https://www.mass.gov/hiring-events-in-massachusetts).
- Dedicated career services for veterans and resources for young and early-career workers.

The department''s main line is (617) 626-5300, weekdays from 8:30 a.m. to 4:30 p.m.

## How do I get started with MassHire JobQuest?

[MassHire JobQuest](https://www.mass.gov/find-your-next-job-with-masshire-jobquest) is the state''s online job board and the front door to many career center services. Getting set up takes three steps:

1. Create a MyMassGov account.
2. Log in to JobQuest with that account.
3. Fill out your profile with your career goals and background so the system can suggest jobs and next steps.

From there, users can search openings statewide, apply online and register for workshops and in-person hiring events.

## What if I just lost my job?

Workers who were recently laid off can apply for unemployment insurance online through an Unemployment Services for Workers account on MyMassGov, or by phone through the Department of Unemployment Assistance TeleClaim Center at (877) 626-6800, Monday through Thursday, 8:30 a.m. to 4:30 p.m., according to the [state''s filing instructions](https://www.mass.gov/how-to/file-for-unemployment-benefits). Applicants should have their work history for recent employers ready and must request benefits each week, starting the week after they apply.

Some claimants are picked for the state''s [Reemployment Services and Eligibility Assessment program, known as RESEA](https://www.mass.gov/info-details/reemployment-services-and-eligibility-assessment-resea). Those selected must complete its steps to keep receiving benefits: a Career Center Seminar by the deadline in their letter, followed by two one-on-one meetings with a RESEA specialist.

## Frequently asked questions

### What is the Massachusetts unemployment rate for September 2026?

The preliminary rate was 4.3%, unchanged from August, according to the Executive Office of Labor and Workforce Development. The national rate for September was 4.2%.

### When is the next jobs report?

The BLS is scheduled to release October national figures on Friday, Nov. 6, at 8:30 a.m. Eastern. Massachusetts plans to release its October numbers on Friday, Nov. 20.

### Are MassHire career center services free?

Yes. MassHire Career Centers offer job search help, workshops, training information and hiring events at no cost to job seekers.

### Do I need a JobQuest account to use MassHire?

Many services, including workshop sign-ups and a number of hiring events, require a free JobQuest account, which is created through MyMassGov. Job seekers can also call or visit a local career center for help getting started.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-81aab286515cbe89', id, 'The Employment Situation - September 2026', 'https://www.bls.gov/news.release/archives/empsit_10022026.htm', 'U.S. Bureau of Labor Statistics', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.bls.gov/news.release/archives/empsit_10022026.htm');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-5ce197a5cfd1773b', id, 'Massachusetts Gains Jobs, Labor Force Continues to Grow in September', 'https://www.mass.gov/news/massachusetts-gains-jobs-labor-force-continues-to-grow-in-september', 'Massachusetts Executive Office of Labor and Workforce Development', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/massachusetts-gains-jobs-labor-force-continues-to-grow-in-september');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-7652629aca95c71d', id, 'MassHire Department of Career Services', 'https://www.mass.gov/orgs/masshire-department-of-career-services', 'Commonwealth of Massachusetts', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/orgs/masshire-department-of-career-services');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-b57c6dc2fa118cfe', id, 'MassHire Department of Career Services Locations', 'https://www.mass.gov/orgs/masshire-department-of-career-services/locations', 'Commonwealth of Massachusetts', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/orgs/masshire-department-of-career-services/locations');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-9108d39237ce6127', id, 'Find your next job with MassHire JobQuest', 'https://www.mass.gov/find-your-next-job-with-masshire-jobquest', 'MassHire Department of Career Services', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/find-your-next-job-with-masshire-jobquest');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-09b7064ccfaf945b', id, 'Hiring events in Massachusetts', 'https://www.mass.gov/hiring-events-in-massachusetts', 'MassHire Department of Career Services', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/hiring-events-in-massachusetts');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-6b9a2243a143f207', id, 'Apply for unemployment insurance benefits', 'https://www.mass.gov/how-to/file-for-unemployment-benefits', 'Massachusetts Department of Unemployment Assistance', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/how-to/file-for-unemployment-benefits');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-cb2775425bd1ca58', id, 'Reemployment Services and Eligibility Assessment (RESEA)', 'https://www.mass.gov/info-details/reemployment-services-and-eligibility-assessment-resea', 'MassHire Department of Career Services', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'september-2026-jobs-report-massachusetts-unemployment-masshire-help' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/info-details/reemployment-services-and-eligibility-assessment-resea');

-- spotted-lanternfly-egg-masses-massachusetts-fall-winter
UPDATE stories SET body = 'Spotted lanternflies are laying eggs across Massachusetts now, and state agriculture officials want residents to scrape off and destroy every egg mass they can reach this fall and winter. The invasive insect has been confirmed in more than 145 cities and towns, according to a Sept. 9 release from the Massachusetts Department of Agricultural Resources, and each egg mass can hold 30 to 50 eggs that will hatch next spring.

## What do spotted lanternfly egg masses look like?

MDAR describes them as flat, gray or beige patches about an inch long that often look like a smear of mud, in its [Sept. 9 release](https://www.mass.gov/news/state-agricultural-officials-urge-residents-to-help-limit-spread-of-spotted-lanternfly-across-massachusetts). They can turn up on almost any flat outdoor surface: tree trunks, fences, stone, outdoor furniture and vehicles.

Their look changes with age, according to [UMass Amherst''s fact sheet](https://www.umass.edu/agriculture-food-environment/landscape/fact-sheets/spotted-lanternfly):

- **Fresh** masses have a whitish coating.
- **Older** masses turn grayish-brown, then crack and resemble dried mud.
- **Very old** masses show rows of brown, seed-like eggs in vertical columns.

UMass notes that the masses can be mistaken for those of the spongy moth, a different insect.

## When do spotted lanternflies lay eggs in Massachusetts?

Egg-laying starts in September and can continue through late November or early December, according to UMass Extension, which bases its timing on Pennsylvania observations. Researchers there estimate each female lays at least two masses per season.

Adults die off after a hard frost, but the eggs survive the winter. Nymphs begin hatching in May, and new adults appear in July, UMass says. Penn State Extension says winter through early spring is the best time to find and destroy egg masses.

## How do I destroy spotted lanternfly egg masses?

[Penn State Extension](https://extension.psu.edu/how-to-remove-spotted-lanternfly-eggs) recommends this method:

1. Hold a scraper card firmly against the egg mass.
2. Press down and scrape until you hear the eggs pop and see fluid. Eggs that are not crushed can still hatch.
3. Scrape the eggs into a bag containing rubbing alcohol or hand sanitizer, making sure they touch the liquid.
4. Seal the bag, double-bag it and put it in the trash.

Do not climb a ladder to reach masses high on trees, Penn State advises.

## Where is spotted lanternfly in Massachusetts?

The first established population in Massachusetts was found in Fitchburg in 2021, according to UMass. MDAR''s Sept. 9 release said the insect had been confirmed in every region of the state except Cape Cod and the Islands, including already infested areas around Springfield, Worcester and Attleboro.

Days later, MDAR environmental biologist Jennifer Forman Orth told [GBH News](https://www.wgbh.org/news/local/2026-09-14/spotted-lanternfly-is-here-to-stay-mass-officials-say) the count had passed 150 cities and towns. She said wiping out an insect that can fly would be "challenging," so the state is focused on slowing its spread and protecting crops. GBH reported that no infestation had been confirmed in New Hampshire or Vermont as of Sept. 14.

## Should I report a spotted lanternfly in Massachusetts?

It depends on where you live. MDAR asks residents to check the state''s distribution map, linked from its [spotted lanternfly page](https://www.mass.gov/spotted-lanternfly), before filing a report.

- **In infested areas,** especially around Springfield, Worcester and Attleboro, reporting is optional.
- **In towns without confirmed infestations,** take a photo and report the sighting at mass.gov/slf. GBH noted that includes much of Berkshire and Franklin counties.

To slow the spread, MDAR also recommends:

- Inspecting your car before leaving an infested area. Egg masses can ride on vehicles over long distances, GBH reported.
- Checking items stored outdoors, such as stone, lawn furniture, RVs and play sets, before moving them. UMass says egg masses on these items pose the greatest risk of spreading the insect.
- Removing tree-of-heaven, the lanternfly''s preferred host plant.

MDAR''s [homeowner management guide](https://www.mass.gov/lists/spotted-lanternfly-management-guide-for-homeowners-in-infested-areas) is available in English and 10 other languages, including Spanish, Portuguese, Haitian Creole, Chinese and Vietnamese.

## Is spotted lanternfly harmful?

Not to people or pets. The insects do not bite or sting, MDAR says. They feed on sap from more than 100 kinds of plants and can seriously damage grapevines, tree-of-heaven and young black walnut trees. Their sticky waste, called honeydew, can coat decks and cars, encourage sooty mold and attract bees, wasps and ants. UMass researcher Elise Petit told GBH that feeding can reduce grape yields and harm vines over time.

## Frequently asked questions

### How many eggs are in a spotted lanternfly egg mass?

About 30 to 50, according to Penn State and UMass extension specialists.

### Do spotted lanternfly eggs survive a Massachusetts winter?

Yes. Freezing weather kills the adults, but egg masses overwinter and hatch in spring, starting around May.

### Is it safe to just smash an egg mass?

Crushing helps, but Penn State says eggs that are not fully crushed can survive. Scraping them into a bag with rubbing alcohol or hand sanitizer is more reliable.

### Do I need to report spotted lanternfly in Worcester or Springfield?

No. MDAR says reporting is optional in already infested areas around Springfield, Worcester and Attleboro. Reports are still requested from towns where the insect has not been confirmed.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d312e1cdff0e9a01', id, 'State Agricultural Officials Urge Residents to Help Limit Spread of Spotted Lanternfly Across Massachusetts', 'https://www.mass.gov/news/state-agricultural-officials-urge-residents-to-help-limit-spread-of-spotted-lanternfly-across-massachusetts', 'Massachusetts Department of Agricultural Resources', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/news/state-agricultural-officials-urge-residents-to-help-limit-spread-of-spotted-lanternfly-across-massachusetts');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-9517bf9a37508a6f', id, 'Spotted Lanternfly', 'https://www.mass.gov/spotted-lanternfly', 'Commonwealth of Massachusetts', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/spotted-lanternfly');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-cada67c93758f1b7', id, 'Spotted Lanternfly Management Guide for Homeowners in Infested Areas', 'https://www.mass.gov/lists/spotted-lanternfly-management-guide-for-homeowners-in-infested-areas', 'Massachusetts Department of Agricultural Resources', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/lists/spotted-lanternfly-management-guide-for-homeowners-in-infested-areas');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-9daff8b20631b799', id, 'Spotted lanternfly is here to stay, Mass. officials say', 'https://www.wgbh.org/news/local/2026-09-14/spotted-lanternfly-is-here-to-stay-mass-officials-say', 'GBH News / New England Public Media', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.wgbh.org/news/local/2026-09-14/spotted-lanternfly-is-here-to-stay-mass-officials-say');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-aae486a287117ad4', id, 'Spotted Lanternfly fact sheet', 'https://www.umass.edu/agriculture-food-environment/landscape/fact-sheets/spotted-lanternfly', 'UMass Amherst Center for Agriculture, Food, and the Environment', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.umass.edu/agriculture-food-environment/landscape/fact-sheets/spotted-lanternfly');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-c8487cfbd7f67f77', id, 'How to Remove Spotted Lanternfly Eggs', 'https://extension.psu.edu/how-to-remove-spotted-lanternfly-eggs', 'Penn State Extension', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'spotted-lanternfly-egg-masses-massachusetts-fall-winter' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://extension.psu.edu/how-to-remove-spotted-lanternfly-eggs');

-- stay-active-winter-cdc-physical-activity-guidelines
UPDATE stories SET body = 'Adults need at least 150 minutes of moderate activity a week, such as brisk walking, plus muscle-strengthening work on two or more days, according to the Centers for Disease Control and Prevention. That target does not change when New England gets dark at dinnertime and icy underfoot. The weekly total can be split into short sessions, and the CDC says some activity is better than none.

## How much exercise do adults need each week?

The [CDC''s adult activity guidelines](https://www.cdc.gov/physical-activity-basics/guidelines/adults.html) call for one of the following each week:

- **150 minutes** of moderate-intensity aerobic activity, such as brisk walking, or
- **75 minutes** of vigorous-intensity aerobic activity, such as jogging or running, or
- An equivalent mix of the two

On top of that, adults should do muscle-strengthening activity on at least **two days** a week that works the legs, hips, back, abdomen, chest, shoulders and arms.

More activity brings more benefits. The federal [Physical Activity Guidelines for Americans](https://odphp.health.gov/sites/default/files/2019-10/PAG_ExecutiveSummary.pdf), published by the U.S. Department of Health and Human Services, put the range for substantial benefits at 150 to 300 minutes of moderate activity a week and urge adults to "move more and sit less." Older adults should follow the same targets where they can and add activities that include balance training, according to the guidelines.

## How can I tell if a workout is moderate or vigorous?

The CDC''s [talk test](https://www.cdc.gov/physical-activity-basics/measuring/index.html) is a quick check that needs no equipment:

- **Moderate:** You can talk but not sing.
- **Vigorous:** You cannot say more than a few words without stopping for a breath.

Moderate examples on the CDC''s list include walking at 2.5 mph or faster, water aerobics, ballroom or line dancing, and general yard and home repair work. Vigorous examples include jogging, swimming laps, jumping rope and heavy yard work such as digging or shoveling when it raises your heart rate. For Massachusetts residents, that means a stretch of hard snow shoveling can count toward the weekly total.

## How do I fit in exercise when it''s dark and cold?

The CDC''s tips for [adding physical activity](https://www.cdc.gov/physical-activity-basics/adding-adults/index.html) work well in winter:

1. **Break it up.** 150 minutes can be 30 minutes a day, five days a week.
2. **Pick activities you enjoy** and that match your abilities, so you stick with them.
3. **Plan the week.** The CDC points to its Move Your Way activity planner and a printable physical activity diary for setting goals and tracking progress.
4. **Mix it up.** One CDC sample week pairs three 30-minute brisk walks with two 15-minute jogs and two days of weight training, which meets the guideline.

Short indoor sessions on stormy days, a lunchtime walk while the sun is up, and strength work at home all add to the total.

## How do I exercise outside safely in winter?

Cold-weather workouts carry real risks, and the CDC''s [hypothermia prevention guidance](https://www.cdc.gov/winter-weather/prevention/index.html) is the place to start:

- **Dress in layers.** Wear several loose layers, a water-resistant coat and boots, a hat, gloves or mittens, and a scarf or knit mask over the face and mouth.
- **Stay dry.** Hypothermia can happen even above 40°F if you get chilled by rain, sweat or cold water, the CDC says, so change out of damp clothes quickly.
- **Know the warning signs.** In adults these include shivering, exhaustion, confusion, fumbling hands, memory loss, slurred speech and drowsiness. The CDC calls hypothermia a medical emergency.
- **Stay in on extreme days.** The CDC advises staying indoors when it is extremely cold.

Wind makes it worse. The [National Weather Service](https://www.weather.gov/bou/windchill) says that at a wind chill near minus 25°F, frostbite is possible within 15 minutes on exposed skin, most often on the fingers, toes, nose and ears. Checking the wind chill before heading out can help decide how to dress or whether to move the workout inside.

## Should I talk to a doctor before starting to exercise?

For most people, moderate activity like walking is safe, according to the CDC. But the agency advises talking with a doctor about the right type and amount of activity if you have a chronic condition such as heart disease, arthritis or diabetes. It also recommends checking with a doctor before starting vigorous activity if you have been inactive, have a disability or have overweight.

The federal guidelines add a general rule: choose activities that fit your current fitness level and build up gradually.

## Frequently asked questions

### How many minutes of exercise do adults need per week?

The CDC recommends 150 minutes of moderate activity or 75 minutes of vigorous activity a week, plus muscle-strengthening activity on at least two days.

### Does shoveling snow count as exercise?

Yes. The CDC lists heavy yard work such as shoveling as vigorous activity when it raises your heart rate.

### Can I split my exercise into short sessions?

Yes. The CDC says the weekly total can be spread out, such as 30 minutes a day on five days, and that some activity is better than none.

### Can you get hypothermia exercising in cool weather?

Yes. The CDC says hypothermia can occur above 40°F if you are chilled by rain, sweat or cold water. Dress in layers and change out of wet clothing.

### What is the talk test?

It is the CDC''s simple intensity check: if you can talk but not sing, the activity is moderate; if you can only say a few words before pausing for breath, it is vigorous.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-9bc495e0d3402195', id, 'Adult Activity: An Overview', 'https://www.cdc.gov/physical-activity-basics/guidelines/adults.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/physical-activity-basics/guidelines/adults.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-10813818d96e1b3b', id, 'Adding Physical Activity as an Adult', 'https://www.cdc.gov/physical-activity-basics/adding-adults/index.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/physical-activity-basics/adding-adults/index.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-36936c28bf3b5ea3', id, 'How to Measure Physical Activity Intensity', 'https://www.cdc.gov/physical-activity-basics/measuring/index.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/physical-activity-basics/measuring/index.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-43d7cd6211b7f3a7', id, 'Preventing Hypothermia', 'https://www.cdc.gov/winter-weather/prevention/index.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/winter-weather/prevention/index.html');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-d41346d7a9edcd27', id, 'Physical Activity Guidelines for Americans, 2nd edition: Executive Summary', 'https://odphp.health.gov/sites/default/files/2019-10/PAG_ExecutiveSummary.pdf', 'U.S. Department of Health and Human Services (ODPHP)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://odphp.health.gov/sites/default/files/2019-10/PAG_ExecutiveSummary.pdf');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-484f803617b8471a', id, 'Wind Chill', 'https://www.weather.gov/bou/windchill', 'National Weather Service (Boulder office)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'stay-active-winter-cdc-physical-activity-guidelines' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.weather.gov/bou/windchill');

-- thanksgiving-2026-turkey-thawing-times-usda-food-safety-guide
UPDATE stories SET body = 'Thanksgiving is Thursday, Nov. 26, and a frozen turkey thawing in the refrigerator needs about 24 hours for every 4 to 5 pounds, according to the U.S. Department of Agriculture. That means a 20-pound bird should be in the fridge by Saturday, Nov. 21, and a bigger one by Friday, Nov. 20.

## When should I start thawing my turkey for Thanksgiving 2026?

The USDA''s [turkey roasting guide](https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/poultry/lets-talk-turkey-roasting) lists these refrigerator thawing times at 40 degrees or colder. The start dates are Boston Daily''s count back from Thursday, using the longer end of each range:

| Turkey weight | Refrigerator thawing time | Put it in the fridge by |
|---|---|---|
| 4 to 12 pounds | 1 to 3 days | Monday, Nov. 23 |
| 12 to 16 pounds | 3 to 4 days | Sunday, Nov. 22 |
| 16 to 20 pounds | 4 to 5 days | Saturday, Nov. 21 |
| 20 to 24 pounds | 5 to 6 days | Friday, Nov. 20 |

Starting a day early is fine. A turkey thawed in the refrigerator keeps for one to two more days before cooking, the USDA says. Leave it in its original wrapper and set it on a tray or pan to catch drips.

## How long does it take to thaw a 20-pound turkey?

In the refrigerator, four to five days. In cold water, it is much faster: about 30 minutes per pound, or eight to 10 hours for a 16- to 20-pound bird, according to the USDA.

To use the cold-water method:

1. Make sure the turkey is wrapped so water cannot get in. The CDC suggests a leakproof bag.
2. Submerge it completely in cold tap water.
3. Change the water every 30 minutes.
4. Cook the turkey right away once it is thawed. Do not refreeze it first.

Microwave thawing works for smaller birds. Check the owner''s manual for size limits and settings, remove all wrapping, and cook the turkey immediately afterward.

## Can I thaw a turkey on the counter, in the garage or in a snowbank?

No. The USDA says thawing on the kitchen counter or in a garage is the most common misconception callers raise with its hotline. Once a frozen bird sits out for more than two hours, its outer layer can enter the "danger zone" of 40 to 140 degrees, where bacteria multiply quickly, even while the center is still frozen.

The [CDC''s holiday turkey guidance](https://www.cdc.gov/food-safety/foods/holiday-turkey.html) also warns against storing a frozen turkey anywhere you cannot monitor the temperature, naming a car trunk, basement, back porch and snow. Keep it in a freezer at 0 degrees or below until you are ready to thaw it.

## What temperature does a turkey need to reach?

The whole bird needs to reach 165 degrees, measured with a food thermometer, the USDA says. Check three spots without touching bone: the thickest part of the breast, the innermost part of the thigh and the innermost part of the wing. A pop-up timer should not be your only check.

Other cooking guidance from the USDA and CDC:

- Roast at 325 degrees or higher, on a rack in a shallow pan.
- An unstuffed 14- to 18-pound turkey takes about 3¾ to 4¼ hours at 325 degrees. A 20- to 24-pound bird takes about 4½ to 5 hours.
- A turkey still frozen when it goes in the oven takes at least 50% longer.
- Let it rest 20 minutes before carving.
- The USDA recommends baking stuffing in a separate dish. Stuffing cooked inside the bird must also reach 165 degrees in the center.

Skip rinsing the raw turkey. Federal agencies have advised against it since 2005 because it can spread germs, the CDC says, yet 78% of people in a 2020 survey said they washed or rinsed their turkey. In a USDA study, 1 in 7 people still had germs in their sink after cleaning it.

## How long are Thanksgiving leftovers safe?

Refrigerate leftovers within two hours of cooking, or within one hour if they were exposed to temperatures above 90 degrees, according to the CDC and USDA. Cut the meat into smaller portions and store it in shallow covered containers so it cools quickly.

Eat refrigerated leftovers within three to four days, and reheat them to 165 degrees. Frozen leftovers have the best quality within two to six months.

The timing matters. Clostridium perfringens, a germ that grows in cooked food left at room temperature, is the second most common bacterial cause of food poisoning, and its outbreaks occur most often in November and December, the CDC says.

Questions can go to the [USDA](https://www.usda.gov/node/55388) Meat and Poultry Hotline at 1-888-674-6854, open 10 a.m. to 6 p.m. Eastern time, Monday through Friday, or by email at mphotline@usda.gov.

## Frequently asked questions

### How long does it take to thaw a 15-pound turkey?

About three to four days in the refrigerator, according to the USDA''s chart for 12- to 16-pound birds. In cold water, plan on roughly 7½ hours at 30 minutes per pound.

### Can I cook a turkey that is still frozen?

Yes. The USDA says it is safe, but cooking will take at least 50% longer than for a fully thawed bird.

### Can I refreeze a thawed turkey?

A turkey thawed in the refrigerator can be refrozen, the USDA says. One thawed in cold water or the microwave should be cooked first.

### Should I wash my turkey before cooking it?

No. Federal health agencies advise against rinsing raw turkey because the splashing can spread germs around the sink and kitchen.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'thanksgiving-2026-turkey-thawing-times-usda-food-safety-guide' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-151873b679cb68bd', id, 'Let''s Talk Turkey: A Consumer Guide to Safely Roasting a Turkey', 'https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/poultry/lets-talk-turkey-roasting', 'USDA Food Safety and Inspection Service', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'thanksgiving-2026-turkey-thawing-times-usda-food-safety-guide' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.fsis.usda.gov/food-safety/safe-food-handling-and-preparation/poultry/lets-talk-turkey-roasting');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-01f16215eaa39738', id, 'Thaw Your Turkey Safely in Time for Thanksgiving', 'https://www.usda.gov/node/55388', 'U.S. Department of Agriculture', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'thanksgiving-2026-turkey-thawing-times-usda-food-safety-guide' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.usda.gov/node/55388');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-c4e2d4a53ae9b252', id, 'Preparing Your Holiday Turkey Safely', 'https://www.cdc.gov/food-safety/foods/holiday-turkey.html', 'Centers for Disease Control and Prevention', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'thanksgiving-2026-turkey-thawing-times-usda-food-safety-guide' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.cdc.gov/food-safety/foods/holiday-turkey.html');

-- winter-car-prep-checklist-nhtsa-new-england
UPDATE stories SET body = 'Before the first snow, federal safety regulators say drivers should check four things: tires, battery, wipers and an emergency kit. The National Highway Traffic Safety Administration''s checklist calls for tires with at least 2/32 of an inch of tread, a mechanic''s look at the battery and charging system, winter washer fluid with de-icer, and a stocked kit in the trunk.

## How do I get my car ready for winter?

[NHTSA''s winter driving tips](https://www.nhtsa.gov/winter-driving-tips) start with a basic service visit. The agency suggests having a mechanic check:

- The battery, charging system and belts
- The cooling system, including coolant that meets the automaker''s specifications; old coolant should be tested and drained or replaced

Cold weather makes a gas or diesel engine draw more power from the battery to start, according to NHTSA, so a weak battery is more likely to fail on a frigid morning.

NHTSA also recommends looking up open recalls with its Recalls Look-up Tool, which uses your vehicle identification number (VIN) to show any unrepaired safety defect and how to get it fixed for free.

## How much tread and air pressure do winter tires need?

NHTSA says every tire, including the spare, should have at least **2/32 of an inch** of tread, with no cuts or bulges in the sidewalls. Some manufacturers recommend replacing tires every six years no matter how much they have been driven, the agency notes.

Pressure matters as much as tread. Tire pressure drops as temperatures fall, so NHTSA advises checking at least once a month and before long trips. Use the pressure the automaker recommends, found on a label in the driver''s door frame and in the owner''s manual, not the maximum number molded into the tire. Check it when the tires are cold, meaning the car has been parked for at least three hours.

## What should I check for visibility and inside the car?

- **Wipers and fluid:** Fill the reservoir with winter washer fluid that contains de-icer, and replace worn wiper blades, NHTSA says.
- **Lights:** Check all exterior lights before the season starts. The Massachusetts Department of Transportation advises keeping headlights on at all times in winter weather.
- **Floor mats:** Use mats sized for your vehicle and secure them with retention clips so they cannot slide forward and jam the pedals.
- **Fuel:** NHTSA suggests keeping the tank close to full when possible.

Before pulling out, MassDOT''s [safe winter driving tips](https://www.mass.gov/service-details/safe-winter-driving-tips) say to clear snow and ice from the windows, lights, hood and roof.

## Do electric cars and hybrids need anything different?

Yes. NHTSA says cold can cut an electric vehicle''s driving range, and plugging in overnight helps keep the battery in its best temperature range.

Federal testing gives a sense of the size of the hit. According to the U.S. Department of Energy''s [fueleconomy.gov](https://fueleconomy.gov/FEG/coldweather.shtml), at 20°F compared with 77°F:

- A gas car''s city fuel economy drops about 15%, and as much as 24% on short trips of 3 to 4 miles.
- Hybrids lose roughly 30% to 34%.
- Electric vehicles lose about 41% of their range in mixed city and highway driving, with about two-thirds of the extra energy going to heating the cabin.

The site suggests EV and plug-in hybrid drivers preheat the cabin while still plugged in and use seat warmers instead of the cabin heater to stretch range. For gas cars, it notes most automakers recommend driving off gently after about 30 seconds rather than idling to warm up.

## What goes in a winter car emergency kit?

NHTSA''s list includes:

1. A snow shovel, broom and ice scraper
2. Sand or cat litter for traction
3. Jumper cables
4. A flashlight
5. Flares or emergency markers
6. A first aid kit
7. Blankets
8. A cellphone and charger
9. Water, food and any medicine you need

A Massachusetts [winter emergency car kit checklist](https://www.mass.gov/doc/winter-emergency-car-kit-0/download) posted on Mass.gov adds extra clothing such as boots, mittens and socks, high-calorie non-perishable food, basic tools, a tow rope, and a brightly colored cloth to use as a flag.

## What should I do if I get stranded in snow?

Stay with the vehicle, NHTSA advises. Tie bright markers to the antenna or windows and keep the dome light on so rescuers can spot you.

Carbon monoxide is the hidden danger. Keep the exhaust pipe clear of snow, and run the engine only now and then to warm up, never for long stretches with the windows closed or in an enclosed space.

MassDOT also urges drivers to tell someone their destination, route and expected arrival time, stay on main roads, and call 511 for road conditions. On the highway, it says to stay at least 200 feet behind plows and never pass them on the right.

## How should kids ride in car seats in winter?

Bulky coats can keep a car-seat harness from fitting snugly, according to NHTSA. Dress children in thin, warm layers, buckle the harness tight, then put a blanket or the coat over them on top of the straps.

## Frequently asked questions

### How much tread do I need for winter driving?

NHTSA says tires should have at least 2/32 of an inch of tread. Check the spare too, along with the sidewalls for cuts or bulges.

### Should I inflate tires to the number on the tire?

No. Use the automaker''s recommended pressure, listed on the driver''s door-frame label and in the owner''s manual, NHTSA says. The number on the tire is the maximum, not the target.

### Is it safe to run the engine to stay warm if I''m stuck?

Only briefly, and only with the exhaust pipe clear of snow, according to NHTSA. A blocked tailpipe can send carbon monoxide into the car.

### How much range do electric cars lose in the cold?

Federal testing cited by fueleconomy.gov found EV range dropped about 41% at 20°F compared with 77°F in mixed driving. Preheating while plugged in and using seat warmers can help.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'winter-car-prep-checklist-nhtsa-new-england' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-87282d1b9b74f0f7', id, 'Winter Weather Driving Tips: Prepare Your Vehicle', 'https://www.nhtsa.gov/winter-driving-tips', 'National Highway Traffic Safety Administration', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-car-prep-checklist-nhtsa-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.nhtsa.gov/winter-driving-tips');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-331dadecb77be5b6', id, 'Safe winter driving tips', 'https://www.mass.gov/service-details/safe-winter-driving-tips', 'Massachusetts Department of Transportation (Mass.gov)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-car-prep-checklist-nhtsa-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/service-details/safe-winter-driving-tips');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-3249cc17350f7d67', id, 'Fuel Economy in Cold Weather', 'https://fueleconomy.gov/FEG/coldweather.shtml', 'U.S. Department of Energy / fueleconomy.gov', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-car-prep-checklist-nhtsa-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://fueleconomy.gov/FEG/coldweather.shtml');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-eb77b40a6e6081c3', id, 'Winter emergency car kit', 'https://www.mass.gov/doc/winter-emergency-car-kit-0/download', 'Mass.gov (issuing agency not named on the document)', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-car-prep-checklist-nhtsa-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.mass.gov/doc/winter-emergency-car-kit-0/download');

-- winter-dry-skin-dermatologist-tips-new-england
UPDATE stories SET body = 'Once the heat comes on in New England homes, dry, itchy skin usually follows. The American Academy of Dermatology''s advice is simple: keep showers to 5 to 10 minutes in warm water, put on a thick, fragrance-free cream or ointment while skin is still damp, and run a humidifier where you sleep. If dryness does not improve with home care, the group recommends seeing a board-certified dermatologist.

## Why does skin get so dry in winter?

Indoor heat is a big part of it. Mayo Clinic lists central heating, wood stoves, space heaters and fireplaces among the causes of dry skin because they lower the humidity indoors. Cold, harsh weather, long hot showers, bathing more than once a day and strong soaps and detergents add to the problem, according to [Mayo Clinic''s dry skin overview](https://mayoclinic.org/diseases-conditions/dry-skin/symptoms-causes/syc-20353885).

Some people are more prone to it. Mayo Clinic says the risk is higher for people over 40, people who live in low-humidity climates, and workers whose hands are often wet or exposed to harsh soap, such as nurses and hairstylists.

Signs include a tight feeling, rough or flaking skin, itching, and cracks that can bleed. On brown and Black skin, dryness may look ashy or grayish rather than red, Mayo Clinic notes.

## How should I shower or bathe when my skin is dry?

The AAD''s [tips for relieving dry skin](https://www.aad.org/public/everyday-care/skin-care-basics/dry/dermatologists-tips-relieve-dry-skin), updated in January 2026, include:

- **Keep it short.** Limit baths and showers to 5 to 10 minutes.
- **Use warm, not hot, water.**
- **Close the bathroom door** to hold in humidity.
- **Go easy on soap.** Use a gentle cleanser only where needed, without building up a thick lather.
- **Pat, don''t rub.** Dry off gently with a clean towel.
- **Shave last.** Skin and hair are softer at the end of a shower.

In a [cold-weather release](https://www.aad.org/news/cold-weather-and-your-skin), the AAD also warns that antibacterial, deodorant and scented soaps can be too harsh for dry, sensitive skin.

## What is the best moisturizer for winter dry skin?

Thicker is usually better. The AAD says ointments and creams tend to work better and irritate less than lotions, and its [winter skin survival kit](https://www.aad.org/public/everyday-care/skin-care-basics/care/winter-skin-survival-kit) notes that products sold in a tube or tub typically hold more moisture than those in a pump bottle. Price is not a measure of quality, the academy says; expensive products are not necessarily more effective.

Timing matters as much as the product. The AAD recommends applying moisturizer right after bathing while skin is still damp, after each hand washing, and any time skin feels dry, which can mean several times a day.

Ingredients the AAD points to for dry skin include:

- Glycerin
- Hyaluronic acid
- Lactic acid
- Lanolin
- Mineral oil
- Petrolatum
- Shea butter
- Jojoba oil and dimethicone

Look for products labeled "fragrance-free." The AAD says "unscented" products can still contain chemicals that mask odors.

## Should I change my skin care routine in winter?

For many people, yes. Dermatologists quoted by the AAD suggest using glycolic acid, salicylic acid and retinol less often, or at lower strength, during the cold months. If a prescription retinoid is too drying, one dermatologist in the AAD''s survival kit suggests asking about switching to a milder option until spring.

Sunscreen stays on the list year-round. The AAD recommends a broad-spectrum, water-resistant sunscreen with SPF 30 or higher on exposed skin such as the face, neck, ears and hands.

## What else helps with dry winter skin at home?

- **Add moisture to the air.** The AAD suggests a humidifier, either built into the heating system or a portable unit in the bedroom while you sleep. Clean it regularly to prevent mold.
- **Wear gloves.** Use them outside in the cold and when washing dishes, gardening or working with water.
- **Protect your lips.** Use a lip balm or petroleum jelly that does not sting or tingle.
- **Dress warm instead of turning up the heat.** The AAD suggests layers and blankets indoors rather than raising the thermostat.
- **Choose soft fabrics.** If skin is very dry or raw, wear cotton or silk next to the skin and wash clothes in fragrance-free detergent.

## When should I see a doctor for dry skin?

The AAD advises seeing a board-certified dermatologist if dry skin persists despite these steps, and its cold-weather release says not to wait until skin is painful, itchy or cracked. Dry skin can sometimes be linked to conditions such as eczema, psoriasis or kidney disease, according to the AAD.

Mayo Clinic suggests seeing a doctor if skin becomes inflamed or painful, if dryness interferes with sleep, or if open sores, infection or large areas of scaling or peeling appear. Cracked skin can let bacteria in, the clinic notes.

## Frequently asked questions

### How long should I shower if I have dry skin?

The American Academy of Dermatology recommends limiting baths and showers to 5 to 10 minutes and using warm rather than hot water.

### Is lotion or cream better for dry winter skin?

The AAD says ointments and creams are generally more effective and less irritating than lotions for dry skin.

### When should I put on moisturizer?

Apply it while skin is still damp after a shower or bath, after washing your hands, and whenever skin feels dry, according to the AAD.

### Does a humidifier help dry skin?

The AAD recommends a humidifier, especially in the bedroom overnight, to add moisture to dry indoor air. Clean it regularly to prevent mold.

### Do I still need sunscreen in winter?

Yes. The AAD recommends broad-spectrum, water-resistant sunscreen with SPF 30 or higher on exposed skin year-round.', status = 'UPDATED', last_updated_at = '2026-10-19T22:00:00.000Z', updated_at = '2026-10-19T22:00:00.000Z' WHERE slug = 'winter-dry-skin-dermatologist-tips-new-england' AND status IN ('PUBLISHED','UPDATED','CORRECTED');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-b8226bc2665ee9ed', id, 'Dermatologists'' top tips for relieving dry skin', 'https://www.aad.org/public/everyday-care/skin-care-basics/dry/dermatologists-tips-relieve-dry-skin', 'American Academy of Dermatology', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-dry-skin-dermatologist-tips-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.aad.org/public/everyday-care/skin-care-basics/dry/dermatologists-tips-relieve-dry-skin');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-266056434d068b5b', id, 'Winter skin survival kit', 'https://www.aad.org/public/everyday-care/skin-care-basics/care/winter-skin-survival-kit', 'American Academy of Dermatology', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-dry-skin-dermatologist-tips-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.aad.org/public/everyday-care/skin-care-basics/care/winter-skin-survival-kit');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-e736d86d4bd745e3', id, 'Cold weather and your skin', 'https://www.aad.org/news/cold-weather-and-your-skin', 'American Academy of Dermatology', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-dry-skin-dermatologist-tips-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://www.aad.org/news/cold-weather-and-your-skin');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, rights_type, verified, public, retrieved_at, added_by, created_at) SELECT 'src-bd7c0d501fbac148', id, 'Dry skin: Symptoms and causes', 'https://mayoclinic.org/diseases-conditions/dry-skin/symptoms-causes/syc-20353885', 'Mayo Clinic', 'PRIMARY_SOURCE', 1, 1, '2026-10-19T22:00:00.000Z', 'editor:expand-2026-10-19', '2026-10-19T22:00:00.000Z' FROM stories WHERE slug = 'winter-dry-skin-dermatologist-tips-new-england' AND NOT EXISTS (SELECT 1 FROM story_sources ss WHERE ss.story_id = stories.id AND ss.url = 'https://mayoclinic.org/diseases-conditions/dry-skin/symptoms-causes/syc-20353885');
