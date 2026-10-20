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

test('Turbopass passes stay off non-UK placements; EasyPass keeps its Rome card there', () => {
  assert.deepEqual(adPartnerProductIds('travel'), []);
  const out = sidePanelProductAds('travel', adPartnerProductIds('uk').map(row));
  assert.ok(!out.includes('/go/p/'));
  assert.ok(out.includes('ezpass.uk/rome-480.webp'));
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
