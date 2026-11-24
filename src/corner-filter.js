/**
 * Boston Speakers' Corner speech rules (pure functions, unit-tested in test/corner.test.mjs).
 *
 * Like Hyde Park's Speakers' Corner, almost everything is allowed: anger, profanity, insults aimed at
 * the powerful, unpopular views. Only four things are stopped:
 *   1. Threats of violence (true threats and calls to violence are not protected speech).
 *   2. Doxxing: phone numbers, email addresses, street addresses, Social Security numbers.
 *   3. Spam: link dumps, repeated characters.
 *   4. Clearly illegal content.
 * Text that mentions violence without clearly threatening anyone is "borderline": it goes live, and
 * when an ANTHROPIC_API_KEY is set a quick AI check (src/corner.js) can still stop a real threat.
 */

export const TAGS = [
  ['immigrants', 'Immigrants'],
  ['workers', 'Workers'],
  ['faith', 'Faith communities'],
  ['disabled', 'Disabled people'],
  ['lgbtq', 'LGBTQ+'],
  ['veterans', 'Veterans'],
  ['seniors', 'Seniors'],
  ['youth', 'Young people'],
  ['other', 'Everyone else'],
];
const TAG_SET = new Set(TAGS.map(([k]) => k));
export const tagLabel = (k) => (TAGS.find(([t]) => t === k) || [null, ''])[1];

export const LIMITS = {
  nameMax: 40,
  townMax: 40,
  textMax: 5000,
  captionMax: 500,
  replyMax: 1500,
  audioMaxBytes: 8 * 1024 * 1024,   // 8 MB: ~3 minutes of a 320 kbps MP3, or far more of a phone recording
  audioMaxSeconds: 600,
};

export const AUDIO_TYPES = ['audio/webm', 'audio/ogg', 'audio/mp4', 'audio/mpeg', 'audio/mp3', 'audio/wav', 'audio/x-wav', 'audio/wave', 'audio/aac', 'audio/x-m4a', 'audio/m4a', 'video/webm', 'video/mp4'];

