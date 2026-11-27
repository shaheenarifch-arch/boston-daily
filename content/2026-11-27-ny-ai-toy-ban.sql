-- Newsroom draft for 2026-11-27: New York's five-year ban on AI chatbot toys.
-- The editor asked on 2026-11-27 for this story and for it to be the main headline under the TV on the home page.
-- It loads as an EDITORIAL_REVIEW draft in AI; nothing is public until the editor approves and publishes it in /admin.
-- is_lead_candidate = 1 and priority 10 so the next edition build leads with it once published; moving it into
-- tonight's lead slot is a separate step after publication.
-- Facts restated in Boston Daily's own words. Primary source: the governor's release (dated Nov. 24, 2026, "today signed").
-- The Guardian (text supplied by the editor) and SiliconANGLE say Wednesday, Nov. 25; the story follows the release.
-- NBC News could not be opened; its toy tests are attributed to SiliconANGLE and the Guardian. The advocates' letter to
-- Amazon and eBay appears only in the Guardian and is attributed and marked as unconfirmed. sensitive = 1: child safety
-- story, so no commercial modules or partner offers run beside it.
-- Hero image: a real photo new to the site. License checked on the Commons file page on 2026-11-27:
-- Marc A. Hermann / MTA, CC BY 4.0.

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban', 'new-york-bans-ai-chatbot-toys-five-years-hochul', 'newsroom', 'news_story', 'ai', 'EDITORIAL_REVIEW', 1, 'New York bans AI chatbot toys for five years as holiday shopping begins', 'Gov. Kathy Hochul signed a pause on making, distributing and selling toys with built-in AI chatbots. It takes effect in late February, with fines of up to $15,000 a day for each violation.', 'New York has banned toys with built-in artificial intelligence chatbots for five years, becoming the second state after California to pause sales of the gadgets just as parents start their holiday shopping.

Gov. Kathy Hochul signed the bill on Tuesday, Nov. 24, according to her office. It bars companies from making, distributing or selling toys with embedded AI chatbots in New York. The pause takes effect 90 days after signing, in late February, and Attorney General Letitia James will enforce it, with civil penalties of up to $15,000 a day for each violation, the governor''s office said.

Hochul said parents "should not have to worry that dangerous chatbots disguised as toys could expose their children to inappropriate conversations, manipulate their feelings or put their privacy at risk."

"As New York''s first mom governor, protecting our kids is deeply personal to me," she said.

## What the tests found

The governor''s office pointed to tests by a national consumer watchdog of chatbot toys marketed to children ages 3 to 12. Some of the toys discussed sexually explicit topics, told children where they might find matches at home and acted upset when a child had to leave, the office said. Most had few or no parental controls, and their safety limits weakened the longer a conversation went on. Some could record a child''s voice or scan their face.

News outlets have found similar problems. NBC News tested Pixie Paw, a plush AI cat marketed to children 3 and older, and found it produced violent and sexual content, SiliconANGLE and the Guardian reported.

Common Sense Media tested five AI toys and found that they told children they loved them, promised to keep secrets and helped them get around bedtime rules, while the conversation records offered to parents were missing or full of errors, TechCrunch reported. "Our research shows they aren''t safe for kids," said James P. Steyer, the group''s founder and chief executive, who called the moratorium one that "could not come soon enough."

## Who will enforce it

"AI chatbots in children''s toys are exposing young people to inappropriate content and putting their mental health at risk," James said, adding that her office "will not hesitate to enforce this law."

The measure was championed by state Sen. Andrew Gounardes and Assemblymember Rebecca Kassay, according to the governor''s office. Gounardes said "Big Tech puts profits before kids'' safety, and families pay the price." Kassay said the pause "gives our state time to assess these emerging technologies."

LaVita Tuff, policy director at Mothers Against Media Addiction, said toys containing AI "should only be sold if they are safe by design."

## Online sellers

