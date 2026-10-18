// Partner Offers selection (src/offers.js): relevance first, nothing unrelated, nothing on sensitive pages.
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { pageContext, selectOffers, scoreProduct } from '../src/offers.js';

const NOW = new Date('2026-10-18T12:00:00Z');
const tech = { slug: 'technology', commerce_allowed: 1, partner_offers: 1 };
const nfl = { slug: 'nfl', commerce_allowed: 1, parent: { slug: 'us-sports', commerce_allowed: 1 } };
const politics = { slug: 'us-politics', commerce_allowed: 0 };
const uk = { slug: 'uk', commerce_allowed: 1 };
let n = 0;
const P = (o) => ({ id: `p${++n}`, name: `Product ${n}`, image_url: 'https://img.test/x.jpg', image_rights_ok: 1, deep_link: 'https://merchant.test/x', availability: 'in_stock', merchant_name: 'Merchant', ...o });

test('category matches rank first; unrelated products never fill the module', () => {
  const laptop = P({ section_slug: 'technology', tags: 'laptops' });
  const phoneCase = P({ section_slug: null, tags: 'phones,accessories' });
  const treadmill = P({ section_slug: 'health-wellness', tags: 'fitness' });
  const wig = P({ section_slug: 'beauty-hair', tags: 'wigs' });
  const out = selectOffers([treadmill, wig, phoneCase, laptop], pageContext(tech), NOW);
  assert.deepEqual(out.map((p) => p.id), [laptop.id, phoneCase.id]);
});

test('exact subcategory beats primary category', () => {
  const nflJersey = P({ section_slug: 'nfl', tags: 'apparel' });
  const ball = P({ section_slug: 'us-sports' });
  const out = selectOffers([ball, nflJersey], pageContext(nfl), NOW);
  assert.equal(out[0].id, nflJersey.id);
  assert.ok(out[0]._score > out[1]._score);
});

test('expired promotions, out-of-stock, missing images and other regions are excluded', () => {
  const ctx = pageContext(tech);
  assert.equal(scoreProduct(P({ section_slug: 'technology', promo_end: '2026-10-01' }), ctx, NOW), null);
  assert.equal(scoreProduct(P({ section_slug: 'technology', availability: 'out_of_stock' }), ctx, NOW), null);
  assert.equal(scoreProduct(P({ section_slug: 'technology', image_url: null }), ctx, NOW), null);
  assert.equal(scoreProduct(P({ section_slug: 'technology', regions: 'UK' }), ctx, NOW), null);
  // A UK-only product is eligible on UK pages, with the region bonus.
  const ukTreadmill = P({ section_slug: 'uk', regions: 'UK' });
  assert.ok(scoreProduct(ukTreadmill, pageContext(uk), NOW).score >= 70 + 20);
});

test('politics, opinion and sensitive stories get nothing, unless an editor picked approved products', () => {
  const p = P({ section_slug: 'technology', tags: 'laptops' });
  assert.deepEqual(selectOffers([p], pageContext(politics), NOW), []);
  assert.deepEqual(selectOffers([p], pageContext(tech, { sensitive: 1, headline: 'Laptops' }), NOW), []);
  assert.deepEqual(selectOffers([p], pageContext({ slug: 'columns', commerce_allowed: 0, parent: { slug: 'opinion', commerce_allowed: 0 } }), NOW), []);
  const approved = P({ section_slug: 'technology', sensitive_ok: 1 });
  const picked = selectOffers([approved, p], pageContext(tech, { sensitive: 1, partner_offer_ids: `${approved.id},${p.id}` }), NOW);
  assert.deepEqual(picked.map((x) => x.id), [approved.id]);
});

test('switched off for a category or an article', () => {
  const p = P({ section_slug: 'technology' }), q = P({ section_slug: 'technology' });
  assert.deepEqual(selectOffers([p, q], pageContext({ ...tech, partner_offers: 0 }), NOW), []);
  assert.deepEqual(selectOffers([p, q], pageContext(tech, { partner_offers: 0 }), NOW), []);
});

test('at most four; one strong match may show alone; one weak match hides the module', () => {
  const many = Array.from({ length: 7 }, () => P({ section_slug: 'technology' }));
  assert.equal(selectOffers(many, pageContext(tech), NOW).length, 4);
  assert.equal(selectOffers([P({ section_slug: 'technology' })], pageContext(tech), NOW).length, 1);
  assert.equal(selectOffers([P({ tags: 'software' })], pageContext(tech), NOW).length, 0);
});

test('the brief\'s point model: tags from the category and the headline, plus stock, promotion and featured', () => {
  const ctx = pageContext({ slug: 'business', commerce_allowed: 1 }, { headline: 'Small firms switch accounting software', dek: '' });
  const acct = P({ tags: 'accounting,software' });
  const promo = P({ tags: 'office', promo_label: '20% off', promo_end: '2026-10-31', featured: 1 });
  assert.equal(scoreProduct(acct, ctx, NOW).score, 2 * 15 + 15);          // two tags + in stock
  assert.equal(scoreProduct(promo, ctx, NOW).score, 15 + 15 + 10 + 10);   // one tag + in stock + promotion + featured
  // An expired promotion's label alone doesn't earn the bonus or the slot.
  assert.equal(scoreProduct(P({ tags: 'office', promo_label: 'Ended', promo_end: '2026-10-17' }), ctx, NOW), null);
});

test('commission never affects order', () => {
  const a = P({ section_slug: 'technology', commission: 50 });
  const b = P({ section_slug: 'technology', tags: 'laptops', commission: 1 });
  const out = selectOffers([a, b], pageContext(tech), NOW);
  assert.equal(out[0].id, b.id);
});

test('regional (UK) pages show offers available in the UK', () => {
  const ukCase = P({ section_slug: 'technology', tags: 'phones', regions: 'UK' });
  const ukPad = P({ section_slug: 'health-wellness', regions: 'UK' });
  const usOnly = P({ section_slug: 'technology', regions: 'US' });
  const out = selectOffers([usOnly, ukCase, ukPad], pageContext(uk), NOW);
  assert.deepEqual(out.map((p) => p.id).sort(), [ukCase.id, ukPad.id].sort());
});

test('an editor\'s single approved pick shows on a sensitive page', () => {
  const stand = P({ section_slug: 'technology', sensitive_ok: 1 });
  const out = selectOffers([stand], pageContext({ slug: 'columns', commerce_allowed: 0, parent: { slug: 'opinion', commerce_allowed: 0 } }, { partner_offer_ids: stand.id }), NOW);
  assert.deepEqual(out.map((p) => p.id), [stand.id]);
});
