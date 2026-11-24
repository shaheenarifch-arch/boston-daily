import { test } from 'node:test';
import assert from 'node:assert/strict';
import { checkText, youtubeId, cleanName, audioMime, findAddress, cleanTag } from '../src/corner-filter.js';
import { cornerHero, cornerApp, rightsCard } from '../src/corner.js';

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
