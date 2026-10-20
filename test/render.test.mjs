import { test } from 'node:test';
import assert from 'node:assert/strict';
import { sidePanelProductAds } from '../src/reader/components.js';
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