Amazon said it would take steps to restrict sales of AI-enabled toys in places where they are banned, but did not give details, TechCrunch reported. The Guardian reported that more than 155 advocates had written to the chief executives of Amazon and eBay about AI toys. Boston Daily could not independently confirm the letter.

## Part of a wider push

The ban builds on a law Hochul signed in October that bars companies from offering certain unsafe chatbot features to minors, including features that foster emotional dependency, encourage self-harm or draw children into sexually explicit conversations, her office said.

California moved first. Gov. Gavin Newsom signed SB 867, by state Sen. Steve Padilla, which pauses the sale and manufacture of toys with AI chatbots in that state for four years, according to the consumer group CALPIRG.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Metropolitan_Transportation_Authority%2C_Federal_Security_Funding%2C_October_2025%2C_Kathy_Hochul_speaking_hands_open.jpg/1280px-Metropolitan_Transportation_Authority%2C_Federal_Security_Funding%2C_October_2025%2C_Kathy_Hochul_speaking_hands_open.jpg', 'Gov. Kathy Hochul speaks at MTA headquarters in Manhattan in October 2025 (file photo). Photo: Marc A. Hermann / MTA, via Wikimedia Commons, CC BY 4.0', 'licensed', 'newsroom', 'content/2026-11-27-ny-ai-toy-ban.sql', 10, 1, 'newsroom-assistant', '2026-11-27T22:45:00.000Z', '2026-11-27T22:45:00.000Z');

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban-src1', 'bd-20261127-ny-ai-chatbot-toy-ban', 'As Consumers Begin Their Holiday Shopping Season, Governor Hochul Signs Five-Year Ban on AI Chatbot Toys', 'https://www.governor.ny.gov/news/consumers-begin-their-holiday-shopping-season-governor-hochul-signs-five-year-ban-ai-chatbot', 'Office of the Governor of New York', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-11-27T22:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-27.', 'newsroom-assistant', '2026-11-27T22:45:00.000Z');

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban-src2', 'bd-20261127-ny-ai-chatbot-toy-ban', 'Want to buy your kid an AI toy this Christmas? Not in New York (Rebecca Bellan)', 'https://techcrunch.com/2026/11/25/want-to-buy-your-kid-an-ai-toy-this-christmas-not-in-new-york', 'TechCrunch', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-27T22:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-27.', 'newsroom-assistant', '2026-11-27T22:45:00.000Z');

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban-src3', 'bd-20261127-ny-ai-chatbot-toy-ban', 'New York bans AI toys amid concern after stuffed animals going rogue (James Farrell)', 'https://siliconangle.com/2026/11/25/new-york-bans-ai-toys-amid-concern-after-stuffed-animals-going-rogue/', 'SiliconANGLE', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-27T22:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-27.', 'newsroom-assistant', '2026-11-27T22:45:00.000Z');

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban-src4', 'bd-20261127-ny-ai-chatbot-toy-ban', 'Statement: Governor Newsom signs bill to pause sale, manufacturing of toys containing AI chatbots for four years', 'https://pirg.org/california/?p=11238', 'CALPIRG', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-27T22:45:00.000Z', 'Opened and checked by the newsroom assistant on 2026-11-27.', 'newsroom-assistant', '2026-11-27T22:45:00.000Z');

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban-src5', 'bd-20261127-ny-ai-chatbot-toy-ban', 'New York bans AI toys, including those using internet to talk to children (Edward Helmore, Nov. 25, 2026)', NULL, 'The Guardian', 'editor', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-27T22:45:00.000Z', 'Article text supplied by the editor on 2026-11-27. theguardian.com could not be opened from the newsroom tools, so no link is recorded.', 'newsroom-assistant', '2026-11-27T22:45:00.000Z');

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261127-ny-ai-chatbot-toy-ban-ev1', 'bd-20261127-ny-ai-chatbot-toy-ban', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from the governor''s release and attributed reporting; the editor asked for it on 2026-11-27 as the main headline. Awaiting editor approval', '2026-11-27T22:45:00.000Z');