/** Normalises a content type ("audio/webm;codecs=opus" → "audio/webm"); null when not an allowed audio type. */
export function audioMime(type) {
  const base = String(type || '').split(';')[0].trim().toLowerCase();
  if (!AUDIO_TYPES.includes(base)) return null;
  // Browsers that record "video/webm" or "video/mp4" with only an audio track still play it as audio.
  return base.replace(/^video\//, 'audio/').replace('audio/mp3', 'audio/mpeg').replace('audio/x-wav', 'audio/wav').replace('audio/wave', 'audio/wav').replace('audio/x-m4a', 'audio/mp4').replace('audio/m4a', 'audio/mp4');
}

export function cleanTag(tag) {
  const t = String(tag || '').trim().toLowerCase();
  return TAG_SET.has(t) ? t : null;
}

/** Plain one-line text: no tags, no control characters, collapsed spaces, capped length. */
export function cleanLine(value, max) {
  return String(value || '').replace(/[<>]/g, '').replace(/[\u0000-\u001f\u007f]/g, ' ').replace(/\s+/g, ' ').trim().slice(0, max);
}

/** Multi-line text: keeps line breaks (max two in a row), drops control characters, capped length. */
export function cleanText(value, max) {
  return String(value || '').replace(/\r\n?/g, '\n').replace(/[\u0000-\u0009\u000b-\u001f\u007f]/g, ' ')
    .replace(/[ \t]+\n/g, '\n').replace(/\n{3,}/g, '\n\n').trim().slice(0, max);
}

/** YouTube video id from any common link form, or null. */
export function youtubeId(input) {
  const raw = String(input || '').trim();
  if (/^[A-Za-z0-9_-]{11}$/.test(raw)) return raw;
  let u;
  try { u = new URL(/^https?:\/\//i.test(raw) ? raw : `https://${raw}`); } catch { return null; }
  const host = u.hostname.toLowerCase().replace(/^(www|m|music)\./, '');
  let id = null;
  if (host === 'youtu.be') id = u.pathname.split('/')[1];
  else if (host === 'youtube.com' || host === 'youtube-nocookie.com') {
    if (u.pathname === '/watch') id = u.searchParams.get('v');
    else {
      const m = u.pathname.match(/^\/(?:shorts|embed|live|v)\/([^/?#]+)/);
      if (m) id = m[1];
    }
  }
  return id && /^[A-Za-z0-9_-]{11}$/.test(id) ? id : null;
}

// ── Doxxing ──
const PHONE = /(?:\+?1[\s.-]?)?(?:\(\d{3}\)|\b\d{3})[\s.-]\d{3}[\s.-]\d{4}\b/;
const SSN = /\b\d{3}-\d{2}-\d{4}\b/;
const EMAIL = /[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}/;
const STREET_SUFFIX = '(?:street|st|avenue|ave|road|rd|lane|ln|drive|dr|court|ct|boulevard|blvd|way|place|pl|terrace|ter|circle|cir|parkway|pkwy|highway|hwy|square|sq)';
const ADDRESS = new RegExp(`\\b\\d{1,6}[A-Za-z]?\\s+((?:[A-Za-z0-9.'-]+\\s+){0,4})${STREET_SUFFIX}\\b`, 'gi');
// Words that show "5 days on the street" is a sentence, not an address.
const NOT_ADDRESS = new Set(['the', 'a', 'an', 'on', 'in', 'at', 'of', 'to', 'for', 'and', 'or', 'from', 'by', 'with', 'my', 'our', 'their', 'his', 'her', 'this', 'that',
  'days', 'day', 'years', 'year', 'months', 'month', 'weeks', 'week', 'hours', 'hour', 'minutes', 'times', 'people', 'men', 'women', 'kids', 'children', 'families', 'agents', 'officers', 'cops', 'cars', 'blocks', 'miles', 'feet', 'percent', 'dollars', 'were', 'was', 'are', 'is', 'went', 'came', 'walked', 'stood', 'lived', 'slept']);

export function findAddress(text) {
  for (const m of String(text).matchAll(ADDRESS)) {
    const words = m[1].trim().toLowerCase().split(/\s+/).filter(Boolean);
    if (!words.some((w) => NOT_ADDRESS.has(w.replace(/[.,'-]/g, '')))) return m[0];
  }
  return null;
}

// ── Threats ──
const STRONG = '(?:kill|murder|shoot|stab|bomb|lynch|hang|behead|execute|strangle|assassinate|gun\\s+down|blow\\s+up|torch|firebomb|rape)';
const VIOLENT_ANY = /\b(?:kill(?:ed|ing|s)?|murder\w*|shoot\w*|shot|stab\w*|bomb\w*|lynch\w*|hang(?:ed)?|behead\w*|execut\w*|strangl\w*|assassinat\w*|gun\w*|blow\w*\s+up|torch\w*|burn\w*|attack\w*|hurt\w*|beat\w*|rape\w*|die|dead|death|bullet\w*|weapon\w*|explosive\w*)\b/i;
const TARGETS = '(?:ice|cbp|dhs|agents?|officers?|cops?|police|feds?|judges?|him|her|them|you|y\\W?all|politicians?|senators?|congressm[ae]n|representatives?|governors?|president|mayor|immigrants?|migrants?|illegals?|jews?|muslims?|christians?|catholics?|hindus?|sikhs?|blacks?|whites?|asians?|latinos?|mexicans?|gays?|trans\\w*|lesbians?|liberals?|conservatives?|democrats?|republicans?|protesters?|everyone|everybody|people|office|building|facility|headquarters|station|school|church|mosque|synagogue|temple|courthouse|clinic|embassy)';
const IDIOM_OBJECTS = /^(?:the\s+|this\s+|that\s+|our\s+)?(?:bill|law|policy|policies|proposal|program|idea|deal|plan|vote|time|it|vibe|mood|lights?|engine|budget|amendment|order|rule|motion|game|show|music|song|video)\b/i;

const BLOCK_PATTERNS = [
  // First-person intent: "I'll shoot ...", "we are going to bomb ...", "I'm gonna kill ..."
  new RegExp(`\\b(?:i|we)\\s*(?:'ll|’ll|\\s+will|\\s+wanna|\\s+want\\s+to|\\s+am\\s+going\\s+to|\\s+are\\s+going\\s+to|\\s+gonna|'m\\s+gonna|’m\\s+gonna|'re\\s+gonna|’re\\s+gonna|'m\\s+going\\s+to|’m\\s+going\\s+to|\\s+plan\\s+to|\\s+intend\\s+to|\\s+shall)\\s+(?:\\w+\\s+){0,2}?${STRONG}\\b\\s*(.{0,30})`, 'i'),
  // Calls to act: "let's kill the agents", "someone should shoot him", "time to lynch ..."
  new RegExp(`\\b(?:let'?s|let’s|lets|somebody|someone|everyone|everybody|we\\s+(?:should|need\\s+to|must|gotta|have\\s+to)|you\\s+(?:should|need\\s+to|must)|go|time\\s+to|gotta|need\\s+to)\\s+(?:\\w+\\s+){0,2}?${STRONG}\\b\\s*(.{0,30})`, 'i'),
  // Wishing violence on people: "should be shot", "deserves to die", "must die"
  /\b(?:should|deserves?\s+to|needs?\s+to|ought\s+to|must|gotta|has\s+to|have\s+to)\s+(?:all\s+)?be\s+(?:killed|shot|hanged|hung|lynched|murdered|beheaded|stabbed|burned\s+alive|gunned\s+down|strung\s+up)\b/i,
  /\b(?:deserves?\s+to|should|must|needs?\s+to|ought\s+to|gotta|has\s+to|have\s+to)\s+die\b/i,
  /\bput\s+a\s+bullet\s+in\b/i,
  /\b(?:i|we)\s+know\s+where\s+(?:you|he|she|they|your\s+\w+)\s+(?:live|lives|sleep|sleeps|work|works)\b/i,
  /\bfind\s+(?:out\s+)?where\s+(?:he|she|they|that\s+\w+|this\s+\w+)\s+(?:lives?|sleeps?)\b/i,
];

const TARGETED_VIOLENCE = new RegExp(`\\b${STRONG}\\s+(?:all\\s+|every\\s+|those\\s+|these\\s+|the\\s+|that\\s+|this\\s+|some\\s+|more\\s+)*${TARGETS}\\b`, 'i');

const ILLEGAL = /\b(?:child\s+porn\w*|csam|kiddie\s+porn)\b/i;

/**
 * Checks words someone wants to post.
 * Returns { ok: true } | { ok: true, borderline: true } | { ok: false, code, message }.
 */
export function checkText(text, { allowEmpty = false, allowAddress = false } = {}) {
  const t = String(text || '');
  if (!t.trim()) return allowEmpty ? { ok: true } : { ok: false, code: 'empty', message: 'Write something first.' };

  if (ILLEGAL.test(t)) return { ok: false, code: 'illegal', message: 'This can’t be posted: it refers to illegal content.' };

  if (SSN.test(t)) return { ok: false, code: 'doxxing', message: 'Take out the Social Security number. Personal numbers are never posted here.' };
  if (EMAIL.test(t)) return { ok: false, code: 'doxxing', message: 'Take out the email address. To protect people, contact details aren’t posted here.' };
  if (PHONE.test(t)) return { ok: false, code: 'doxxing', message: 'Take out the phone number. To protect people, contact details aren’t posted here.' };
  // Events may name a public venue's address; everywhere else a street address is treated as doxxing.
  if (!allowAddress && findAddress(t)) return { ok: false, code: 'doxxing', message: 'Take out the street address. Name the town or the building instead, so nobody’s home is exposed.' };

  for (const re of BLOCK_PATTERNS) {
    const m = t.match(re);
    if (!m) continue;
    // "I'm going to kill this bill" is politics, not a threat.
    if (m[1] !== undefined && IDIOM_OBJECTS.test(m[1].trim())) continue;
    return { ok: false, code: 'threat', message: 'This reads as a threat of violence, which isn’t protected speech. Say how angry you are, criticise anyone you like, but don’t threaten to hurt people.' };
  }

  const links = (t.match(/https?:\/\/|www\./gi) || []).length;
  if (links > 2) return { ok: false, code: 'spam', message: 'Too many links. Share at most two.' };
  if (/(.)\1{29,}/s.test(t)) return { ok: false, code: 'spam', message: 'That looks like spam. Take out the repeated characters.' };

  if (TARGETED_VIOLENCE.test(t) || VIOLENT_ANY.test(t)) return { ok: true, borderline: true };
  return { ok: true };
}

/** Display name: "Anonymous" when blank; contact details are never allowed in a name. */
export function cleanName(value) {
  const n = cleanLine(value, LIMITS.nameMax);
  if (!n) return { ok: true, value: 'Anonymous' };
  if (EMAIL.test(n) || PHONE.test(n)) return { ok: false, message: 'Use a name, not an email or phone number.' };
  return { ok: true, value: n };
}

export const REPORT_REASONS = [
  ['threat', 'Threat of violence'],
  ['doxxing', 'Shares someone’s private details'],
  ['spam', 'Spam or scam'],
  ['illegal', 'Illegal content'],
  ['copyright', 'Uses my copyrighted work'],
  ['other', 'Something else'],
];
export const REPORT_SET = new Set(REPORT_REASONS.map(([k]) => k));
