import { test } from 'node:test';
import assert from 'node:assert/strict';
import { sidePanelProductAds, storyStamp } from '../src/reader/components.js';
import { mastheadUpdated } from '../src/reader/layout.js';
import { relativeStamp } from '../src/util.js';
import { adPartnerProductIds } from '../src/ads.js';

const TURBOPASS = ['Rome', 'York', 'Paris', 'London', 'Dubai', 'Athens', 'Venice', 'Prague'];
const row = (id, i) => ({ id, name: `${TURBOPASS[i]} City Pass`, image_url: `https://ezpass.uk/${TURBOPASS[i].toLowerCase()}-480.webp`, image_rights_ok: 1, merchant_name: 'Turbopass', display_name_allowed: 1, price: null });

test('UK EasyPass block carries all 8 Turbopass passes via /go/p, and Rome only once', () => {
  const ids = adPartnerProductIds('uk');
  assert.equal(ids.length, 8);
  const out = sidePanelProductAds('uk', ids.map(row));
  const block = out.slice(out.indexOf('ezpass-uk-city-passes'));
  for (const id of ids) assert.ok(block.includes(`href="/go/p/${id}"`), id);
  assert.equal(block.match(/class="product-name">Rome City Pass/g).length, 1);
  assert.equal(block.match(/rome-480\.webp/g).length, 1);
  assert.match(block, /label-commerce">Affiliate/);
});

test('EasyPass (UK site) stays off non-UK placements', () => {
  for (const p of ['travel', 'home', 'us']) {
    assert.deepEqual(adPartnerProductIds(p), []);
    const out = sidePanelProductAds(p, adPartnerProductIds('uk').map(row));
    assert.ok(!out.includes('ezpass.uk'), p);
  }
});

test('without product rows (deactivated) the EasyPass block is unchanged', () => {
  const out = sidePanelProductAds('uk', []);
  assert.ok(out.includes('ezpass.uk/rome-480.webp'));
  assert.ok(!out.includes('ad-partner-products'));
});

const TZ = 'America/New_York';
const ago = (min) => new Date(Date.now() - min * 60000).toISOString();

test('cards say Updated only when the story was updated since publishing', () => {
  const updated = storyStamp({ status: 'UPDATED', published_at: ago(300), last_updated_at: ago(12) }, TZ);
  assert.match(updated, /stamp-updated">Updated <time datetime="[^"]+" data-ago[^>]*>12 min ago<\/time>/);
  const fresh = storyStamp({ status: 'PUBLISHED', published_at: ago(45) }, TZ);
  assert.match(fresh, /^<span class="stamp">Published <time [^>]*data-ago[^>]*>45 min ago/);
  assert.ok(!fresh.includes('Updated'));
  const corrected = storyStamp({ status: 'CORRECTED', published_at: ago(300), last_updated_at: ago(200), corrected_at: ago(5) }, TZ);
  assert.match(corrected, /Corrected <time/);
  // A later update after a correction reads Updated.
  assert.match(storyStamp({ status: 'UPDATED', published_at: ago(300), corrected_at: ago(200), last_updated_at: ago(3) }, TZ), /Updated/);
  assert.equal(storyStamp({ status: 'PUBLISHED' }, TZ), '');
});

test('relative stamps: minutes, hours, then a date', () => {
  const now = Date.parse('2026-10-20T16:00:00Z');
  assert.equal(relativeStamp('2026-10-20T15:59:30Z', TZ, now), 'just now');
  assert.equal(relativeStamp('2026-10-20T15:48:00Z', TZ, now), '12 min ago');
  assert.equal(relativeStamp('2026-10-20T13:00:00Z', TZ, now), '3 hr ago');
  assert.equal(relativeStamp('2026-10-17T13:00:00Z', TZ, now), 'Oct 17');
});

test('masthead: "h:mm AM ET" today, with the date on earlier days', () => {
  const now = new Date();
  assert.match(mastheadUpdated(now.toISOString(), TZ), /^\d{1,2}:\d{2} [AP]M ET$/);
  assert.match(mastheadUpdated('2026-01-05T11:30:00Z', TZ), /^Jan 5, 6:30 AM ET$/);
  assert.equal(mastheadUpdated(null, TZ), '');
});

test('a line that is only a site image renders as a captioned figure; other images are dropped', async () => {
  const { renderMarkdown } = await import('../src/markdown.js');
  const out = renderMarkdown('Intro.\n\n![The Advertise page](/img/guides/advertise.jpg "Screenshot of the Advertise page")\n\nMore.');
  assert.match(out, /<figure class="story-figure"><img src="\/img\/guides\/advertise\.jpg" alt="The Advertise page" loading="lazy" decoding="async"><figcaption>Screenshot of the Advertise page<\/figcaption><\/figure>/);
  assert.match(out, /<p>Intro\.<\/p>/);
  for (const bad of ['https://evil.test/x.jpg', '/img/../secret.jpg', 'javascript:alert(1)', '/img/x.svg']) {
    assert.ok(!renderMarkdown(`![x](${bad})`).includes('<img'), bad);
  }
});

test('Business Affiliates box: Printful affiliate link, sponsored rel, disclosure, no yellow', async () => {
  const { affiliatesBox } = await import('../src/reader/components.js');
  const html = affiliatesBox();
  assert.match(html, />Affiliates</);
  assert.match(html, /href="https:\/\/www\.printful\.com\/a\/getservices"/);
  assert.match(html, /rel="sponsored nofollow noopener noreferrer"/);
  assert.match(html, /may earn a commission/);
  assert.ok(!/yellow|#ff0\b|#ffff00|var\(--gold/i.test(html));
  assert.equal(affiliatesBox([]), '');
});

test('Boston Daily TV: four channels, eight sources, muted-start help, no yellow', async () => {
  const { tvModule, TV_CHANNELS } = await import('../src/reader/tv.js');
  const html = tvModule();
  assert.deepEqual(TV_CHANNELS.map((c) => c.label), ['Boston', 'US', 'World', 'Business']);
  assert.equal(TV_CHANNELS.flatMap((c) => c.sources).length, 8);
  for (const c of TV_CHANNELS) for (const s of c.sources) assert.match(s.id, /^UC[\w-]{22}$/);
  assert.match(html, /Sound on/);
  assert.match(html, /On air<\/span> Live Boston TV<\/h2>/);
  assert.match(html, /src="\/js\/tv\.js\?v=3"/);
  const cfg = JSON.parse(html.match(/id="bdtv-config">([^<]*)</)[1]);
  assert.equal(cfg.length, 4);
  assert.ok(!/yellow|#ff0\b|#ffff00|var\(--gold/i.test(html));
});

test('Boston Daily TV source note sits in the footer, not under the screen', async () => {
  const { tvModule, tvFooterNote } = await import('../src/reader/tv.js');
  assert.ok(!tvModule().includes('bdtv-note'));
  assert.match(tvFooterNote(), /Live Boston TV plays clips from official news channels on YouTube \(NBC10 Boston,.*Bloomberg Television\)/);
});

test('Love and Care carousel: one T-shirt, holiday gifts first, real Amazon photos, affiliate tag, no yellow', async () => {
  const { loveCareCarousel, LOVE_CARE_PRODUCTS } = await import('../src/reader/love-care.js');
  const html = loveCareCarousel();
  assert.equal(LOVE_CARE_PRODUCTS.filter((p) => /t-shirt/i.test(p.name)).length, 1);
  assert.ok(LOVE_CARE_PRODUCTS[0].holiday);
  assert.ok(LOVE_CARE_PRODUCTS.filter((p) => p.holiday).length >= 10);
  assert.equal(new Set(LOVE_CARE_PRODUCTS.map((p) => p.asin)).size, LOVE_CARE_PRODUCTS.length);
  for (const p of LOVE_CARE_PRODUCTS) {
    assert.match(p.image, /^https:\/\/m\.media-amazon\.com\/images\/I\//);
    assert.match(p.url, /^https:\/\/www\.amazon\.com\/dp\/B0[A-Z0-9]{8}\?tag=get786-20$/);
  }
  assert.match(html, /data-marquee="left"/);
  assert.match(html, /Amazon Associate/);
  assert.ok(!/yellow|#ff0\b|#ffff00|var\(--gold/i.test(html));
});

test('Printful card: affiliate link marked sponsored, disclosure shown, real photo, no yellow', async () => {
  const { printfulCard, PRINTFUL_LINK } = await import('../src/reader/printful.js');
  const html = printfulCard();
  assert.equal(PRINTFUL_LINK, 'https://www.printful.com/a/getservices');
  const links = [...html.matchAll(/<a [^>]*href="https:\/\/www\.printful\.com[^"]*"[^>]*>/g)].map((m) => m[0]);
  assert.ok(links.length >= 1);
  for (const a of links) assert.match(a, /rel="sponsored noopener"/);
  assert.match(html, /src="\/img\/printful-dtg-printing\.webp"/);
  assert.match(html, /affiliate link/);
  assert.match(html, /ecommerce sellers only/);
  assert.ok(!/yellow|#ff0\b|#ffff00|var\(--gold/i.test(html));
});

test('Printful rail ad: affiliate link sponsored, real photo, disclosure', async () => {
  const { printfulRailAd } = await import('../src/reader/printful.js');
  const html = printfulRailAd();
  const links = [...html.matchAll(/<a [^>]*href="https:\/\/www\.printful\.com\/a\/getservices"[^>]*>/g)].map((m) => m[0]);
  assert.equal(links.length, 2);
  for (const l of links) assert.match(l, /rel="sponsored noopener"/);
  assert.match(html, /src="\/img\/printful-30-off-products\.webp"/);
  assert.match(html, /commission/);
  assert.doesNotMatch(html, /yellow|#ff0|#ffff00/i);
});
