import { test, beforeEach, afterEach } from 'node:test';
import assert from 'node:assert/strict';
import {
  policyProblems, publicUrl, extractMeta, templateAutofill, templateCopy, templateTweak, LIMITS,
  aiCopy, aiAutofill, copyEndpoint, autofillEndpoint, smartMessage,
} from '../src/advertise.js';

// A D1 stand-in for the hourly usage counter.
function fakeDb() {
  const counts = new Map();
  return {
    prepare: () => ({
      bind: (vid, kind, hour) => ({
        first: async () => { const k = `${vid}|${kind}|${hour}`; counts.set(k, (counts.get(k) || 0) + 1); return { n: counts.get(k) }; },
      }),
    }),
  };
}
const req = (body) => new Request('https://bostondaily.us/api/advertise/x', { method: 'POST', headers: { 'content-type': 'application/json', 'cf-connecting-ip': '203.0.113.9' }, body: JSON.stringify(body) });
const fakeClient = (reply) => ({ messages: { create: async () => reply } });
const textReply = (obj, stop = 'end_turn') => ({ stop_reason: stop, content: [{ type: 'text', text: JSON.stringify(obj) }] });

const realFetch = globalThis.fetch;
afterEach(() => { globalThis.fetch = realFetch; });

test('house policy blocks prohibited ads and no-ad sections, flags things to review', () => {
  assert.equal(policyProblems({ company: 'Harbor Coffee', website: 'harbor.coffee', ad: { headline: 'Fresh coffee', body: 'Roasted daily.', cta: 'Visit' } }).blocked.length, 0);
  assert.ok(policyProblems({ website: 'javascript:alert(1)' }).blocked.some((b) => /http/.test(b)));
  assert.equal(policyProblems({ company: 'Harbor Coffee', website: 'https://harbor.coffee', ad: { headline: 'Fresh coffee in Southie', body: 'Roasted daily.', cta: 'Visit us' } }).blocked.length, 0);
  const cases = [
    { ad: { headline: 'Vote for Smith on Nov. 3', body: 'x' } },
    { description: 'We sell firearms and ammunition' },
    { ad: { headline: 'Buy Bitcoin today', body: 'x' } },
    { ad: { headline: 'This tea cures anxiety', body: 'x' } },
    { ad: { headline: 'Guaranteed returns of 20%', body: 'x' } },
    { company: 'Replica Watches Co' },
    { sections: ['travel', 'us-politics'] },
  ];
  for (const c of cases) assert.ok(policyProblems({ website: 'https://a.example', ...c }).blocked.length > 0, JSON.stringify(c));
  // Whole words only: "electric", "selection", "guns" inside other words do not trip the rules.
  assert.equal(policyProblems({ website: 'https://a.example', ad: { headline: 'Electric bikes, great selection', body: 'Burgundy paint.', cta: 'Shop' } }).blocked.length, 0);
  const flags = policyProblems({ ad: { headline: 'BREAKING NEWS!!', body: 'BIG SALE NOW ON EVERYTHING', cta: 'Go' } }).flags.join(' ');
  assert.match(flags, /No website/);
  assert.match(flags, /capital letters/);
  assert.match(flags, /exclamation/);
  assert.match(flags, /news reporting/);
  assert.match(policyProblems({ website: 'https://a.example', ad: { headline: 'h'.repeat(LIMITS.headline + 1), body: 'b' } }).flags.join(' '), /over 60/);
});

test('website look-ups only reach public http(s) hosts', () => {
  assert.equal(publicUrl('example.com').toString(), 'https://example.com/');
  assert.ok(publicUrl('http://shop.example.co.uk/path'));
  for (const bad of ['localhost', 'http://localhost:8787', '127.0.0.1', 'http://10.1.2.3', '192.168.0.1', '172.20.0.5', '169.254.169.254', 'http://[::1]/', 'ftp://example.com', 'https://user:pw@example.com', 'printer.local', 'intranet', 'https://example.com:8443', '']) {
    assert.equal(publicUrl(bad), null, bad);
  }
});

test('auto-fill from meta tags (no AI)', () => {
  const html = `<html><head><title>Harbor Coffee | Small-batch roasters in Boston</title>
    <meta name="description" content="Small-batch coffee roasted in South Boston. Caf&eacute; open daily.">
    <meta property="og:site_name" content="Harbor Coffee"></head>
    <body><nav>Menu</nav><h1>Coffee, roasted here</h1><p>Visit our cafe and bakery.</p><script>var x=1</script></body></html>`;
  const m = extractMeta(html, 'https://www.harbor.coffee/');
  assert.equal(m.host, 'harbor.coffee');
  assert.ok(!m.text.includes('var x'));
  const f = templateAutofill(m);
  assert.equal(f.name, 'Harbor Coffee');
  assert.match(f.description, /^Small-batch coffee roasted in South Boston/);
  assert.equal(f.category, 'food-culture');
  assert.equal(f.source, 'template');
  // Without og:site_name the title's first part is the name.
  assert.equal(templateAutofill(extractMeta('<title>Acme Tours - City walks</title>', 'https://acme.example')).name, 'Acme Tours');
});

