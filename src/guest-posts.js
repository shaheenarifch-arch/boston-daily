/**
 * Guest posts ("Write for Us").
 *
 * Reader side:  GET /write-for-us (guidelines + form), POST /write-for-us (submit),
 *               GET /guest-post/status (private status link, or ref + email lookup),
 *               POST /guest-post/status (author resubmits after "changes requested").
 * Console side: /api/admin/guest-posts… (list, detail, actions). Only Shaheen can accept a
 *               submission, and the story it becomes still needs Shaheen's approval
 *               (GUEST_APPROVERS in lifecycle.js), so nothing a guest sends can publish by itself.
 * Emails:       author confirmation, editor alert, changes requested, accepted, declined, and
 *               "your post is live" (sent by guestLiveSweep once the story is published).
 *               Sending uses Resend when RESEND_API_KEY and NEWSLETTER_FROM are set; without them
 *               everything else works and each email is logged as "not sent".
 */
import { uid, nowIso, esc, html, json, errorJson, readJson, isHttpUrl, ipHash, slugify, formatDateTime } from './util.js';
import { htmlToMarkdown, renderMarkdown } from './markdown.js';
import { SITE } from './reader/components.js';
import { layout, loadChrome } from './reader/layout.js';
import { transition, isGuestApprover, PUBLIC_STATES } from './lifecycle.js';

/** Sections a guest can write for. Both sit under Opinion, which is commerce-free and always human-reviewed. */
export const GUEST_SECTIONS = [
  ['columns', 'Opinion: Columns', 'A signed argument or point of view.'],
  ['analysis', 'Opinion: Analysis', 'Explanation and context from your expertise.'],
];
export const MIN_WORDS = 800;
export const MAX_WORDS = 1500;
const DAILY_LIMIT = 3;
const GUIDE_HELP = '/write-for-us#guidelines';

export const STATUS_LABEL = {
  received: 'Received', in_review: 'In review', changes_requested: 'Changes requested', accepted: 'Accepted',
  scheduled: 'Scheduled', live: 'Live', declined: 'Declined',
};
const STEPS = ['received', 'in_review', 'accepted', 'scheduled', 'live'];

export const wordCount = (text) => (String(text || '').replace(/\]\([^)]*\)/g, ' ').replace(/https?:\/\/\S+/g, ' ').replace(/[#>*_|\-[\]()]/g, ' ').match(/\b[\w'’]+\b/g) || []).length;

const newRef = () => `GP-${String(Math.floor(10000 + Math.random() * 90000))}`;
const newToken = () => [...crypto.getRandomValues(new Uint8Array(18))].map((b) => b.toString(16).padStart(2, '0')).join('');
const statusUrl = (site, gp) => `${site.url}/guest-post/status?ref=${encodeURIComponent(gp.ref)}&t=${encodeURIComponent(gp.token)}`;

// ───────────────────────────── Validation (pure, tested) ─────────────────────────────

/** Normalises a submitted form into a guest post draft and lists every problem in plain words. */
export function validateGuestPost(input) {
  const get = (k, max) => String(input[k] ?? '').trim().slice(0, max);
  let body = get('body', 30000);
  if (/<[a-z][^>]*>/i.test(body)) body = htmlToMarkdown(body); // pasted HTML is converted, never stored raw
  const d = {
    author_name: get('author_name', 120), author_email: get('author_email', 200).toLowerCase(), author_bio: get('author_bio', 400),
    author_website: get('author_website', 300), section_slug: get('section_slug', 40), headline: get('headline', 160), dek: get('dek', 260),
    body, hero_image_url: get('hero_image_url', 600), hero_image_credit: get('hero_image_credit', 200), sources: get('sources', 3000),
  };
  const problems = [];
  if (d.author_name.length < 2) problems.push('Enter your full name as it should appear in the byline.');
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(d.author_email)) problems.push('Enter a valid email address. We send your confirmation and status updates there.');
  if (d.author_bio.length < 30) problems.push('Add a short author bio (at least 30 characters): who you are and why you can write on this topic.');
  if (d.author_website && !isHttpUrl(d.author_website)) problems.push('Your website must be a full link starting with https://');
  if (!GUEST_SECTIONS.some(([slug]) => slug === d.section_slug)) problems.push('Choose a section: Columns or Analysis.');
  if (d.headline.length < 10) problems.push('Add a headline (at least 10 characters).');
  const words = wordCount(d.body);
  if (words < MIN_WORDS || words > MAX_WORDS) problems.push(`Your article is ${words} words. Guest posts must be ${MIN_WORDS}–${MAX_WORDS} words.`);
  if (!isHttpUrl(d.hero_image_url)) problems.push('Add a link to a real photo for the top of your article (starting with https://).');
  else if (!/\.(jpe?g|png|webp)(\?|$)/i.test(d.hero_image_url)) problems.push('The photo link must point straight to a .jpg, .png or .webp image file.');
  if (d.hero_image_credit.length < 3) problems.push('Add the photo credit (who took it, or "Photo by the author").');
  const links = [...d.body.matchAll(/\]\((https?:\/\/[^)\s]+)\)/g)].map((m) => m[1]);
  if (links.length > 3) problems.push(`Your article has ${links.length} links. Keep it to 3 or fewer, plus your one bio link.`);
  if (/\b(casino|betting|viagra|cbd|payday loan|crypto signals?|escort)\b/i.test(`${d.headline} ${d.body}`)) problems.push('This topic is not accepted for guest posts. See the guidelines.');
  for (const k of ['original', 'rights', 'editing', 'no_payment']) if (!input[k]) { problems.push('Tick all four agreement boxes before sending.'); break; }
  return { draft: d, problems, words };
}

