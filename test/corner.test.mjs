import { test } from 'node:test';
import assert from 'node:assert/strict';
import { checkText, youtubeId, cleanName, audioMime, findAddress, cleanTag } from '../src/corner-filter.js';
import { cornerHero, cornerApp, rightsCard, casesCard, LANDMARK_CASES } from '../src/corner.js';

const blocked = (t) => checkText(t).ok === false;
const code = (t) => checkText(t).code;

test('angry, rude and political speech stays up', () => {
  for (const t of [
    'ICE are thugs and I hate everything they stand for.',
    'F*** this administration. Abolish ICE!',
    'The governor is a coward and a liar.',
    'ICE killed Renee Good and nobody has been charged.',
    'Prosecute every agent who broke the law. Lock them up.',
    'I will kill that bill in committee.',
    'We are going to fight this in court and in the streets, peacefully.',
    'I spent 5 days on the street after the raid.',
    'Agents dragged my neighbour out at 6 am. We filmed everything.',
  ]) assert.equal(checkText(t).ok, true, t);
});

test('threats and calls for violence are blocked', () => {
  for (const t of [
    'I will kill those agents',
    'I’m gonna shoot the next ICE officer I see',
    'lets shoot the ICE agents',
    'Someone should shoot him',
    'They deserve to die',
    'Every judge who signed that should be hanged',
    'We are going to bomb the office',
    'I know where you live',
    'put a bullet in that officer',
  ]) {
    assert.equal(blocked(t), true, t);
    assert.equal(code(t), 'threat', t);
  }
});

test('doxxing is blocked: phones, emails, street addresses, SSNs', () => {
  assert.equal(code('Call him at 617-555-1234'), 'doxxing');
  assert.equal(code('(617) 555 1234 is his cell'), 'doxxing');
  assert.equal(code('Email her: jane.doe@example.com'), 'doxxing');
  assert.equal(code('He lives at 22 Elm Street, Lowell'), 'doxxing');
  assert.equal(code('Agent home: 1400 Commonwealth Ave'), 'doxxing');
  assert.equal(code('SSN 123-45-6789'), 'doxxing');
  assert.equal(findAddress('we marched 3 miles down the road'), null);
});

test('spam and illegal content are blocked', () => {
  assert.equal(code('https://a.com https://b.com https://c.com'), 'spam');
  assert.equal(code('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'), 'spam');
  assert.equal(code('selling child porn'), 'illegal');
});

test('violent words that are not threats are borderline (live, optional AI second look)', () => {
  assert.deepEqual(checkText('Agents shoot them like dogs and walk away'), { ok: true, borderline: true });
  assert.deepEqual(checkText('Prayers for the families'), { ok: true });
});

test('YouTube links in every common form', () => {
  for (const u of ['https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=10', 'youtu.be/dQw4w9WgXcQ', 'https://youtube.com/shorts/dQw4w9WgXcQ?si=abc', 'https://m.youtube.com/live/dQw4w9WgXcQ', 'dQw4w9WgXcQ']) {
    assert.equal(youtubeId(u), 'dQw4w9WgXcQ', u);
  }
  for (const u of ['https://vimeo.com/123', 'https://evil.com/watch?v=dQw4w9WgXcQ', 'not a link', '']) assert.equal(youtubeId(u), null, u);
});

test('names, tags and audio types', () => {
  assert.deepEqual(cleanName(''), { ok: true, value: 'Anonymous' });
  assert.deepEqual(cleanName('  Maria <b>R.</b> '), { ok: true, value: 'Maria bR./b' });
  assert.equal(cleanName('617-555-1234').ok, false);
  assert.equal(cleanTag('Immigrants'), 'immigrants');
  assert.equal(cleanTag('robots'), null);
  assert.equal(audioMime('audio/webm;codecs=opus'), 'audio/webm');
  assert.equal(audioMime('video/mp4'), 'audio/mp4');
  assert.equal(audioMime('audio/x-m4a'), 'audio/mp4');
  assert.equal(audioMime('application/pdf'), null);
});

