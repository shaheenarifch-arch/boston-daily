-- Amazon Black Friday 2026 Special Picks (editor-approved plan, Nov. 25, 2026).
-- One labeled Affiliate guide in Deals. Loads as an EDITORIAL_REVIEW draft; the editor approves it in /admin before it is published.
-- Amazon links use the Boston Daily-only tracking ID bostondailyus-20 so Associates reports show this site's sales.
-- No prices, percentages or star ratings (Amazon allows those only through its API). Hero photo: Unsplash, used nowhere else on the site.

INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, disclosure_label, disclosure_text, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261126-amazon-bf', 'amazon-black-friday-cyber-monday-2026-where-to-find-deals', 'partner_commerce', 'blog_post', 'deals', 'EDITORIAL_REVIEW', 0, 'Amazon Black Friday 2026: Where to find the deals, plus gift and toy lists', 'Black Friday is Friday, Nov. 27, and Cyber Monday is Nov. 30. Here are Amazon''s official deal pages, its most-gifted and toy lists, and how holiday returns work this year.', 'Black Friday is **Friday, Nov. 27, 2026**, and Cyber Monday is **Monday, Nov. 30**. Amazon''s holiday deals are already running. Below are the official Amazon pages worth bookmarking, with a few tips for getting the most out of them. Prices and deals change through the day, so check each product page for today''s price and delivery date.

## Amazon''s official deal pages

- **[Amazon Black Friday Deals](https://www.amazon.com/blackfriday?tag=bostondailyus-20)**: Amazon''s main Black Friday hub, with Lightning Deals and limited-time discounts across every department.
- **[Cyber Monday Deals](https://www.amazon.com/cybermonday?tag=bostondailyus-20)**: Bookmark this one for Monday, Nov. 30.
- **[Amazon Best Sellers](https://www.amazon.com/gp/bestsellers?tag=bostondailyus-20)**: The best-selling products in every category, updated hourly.

## Gift ideas

- **[Most-gifted on Amazon](https://www.amazon.com/gp/most-gifted/?tag=bostondailyus-20)**: The items shoppers order most often as gifts right now. A good shortcut when you are stuck on what to buy.
- **[Amazon Holiday Toy List](https://www.amazon.com/holidaytoylist?tag=bostondailyus-20)**: Toys for every age, from stocking stuffers to the big gift.

## How to get the most from Amazon''s Black Friday

1. **Make a short list now.** Add the items you want to your cart or a wish list before Friday, so you can tell quickly when one of them drops in price.
2. **Watch Lightning Deals.** They run for a few hours or until they sell out. If a deal you want is full, you can join its waitlist.
3. **Check the seller.** "Ships from and sold by Amazon.com" makes returns simplest. For other sellers, read the seller''s return policy before you buy.
4. **Check delivery dates for gifts.** The product page shows the expected delivery date. Order early in December for anything that must arrive before the holidays.

## Can I return Black Friday purchases?

Yes, for most items. Amazon says most items bought on Amazon.com between Nov. 1 and Dec. 31, 2026 can be returned until **Jan. 31, 2027**. Some items, such as perishables and products marked "Final Sale," cannot be returned unless they arrive damaged or not as described. Check Amazon''s [return policy](https://www.amazon.com/gp/help/customer/display.html?nodeId=GKM69DUUYKQWKWX7) before you buy.

## More Black Friday deals

Looking for coupon codes from other stores? [CouponDepots](https://coupondepots.info/black-friday-deals/) lists Black Friday and Cyber Monday codes from featured brands, updated daily.', NULL, 'https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=1600&q=80&auto=format&fit=crop', 'Black Friday sale bags (illustrative). Photo: Unsplash, Unsplash License', 'licensed', 'Affiliate', 'This guide contains Amazon affiliate links. As an Amazon Associate, Boston Daily earns from qualifying purchases, at no extra cost to you. CouponDepots is part of the GetServices.ai network, which also publishes Boston Daily.', 'manual', 'content/2026-11-26-amazon-black-friday.sql', 7, 0, 'newsroom-assistant', '2026-11-26T04:00:00.000Z', '2026-11-26T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261126-amazon-bf-src1', 'bd-20261126-amazon-bf', 'Black Friday Deals 2026', 'https://www.amazon.com/blackfriday', 'Amazon.com', 'editor', 'PRIMARY_SOURCE', 1, 1, '2026-11-26T03:50:00.000Z', 'Page opened and title confirmed by the newsroom assistant on 2026-11-25. Editor to confirm.', 'newsroom-assistant', '2026-11-26T04:00:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261126-amazon-bf-src2', 'bd-20261126-amazon-bf', 'Amazon makes its January 31 holiday return deadline an annual rule', 'https://ppc.land/amazon-makes-its-january-31-holiday-return-deadline-an-annual-rule/', 'PPC Land', 'editor', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-26T03:50:00.000Z', 'Reports Amazon Seller News post of Oct. 16, 2026: Nov. 1 to Dec. 31, 2026 purchases returnable until Jan. 31, 2027.', 'newsroom-assistant', '2026-11-26T04:00:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261126-amazon-bf-ev1', 'bd-20261126-amazon-bf', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Amazon Black Friday affiliate guide draft; awaiting editor approval', '2026-11-26T04:00:00.000Z');
