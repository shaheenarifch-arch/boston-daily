-- Boston Daily seed data: sections + GetServices.ai network business registry.
-- Safe to re-run: uses INSERT OR IGNORE.

-- ── News sections ─────────────────────────────────────────────
INSERT OR IGNORE INTO sections (slug,name,kind,parent_slug,sort_order,in_nav,commerce_allowed,always_human,description) VALUES
('us','US','news',NULL,10,1,1,0,'National news from across the United States'),
('us-politics','US Politics','news',NULL,20,1,0,1,'The White House, Congress, the courts, elections and policy'),
('world','World','news',NULL,30,1,1,0,'International news'),
('business','Business','news',NULL,40,1,1,0,'Markets, companies and the economy'),
('technology','Technology','news',NULL,50,1,1,0,'Tech industry, gadgets and the digital world'),
('ai','AI','news',NULL,60,1,1,0,'Artificial intelligence: research, products and policy'),
('science','Science','news',NULL,70,1,1,0,'Research and discovery'),
('us-sports','US Sports','news',NULL,80,1,1,0,'NFL, NBA, MLB, NHL, college and more'),
('uk','UK','news',NULL,90,1,1,0,'News from the United Kingdom'),
('entertainment','Entertainment','news',NULL,100,1,1,0,'Film, TV, music and culture'),
('lifestyle','Lifestyle','news',NULL,110,1,1,0,'How we live'),
('opinion','Opinion','news',NULL,120,1,0,0,'Columns and commentary, clearly separated from news');

-- US Politics subsections (always human-approved, no commerce)
INSERT OR IGNORE INTO sections (slug,name,kind,parent_slug,sort_order,in_nav,commerce_allowed,always_human) VALUES
('white-house','White House','news','us-politics',21,0,0,1),
('congress','Congress','news','us-politics',22,0,0,1),
('courts','Supreme Court & Courts','news','us-politics',23,0,0,1),
('elections','Elections & Campaigns','news','us-politics',24,0,0,1),
('states','States','news','us-politics',25,0,0,1),
('policy','Policy','news','us-politics',26,0,0,1);

-- US Sports subsections
INSERT OR IGNORE INTO sections (slug,name,kind,parent_slug,sort_order,in_nav,commerce_allowed,always_human) VALUES
('nfl','NFL','news','us-sports',81,0,1,0),
('nba','NBA','news','us-sports',82,0,1,0),
('mlb','MLB','news','us-sports',83,0,1,0),
('nhl','NHL','news','us-sports',84,0,1,0),
('mls','MLS','news','us-sports',85,0,1,0),
('wnba','WNBA','news','us-sports',86,0,1,0),
('college-football','College Football','news','us-sports',87,0,1,0),
('college-basketball','College Basketball','news','us-sports',88,0,1,0),
('golf','Golf','news','us-sports',89,0,1,0),
('tennis','Tennis','news','us-sports',90,0,1,0),
('combat-sports','Boxing & MMA','news','us-sports',91,0,1,0),
('motorsport','Motorsport','news','us-sports',92,0,1,0);

-- ── Network niche sections ────────────────────────────────────
INSERT OR IGNORE INTO sections (slug,name,kind,parent_slug,sort_order,in_nav,commerce_allowed,always_human,description) VALUES
('beauty-hair','Beauty & Hair','niche',NULL,200,1,1,0,'Skincare, hair care and beauty'),
('fashion-style','Fashion & Style','niche',NULL,210,1,1,0,'What to wear and how to wear it'),
('outdoor','Outdoor','niche',NULL,220,1,1,0,'Gear, adventure and the outdoors'),
('auto','Auto','niche',NULL,230,1,1,0,'Cars and car tech'),
('travel','Travel','niche',NULL,240,1,1,0,'Trips, flights, hotels and passes'),
('home-living','Home & Living','niche',NULL,250,1,1,0,'Home, bedding and wellness at home'),
('garden','Garden','niche',NULL,260,1,1,0,'Seeds, plants and growing'),
('pets','Pets','niche',NULL,270,1,1,0,'Pet care and gear'),
('health-wellness','Health & Wellness','niche',NULL,280,1,1,1,'Health news is always editor-approved; no medical claims'),
('food-culture','Food & Culture','niche',NULL,290,1,1,0,'Food, groceries and culture'),
('deals','Deals','niche',NULL,300,1,1,0,'Today''s best deals from our partners'),
('education-careers','Education & Careers','niche',NULL,310,1,1,0,'Skills, learning and work');

