// End-to-end check against a running dev server: `npm run dev`, then `node test/e2e.mjs`.
// Uses the dev credentials from .dev.vars.
import { createHmac } from 'node:crypto';

const BASE = process.env.BASE || 'http://localhost:8787';
const TOKEN = process.env.EDITOR_TOKEN || 'dev-editor-token';
const SECRET = process.env.INGEST_SECRET || 'dev-ingest-secret';
let failures = 0;

const check = (cond, msg) => { console.log(`${cond ? 'PASS' : 'FAIL'}  ${msg}`); if (!cond) failures++; };
async function api(method, path, body) {
  const res = await fetch(BASE + path, { method, headers: { authorization: `Bearer ${TOKEN}`, 'content-type': 'application/json' }, body: body ? JSON.stringify(body) : undefined });
  return { status: res.status, data: await res.json().catch(() => null) };
}
async function ingest(path, payload) {
  const raw = JSON.stringify(payload);
  const sig = createHmac('sha256', SECRET).update(raw).digest('hex');
  const res = await fetch(BASE + path, { method: 'POST', headers: { 'content-type': 'application/json', 'x-signature': `sha256=${sig}` }, body: raw });
  return { status: res.status, data: await res.json().catch(() => null) };
}
const page = async (path) => { const r = await fetch(BASE + path, { redirect: 'manual' }); return { status: r.status, text: await r.text(), headers: r.headers }; };

const BODY = 'The Massachusetts Senate voted 31-8 on Thursday to approve the bill, according to the official roll call published by the legislature. The measure now moves to the House.';

// Auth
check((await fetch(BASE + '/api/admin/overview')).status === 401, 'Admin API rejects unauthenticated requests');
check((await ingest('/api/ingest/blog', {}).then(() => fetch(BASE + '/api/ingest/blog', { method: 'POST', body: '{}' }))).status === 401, 'Ingest rejects unsigned requests');

// Newsroom politics story lifecycle
const created = await api('POST', '/api/admin/stories', { headline: 'Senate approves transit funding bill', section_slug: 'us-politics', body: BODY, status: 'DRAFTING' });
check(created.status === 201, 'Editor creates a politics story');
const id = created.data.id;
check((await api('POST', `/api/admin/stories/${id}/transition`, { to: 'PUBLISHED' })).status === 409, 'Cannot jump straight to PUBLISHED');
await api('POST', `/api/admin/stories/${id}/transition`, { to: 'EDITORIAL_REVIEW' });
let r = await api('POST', `/api/admin/stories/${id}/approve`, {});
check(r.status === 422 && r.data.problems.some((p) => /provenance|sources/i.test(p)), 'Approval blocked without sources');
const src = await api('POST', `/api/admin/stories/${id}/sources`, { title: 'Senate roll call', url: 'https://malegislature.gov/', publisher: 'Massachusetts Legislature', rights_type: 'DISCOVERY_ONLY' });
r = await api('POST', `/api/admin/stories/${id}/approve`, {});
check(r.status === 422 && r.data.problems.some((p) => /DISCOVERY_ONLY/.test(p)), 'Approval blocked with only DISCOVERY_ONLY sources');
const src2 = await api('POST', `/api/admin/stories/${id}/sources`, { title: 'Official roll call vote', url: 'https://malegislature.gov/Bills', publisher: 'Massachusetts Legislature', rights_type: 'PRIMARY_SOURCE' });
r = await api('POST', `/api/admin/stories/${id}/approve`, {});
check(r.status === 422 && r.data.problems.some((p) => /not yet verified/.test(p)), 'Approval blocked while sources are unverified');
await api('PATCH', `/api/admin/sources/${src2.data.id}`, { verified: true });
r = await api('POST', `/api/admin/stories/${id}/approve`, { note: 'Checked against roll call' });
check(r.status === 200 && r.data.story.status === 'APPROVED' && r.data.story.approved_by === 'Shaheen', 'Human editor approves');
r = await api('POST', `/api/admin/stories/${id}/publish`, {});
check(r.status === 200 && r.data.story.status === 'PUBLISHED' && r.data.story.published_at, 'Publish confirmed by database');
const slug = r.data.story.slug;
let p = await page(`/story/${slug}`);
check(p.status === 200 && p.text.includes('Senate approves transit funding bill'), 'Published story renders');
check(p.text.includes('Official roll call vote') && !p.text.includes('>Senate roll call<'), 'Public sources block shows verified sources, hides DISCOVERY_ONLY');
check(!p.text.includes('module-commerce') && !p.text.includes('Advertisement'), 'No commercial modules on politics story');
check((await api('PATCH', `/api/admin/stories/${id}`, { headline: 'Changed' })).status === 409, 'Published story cannot be silently edited');
r = await api('POST', `/api/admin/stories/${id}/update`, { body: BODY + ' The House is expected to take it up next week, the Speaker’s office said in a statement.', note: 'Added House timing from Speaker’s statement.' });
check(r.status === 200 && r.data.story.status === 'UPDATED' && r.data.story.version === 2, 'Update creates version 2 and UPDATED status');
r = await api('POST', `/api/admin/stories/${id}/correct`, { body: BODY.replace('31-8', '32-7'), note: 'An earlier version misstated the vote count. It was 32-7.' });
check(r.status === 200 && r.data.story.status === 'CORRECTED', 'Correction sets CORRECTED');
p = await page(`/story/${slug}`);
check(p.text.includes('Correction,') && p.text.includes('32-7'), 'Correction notice shows on story');
check((await page('/corrections')).text.includes('misstated the vote count'), 'Corrections page lists it');
const detail = await api('GET', `/api/admin/stories/${id}`);
check(detail.data.versions.length === 3, 'Three versions preserved (publish, update, correction)');