test('template copy: three options within limits, and every tweak changes the ad', () => {
  const biz = { company: 'Harbor Coffee', description: 'Small-batch coffee roasted in Southie. Open daily from 7am.', audience: 'South Boston locals' };
  const opts = templateCopy(biz);
  assert.equal(opts.length, 3);
  for (const o of opts) {
    assert.ok(o.headline && o.body && o.cta);
    assert.ok(o.headline.length <= LIMITS.headline && o.body.length <= LIMITS.body && o.cta.length <= LIMITS.cta);
  }
  assert.equal(new Set(opts.map((o) => o.headline)).size, 3);
  for (const t of ['shorter', 'premium', 'urgent', 'friendly']) {
    const out = templateTweak(opts[0], t, biz);
    assert.notDeepEqual(out, opts[0], t);
    assert.ok(out.body.length <= LIMITS.body && out.headline.length <= LIMITS.headline, t);
    assert.equal(policyProblems({ website: 'https://a.example', ...biz, ad: out }).blocked.length, 0, t);
  }
  assert.ok(templateTweak(opts[0], 'shorter', biz).body.length <= 90);
  // Works with only a name.
  assert.equal(templateCopy({ company: 'Acme' }).length, 3);
});

test('AI copy and auto-fill parse structured answers and enforce limits', async () => {
  const long = 'x'.repeat(300);
  const opts = await aiCopy({}, { company: 'Acme' }, {}, { client: fakeClient(textReply({ options: [{ headline: 'One', body: 'Body one', cta: 'Go' }, { headline: long, body: long, cta: long }, { headline: 'Three', body: 'Body three', cta: 'Shop' }] })) });
  assert.equal(opts.length, 3);
  assert.ok(opts[1].headline.length <= LIMITS.headline && opts[1].body.length <= LIMITS.body && opts[1].cta.length <= LIMITS.cta);
  const one = await aiCopy({}, { company: 'Acme' }, { tweak: 'urgent', option: opts[0] }, { client: fakeClient(textReply({ options: [{ headline: 'Now', body: 'Today only', cta: 'Book' }, { headline: 'extra', body: 'extra', cta: 'x' }] })) });
  assert.deepEqual(one, [{ headline: 'Now', body: 'Today only', cta: 'Book' }]);
  const fill = await aiAutofill({}, extractMeta('<title>Acme</title>', 'https://acme.example'), { client: fakeClient(textReply({ name: 'Acme Tours', description: 'Walking tours.', category: 'not-a-section', audience: 'Visitors' })) });
  assert.equal(fill.name, 'Acme Tours');
  assert.equal(fill.category, ''); // unknown categories are dropped
  assert.equal(fill.source, 'ai');
});

test('AI failures throw so callers fall back: refusal, truncation, bad JSON, too few options, no key', async () => {
  const biz = { company: 'Acme' };
  await assert.rejects(aiCopy({}, biz, {}, { client: fakeClient(textReply({ options: [] }, 'refusal')) }));
  await assert.rejects(aiCopy({}, biz, {}, { client: fakeClient(textReply({ options: [] }, 'max_tokens')) }));
  await assert.rejects(aiCopy({}, biz, {}, { client: fakeClient({ stop_reason: 'end_turn', content: [{ type: 'text', text: '{"options": [' }] }) }));
  await assert.rejects(aiCopy({}, biz, {}, { client: fakeClient(textReply({ options: [{ headline: 'Only one', body: 'b', cta: 'c' }] })) }));
  await assert.rejects(aiCopy({}, biz, {}, { client: { messages: { create: async () => { throw new Error('529 overloaded'); } } } }));
  await assert.rejects(aiCopy({}, biz), /not configured/);
});

test('copy endpoint: templates with no API key', async () => {
  const res = await copyEndpoint({ DB: fakeDb() }, req({ company: 'Acme', description: 'Walking tours of Boston.' }));
  const body = await res.json();
  assert.equal(res.status, 200);
  assert.equal(body.source, 'template');
  assert.equal(body.options.length, 3);
});

