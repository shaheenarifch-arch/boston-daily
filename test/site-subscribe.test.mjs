import { test } from 'node:test';
import assert from 'node:assert/strict';
import { checkSignup, hostMatchesSite, siteSubscribe, SITES } from '../src/site-subscribe.js';

test('accepts a sign-up from the site itself', () => {
  const c = checkSignup({ site: 'desi.markets', email: ' A@B.com ', origin: 'https://desi.markets' });
  assert.equal(c.ok, true); assert.equal(c.email, 'a@b.com'); assert.equal(c.site, 'desi.markets');
});
test('www and subdomains count as the site; other hosts do not', () => {
  assert.equal(hostMatchesSite('www.desi.markets'.replace(/^www\./, ''), 'desi.markets'), true);
  assert.equal(hostMatchesSite('shop.desi.markets', 'desi.markets'), true);
  assert.equal(hostMatchesSite('evil-desi.markets', 'desi.markets'), false);
  assert.equal(checkSignup({ site: 'desi.markets', email: 'a@b.com', origin: 'https://example.com' }).error, 'wrong_origin');
});
test("the site's own Cloudflare Pages previews count; other pages.dev projects do not", () => {
  assert.equal(hostMatchesSite('hairstyle-company.pages.dev', 'hairstyle.company'), true);
  assert.equal(hostMatchesSite('add-hairmax-section.hairstyle-company.pages.dev', 'hairstyle.company'), true);
  assert.equal(hostMatchesSite('hairstyle-company-evil.pages.dev', 'hairstyle.company'), false);
  assert.equal(hostMatchesSite('other.pages.dev', 'hairstyle.company'), false);
  assert.equal(checkSignup({ site: 'hairstyle.company', email: 'a@b.com', origin: 'https://add-hairmax-section.hairstyle-company.pages.dev' }).ok, true);
});
test('falls back to Referer for plain form posts', () => {
  assert.equal(checkSignup({ site: 'needed.men', email: 'a@b.com', referer: 'https://www.needed.men/blog/x.html' }).ok, true);
});
test('rejects unknown sites and bad emails; honeypot is a silent success', () => {
  assert.equal(checkSignup({ site: 'nope.com', email: 'a@b.com', origin: 'https://nope.com' }).error, 'unknown_site');
  assert.equal(checkSignup({ site: 'desi.markets', email: 'bad', origin: 'https://desi.markets' }).error, 'email');
  assert.equal(checkSignup({ site: 'desi.markets', email: 'a@b.com', origin: 'https://desi.markets', botcheck: 'on' }).spam, true);
});
test('every site key is a bare lowercase host', () => {
  for (const k of Object.keys(SITES)) assert.match(k, /^[a-z0-9.-]+\.[a-z]+$/);
});

function fakeDb() {
  const rows = [];
  return { rows, prepare: () => ({ bind: (...a) => ({ run: async () => { rows.push(a); } }) }) };
}
const post = (fields, headers) => {
  const fd = new FormData(); for (const [k, v] of Object.entries(fields)) fd.append(k, v);
  return new Request('https://bostondaily.us/api/subscribe', { method: 'POST', headers, body: fd });
};

test('fetch sign-up returns {success:true} with CORS for the site, and stores it', async () => {
  const db = fakeDb();
  const res = await siteSubscribe({ DB: db }, post({ site: 'desi.markets', email: 'x@y.com', source_page: '/about.html' }, { origin: 'https://desi.markets', accept: 'application/json' }));
  assert.equal(res.status, 200);
  assert.deepEqual(await res.json(), { success: true });
  assert.equal(res.headers.get('access-control-allow-origin'), 'https://desi.markets');
  assert.equal(db.rows.length, 1); assert.equal(db.rows[0][1], 'desi.markets'); assert.equal(db.rows[0][2], 'x@y.com');
});
test('plain form post gets a thank-you page linking back', async () => {
  const db = fakeDb();
  const res = await siteSubscribe({ DB: db }, post({ site: 'womenstyle.win', email: 'x@y.com' }, { referer: 'https://womenstyle.win/blog/' }));
  assert.equal(res.status, 200);
  const body = await res.text();
  assert.match(body, /You are subscribed/); assert.match(body, /https:\/\/womenstyle\.win\/blog\//);
});
test('a post from another website is refused and nothing is stored', async () => {
  const db = fakeDb();
  const res = await siteSubscribe({ DB: db }, post({ site: 'desi.markets', email: 'x@y.com' }, { origin: 'https://spam.example', accept: 'application/json' }));
  assert.equal(res.status, 403); assert.equal(db.rows.length, 0);
  assert.equal(res.headers.get('access-control-allow-origin'), null);
});