// Opinion rules and commercial lane restrictions
r = await api('POST', '/api/admin/stories', { headline: 'Buy this', section_slug: 'us-politics', lane: 'partner_commerce', type: 'blog_post' });
check(r.status === 422, 'Commercial content cannot be created in US Politics');

// Blog bot ingestion (auto-publish when gates pass)
const blogBody = '<h2>Best travel pillows</h2><p>Our partner picks for long flights, tested on red-eyes.</p><script>alert(1)</script><p><a href="https://www.awin1.com/cread.php?awinmid=1&awinaffid=3067297">Shop the pillow</a></p><ul><li>Memory foam</li><li>Machine washable</li></ul>';
r = await ingest('/api/ingest/blog', { site: 'flyhorizons.online', repo: 'shaheenarifch-arch/flyhorizons.online', path: 'blog/travel-pillows.json', sha: 'abc123', title: 'The best travel pillows for long flights', body_html: blogBody, reviewer: 'Talha N. Ch' });
check(r.status === 200 && r.data.status === 'PUBLISHED', `Blog bot post auto-published after gates (${r.data?.status} ${r.data?.reason || ''} ${(r.data?.problems || []).join(' ')})`);
const blogSlug = r.data.slug;
p = await page(`/story/${blogSlug}`);
check(p.text.includes('label-commerce') && p.text.includes('not Boston Daily news reporting'), 'Blog post carries affiliate label and disclosure');
check(p.text.includes('rel="sponsored nofollow noopener"') && !p.text.includes('<script>alert'), 'Affiliate links tagged sponsored; scripts stripped');
r = await ingest('/api/ingest/blog', { site: 'flyhorizons.online', repo: 'shaheenarifch-arch/flyhorizons.online', path: 'blog/travel-pillows.json', sha: 'def456', title: 'Dup', body_html: blogBody });
check(r.data.duplicate === true, 'Duplicate blog post is skipped');
r = await ingest('/api/ingest/blog', { site: 'medicalsupplie.com', path: 'blog/x.json', title: 'Home blood pressure monitors', body_markdown: 'A guide to home monitors from our partners, with details on cuff sizes and accuracy ratings.' });
check(r.data.status === 'EDITORIAL_REVIEW' && r.data.queued, 'Health-section blog post is queued for a human');
r = await ingest('/api/ingest/blog', { site: 'womenstyle.win', path: 'blog/y.json', title: 'BREAKING: reporters confirm this serum works', body_markdown: 'It cures everything and is doctor-approved, try it now for guaranteed results.' });
check(r.data.status === 'EDITORIAL_REVIEW' && r.data.problems.length >= 1, 'News-style framing and medical claims fail the gates');