// ───────────────────────────── Email ─────────────────────────────

export function emailConfigured(env) { return !!(env.RESEND_API_KEY && env.NEWSLETTER_FROM); }

async function logEvent(db, gpId, kind, note, actor) {
  await db.prepare('INSERT INTO guest_post_events (id, guest_post_id, kind, note, actor, created_at) VALUES (?,?,?,?,?,?)')
    .bind(uid(), gpId, kind, note || null, actor, nowIso()).run();
}

function emailShell(site, heading, inner) {
  return `<div style="font-family:Arial,Helvetica,sans-serif;color:#1b2733;max-width:600px;margin:0 auto;line-height:1.55">
  <p style="font-family:Georgia,serif;font-size:22px;font-weight:bold;margin:0 0 4px">${esc(site.name)}</p>
  <p style="margin:0 0 18px;color:#4a5663;font-size:13px">Guest posts</p>
  <h1 style="font-size:20px;margin:0 0 12px">${esc(heading)}</h1>
  ${inner}
  <hr style="border:0;border-top:1px solid #d8dde2;margin:24px 0 12px">
  <p style="font-size:12px;color:#4a5663;margin:0">Questions? Reply to this email or write to <a href="mailto:${esc(site.editorEmail)}" style="color:#1d4f7a">${esc(site.editorEmail)}</a>.
  Guest post guidelines: <a href="${esc(site.url)}${GUIDE_HELP}" style="color:#1d4f7a">${esc(site.url)}/write-for-us</a></p></div>`;
}
const btn = (href, label) => `<p style="margin:18px 0"><a href="${esc(href)}" style="background:#1d4f7a;color:#fff;padding:11px 16px;border-radius:5px;text-decoration:none;font-weight:bold">${esc(label)}</a></p>`;

async function sendEmail(env, db, gp, kind, { to, subject, html: body, replyTo }) {
  if (!emailConfigured(env)) {
    await logEvent(db, gp.id, `email:${kind}`, `Not sent (email sending is not set up): ${subject}`, 'system');
    return false;
  }
  try {
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST', headers: { authorization: `Bearer ${env.RESEND_API_KEY}`, 'content-type': 'application/json' },
      body: JSON.stringify({ from: env.NEWSLETTER_FROM, to: [to], reply_to: replyTo, subject, html: body }),
    });
    await logEvent(db, gp.id, `email:${kind}`, `${res.ok ? 'Sent' : `Failed (${res.status})`} to ${to}: ${subject}`, 'system');
    return res.ok;
  } catch (e) {
    await logEvent(db, gp.id, `email:${kind}`, `Failed to ${to}: ${e.message}`, 'system');
    return false;
  }
}