test('copy endpoint: falls back to templates when Claude errors (no credit, rate limit, outage)', async () => {
  for (const status of [400, 401, 429, 500, 529]) {
    globalThis.fetch = async () => new Response(JSON.stringify({ type: 'error', error: { type: 'x', message: 'nope' } }), { status, headers: { 'content-type': 'application/json' } });
    const res = await copyEndpoint({ DB: fakeDb(), ANTHROPIC_API_KEY: 'sk-test' }, req({ company: 'Acme', tweak: 'friendly', option: { headline: 'Meet Acme', body: 'Walking tours.', cta: 'Book' } }));
    const body = await res.json();
    assert.equal(res.status, 200, String(status));
    assert.equal(body.source, 'template', String(status));
    assert.equal(body.options.length, 1);
  }
});

test('copy endpoint: over the hourly AI limit uses templates without calling Claude', async () => {
  let calls = 0;
  globalThis.fetch = async () => { calls += 1; return new Response('{}', { status: 500 }); };
  const env = { DB: fakeDb(), ANTHROPIC_API_KEY: 'sk-test' };
  for (let i = 0; i < 25; i += 1) {
    const body = await (await copyEndpoint(env, req({ company: 'Acme' }))).json();
    assert.equal(body.source, 'template');
  }
  assert.equal(calls, 20);
});

test('auto-fill endpoint: reads the page, follows safe redirects only, falls back to meta tags', async () => {
  const page = '<title>Acme Tours | Boston walks</title><meta name="description" content="Guided walking tours of Boston.">';
  globalThis.fetch = async (url) => {
    if (url.startsWith('https://acme.example')) return new Response(null, { status: 301, headers: { location: 'https://www.acme.example/home' } });
    if (url.startsWith('https://www.acme.example')) return new Response(page, { headers: { 'content-type': 'text/html; charset=utf-8' } });
    if (url.startsWith('https://evil.example')) return new Response(null, { status: 302, headers: { location: 'http://169.254.169.254/latest' } });
    if (url.startsWith('https://api.anthropic.com')) return new Response('{"type":"error","error":{"type":"billing_error","message":"credit"}}', { status: 400, headers: { 'content-type': 'application/json' } });
    throw new Error(`unexpected fetch ${url}`);
  };
  for (const env of [{ DB: fakeDb() }, { DB: fakeDb(), ANTHROPIC_API_KEY: 'sk-test' }]) {
    const res = await autofillEndpoint(env, req({ website: 'acme.example' }));
    const body = await res.json();
    assert.equal(res.status, 200);
    assert.equal(body.website, 'https://www.acme.example/home');
    assert.equal(body.fields.name, 'Acme Tours');
    assert.equal(body.fields.category, 'travel');
    assert.equal(body.source, 'template');
  }
  // A working Claude answer fills the fields, but an empty answer never wipes what the meta tags found.
  globalThis.fetch = async (url) => {
    if (url.startsWith('https://acme.example')) return new Response(page, { headers: { 'content-type': 'text/html' } });
    return new Response(JSON.stringify({ id: 'm', type: 'message', role: 'assistant', model: 'claude-haiku-5-5', stop_reason: 'end_turn', usage: { input_tokens: 1, output_tokens: 1 },
      content: [{ type: 'text', text: JSON.stringify({ name: 'Acme Walking Tours', description: 'Guided walks.', category: '', audience: 'Visitors to Boston' }) }] }), { headers: { 'content-type': 'application/json' } });
  };
  const ai = await (await autofillEndpoint({ DB: fakeDb(), ANTHROPIC_API_KEY: 'sk-test' }, req({ website: 'acme.example' }))).json();
  assert.equal(ai.source, 'ai');
  assert.equal(ai.fields.name, 'Acme Walking Tours');
  assert.equal(ai.fields.category, 'travel');
  const bad = await autofillEndpoint({ DB: fakeDb() }, req({ website: 'evil.example' }));
  assert.equal(bad.status, 422);
  assert.equal((await autofillEndpoint({ DB: fakeDb() }, req({ website: 'localhost' }))).status, 400);
});

test('smart-form message records the ad, its source and the policy verdict', () => {
  const msg = smartMessage({ note: 'Call me', phone: '617-555-0100', sections: ['travel'], biz: { category: 'travel', audience: 'Visitors' }, ad: { headline: 'H', body: 'B', cta: 'C' }, copySource: 'ai+edited', policy: { blocked: ['Weapons: "rifle"'], flags: [] }, packageName: 'Display ads', start: '2026-11-01', end: '2026-11-30' });
  assert.match(msg, /^Call me/);
  for (const part of ['Package: Display ads', 'Sections: travel', 'Dates: 2026-11-01 to 2026-11-30', 'Phone: 617-555-0100', 'Headline: H', 'Copy source: ai+edited', 'Policy check: BLOCKED']) assert.ok(msg.includes(part), part);
  assert.match(smartMessage({ policy: { blocked: [], flags: [] } }), /Policy check: passed/);
});