test('page fragments: real photo with credit, four tools, rights card with sources, no yellow', () => {
  const hero = cornerHero();
  assert.match(hero, /upload\.wikimedia\.org\/.*Fortepan_28399/);
  assert.match(hero, /CC BY-SA 3\.0/);
  const app = cornerApp();
  for (const k of ['voice', 'text', 'video', 'song']) assert.match(app, new RegExp(`data-open="${k}"`));
  assert.match(app, /Podium rules/);
  const rights = rightsCard();
  for (const src of ['dhs.gov/file-civil-rights-complaint', 'oig.dhs.gov/hotline', 'justice.gov/crt', 'aclum.org/en/cases/glik-v-cunniffe']) assert.ok(rights.includes(src), src);
  assert.match(rights, /not legal advice/);
  assert.ok(!/yellow|#ff0\b|#ffff00|var\(--gold/i.test(hero + app + rights));
});

test('landmark cases card: all 9 cases plus 2 dive-deeper links, each to uscourts.gov, no yellow', () => {
  const html = casesCard();
  assert.equal(LANDMARK_CASES.length, 9);
  for (const name of ['Cox v. New Hampshire', 'Elonis v. U.S.', 'Counterman v. Colorado', 'Engel v. Vitale', 'Hazelwood v. Kuhlmeier', 'Hazelwood meets Mahanoy', 'Morse v. Frederick', 'Snyder v. Phelps', 'Texas v. Johnson', 'Tinker v. Des Moines', 'U.S. v. Alvarez']) assert.ok(html.includes(name), name);
  const links = html.match(/href="[^"]+"/g);
  assert.equal(links.length, 12);
  for (const l of links) assert.ok(l.startsWith('href="https://www.uscourts.gov/about-federal-courts/educational-resources/educational-activities/first-amendment-activities/'), l);
  assert.ok(!/yellow|#ff0\b|#ffff00|var\(--gold/i.test(html));
});

// ── Events board (freedom of assembly) ──
import { validateEvent, zonedToUtc, icsFor } from '../src/corner-events.js';
const NOW = Date.parse('2026-11-24T15:00:00Z');
const EV = { kind: 'rally', title: 'Stand with our neighbours', state: 'MA', date: '2026-11-29', start: '14:00', end: '16:00', venue: 'Boston Common, Parkman Bandstand', town: 'Boston', organizer: 'Mass Neighbours', public_place: true };

test('event times follow the state time zone, including daylight saving', () => {
  assert.equal(zonedToUtc('2026-11-29T14:00', 'America/New_York'), '2026-11-29T19:00:00.000Z');
  assert.equal(zonedToUtc('2026-07-04T14:00', 'America/New_York'), '2026-07-04T18:00:00.000Z');
  assert.equal(zonedToUtc('2026-11-29T14:00', 'America/Los_Angeles'), '2026-11-29T22:00:00.000Z');
  const v = validateEvent({ ...EV, end: '01:00' }, NOW);
  assert.equal(v.value.ends_at, '2026-11-30T06:00:00.000Z'); // runs past midnight
  assert.equal(validateEvent({ ...EV, end: '' }, NOW).value.ends_at, '2026-11-29T21:00:00.000Z'); // default 2 hours
});

test('a public event passes; homes, past dates and threats do not', () => {
  assert.equal(validateEvent(EV, NOW).ok, true);
  assert.equal(validateEvent({ ...EV, address: '139 Tremont St' }, NOW).ok, true); // public venue address is fine
  assert.equal(validateEvent({ ...EV, address: '22 Elm St Apt 4' }, NOW).field, 'address');
  assert.equal(validateEvent({ ...EV, venue: 'Outside his house' }, NOW).field, 'address');
  assert.equal(validateEvent({ ...EV, public_place: false }, NOW).field, 'public_place');
  assert.equal(validateEvent({ ...EV, date: '2026-11-01' }, NOW).field, 'date');
  assert.equal(validateEvent({ ...EV, date: '2028-01-01' }, NOW).field, 'date');
  assert.equal(validateEvent({ ...EV, body: 'lets shoot the agents' }, NOW).field, 'body');
  assert.equal(validateEvent({ ...EV, body: 'Questions? Call 617-555-1234' }, NOW).field, 'body');
  assert.equal(validateEvent({ ...EV, state: 'XX' }, NOW).field, 'state');
  assert.equal(validateEvent({ ...EV, link: 'javascript:alert(1)' }, NOW).field, 'link');
});

test('online events need a join link and no place', () => {
  assert.equal(validateEvent({ ...EV, online: true, venue: '', town: '', public_place: false }, NOW).field, 'online_url');
  const v = validateEvent({ ...EV, online: true, online_url: 'https://zoom.us/j/123', venue: '', town: '', public_place: false }, NOW);
  assert.equal(v.ok, true);
  assert.equal(v.value.address, null);
});

test('calendar file is valid: UTC times, escaped text, lines folded at 75', () => {
  const ics = icsFor({ id: 'abc', title: 'Vigil, then march; all welcome', starts_at: '2026-11-29T19:00:00.000Z', ends_at: '2026-11-29T21:00:00.000Z', venue: 'Boston Common', town: 'Boston', state: 'MA', organizer: 'Org', body: 'x'.repeat(200) }, 'https://bostondaily.us');
  assert.match(ics, /DTSTART:20261129T190000Z\r\n/);
  assert.ok(ics.includes('SUMMARY:Vigil\\, then march\\; all welcome'));
  for (const line of ics.split('\r\n')) assert.ok(new TextEncoder().encode(line).length <= 75, line);
  assert.ok(ics.endsWith('END:VCALENDAR\r\n'));
});

test('page has the Podium | Events tabs, event form help and report reasons', () => {
  const app = cornerApp();
  assert.match(app, /data-tab="podium"/);
  assert.match(app, /data-tab="events"/);
  assert.match(app, /not someone’s home/);
  assert.match(app, /private_home/);
  assert.match(app, /Before you go/);
});