/** Every email this system sends, in one place. kind: confirmation | editor | changes | accepted | declined | live */
export function guestEmail(site, kind, gp, extra = {}) {
  const link = statusUrl(site, gp);
  const note = gp.editor_note ? `<blockquote style="margin:12px 0;padding:10px 14px;background:#eef3f7;border-left:3px solid #1d4f7a;white-space:pre-wrap">${esc(gp.editor_note)}</blockquote>` : '';
  switch (kind) {
    case 'confirmation': return {
      subject: `We received your guest post (${gp.ref})`,
      html: emailShell(site, 'Thank you. Your guest post has arrived.', `<p>Hi ${esc(gp.author_name)},</p>
        <p>We received <strong>“${esc(gp.headline)}”</strong>. Your reference number is <strong>${esc(gp.ref)}</strong>.</p>
        <p><strong>What happens next:</strong> the editor reads every submission, usually within 5 business days. You will get an email when your piece is accepted, needs changes, or is declined, and again the moment it goes live.</p>
        ${btn(link, 'Check your status')}<p style="font-size:13px;color:#4a5663">Keep this email: the button is your private status link.</p>`),
    };
    case 'editor': return {
      subject: `New guest post ${gp.ref}: ${gp.headline}`,
      html: emailShell(site, 'New guest post waiting for your review', `<table style="font-size:14px">
        ${[['Reference', gp.ref], ['Author', `${gp.author_name} <${gp.author_email}>`], ['Section', gp.section_slug], ['Headline', gp.headline], ['Words', String(extra.words ?? wordCount(gp.body))], ['Website', gp.author_website || '—'], ['Resubmission', extra.resubmitted ? 'Yes, after changes requested' : 'No']]
          .map(([k, v]) => `<tr><td valign="top" style="padding:2px 12px 2px 0"><b>${esc(k)}</b></td><td>${esc(v)}</td></tr>`).join('')}</table>
        ${btn(`${site.url}/admin/#/guest/${gp.id}`, 'Review in the newsroom console')}`),
    };
    case 'changes': return {
      subject: `Changes requested for your guest post (${gp.ref})`,
      html: emailShell(site, 'Your piece is close. A few changes, please.', `<p>Hi ${esc(gp.author_name)},</p>
        <p>The editor read <strong>“${esc(gp.headline)}”</strong> and asks for these changes:</p>${note}
        <p>Open your status page, edit the article and send it back. It goes straight to the editor again.</p>${btn(link, 'Edit and resubmit')}`),
    };
    case 'accepted': return {
      subject: `Accepted: your guest post (${gp.ref})`,
      html: emailShell(site, 'Good news: your guest post is accepted.', `<p>Hi ${esc(gp.author_name)},</p>
        <p><strong>“${esc(gp.headline)}”</strong> has been accepted for ${esc(site.name)}. It is now in final editing and will be scheduled for publication. We may make small edits for length, clarity and style.</p>
        ${note}<p>We will email you again the moment it is live.</p>${btn(link, 'Check your status')}`),
    };
    case 'declined': return {
      subject: `About your guest post (${gp.ref})`,
      html: emailShell(site, 'Thank you for writing to us.', `<p>Hi ${esc(gp.author_name)},</p>
        <p>Thank you for sending <strong>“${esc(gp.headline)}”</strong>. After review, we are not able to publish it.</p>${note}
        <p>You are welcome to send a different piece in the future. Our <a href="${esc(site.url)}${GUIDE_HELP}" style="color:#1d4f7a">guidelines</a> explain what we look for.</p>`),
    };
    case 'live': {
      const url = extra.storyUrl;
      const enc = encodeURIComponent(url);
      const t = encodeURIComponent(gp.headline);
      const shares = [['X', `https://twitter.com/intent/tweet?url=${enc}&text=${t}`], ['Facebook', `https://www.facebook.com/sharer/sharer.php?u=${enc}`],
        ['LinkedIn', `https://www.linkedin.com/sharing/share-offsite/?url=${enc}`], ['WhatsApp', `https://wa.me/?text=${t}%20${enc}`]];
      return {
        subject: `Your guest post is live on ${site.name}`,
        html: emailShell(site, 'Your guest post is live!', `<p>Hi ${esc(gp.author_name)},</p>
          <p><strong>“${esc(gp.headline)}”</strong> is now published on ${esc(site.name)}.</p>${btn(url, 'Read your post')}
          <p><strong>Share it:</strong> ${shares.map(([n, h]) => `<a href="${esc(h)}" style="color:#1d4f7a">${n}</a>`).join(' · ')}</p>
          <p style="font-size:13px;color:#4a5663">Readers can comment on the story page. Comments appear after moderation.</p>`),
      };
    }
    default: throw new Error(`unknown guest email ${kind}`);
  }
}

async function notify(env, db, gp, kind, extra = {}) {
  const site = SITE(env);
  const { subject, html: body } = guestEmail(site, kind, gp, extra);
  const toEditor = kind === 'editor';
  return sendEmail(env, db, gp, kind, { to: toEditor ? site.editorEmail : gp.author_email, subject, html: body, replyTo: toEditor ? gp.author_email : site.editorEmail });
}

// ───────────────────────────── Reader pages ─────────────────────────────

const field = (label, name, value, { type = 'text', help = '', required = true, max = 300, rows = 0, placeholder = '' } = {}) => {
  const id = `gp-${name}`;
  const input = rows
    ? `<textarea id="${id}" name="${name}" rows="${rows}" maxlength="${max}"${required ? ' required' : ''}${placeholder ? ` placeholder="${esc(placeholder)}"` : ''} aria-describedby="${id}-help">${esc(value || '')}</textarea>`
    : `<input id="${id}" name="${name}" type="${type}" maxlength="${max}" value="${esc(value || '')}"${required ? ' required' : ''}${placeholder ? ` placeholder="${esc(placeholder)}"` : ''} aria-describedby="${id}-help">`;
  return `<label for="${id}">${esc(label)}${required ? '' : ' <span class="gp-optional">(optional)</span>'}${input}</label>${help ? `<p class="gp-help" id="${id}-help">${help}</p>` : ''}`;
};

/** The article fields, shared by the first submission and the "edit and resubmit" form. */
function articleFields(v) {
  return `<label for="gp-section_slug">Section<select id="gp-section_slug" name="section_slug" required aria-describedby="gp-section_slug-help">
      ${GUEST_SECTIONS.map(([slug, name]) => `<option value="${slug}"${v.section_slug === slug ? ' selected' : ''}>${esc(name)}</option>`).join('')}</select></label>
    <p class="gp-help" id="gp-section_slug-help">${GUEST_SECTIONS.map(([, n, d]) => `<strong>${esc(n.replace('Opinion: ', ''))}</strong>: ${esc(d)}`).join(' ')}</p>
    ${field('Headline', 'headline', v.headline, { max: 160, help: 'Clear and specific, under 100 characters works best. The editor may sharpen it.' })}
    ${field('Summary', 'dek', v.dek, { required: false, max: 260, help: 'One sentence under the headline that tells readers what you argue.' })}
    ${field('Your article', 'body', v.body, { rows: 18, max: 30000, help: `${MIN_WORDS}–${MAX_WORDS} words. Formatting: <code>## Subheading</code>, <code>**bold**</code>, <code>*italic*</code>, <code>[link text](https://…)</code>, and <code>- </code> for lists. Up to 3 links. <span data-wordcount aria-live="polite"></span>` })}
    ${field('Photo link', 'hero_image_url', v.hero_image_url, { type: 'url', max: 600, placeholder: 'https://example.com/photo.jpg', help: 'A real photo (no drawings or AI images) that you took or have permission to use, linked straight to the .jpg, .png or .webp file. Every story on Boston Daily uses its own image, so send one that has not run with another story here. <a href="/write-for-us#photos">Photo rules</a>' })}
    ${field('Photo credit', 'hero_image_credit', v.hero_image_credit, { max: 200, placeholder: 'Photo by Jane Smith', help: 'Shown under the photo.' })}
    ${field('Sources', 'sources', v.sources, { rows: 4, max: 3000, required: false, help: 'One link or reference per line for any facts, figures or quotes. The editor checks them.' })}`;
}

function guidelines(site) {
  return `<section class="prose gp-guidelines" id="guidelines"><h2>Guest post guidelines</h2>
    <ul>
      <li><strong>Original and exclusive:</strong> not published anywhere else, including your own blog, LinkedIn or Medium. Do not repost it elsewhere for 30 days after it runs.</li>
      <li><strong>Length:</strong> ${MIN_WORDS}–${MAX_WORDS} words, with a clear argument and your own perspective or expertise.</li>
      <li><strong>Facts:</strong> back up figures and quotes with sources. Opinions are welcome; made-up facts are not.</li>
      <li><strong>Written by you:</strong> you may use tools to check grammar, but the ideas and writing must be yours. Mass-produced AI text is declined.</li>
      <li><strong>Links:</strong> up to 3 helpful links in the article and one link in your bio. Guest links are marked <code>nofollow</code>, as <a href="https://developers.google.com/search/docs/crawling-indexing/qualify-outbound-links" target="_blank" rel="noopener">Google recommends</a>.</li>
      <li><strong>Free and independent:</strong> we never charge to publish a guest post and we never accept payment for one. Want paid placement? That is clearly labeled <a href="/advertise">sponsored content</a>.</li>
      <li><strong>Any topic, any viewpoint:</strong> our 1st Amendment Page is open to every voice. We do not turn pieces down because we disagree with them.</li>
      <li><strong>The only limits</strong> are speech the law does not protect and spam: defamation (false statements of fact that harm a real person), threats or calls to violence, harassment or private details of private people, someone else's copyrighted work, and ads or scams dressed up as articles. <a href="https://www.uscourts.gov/about-federal-courts/educational-resources/about-educational-outreach/activity-resources/what-does" target="_blank" rel="noopener">What the First Amendment does and does not protect</a>.</li>
      <li><strong>Editing:</strong> the editor may edit for length, clarity, accuracy and style, and decides the headline and publication date. Every guest post is personally approved by the editor before it goes live.</li>
    </ul>
    <h3 id="photos">Photo rules</h3>
    <p>Send one real photograph that you took or have written permission to use, at least 1200 pixels wide. No drawings, logos, screenshots of other sites or AI-generated images. Tell us who took it so we can credit them.</p>
    <h3>What happens after you send it</h3>
    <ol>
      <li>You get a confirmation email with your reference number and a private status link.</li>
      <li>The editor reviews it, usually within 5 business days.</li>
      <li>You hear back by email: <em>accepted</em>, <em>changes requested</em> (you edit and resend from your status page) or <em>declined</em>.</li>
      <li>When it is published, we email you the link with share buttons.</li>
    </ol>
    <p>Questions? Email <a href="mailto:${esc(site.editorEmail)}?subject=${encodeURIComponent('Guest post question')}">${esc(site.editorEmail)}</a>. Already sent something? <a href="/guest-post/status">Check your status</a>.</p>
  </section>`;
}

export async function writeForUsPage(env, { values = {}, problems = [] } = {}) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const v = { section_slug: 'columns', ...values };
  const body = `<div class="page-head"><p class="crumb"><a href="/section/opinion">1st Amendment Page</a></p><h1>Write for Boston Daily</h1>
      <p class="page-sub">Share your view with our readers. Guest columns and analysis are free to submit, and every piece is read and approved by the editor before it is published.</p>
      <p><a class="button" href="#guest-form">Submit a guest post</a> <a class="button button-quiet" href="#guidelines">Read the guidelines</a></p></div>
    <div class="columns"><div class="col-main">${guidelines(site)}</div>
    <aside class="col-rail"><div class="module gp-rail"><p class="module-title">At a glance</p>
      <ul class="gp-facts"><li>${MIN_WORDS}–${MAX_WORDS} words</li><li>Original and unpublished</li><li>One real photo you have rights to</li><li>Free, no paid links</li><li>Reply within about 5 business days</li></ul>
      <p><a href="/guest-post/status">Check a submission’s status</a></p></div></aside></div>
    <form class="inquiry gp-form" id="guest-form" method="post" action="/write-for-us" novalidate>
      <h2>Submit your guest post</h2>
      <p class="gp-help">All fields are required unless marked optional. Need help? See the <a href="#guidelines">guidelines</a> or email <a href="mailto:${esc(site.editorEmail)}">${esc(site.editorEmail)}</a>.</p>
      ${problems.length ? `<div class="flash flash-err" role="alert"><p><strong>Please fix the following, then send again:</strong></p><ul>${problems.map((p) => `<li>${esc(p)}</li>`).join('')}</ul></div>` : ''}
      <fieldset class="gp-step" data-step="1"><legend>Step 1 of 3: About you</legend>
        ${field('Full name', 'author_name', v.author_name, { max: 120, help: 'Shown in the byline as “Your Name | Guest Contributor”.' })}
        ${field('Email', 'author_email', v.author_email, { type: 'email', max: 200, help: 'Private. We send your confirmation and status updates here.' })}
        ${field('Short bio', 'author_bio', v.author_bio, { rows: 3, max: 400, help: 'One or two sentences shown at the end of your article, for example “Jane Smith is a Boston energy analyst.”' })}
        ${field('Your website or profile', 'author_website', v.author_website, { type: 'url', required: false, max: 300, placeholder: 'https://', help: 'Your one bio link. It is marked nofollow.' })}
      </fieldset>
      <fieldset class="gp-step" data-step="2"><legend>Step 2 of 3: Your article</legend>${articleFields(v)}</fieldset>
      <fieldset class="gp-step" data-step="3"><legend>Step 3 of 3: Agreements</legend>
        <label class="gp-check"><input type="checkbox" name="original" value="1"${v.original ? ' checked' : ''}> This is my original work and has not been published anywhere else.</label>
        <label class="gp-check"><input type="checkbox" name="rights" value="1"${v.rights ? ' checked' : ''}> I took the photo or have permission to use it, and the credit is correct.</label>
        <label class="gp-check"><input type="checkbox" name="editing" value="1"${v.editing ? ' checked' : ''}> Boston Daily may edit my piece and decide when (or whether) it is published, as set out in the <a href="#guidelines">guidelines</a> and <a href="/terms">terms of use</a>.</label>
        <label class="gp-check"><input type="checkbox" name="no_payment" value="1"${v.no_payment ? ' checked' : ''}> No one paid me, and I am not paying anyone, to place this piece or its links.</label>
        <p class="gp-help">We use your email only for this submission. See our <a href="/privacy">privacy policy</a>.</p>
      </fieldset>
      <label class="hp" aria-hidden="true">Leave empty<input name="company_site" tabindex="-1" autocomplete="off"></label>
      <div class="gp-nav"><button class="button button-quiet" type="button" data-gp-back hidden>Back</button><button class="button" type="button" data-gp-next hidden>Next</button><button class="button" type="submit" data-gp-submit>Send my guest post</button></div>
    </form>
    <script src="/js/guest-post.js?v=1" defer></script>`;
  return html(layout(env, chrome, {
    title: 'Write for us: submit a guest post',
    description: `Submit a guest column or analysis to ${site.name}. Free to submit, ${MIN_WORDS}–${MAX_WORDS} words, original work, reviewed and approved by the editor.`,
    canonical: '/write-for-us', active: 'opinion', body,
    jsonLd: { '@context': 'https://schema.org', '@type': 'WebPage', name: `Write for us | ${site.name}`, url: site.url ? `${site.url}/write-for-us` : undefined },
  }), problems.length ? 422 : 200, problems.length ? { 'cache-control': 'no-store' } : {});
}

async function readForm(request) {
  const form = await request.formData();
  const out = {};
  for (const [k, v] of form.entries()) out[k] = typeof v === 'string' ? v : '';
  return out;
}

export async function submitGuestPost(env, request, ctx) {
  const db = env.DB;
  const input = await readForm(request);
  if (input.company_site) return Response.redirect(new URL('/write-for-us?sent=1', request.url), 303); // honeypot
  const { draft, problems, words } = validateGuestPost(input);
  if (!problems.length) {
    const since = new Date(Date.now() - 86400000).toISOString();
    const ip = await ipHash(request, env);
    const recent = await db.prepare('SELECT COUNT(*) AS n FROM guest_posts WHERE (author_email = ? OR ip_hash = ?) AND created_at >= ?').bind(draft.author_email, ip, since).first();
    if ((recent?.n || 0) >= DAILY_LIMIT) problems.push(`You can send up to ${DAILY_LIMIT} guest posts a day. Please try again tomorrow.`);
    const dupe = await db.prepare('SELECT ref FROM guest_posts WHERE author_email = ? AND lower(headline) = lower(?)').bind(draft.author_email, draft.headline).first();
    if (dupe) problems.push(`You already sent this piece (reference ${dupe.ref}). Use the status link in your confirmation email to follow it.`);
    if (await db.prepare('SELECT 1 FROM stories WHERE hero_image_url = ? UNION SELECT 1 FROM guest_posts WHERE hero_image_url = ?').bind(draft.hero_image_url, draft.hero_image_url).first()) {
      problems.push('That photo is already used on Boston Daily. Every story needs its own photo, so please send a different one.');
    }
    if (!problems.length) {
      let ref = newRef();
      for (let i = 0; i < 5 && (await db.prepare('SELECT 1 FROM guest_posts WHERE ref = ?').bind(ref).first()); i++) ref = newRef();
      const gp = { id: uid(), ref, token: newToken(), ...draft, author_website: draft.author_website || null, dek: draft.dek || null, sources: draft.sources || null };
      const ts = nowIso();
      await db.batch([
        db.prepare(`INSERT INTO guest_posts (id, ref, token, status, author_name, author_email, author_bio, author_website, section_slug, headline, dek, body,
          hero_image_url, hero_image_credit, sources, ip_hash, created_at, updated_at) VALUES (?,?,?,'received',?,?,?,?,?,?,?,?,?,?,?,?,?,?)`)
          .bind(gp.id, gp.ref, gp.token, gp.author_name, gp.author_email, gp.author_bio, gp.author_website, gp.section_slug, gp.headline, gp.dek, gp.body,
            gp.hero_image_url, gp.hero_image_credit, gp.sources, ip, ts, ts),
        db.prepare('INSERT INTO guest_post_events (id, guest_post_id, kind, note, actor, created_at) VALUES (?,?,?,?,?,?)').bind(uid(), gp.id, 'status:received', `Submitted (${words} words)`, gp.author_name, ts),
      ]);
      const mails = Promise.all([notify(env, db, gp, 'confirmation'), notify(env, db, gp, 'editor', { words })]).catch((e) => console.error('guest notify', e));
      if (ctx?.waitUntil) ctx.waitUntil(mails); else await mails;
      return Response.redirect(new URL(`/guest-post/status?ref=${encodeURIComponent(gp.ref)}&t=${gp.token}&new=1`, request.url), 303);
    }
  }
  return writeForUsPage(env, { values: input, problems });
}

/** Status shown to the author: scheduled and live come from the story itself. */
export function publicStatus(gp, story) {
  if (gp.status === 'declined' || gp.status === 'changes_requested') return gp.status;
  if (story && PUBLIC_STATES.includes(story.status)) return 'live';
  if (story && story.status === 'SCHEDULED') return 'scheduled';
  return gp.status === 'live' ? 'accepted' : gp.status;
}

export async function guestStatusPage(env, url, { problems = [], values = null, saved = false } = {}) {
  const db = env.DB;
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const ref = (url.searchParams.get('ref') || '').trim().toUpperCase();
  const token = url.searchParams.get('t') || '';
  const email = (url.searchParams.get('email') || '').trim().toLowerCase();
  let gp = null;
  if (ref && token) gp = await db.prepare('SELECT * FROM guest_posts WHERE ref = ? AND token = ?').bind(ref, token).first();
  else if (ref && email) gp = await db.prepare('SELECT * FROM guest_posts WHERE ref = ? AND author_email = ?').bind(ref, email).first();
  const page = (body) => html(layout(env, chrome, { title: 'Guest post status', description: 'Check the status of your Boston Daily guest post.', canonical: '/guest-post/status', body, noindex: true }),
    problems.length ? 422 : 200, { 'cache-control': 'no-store' });

  if (!gp) {
    return page(`<div class="page-head"><p class="crumb"><a href="/write-for-us">Write for us</a></p><h1>Guest post status</h1>
      <p class="page-sub">Use the button in your confirmation email, or enter your reference number and the email you used.</p></div>
      ${ref ? '<p class="flash flash-err" role="alert">We could not find a guest post with that reference and email. Check both and try again.</p>' : ''}
      <form class="inquiry gp-lookup" method="get" action="/guest-post/status">
        ${field('Reference number', 'ref', ref, { max: 20, placeholder: 'GP-12345', help: 'In the subject line of your confirmation email.' })}
        ${field('Email', 'email', email, { type: 'email', max: 200 })}
        <button class="button" type="submit">Check status</button>
        <p class="gp-help">Lost your reference? Email <a href="mailto:${esc(site.editorEmail)}?subject=${encodeURIComponent('Guest post status')}">${esc(site.editorEmail)}</a>.</p>
      </form>`);
  }

  const story = gp.story_id ? await db.prepare('SELECT slug, status, scheduled_at, published_at FROM stories WHERE id = ?').bind(gp.story_id).first() : null;
  const st = publicStatus(gp, story);
  const isNew = url.searchParams.get('new') === '1';
  const canEdit = !!token && gp.status === 'changes_requested';
  const progress = st === 'declined' || st === 'changes_requested' ? '' : `<ol class="gp-progress">${STEPS.map((s, i) => `<li class="${STEPS.indexOf(st) >= i ? 'done' : ''}${s === st ? ' current' : ''}">${STATUS_LABEL[s]}</li>`).join('')}</ol>`;
  const explain = {
    received: 'Your piece is waiting for the editor. Reviews usually take about 5 business days.',
    in_review: 'The editor is reading your piece now.',
    changes_requested: 'The editor asked for changes. Edit your piece below and send it back.',
    accepted: 'Accepted. Your piece is in final editing and will be scheduled soon.',
    scheduled: story?.scheduled_at ? `Scheduled to publish ${formatDateTime(story.scheduled_at, site.tz)}.` : 'Scheduled for publication.',
    live: 'Your guest post is live.',
    declined: 'We are not able to publish this piece. Thank you for writing to us.',
  }[st];
  const v = values || gp;
  const body = `<div class="page-head"><p class="crumb"><a href="/write-for-us">Write for us</a></p><h1>Guest post status</h1>
      <p class="page-sub">Reference <strong>${esc(gp.ref)}</strong> · “${esc(gp.headline)}” · sent ${esc(formatDateTime(gp.created_at, site.tz))}</p></div>
    ${isNew ? `<div class="flash flash-ok" role="status"><p><strong>Thank you, ${esc(gp.author_name)}. Your guest post was received.</strong> Your reference number is ${esc(gp.ref)}. ${emailConfigured(env) ? `A confirmation is on its way to ${esc(gp.author_email)}.` : ''} Bookmark this page to follow your piece.</p></div>` : ''}
    ${saved ? '<div class="flash flash-ok" role="status"><p><strong>Thank you. Your changes were sent to the editor.</strong></p></div>' : ''}
    <section class="prose"><p class="gp-status-now">Status: <span class="gp-badge gp-badge-${esc(st)}">${esc(STATUS_LABEL[st])}</span></p>
      ${progress}<p>${esc(explain)}</p>
      ${gp.editor_note && ['changes_requested', 'declined', 'accepted'].includes(gp.status) ? `<blockquote><p><strong>Note from the editor:</strong> ${esc(gp.editor_note)}</p></blockquote>` : ''}
      ${st === 'live' && story ? `<p><a class="button" href="/story/${esc(story.slug)}">Read your post</a></p>` : ''}
      <p class="gp-help">Questions? Email <a href="mailto:${esc(site.editorEmail)}?subject=${encodeURIComponent(`Guest post ${gp.ref}`)}">${esc(site.editorEmail)}</a> with your reference number.</p></section>
    ${canEdit ? `<form class="inquiry gp-form" method="post" action="/guest-post/status?ref=${encodeURIComponent(gp.ref)}&amp;t=${encodeURIComponent(token)}" novalidate>
      <h2>Edit and resubmit</h2>
      ${problems.length ? `<div class="flash flash-err" role="alert"><p><strong>Please fix the following, then send again:</strong></p><ul>${problems.map((p) => `<li>${esc(p)}</li>`).join('')}</ul></div>` : ''}
      ${articleFields(v)}
      ${field('Short bio', 'author_bio', v.author_bio, { rows: 3, max: 400 })}
      <button class="button" type="submit">Send my changes</button></form><script src="/js/guest-post.js?v=1" defer></script>` : ''}`;
  return page(body);
}

export async function resubmitGuestPost(env, request, url, ctx) {
  const db = env.DB;
  const ref = (url.searchParams.get('ref') || '').toUpperCase();
  const token = url.searchParams.get('t') || '';
  const gp = await db.prepare('SELECT * FROM guest_posts WHERE ref = ? AND token = ?').bind(ref, token).first();
  if (!gp || gp.status !== 'changes_requested') return guestStatusPage(env, url);
  const input = await readForm(request);
  // Identity and agreements carry over from the first submission.
  const merged = { ...input, author_name: gp.author_name, author_email: gp.author_email, author_website: gp.author_website || '', original: 1, rights: 1, editing: 1, no_payment: 1 };
  const { draft, problems, words } = validateGuestPost(merged);
  if (draft.hero_image_url !== gp.hero_image_url
    && await db.prepare('SELECT 1 FROM stories WHERE hero_image_url = ? UNION SELECT 1 FROM guest_posts WHERE hero_image_url = ? AND id != ?').bind(draft.hero_image_url, draft.hero_image_url, gp.id).first()) {
    problems.push('That photo is already used on Boston Daily. Please send a different one.');
  }
  if (problems.length) return guestStatusPage(env, url, { problems, values: { ...gp, ...draft } });
  const ts = nowIso();
  await db.prepare(`UPDATE guest_posts SET status = 'received', section_slug = ?, headline = ?, dek = ?, body = ?, hero_image_url = ?, hero_image_credit = ?, sources = ?, author_bio = ?, updated_at = ? WHERE id = ?`)
    .bind(draft.section_slug, draft.headline, draft.dek || null, draft.body, draft.hero_image_url, draft.hero_image_credit, draft.sources || null, draft.author_bio, ts, gp.id).run();
  await logEvent(db, gp.id, 'status:received', `Resubmitted with changes (${words} words)`, gp.author_name);
  const fresh = await db.prepare('SELECT * FROM guest_posts WHERE id = ?').bind(gp.id).first();
  const mail = notify(env, db, fresh, 'editor', { words, resubmitted: true }).catch((e) => console.error('guest notify', e));
  if (ctx?.waitUntil) ctx.waitUntil(mail); else await mail;
  return guestStatusPage(env, url, { saved: true });
}

/** Author box under a guest story. Bio link is nofollow ugc. */
export function guestAuthorBox(gp) {
  if (!gp) return '';
  return `<aside class="gp-author" aria-label="About the author"><p class="gp-author-label">Guest contributor</p>
    <p><strong>${esc(gp.author_name)}</strong> ${esc(gp.author_bio)}${gp.author_website ? ` <a href="${esc(gp.author_website)}" rel="nofollow ugc noopener" target="_blank">${esc(gp.author_website.replace(/^https?:\/\/(www\.)?/, '').replace(/\/$/, ''))}</a>` : ''}</p>
    <p class="gp-help">Guest posts reflect the author’s own views, not those of Boston Daily.</p></aside>`;
}

/** "Write for us" call to action used on Opinion pages and opinion stories. */
export function writeForUsBox({ compact = false } = {}) {
  return compact
    ? '<p class="gp-cta-line"><strong>Have a view?</strong> <a href="/write-for-us">Submit a guest column</a> to Boston Daily.</p>'
    : `<div class="module gp-cta"><p class="module-title">Your voice on the 1st Amendment Page</p>
      <p class="module-disclosure">Any guest writer, any topic, any viewpoint. Send ${MIN_WORDS}–${MAX_WORDS} words. Free to submit; the editor reviews each piece before it goes live.</p>
      <p><a class="button" href="/write-for-us">Submit a guest post</a></p><p><a class="module-more" href="/write-for-us#guidelines">Read the guidelines</a></p></div>`;
}

// ───────────────────────────── Live email sweep ─────────────────────────────

/** Marks accepted guest posts live once their story is published and sends the "your post is live" email (once). */
export async function guestLiveSweep(env) {
  const db = env.DB;
  const site = SITE(env);
  const { results } = await db.prepare(`SELECT g.*, s.slug AS story_slug FROM guest_posts g JOIN stories s ON s.id = g.story_id
    WHERE g.live_emailed_at IS NULL AND g.status IN ('accepted','live') AND s.status IN ('PUBLISHED','UPDATED','CORRECTED') LIMIT 20`).all();
  for (const gp of results) {
    // Claim the row first so two overlapping runs can't send twice.
    const claim = await db.prepare("UPDATE guest_posts SET status = 'live', live_emailed_at = ?, updated_at = ? WHERE id = ? AND live_emailed_at IS NULL").bind(nowIso(), nowIso(), gp.id).run();
    if (!claim.meta || claim.meta.changes !== 1) continue;
    await logEvent(db, gp.id, 'status:live', `Published at /story/${gp.story_slug}`, 'system');
    await notify(env, db, gp, 'live', { storyUrl: `${site.url}/story/${gp.story_slug}` });
  }
  return results.length;
}

// ───────────────────────────── Newsroom console API ─────────────────────────────

export async function guestAdmin(env, request, seg, editor) {
  const db = env.DB;
  const method = request.method;
  if (seg.length === 1 && method === 'GET') {
    const status = new URL(request.url).searchParams.get('status') || 'open';
    const where = status === 'open' ? "g.status IN ('received','in_review')" : status === 'all' ? '1=1' : 'g.status = ?';
    const q = db.prepare(`SELECT g.id, g.ref, g.status, g.author_name, g.author_email, g.section_slug, g.headline, g.created_at, g.updated_at, g.story_id,
      s.status AS story_status, s.slug AS story_slug FROM guest_posts g LEFT JOIN stories s ON s.id = g.story_id WHERE ${where} ORDER BY g.created_at DESC LIMIT 200`);
    const { results } = await (status === 'open' || status === 'all' ? q : q.bind(status)).all();
    return json({ ok: true, guest_posts: results, email_configured: emailConfigured(env), can_decide: isGuestApprover(editor) });
  }
  const gp = await db.prepare('SELECT * FROM guest_posts WHERE id = ?').bind(seg[1]).first();
  if (!gp) return errorJson('Guest post not found', 404);
  if (seg.length === 2 && method === 'GET') {
    const [{ results: events }, story] = await Promise.all([
      db.prepare('SELECT kind, note, actor, created_at FROM guest_post_events WHERE guest_post_id = ? ORDER BY created_at DESC').bind(gp.id).all(),
      gp.story_id ? db.prepare('SELECT id, slug, status FROM stories WHERE id = ?').bind(gp.story_id).first() : null,
    ]);
    const { token, ip_hash, ...safe } = gp;
    return json({ ok: true, guest_post: safe, words: wordCount(gp.body), preview: renderMarkdown(gp.body, { ugcLinks: true }), events, story,
      email_configured: emailConfigured(env), can_decide: isGuestApprover(editor) });
  }
  if (seg[2] === 'action' && method === 'POST') {
    const b = (await readJson(request)) || {};
    const note = String(b.note || '').trim().slice(0, 2000);
    const action = b.action;
    if (!isGuestApprover(editor)) return errorJson('Only Shaheen can review guest posts.', 403);
    if (['accepted', 'live', 'declined'].includes(gp.status)) return errorJson(`This submission is already ${STATUS_LABEL[gp.status].toLowerCase()}.`, 409);
    const setStatus = async (to, kind) => {
      const r = await db.prepare('UPDATE guest_posts SET status = ?, editor_note = ?, updated_at = ? WHERE id = ? AND status = ?').bind(to, note || null, nowIso(), gp.id, gp.status).run();
      if (!r.meta || r.meta.changes !== 1) throw Object.assign(new Error('This submission changed in the meantime; reload.'), { status: 409 });
      await logEvent(db, gp.id, `status:${to}`, note || null, editor.name);
      const fresh = { ...gp, status: to, editor_note: note || null };
      if (kind) await notify(env, db, fresh, kind);
      const { token, ip_hash, ...safe } = fresh; // the private status token never goes to the console
      return safe;
    };
    try {
      if (action === 'review') return json({ ok: true, guest_post: await setStatus('in_review', null) });
      if (action === 'changes') {
        if (note.length < 10) return errorJson('Tell the author what to change (at least 10 characters). They see this note.', 422);
        return json({ ok: true, guest_post: await setStatus('changes_requested', 'changes') });
      }
      if (action === 'decline') {
        if (note.length < 10) return errorJson('Add a short, polite reason (at least 10 characters). The author sees this note.', 422);
        return json({ ok: true, guest_post: await setStatus('declined', 'declined') });
      }
      if (action === 'accept') {
        const storyId = await createGuestStory(db, gp, editor);
        await db.prepare('UPDATE guest_posts SET story_id = ? WHERE id = ?').bind(storyId, gp.id).run();
        const fresh = await setStatus('accepted', 'accepted');
        return json({ ok: true, guest_post: fresh, story_id: storyId });
      }
    } catch (e) {
      return errorJson(e.message, e.status || 500, { problems: e.problems || [] });
    }
    return errorJson('Unknown action');
  }
  return errorJson('Not found', 404);
}

/** Turns an accepted submission into an Opinion story waiting in the editorial queue for Shaheen's approval. */
async function createGuestStory(db, gp, editor) {
  const section = await db.prepare('SELECT slug FROM sections WHERE slug = ? AND active = 1').bind(gp.section_slug).first();
  const sectionSlug = section ? section.slug : 'opinion';
  let slug = slugify(gp.headline);
  if (await db.prepare('SELECT 1 FROM stories WHERE slug = ?').bind(slug).first()) slug = `${slug}-${uid().slice(0, 6)}`;
  const id = uid();
  const ts = nowIso();
  const sources = String(gp.sources || '').split('\n').map((s) => s.trim()).filter(Boolean).slice(0, 15);
  const srcStmt = (title, urlv, rights, verified, isPublic, notes) => db.prepare(`INSERT INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, notes, added_by, created_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?)`).bind(uid(), id, title.slice(0, 300), urlv, null, 'guest', rights, verified, isPublic, notes, editor.name, ts);
  await db.batch([
    db.prepare(`INSERT INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights,
      priority, source_system, source_ref, created_by, created_at, updated_at) VALUES (?,?,'newsroom','opinion',?,'DRAFTING',0,?,?,?,?,?,?,'permitted_release',0,'guest',?,?,?,?)`)
      .bind(id, slug, sectionSlug, gp.headline, gp.dek, gp.body, `${gp.author_name} | Guest Contributor`, gp.hero_image_url, gp.hero_image_credit, gp.ref, editor.name, ts, ts),
    db.prepare('INSERT INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES (?,?,?,?,?,?,?)')
      .bind(uid(), id, null, 'DRAFTING', editor.name, `Created from guest post ${gp.ref}`, ts),
    srcStmt(`Original guest submission ${gp.ref} by ${gp.author_name}`, null, 'ORIGINAL', 1, 0, 'Author confirmed originality, photo rights and no payment on submission.'),
    ...sources.map((s) => srcStmt(s, isHttpUrl(s) ? s : null, 'ATTRIBUTED_REPORT', 0, 1, 'Supplied by the guest author. Check before approval.')),
  ]);
  await transition(db, id, 'EDITORIAL_REVIEW', editor, `Guest post ${gp.ref} accepted; waiting for Shaheen's approval`);
  return id;
}