// Products
r = await ingest('/api/ingest/products', {
  merchants: [{ network: 'awin', network_merchant_id: '117035', name: 'HappyPatina', publisher_account_id: '3067297', section: 'fashion-style' },
              { network: 'awin', network_merchant_id: '999', name: 'Hidden Vendor', display_name_allowed: false, section: 'home-living' }],
  products: [{ network: 'awin', network_merchant_id: '117035', external_id: 'bag-1', name: 'Leather weekender bag', price: 189, deep_link: 'https://www.awin1.com/cread.php?awinmid=117035&awinaffid=3067297', is_deal: true },
             { network: 'awin', network_merchant_id: '999', external_id: 'sheet-1', name: 'Bamboo sheet set', price: 79, deep_link: 'https://example.com/sheets' },
             { network: 'awin', network_merchant_id: '117035', external_id: 'bad', name: 'Bad link', deep_link: 'javascript:alert(1)' }],
});
check(r.data.products === 2 && r.data.errors.length === 1, 'Products sync upserts valid items and rejects bad links');
p = await page('/shop');
check(p.text.includes('Leather weekender bag') && p.text.includes('HappyPatina') && p.text.includes('Bamboo sheet set') && !p.text.includes('Hidden Vendor'), 'Shop lists all vendors; hides names where not allowed');
const goMatch = p.text.match(/\/go\/p\/([a-f0-9-]+)/);
const go = await page(goMatch[0]);
check(go.status === 302 && go.headers.get('location').startsWith('https://'), 'Outbound affiliate redirect works');

// Courses + businesses
r = await ingest('/api/ingest/courses', { courses: [{ title: 'AI for Small Business', type: 'owned', url: 'https://realskillset.com/courses/ai-small-business', category: 'AI', section: 'ai', level: 'Beginner', price: 49 }] });
check(r.data.upserted === 1, 'Course sync');
check((await page('/courses')).text.includes('AI for Small Business'), 'Courses page lists RealSkillSet course');
p = await page('/businesses');
check(p.text.includes('FlyHorizons') && p.text.includes('part of the GetServices.ai network'), 'Recommended Businesses lists network with ownership disclosure');

// Edition
r = await api('POST', '/api/admin/editions/build', { rebuild: true });
check(r.status === 200 && r.data.edition, 'Edition built');
p = await page('/');
check(p.text.includes('Senate approves transit funding bill') && p.text.includes('Edition'), 'Home shows today’s edition with the lead');
check((await page('/editions')).text.includes('Edition'), 'Edition archive renders');

// Advertise
const form = new URLSearchParams({ type: 'ADS', company: 'Acme', email: 'ads@acme.test', message: 'Display ads in Business' });
const sub = await fetch(BASE + '/api/inquiry', { method: 'POST', body: form, redirect: 'manual' });
check(sub.status === 303, 'Advertise inquiry accepted');
const inq = await api('GET', '/api/admin/inquiries');
check(inq.data.inquiries.some((i) => i.company === 'Acme' && i.status === 'new'), 'Inquiry lands in the console as new');

// Feeds
check(!(await page('/news-sitemap.xml')).text.includes(blogSlug), 'News sitemap excludes commercial content');
check((await page('/feed.xml')).status === 200, 'RSS feed');

const ov = await api('GET', '/api/admin/overview');
check(ov.status === 200 && ov.data.newsroom.CORRECTED === 1, 'Overview counts');

console.log(failures ? `\n${failures} check(s) failed` : '\nAll checks passed');
process.exit(failures ? 1 : 0);
