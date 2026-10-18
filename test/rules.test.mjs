import { test } from 'node:test';
import assert from 'node:assert/strict';
import { approvalProblems, canTransition, requiresHuman, commerceGateProblems } from '../src/lifecycle.js';
import { renderMarkdown, htmlToMarkdown } from '../src/markdown.js';

const editor = { name: 'Shaheen', kind: 'human' };
const system = { name: 'system:commerce-gates', kind: 'system' };
const politics = { slug: 'us-politics', name: 'US Politics', active: 1, commerce_allowed: 0, always_human: 1 };
const travel = { slug: 'travel', name: 'Travel', active: 1, commerce_allowed: 1, always_human: 0 };
const body = 'A body that is long enough to pass the minimum length check for publishing.';
const verified = [{ rights_type: 'PRIMARY_SOURCE', verified: 1 }];

test('no shortcuts through the lifecycle', () => {
  assert.equal(canTransition('DRAFTING', 'PUBLISHED'), false);
  assert.equal(canTransition('DISCOVERED', 'RESEARCHING'), true);
  assert.equal(canTransition('EDITORIAL_REVIEW', 'APPROVED'), false); // approval is its own gated operation
});

test('newsroom always needs a human; systems cannot approve news', () => {
  const story = { lane: 'newsroom', type: 'news_story', headline: 'H', body, section_slug: 'travel' };
  assert.equal(requiresHuman(story, travel), true);
  assert.ok(approvalProblems(story, travel, verified, system).some((p) => /human editor/.test(p)));
  assert.deepEqual(approvalProblems(story, travel, verified, editor), []);
});

test('discovery-only and unverified sources block news', () => {
  const story = { lane: 'newsroom', type: 'news_story', headline: 'H', body, section_slug: 'travel' };
  assert.ok(approvalProblems(story, travel, [{ rights_type: 'DISCOVERY_ONLY', verified: 1 }], editor).length);
  assert.ok(approvalProblems(story, travel, [{ rights_type: 'PRIMARY_SOURCE', verified: 0 }], editor).length);
});

test('commerce gates', () => {
  const ok = { lane: 'partner_commerce', type: 'blog_post', headline: 'Best pillows', body, disclosure_label: 'Affiliate', disclosure_text: 'This post contains affiliate links and we may earn.' };
  assert.deepEqual(commerceGateProblems(ok, travel), []);
  assert.ok(commerceGateProblems(ok, politics).some((p) => /not allowed/.test(p)));
  assert.ok(commerceGateProblems({ ...ok, disclosure_label: null }, travel).length);
  assert.ok(commerceGateProblems({ ...ok, byline: 'Boston Daily Staff' }, travel).length);
  assert.ok(commerceGateProblems({ ...ok, type: 'sponsored' }, travel).some((p) => /sponsor/.test(p)));
  assert.equal(requiresHuman({ ...ok, sensitive: 1 }, travel), true);
});

test('images need rights', () => {
  const story = { lane: 'newsroom', type: 'news_story', headline: 'H', body, section_slug: 'travel', hero_image_url: 'https://x/y.jpg' };
  assert.ok(approvalProblems(story, travel, verified, editor).some((p) => /usage rights/.test(p)));
});

test('markdown is safe', () => {
  const out = renderMarkdown('<script>x</script> [a](javascript:alert(1)) [b](https://ok.test)', { sponsoredLinks: true });
  assert.ok(!out.includes('<script>'));
  assert.ok(!out.includes('javascript:'));
  assert.ok(out.includes('rel="sponsored nofollow noopener"'));
  assert.ok(!htmlToMarkdown('<p onclick="x">hi</p><iframe src="e"></iframe>').includes('iframe'));
});
