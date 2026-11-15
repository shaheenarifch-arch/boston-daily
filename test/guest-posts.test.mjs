import { test } from 'node:test';
import assert from 'node:assert/strict';
import { validateGuestPost, wordCount, guestEmail, publicStatus, guestAuthorBox } from '../src/guest-posts.js';
import { approvalProblems, isGuestApprover } from '../src/lifecycle.js';
import { renderMarkdown } from '../src/markdown.js';

const words = (n) => Array.from({ length: n }, (_, i) => `word${i}`).join(' ');
const good = {
  author_name: 'Jane Smith', author_email: 'Jane@Example.com', author_bio: 'Jane Smith is a Boston energy analyst who writes about fuel prices.',
  author_website: 'https://janesmith.example', section_slug: 'columns', headline: 'Why Boston needs cheaper winter heating', dek: 'A short summary.',
  body: words(900), hero_image_url: 'https://images.example.com/heating.jpg', hero_image_credit: 'Photo by Jane Smith', sources: 'https://www.eia.gov/',
  original: '1', rights: '1', editing: '1', no_payment: '1',
};

test('a complete guest post passes and the email is normalised', () => {
  const { problems, draft } = validateGuestPost(good);
  assert.deepEqual(problems, []);
  assert.equal(draft.author_email, 'jane@example.com');
});

test('length, photo, agreements, links and spam topics are enforced', () => {
  assert.ok(validateGuestPost({ ...good, body: words(300) }).problems.some((p) => /800–1500 words/.test(p)));
  assert.ok(validateGuestPost({ ...good, body: words(1700) }).problems.some((p) => /800–1500 words/.test(p)));
  assert.ok(validateGuestPost({ ...good, hero_image_url: 'https://example.com/page' }).problems.some((p) => /\.jpg/.test(p)));
  assert.ok(validateGuestPost({ ...good, no_payment: '' }).problems.some((p) => /agreement/.test(p)));
  const linky = `${words(850)} [a](https://a.com) [b](https://b.com) [c](https://c.com) [d](https://d.com)`;
  assert.ok(validateGuestPost({ ...good, body: linky }).problems.some((p) => /3 or fewer/.test(p)));
  assert.ok(validateGuestPost({ ...good, headline: 'Best casino bonus codes this year' }).problems.some((p) => /not accepted/.test(p)));
  assert.ok(validateGuestPost({ ...good, section_slug: 'us-politics' }).problems.some((p) => /Columns or Analysis/.test(p)));
});

test('pasted HTML is converted, never stored raw', () => {
  const { draft } = validateGuestPost({ ...good, body: `<p>${words(900)}</p><script>alert(1)</script>` });
  assert.ok(!/<script|<p>/.test(draft.body));
});

test('word count ignores Markdown symbols', () => {
  assert.equal(wordCount('## Heading here\n\n**Bold** text and [a link](https://x.com).'), 7);
});

test('only Shaheen can approve a guest story; other editors and systems are blocked', () => {
  const section = { slug: 'columns', name: 'Columns', active: 1, parent_slug: 'opinion', commerce_allowed: 0, always_human: 1 };
  const story = { lane: 'newsroom', type: 'opinion', headline: 'H', body: words(60), section_slug: 'columns', source_system: 'guest', hero_image_url: 'https://x/y.jpg', hero_image_rights: 'permitted_release' };
  const sources = [{ rights_type: 'ORIGINAL', verified: 1 }];
  assert.deepEqual(approvalProblems(story, section, sources, { name: 'Shaheen', kind: 'human' }), []);
  assert.ok(approvalProblems(story, section, sources, { name: 'Talha', kind: 'human' }).some((p) => /only be approved by Shaheen/.test(p)));
  assert.ok(approvalProblems(story, section, sources, { name: 'system:scheduler', kind: 'system' }).some((p) => /Shaheen/.test(p)));
  assert.equal(isGuestApprover({ name: 'shaheen', kind: 'human' }), true);
  // Non-guest opinion is unaffected.
  assert.deepEqual(approvalProblems({ ...story, source_system: 'manual' }, section, sources, { name: 'Talha', kind: 'human' }), []);
});

test('guest links are nofollow ugc in the story and the author box', () => {
  assert.match(renderMarkdown('See [data](https://eia.gov).', { ugcLinks: true }), /rel="nofollow ugc noopener"/);
  assert.match(renderMarkdown('See [data](https://eia.gov).'), /rel="noopener"/);
  const box = guestAuthorBox({ author_name: 'Jane <b>', author_bio: 'Analyst.', author_website: 'https://janesmith.example/' });
  assert.match(box, /rel="nofollow ugc noopener"/);
  assert.ok(box.includes('Jane &lt;b&gt;'));
});

test('status shown to the author follows the story', () => {
  assert.equal(publicStatus({ status: 'accepted' }, { status: 'SCHEDULED' }), 'scheduled');
  assert.equal(publicStatus({ status: 'accepted' }, { status: 'PUBLISHED' }), 'live');
  assert.equal(publicStatus({ status: 'accepted' }, { status: 'EDITORIAL_REVIEW' }), 'accepted');
  assert.equal(publicStatus({ status: 'declined' }, null), 'declined');
});

test('every email has a subject, the status link and escapes author text', () => {
  const site = { name: 'Boston Daily', url: 'https://bostondaily.us', editorEmail: 'editor@bostondaily.us' };
  const gp = { id: 'id1', ref: 'GP-12345', token: 'tok', author_name: 'Jane <script>', author_email: 'jane@example.com', headline: 'Head', body: words(900), section_slug: 'columns', editor_note: 'Shorten the intro.' };
  for (const kind of ['confirmation', 'changes', 'accepted', 'declined']) {
    const m = guestEmail(site, kind, gp);
    assert.ok(m.subject.length > 5);
    assert.ok(!m.html.includes('<script>'), kind);
  }
  assert.ok(guestEmail(site, 'confirmation', gp).html.includes('/guest-post/status?ref=GP-12345&amp;t=tok'));
  assert.ok(guestEmail(site, 'changes', gp).html.includes('Shorten the intro.'));
  assert.ok(guestEmail(site, 'editor', gp).html.includes('/admin/#/guest/id1'));
  const live = guestEmail(site, 'live', gp, { storyUrl: 'https://bostondaily.us/story/head' });
  assert.match(live.subject, /live/);
  assert.ok(live.html.includes('https://bostondaily.us/story/head') && live.html.includes('linkedin.com'));
});