-- ── GetServices.ai network business registry (initial seed — verify against master file) ──
INSERT OR IGNORE INTO businesses (id,slug,name,domain,grp,section_slug,short_description,owned_by_network,featured,sort_order,status,created_at,updated_at) VALUES
('biz-getservices','getservices-ai','GetServices.ai','getservices.ai','Agencies & service providers','ai','AI services, AI pods and automation for small businesses and regulated industries',1,1,1,'active',datetime('now'),datetime('now')),
('biz-atlas','atlas-aeo','ATLAS AEO','app.getservices.ai','AI tools','ai','Answer-engine and search optimization app for your website',1,1,2,'active',datetime('now'),datetime('now')),
('biz-studio','getservices-studio','GetServices AI Studio','studio.getservices.ai','AI tools','ai','The GetServices AI operating environment',1,0,3,'active',datetime('now'),datetime('now')),
('biz-fashtronix','fashtronix-hub','Fashtronix Hub','fashtronixhub.com','Company & platforms','technology','Electronics store',1,0,4,'active',datetime('now'),datetime('now')),
('biz-buybeststore','buybeststore','BuyBestStore','buybeststore.com','Shopping, deals & guides','technology','Shopping and buying guides',1,0,10,'active',datetime('now'),datetime('now')),
('biz-buybeststores-uk','buybeststores-uk','BuyBestStores UK','buybeststores.uk','Shopping, deals & guides','technology','UK electronics and fitness picks',1,0,11,'active',datetime('now'),datetime('now')),
('biz-coupondepots','coupondepots','CouponDepots','coupondepots.info','Shopping, deals & guides','deals','Verified coupons and deals',1,0,12,'active',datetime('now'),datetime('now')),
('biz-homewellness','homewellnessdeals','Home Wellness Deals','homewellnessdeals.com','Shopping, deals & guides','home-living','Home and wellness deals',1,0,13,'active',datetime('now'),datetime('now')),
('biz-bedbathbuy','bedbathbuy','BedBathBuy','bedbathbuy.trade','Shopping, deals & guides','home-living','Bedding and bath picks',1,0,14,'active',datetime('now'),datetime('now')),
('biz-neededmen','needed-men','Needed.men','needed.men','Shopping, deals & guides','fashion-style','Menswear and essentials',1,0,15,'active',datetime('now'),datetime('now')),
('biz-authenticpak','authenticpakusa','AuthenticPak USA','authenticpakusa.com','Shopping, deals & guides','fashion-style','Clothing and lifestyle',1,0,16,'active',datetime('now'),datetime('now')),
('biz-desimarkets','desi-markets','Desi Markets','desi.markets','Shopping, deals & guides','food-culture','Guide to South Asian online stores',1,0,17,'active',datetime('now'),datetime('now')),
('biz-petscool','petscoolstuff','Pets Cool Stuff','petscoolstuff.trade','Shopping, deals & guides','pets','Pet gear and accessories',1,0,18,'active',datetime('now'),datetime('now')),
('biz-costumescout','costumescout','CostumeScout',NULL,'Shopping, deals & guides','deals','Costume finds',1,0,19,'unverified',datetime('now'),datetime('now')),
('biz-womenstyle','womenstyle','WomenStyle','womenstyle.win','Women''s fashion & beauty','fashion-style','Women''s fashion, beauty, hair, shoes and jewelry',1,1,20,'active',datetime('now'),datetime('now')),
('biz-curated4her','curated4her','Curated4Her','curated4her.com','Women''s fashion & beauty','beauty-hair','Curated shopping for women',1,0,21,'active',datetime('now'),datetime('now')),
('biz-glowsculpt','glowsculpt','GlowSculpt','glowsculpt.site','Women''s fashion & beauty','beauty-hair','Beauty and skincare picks',1,0,22,'active',datetime('now'),datetime('now')),
('biz-hairstyle','hairstyle-company','Hairstyle Company','hairstyle.company','Women''s fashion & beauty','beauty-hair','Wigs and hair care',1,0,23,'active',datetime('now'),datetime('now')),
('biz-jewllery','jewllery-store','Maison Aurelia','jewllery.store','Women''s fashion & beauty','fashion-style','Jewelry picks',1,0,24,'active',datetime('now'),datetime('now')),
('biz-flyhorizons','flyhorizons','FlyHorizons','flyhorizons.online','Travel','travel','Flights, hotels and ground travel',1,1,30,'active',datetime('now'),datetime('now')),
('biz-skytodoor','skytodoor','SkyToDoor','skytodoor.com','Travel','travel','Door-to-door travel planning',1,0,31,'active',datetime('now'),datetime('now')),
('biz-ezpass','easypass','EasyPass','ezpass.uk','Travel','travel','City passes and attractions',1,0,32,'active',datetime('now'),datetime('now')),
('biz-luxurytravel','luxury-travel-party','Luxury Travel Party','luxurytravel.party','Travel','travel','Yacht and boat rentals',1,0,33,'active',datetime('now'),datetime('now')),
('biz-outdoorsports','outdoorsports-fun','Outdoor Sports Fun','outdoorsports.fun','Outdoor, auto & lifestyle','outdoor','Outdoor gear guides',1,0,40,'active',datetime('now'),datetime('now')),
('biz-outdoorhaulers','outdoorhaulers','Outdoor Haulers','outdoorhaulers.site','Outdoor, auto & lifestyle','outdoor','Bike racks, roof and cargo carriers',1,0,41,'active',datetime('now'),datetime('now')),
('biz-drivezone','drivezone-nexus','DriveZone Nexus','drivezone.nexus','Outdoor, auto & lifestyle','auto','Car tech and in-car entertainment',1,0,42,'active',datetime('now'),datetime('now')),
('biz-flowerofheaven','flower-of-heaven','Flower of Heaven','flowerofheaven.com','Outdoor, auto & lifestyle','garden','Seed discovery',1,0,43,'active',datetime('now'),datetime('now')),
('biz-lensloop','lensloop','LensLoop','lensloop.site','Outdoor, auto & lifestyle','fashion-style','Eyewear buying guide',1,0,44,'active',datetime('now'),datetime('now')),
('biz-medicalsupplie','medicalsupplie','MedicalSupplie','medicalsupplie.com','Outdoor, auto & lifestyle','health-wellness','Medical supplies and telehealth partners',1,0,45,'active',datetime('now'),datetime('now')),
('biz-businessbuy','businessbuy','BusinessBuy','businessbuy.site','Business & education','business','Guide to buying a business',1,0,50,'active',datetime('now'),datetime('now')),
('biz-realskillset','realskillset','RealSkillSet','realskillset.com','Business & education','education-careers','Courses and skills for work',1,1,51,'active',datetime('now'),datetime('now')),
('biz-faujileaks','faujileaks','Faujileaks','faujileaks.com','Media',NULL,'Investigative and reporting website',1,0,60,'active',datetime('now'),datetime('now'));
