import { esc, html, formatDateLong, formatDateTime, localDate, slugify, isHttpUrl, nowIso, uid } from '../util.js';
import { renderMarkdown, excerpt } from '../markdown.js';
import { getEditionWithItems } from '../editions.js';
import { layout, loadChrome } from './layout.js';
import { subscribeBox } from '../newsletter.js';
import {
  SITE, commerceAllowed, storyCard, partnerPicks, shopBand, paidProductAds, premiumAds, courseModule, courseItem, houseAd, productCard,
  sourcesBlock, noticesBlock, emptyState, storyStamp,
} from './components.js';

const PUBLIC = "('PUBLISHED','UPDATED','CORRECTED')";
const STORY_COLS = `s.id, s.slug, s.lane, s.type, s.section_slug, s.status, s.sensitive, s.headline, s.dek, substr(s.body, 1, 600) AS body,
  s.hero_image_url, s.hero_image_rights, s.disclosure_label, s.published_at, s.last_updated_at, s.corrected_at, s.priority, s.is_lead_candidate, s.created_at, sec.name AS section_name`;
const PRODUCT_COLS = 'p.*, m.name AS merchant_name, m.display_name_allowed';
const COURSE_SECTIONS = ['education-careers', 'business', 'technology', 'ai', 'science'];

/**
 * Commercial share of a page stays around 10-15%: one commercial module per ~7 content blocks,
 * minimum one. Modules are passed in priority order; empty ones are skipped.
 */
function commercialBudget(contentBlocks, modules, min = 1) {
  const allowed = Math.max(min, Math.round(contentBlocks * 0.15));
  return modules.filter(Boolean).slice(0, allowed);
}

function sectionTree(chrome, slug) {
  const section = chrome.sections.find((s) => s.slug === slug);
  if (!section) return null;
  const parent = section.parent_slug ? chrome.sections.find((s) => s.slug === section.parent_slug) : null;
  return { ...section, parent };
}

// Product categories that belong with a news section (e.g. Lifestyle shows home, style, food and beauty picks).
const RELATED_PRODUCT_SECTIONS = {
  lifestyle: ['lifestyle', 'home-living', 'fashion-style', 'food-culture', 'beauty-hair', 'garden', 'pets'],
  travel: ['travel', 'outdoor'],
  'us-sports': ['us-sports', 'outdoor'],
};

async function deals(db, { section = null, limit = 4 } = {}) {
  const where = ["p.status = 'active'", "m.status = 'active'"];
  const binds = [];
  if (section) {
    const list = RELATED_PRODUCT_SECTIONS[section] || [section];
    const ph = list.map(() => '?').join(',');
    where.push(`(p.section_slug IN (${ph}) OR (p.section_slug IS NULL AND m.section_slug IN (${ph})))`);
    binds.push(...list, ...list);
  }
  const { results } = await db.prepare(`SELECT ${PRODUCT_COLS} FROM products p JOIN merchants m ON m.id = p.merchant_id
    WHERE ${where.join(' AND ')} ORDER BY p.is_deal DESC, p.updated_at DESC LIMIT ?`).bind(...binds, limit).all();
  return results;
}

async function networkFor(db, section = null, limit = 4) {
  const { results } = section
    ? await db.prepare(`SELECT * FROM businesses WHERE status = 'active' AND owned_by_network = 1 AND (health_ok IS NULL OR health_ok = 1) AND section_slug = ? ORDER BY featured DESC, sort_order LIMIT ?`).bind(section, limit).all()
    : await db.prepare(`SELECT * FROM businesses WHERE status = 'active' AND owned_by_network = 1 AND (health_ok IS NULL OR health_ok = 1) AND featured = 1 ORDER BY sort_order LIMIT ?`).bind(limit).all();
  return results;
}

async function coursesFor(db, section = null, limit = 3) {
  const { results } = section
    ? await db.prepare("SELECT * FROM courses WHERE status = 'active' AND (section_slug = ? OR category = ?) ORDER BY title LIMIT ?").bind(section, section, limit).all()
    : await db.prepare("SELECT * FROM courses WHERE status = 'active' ORDER BY title LIMIT ?").bind(limit).all();
  return results;
}

async function courseOfTheDay(db, tz) {
  const count = await db.prepare("SELECT COUNT(*) AS n FROM courses WHERE status = 'active'").first();
  if (!count?.n) return [];
  const day = Number(localDate(new Date(), tz).replace(/-/g, ''));
  const offset = day % count.n;
  const { results } = await db.prepare("SELECT * FROM courses WHERE status = 'active' ORDER BY slug LIMIT 1 OFFSET ?").bind(offset).all();
  return results;
}

// ───────────────────────────── Home / edition ─────────────────────────────

export async function homePage(env, editionDate = null) {
  const db = env.DB;
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const data = await getEditionWithItems(db, editionDate);
  if (editionDate && !data) return notFound(env, chrome, 'There is no edition for that date.');

  const weekAgo = new Date(Date.now() - 7 * 86400000).toISOString();
  const [{ results: pool }, { results: mostRead }, picks, network, cotd] = await Promise.all([
    db.prepare(`SELECT ${STORY_COLS}, COALESCE(s.corrected_at, s.last_updated_at, s.published_at) AS activity FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.lane = 'newsroom' AND s.status IN ${PUBLIC} ORDER BY activity DESC LIMIT 80`).all(),
    db.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.lane = 'newsroom' AND s.status IN ${PUBLIC} AND s.published_at >= ? AND s.view_count > 0 ORDER BY s.view_count DESC LIMIT 5`).bind(weekAgo).all(),
    deals(db, { limit: 6 }),
    [],
    courseOfTheDay(db, site.tz),
  ]);
  const { results: partnerGuides } = await db.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
    WHERE s.lane = 'partner_commerce' AND s.status IN ${PUBLIC} AND s.sensitive = 0 AND sec.commerce_allowed = 1 ORDER BY s.published_at DESC LIMIT 3`).all();

  const latest = pool.slice(0, 8);

  // Hydrate section names for edition items.
  const nameOf = Object.fromEntries(chrome.sections.map((s) => [s.slug, s.name]));
  const items = (data?.items || []).map((s) => ({ ...s, section_name: nameOf[s.section_slug] }));
  if (!editionDate) {
    const placed = new Set(items.map((i) => i.id));
    // Newest first, but a flagged lead candidate or higher-priority story leads.
    const extra = pool.filter((s) => !placed.has(s.id))
      // Newest day's stories first among equals (by when the story was written, so a bulk approval doesn't reorder the front page).
      .sort((a, b) => (b.is_lead_candidate - a.is_lead_candidate) || (b.created_at ? localDate(new Date(b.created_at), site.tz) : '').localeCompare(a.created_at ? localDate(new Date(a.created_at), site.tz) : '') || (b.priority - a.priority) || String(b.published_at).localeCompare(String(a.published_at)));
    if (!items.some((i) => i.slot === 'lead') && extra.length) items.unshift({ ...extra.shift(), slot: 'lead' });
    while (items.filter((i) => i.slot === 'top').length < 8 && extra.length) items.push({ ...extra.shift(), slot: 'top' });
    // Everything else published fills the section rows below the fold (until an edition curates them).
    for (const s of extra) items.push({ ...s, slot: 'section' });
  }
  const lead = items.find((i) => i.slot === 'lead');
  const top = items.filter((i) => i.slot === 'top');
  const hasNews = !!lead;
  const selection = items.filter((i) => i.slot === 'editors_selection');
  const rest = items.filter((i) => i.slot === 'section');

  // Section rows: group edition + rest by top-level section.
  const onFront = new Set([lead?.id, ...top.slice(0, 8).map((t) => t.id)]);
  const bySection = new Map();
  for (const s of [...top, ...rest].filter((x) => !onFront.has(x.id))) {
    const sec = sectionTree(chrome, s.section_slug);
    const key = sec?.parent?.slug || s.section_slug;
    if (!bySection.has(key)) bySection.set(key, []);
    bySection.get(key).push(s);
  }

  const edition = data?.edition;
  const heading = editionDate
    ? `<div class="edition-head"><h1 class="edition-title">Edition ${esc(edition.edition_number)}</h1>
       <p class="edition-sub">${esc(formatDateLong(edition.edition_date, site.tz))}. <a href="/">Go to today’s front page</a></p></div>`
    : `<h1 class="sr">${esc(site.name)}: today’s edition</h1>`;

  const newsSections = chrome.sections.filter((x) => x.in_nav && x.kind === 'news');
  const nicheSections = chrome.sections.filter((x) => x.in_nav && x.kind === 'niche');
  const fullSections = await db.prepare('SELECT slug, description FROM sections WHERE active = 1').all();
  const descOf = Object.fromEntries(fullSections.results.map((x) => [x.slug, x.description]));

  // Column A: the lead (or the welcome note before the first story).
  const colA = hasNews
    ? `${storyCard(lead, { size: 'lead', tz: site.tz })}
       ${top.length > 6 ? `<div class="front-pair">${top.slice(6, 8).map((s) => storyCard(s, { size: 'm', tz: site.tz })).join('')}</div>` : ''}`
    : `<div class="welcome">
        <p class="welcome-kicker">Welcome to ${esc(site.name)}</p>
        <h2 class="welcome-title">News for Boston and the nation, with a fresh edition every morning.</h2>
        <p class="welcome-dek">We report from primary sources and official records, and an editor reviews every story before it runs. The first stories are on the way.</p>
        <p class="welcome-links"><a class="button" href="/standards">How we report</a> <a class="button button-quiet" href="/advertise">Advertise with us</a></p>
        <dl class="welcome-facts">
          <div><dt>Every morning</dt><dd>A new numbered edition, archived for good</dd></div>
          <div><dt>Editor approved</dt><dd>No story runs without a person signing off</dd></div>
          <div><dt>Open about changes</dt><dd>Updates and corrections are labeled on every story</dd></div>
        </dl>
      </div>`;

  // Column B: top stories (or a section guide before the first story).
  const sectionIndex = `<ul class="section-index">${newsSections.map((x) => `<li><a href="/section/${esc(x.slug)}"><strong>${esc(x.name)}</strong>${descOf[x.slug] ? `<span>${esc(descOf[x.slug])}</span>` : ''}</a></li>`).join('')}</ul>`;
  const moreStories = latest.filter((s) => s.id !== lead?.id).slice(0, 6);
  const colB = top.length
    ? `<h2 class="col-label">Top stories</h2>${top.slice(0, 6).map((s) => storyCard(s, { size: 's', tz: site.tz, showDek: false })).join('')}`
    : moreStories.length
      ? `<h2 class="col-label">More stories</h2>${moreStories.map((s) => storyCard(s, { size: 's', tz: site.tz, showDek: false })).join('')}`
      : `<h2 class="col-label">Sections</h2>${sectionIndex}`;

  // Commercial budget: ~15% of the content blocks on the page.
  const contentBlocks = hasNews ? (1 + top.length + rest.length + selection.length + latest.length) : 8;
  const picked = commercialBudget(contentBlocks, [
    houseAd(site, 'FRONT PAGE', 'home'),
    shopBand(picks),
    partnerGuides.length ? `<section class="section-row partner-row">
    <h2 class="row-title">Guides from our partners</h2>
    <p class="module-disclosure">Partner content with affiliate links. Not produced by the Boston Daily newsroom.</p>
    <div class="row-cards">${partnerGuides.map((s) => storyCard(s, { size: 'm', tz: site.tz })).join('')}</div>
  </section>` : '',
    courseModule(cotd, site.network, { title: 'Skill Center: course of the day' }),
  ]);
  const isMain = (m) => m.includes('partner-row') || m.includes('product-grid') || m.includes('shop-band');
  const railCommercial = picked.filter((m) => !isMain(m)).join('');
  const mainCommercial = picked.filter(isMain).join('');

  // Column C: the rail.
  const colC = `
      ${latest.length ? `<section class="rail-block"><h2 class="col-label">Latest updates</h2>
        <ol class="latest">${latest.map((s) => `<li><a href="/story/${esc(s.slug)}">${esc(s.headline)}</a> ${storyStamp(s, site.tz)}</li>`).join('')}</ol></section>` : ''}
      ${mostRead.length ? `<section class="rail-block"><h2 class="col-label">Most read</h2>
        <ol class="most-read">${mostRead.map((s) => `<li><a href="/story/${esc(s.slug)}">${esc(s.headline)}</a></li>`).join('')}</ol></section>` : ''}
      ${subscribeBox({ compact: true })}
      ${railCommercial}`;

  const sectionRows = [...bySection.entries()].map(([slug, list]) => {
    const sec = chrome.sections.find((x) => x.slug === slug);
    return `<section class="section-row">
      <h2 class="row-title"><a href="/section/${esc(slug)}">${esc(sec?.name || slug)}</a></h2>
      <div class="row-cards">${list.slice(0, 4).map((s) => storyCard(s, { size: 'm', tz: site.tz, showSection: false })).join('')}</div>
    </section>`;
  }).join('');

  const body = `
  ${heading}
  <section class="front-grid">
    <div class="fg-a">${colA}</div>
    <div class="fg-b">${colB}</div>
    <aside class="fg-c">${colC}</aside>
  </section>
  ${mainCommercial}
  ${hasNews ? premiumAds('home') : ''}
  ${sectionRows}
  ${selection.length ? `<section class="section-row selection">
    <h2 class="row-title">Editor’s selection</h2>
    <div class="row-cards">${selection.map((s) => storyCard(s, { size: 'm', tz: site.tz })).join('')}</div>
  </section>` : ''}
  <section class="section-row">
    <h2 class="row-title">Guides and shopping</h2>
    <ul class="section-grid">${nicheSections.map((x) => `<li><a href="/section/${esc(x.slug)}">${esc(x.name)}</a></li>`).join('')}
      <li><a href="/courses">Skill Center</a></li></ul>
  </section>
  ${hasNews ? '<p class="rail-archive"><a href="/editions">Browse past editions</a></p>' : ''}`;

  return html(layout(env, chrome, {
    title: editionDate ? `Edition ${edition.edition_number}, ${formatDateLong(edition.edition_date, site.tz)}` : '',
    description: 'Boston Daily: a fresh edition every morning, with stories updated through the day.',
    canonical: editionDate ? `/edition/${editionDate}` : '/',
    active: editionDate ? '' : 'home',
    body,
    jsonLd: { '@context': 'https://schema.org', '@type': 'NewsMediaOrganization', name: site.name, url: site.url || undefined, publishingPrinciples: site.url ? `${site.url}/standards` : undefined, correctionsPolicy: site.url ? `${site.url}/standards#corrections` : undefined },
  }));
}

export async function editionsArchive(env) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const { results } = await env.DB.prepare(`SELECT e.edition_date, e.edition_number,
      (SELECT s.headline FROM edition_items ei JOIN stories s ON s.id = ei.story_id WHERE ei.edition_id = e.id AND ei.slot = 'lead') AS lead
    FROM editions e WHERE e.status = 'published' ORDER BY e.edition_date DESC LIMIT 400`).all();
  const months = new Map();
  for (const e of results) {
    const key = e.edition_date.slice(0, 7);
    if (!months.has(key)) months.set(key, []);
    months.get(key).push(e);
  }
  const monthName = (k) => new Intl.DateTimeFormat('en-US', { month: 'long', year: 'numeric', timeZone: 'UTC' }).format(new Date(`${k}-15T12:00:00Z`));
  const body = `<div class="page-head"><h1>Past editions</h1><p class="page-sub">Every edition of Boston Daily, as published that day.</p></div>
    ${results.length ? [...months.entries()].map(([k, list]) => `<section class="archive-month"><h2>${esc(monthName(k))}</h2>
      <ul class="archive-list">${list.map((e) => `<li><a href="/edition/${esc(e.edition_date)}"><span class="archive-date">${esc(formatDateLong(e.edition_date, site.tz))}</span>
        <span class="archive-no">Edition ${esc(e.edition_number)}</span>${e.lead ? `<span class="archive-lead">${esc(e.lead)}</span>` : ''}</a></li>`).join('')}</ul></section>`).join('')
      : emptyState('The first edition has not been published yet.')}`;
  return html(layout(env, chrome, { title: 'Past editions', description: 'Archive of Boston Daily editions.', canonical: '/editions', body }));
}

// ───────────────────────────── Section ─────────────────────────────

export async function sectionPage(env, slug) {
  const db = env.DB;
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const section = sectionTree(chrome, slug);
  if (!section) return notFound(env, chrome);
  const children = chrome.sections.filter((s) => s.parent_slug === slug);
  const slugs = [slug, ...children.map((c) => c.slug)];
  const ph = slugs.map(() => '?').join(',');
  const showCommerce = commerceAllowed(section);

  const [{ results: news }, commercial, products, network, courses] = await Promise.all([
    db.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.lane = 'newsroom' AND s.status IN ${PUBLIC} AND s.section_slug IN (${ph}) ORDER BY s.published_at DESC LIMIT 30`).bind(...slugs).all(),
    showCommerce ? db.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.lane = 'partner_commerce' AND s.status IN ${PUBLIC} AND s.section_slug IN (${ph}) ORDER BY s.published_at DESC LIMIT 6`).bind(...slugs).all().then((r) => r.results) : [],
    showCommerce ? deals(db, { section: slug, limit: 6 }) : [],
    [],
    showCommerce && COURSE_SECTIONS.includes(slug) ? coursesFor(db, slug, 3) : [],
  ]);

  const [first, ...others] = news;
  const sectionMods = [
    partnerPicks(products, { title: `${section.name} picks`, more: `/shop?section=${encodeURIComponent(slug)}` }),
    showCommerce ? houseAd(site, 'SPONSORED', slug) : '',
    commercial.length ? `<section class="section-row partner-row">
          <h2 class="row-title">Guides from our partners</h2>
          <p class="module-disclosure">Partner content with affiliate links. Not produced by the Boston Daily newsroom.</p>
          <div class="row-cards">${commercial.map((s) => storyCard(s, { size: 'm', tz: site.tz, showSection: false })).join('')}</div>
        </section>` : '',
    courseModule(courses, site.network),
  ];
  // News sections keep commercial content to ~15% of the page; guide/shopping sections are partner-led.
  const pickedMods = section.kind === 'news' || section.parent?.kind === 'news' ? commercialBudget(Math.max(news.length, 4), sectionMods, 2) : sectionMods.filter(Boolean);
  const isMainMod = (m) => m.includes('partner-row') || m.includes('product-grid');
  const mainMods = pickedMods.filter(isMainMod).join('');
  const railMods = pickedMods.filter((m) => !isMainMod(m)).join('');
  const body = `<div class="page-head">
      ${section.parent ? `<p class="crumb"><a href="/section/${esc(section.parent.slug)}">${esc(section.parent.name)}</a></p>` : ''}
      <h1>${esc(section.name)}</h1>
      ${section.always_human ? '<p class="page-sub">Every story in this section is reviewed and approved by a Boston Daily editor before publication.</p>' : ''}
      ${children.length ? `<nav class="chips" aria-label="${esc(section.name)} subsections">${children.map((c) => `<a href="/section/${esc(c.slug)}">${esc(c.name)}</a>`).join('')}</nav>` : ''}
    </div>
    <div class="columns">
      <div class="col-main">
        ${first ? `<div class="section-lead">${storyCard(first, { size: 'lead', tz: site.tz, showSection: !!children.length })}</div>` : emptyState(`${section.description ? `${section.description}. ` : ''}${section.name} stories will appear here as soon as the newsroom publishes them.`)}
        ${others.length ? `<div class="stream">${others.map((s) => storyCard(s, { size: 'm', tz: site.tz, showSection: !!children.length })).join('')}</div>` : ''}
        ${mainMods}
        ${showCommerce ? paidProductAds(slug) : ''}
      </div>
      <aside class="col-rail">
        ${railMods}
      </aside>
    </div>`;
  return html(layout(env, chrome, { title: section.name, description: section.description || `${section.name} news from Boston Daily.`, canonical: `/section/${slug}`, active: section.parent?.slug || slug, body }));
}

// ───────────────────────────── Story ─────────────────────────────

export async function storyPage(env, slug, ctx, reqUrl = null) {
  const db = env.DB;
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const story = await db.prepare(`SELECT * FROM stories WHERE slug = ? AND status IN ${PUBLIC}`).bind(slug).first();
  if (!story) return notFound(env, chrome, 'This story is not available. It may have been archived.');
  const section = sectionTree(chrome, story.section_slug);
  const [{ results: sources }, { results: notices }, { results: related }] = await Promise.all([
    db.prepare('SELECT title, url, publisher, rights_type, public FROM story_sources WHERE story_id = ?').bind(story.id).all(),
    db.prepare('SELECT * FROM story_notices WHERE story_id = ? ORDER BY created_at DESC').bind(story.id).all(),
    db.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.lane = 'newsroom' AND s.status IN ${PUBLIC} AND s.section_slug = ? AND s.id != ? ORDER BY s.published_at DESC LIMIT 4`).bind(story.section_slug, story.id).all(),
  ]);
  ctx?.waitUntil?.(db.prepare('UPDATE stories SET view_count = view_count + 1 WHERE id = ?').bind(story.id).run().catch(() => {}));
  const { results: comments } = await db.prepare("SELECT name, body, created_at FROM comments WHERE story_id = ? AND status = 'approved' ORDER BY created_at ASC LIMIT 200").bind(story.id).all();
  const commentNote = reqUrl?.searchParams.get('comment');

  const commercial = story.lane === 'partner_commerce';
  const showCommerce = commerceAllowed(section, story);
  const [products, network] = await Promise.all([
    showCommerce ? deals(db, { section: story.section_slug, limit: 3 }) : [],
    [],
  ]);

  const typeLabel = { analysis: 'Analysis', opinion: 'Opinion', feature: 'Feature' }[story.type];
  const times = [
    story.published_at ? `<span>Published <time datetime="${esc(story.published_at)}">${esc(formatDateTime(story.published_at, site.tz))}</time></span>` : '',
    story.last_updated_at ? `<span>Updated <time datetime="${esc(story.last_updated_at)}">${esc(formatDateTime(story.last_updated_at, site.tz))}</time></span>` : '',
    story.corrected_at ? `<span class="stamp-corrected">Corrected <time datetime="${esc(story.corrected_at)}">${esc(formatDateTime(story.corrected_at, site.tz))}</time></span>` : '',
  ].filter(Boolean).join('');

  const body = `<article class="story${commercial ? ' story-commercial' : ''}">
    <header class="story-head">
      <p class="story-kicker">
        <a href="/section/${esc(story.section_slug)}">${esc(section?.name || '')}</a>
        ${typeLabel ? `<span class="label label-type">${typeLabel}</span>` : ''}
        ${commercial ? `<span class="label label-commerce">${esc(story.disclosure_label)}</span>` : ''}
      </p>
      ${commercial ? `<p class="disclosure-banner">${esc(story.disclosure_text)}${story.sponsor_name ? ` Sponsored by ${esc(story.sponsor_name)}.` : ''} This is not Boston Daily news reporting.</p>` : ''}
      <h1 class="story-headline">${esc(story.headline)}</h1>
      ${story.dek ? `<p class="story-dek">${esc(story.dek)}</p>` : ''}
      <p class="story-byline">${story.byline ? `By ${esc(story.byline)}` : ''}${story.credited_reviewer ? `<span class="reviewer">Reviewed by ${esc(story.credited_reviewer)}</span>` : ''}</p>
      <p class="story-times">${times}</p>
    </header>
    ${story.hero_image_url && story.hero_image_rights ? `<figure class="story-figure"><img src="${esc(story.hero_image_url)}" alt="" decoding="async">${story.hero_image_credit ? `<figcaption>${esc(story.hero_image_credit)}</figcaption>` : ''}</figure>` : ''}
    ${noticesBlock(notices.filter((n) => n.kind === 'correction'), site.tz)}
    <div class="story-body">${renderMarkdown(story.body, { sponsoredLinks: commercial })}</div>
    ${noticesBlock(notices.filter((n) => n.kind === 'update'), site.tz)}
    ${sourcesBlock(sources)}
    ${commercial ? '' : subscribeBox()}
    ${shareBar(story)}
    ${commentsBlock(story, comments, commentNote, site.tz)}
    <p class="story-standards"><a href="/standards">Our editorial standards</a>${commercial ? ' explain how partner content is labeled.' : '. Spotted an error? Email <a href="mailto:' + esc(site.email) + '?subject=' + encodeURIComponent('Correction request: ' + story.headline) + '">' + esc(site.email) + '</a>.'}</p>
  </article>
  ${related.length ? `<section class="section-row related"><h2 class="row-title">More in ${esc(section?.name || '')}</h2>
    <div class="row-cards">${related.map((s) => storyCard(s, { size: 'm', tz: site.tz, showSection: false })).join('')}</div></section>` : ''}
  ${partnerPicks(products, { title: 'Related partner picks', more: `/shop?section=${encodeURIComponent(story.section_slug)}` })}
`;

  const url = site.url ? `${site.url}/story/${story.slug}` : undefined;
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': commercial ? 'BlogPosting' : 'NewsArticle',
    headline: story.headline,
    description: story.dek || excerpt(story.body, 200),
    datePublished: story.published_at,
    dateModified: story.corrected_at || story.last_updated_at || story.published_at,
    author: story.byline ? { '@type': commercial || /staff$/i.test(story.byline) ? 'Organization' : 'Person', name: story.byline } : undefined,
    publisher: { '@type': 'NewsMediaOrganization', name: site.name },
    mainEntityOfPage: url,
    image: story.hero_image_url && story.hero_image_rights ? [story.hero_image_url] : undefined,
    articleSection: section?.name,
  };
  // Answer-engine markup: a "Frequently asked questions" section with ### questions becomes FAQPage data.
  const faq = faqFromBody(story.body);
  const ld = faq.length >= 2 ? [jsonLd, { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: faq.map(([q, a]) => ({ '@type': 'Question', name: q, acceptedAnswer: { '@type': 'Answer', text: a } })) }] : jsonLd;
  return html(layout(env, chrome, {
    title: story.headline, description: story.dek || excerpt(story.body, 160), canonical: `/story/${story.slug}`,
    ogType: 'article', image: story.hero_image_rights ? story.hero_image_url : '', body, jsonLd: ld, active: section?.parent?.slug || story.section_slug,
  }));
}

// ───────────────────────────── Commerce areas ─────────────────────────────

export async function shopPage(env, url) {
  const db = env.DB;
  const chrome = await loadChrome(env);
  const section = url.searchParams.get('section');
  const merchant = url.searchParams.get('merchant');
  const where = ["p.status = 'active'", "m.status = 'active'"];
  const binds = [];
  if (section) { where.push('(p.section_slug = ? OR (p.section_slug IS NULL AND m.section_slug = ?))'); binds.push(section, section); }
  if (merchant) { where.push('m.id = ?'); binds.push(merchant); }
  const [{ results: products }, { results: merchants }] = await Promise.all([
    db.prepare(`SELECT ${PRODUCT_COLS} FROM products p JOIN merchants m ON m.id = p.merchant_id WHERE ${where.join(' AND ')} ORDER BY p.is_deal DESC, p.updated_at DESC LIMIT 120`).bind(...binds).all(),
    db.prepare(`SELECT m.id, m.name, m.display_name_allowed, COUNT(p.id) AS n FROM merchants m JOIN products p ON p.merchant_id = m.id AND p.status = 'active'
      WHERE m.status = 'active' GROUP BY m.id ORDER BY m.name`).all(),
  ]);
  const commerceSections = chrome.sections.filter((s) => s.commerce_allowed && !s.parent_slug && s.kind !== 'commerce');
  const current = merchants.find((m) => m.id === merchant);
  const body = `<div class="page-head">
      <h1>${current && current.display_name_allowed ? esc(current.name) : 'Partner picks'}</h1>
      <p class="page-sub">Products from our affiliate partners. We may earn a commission when you buy through these links, at no extra cost to you. Partners never influence Boston Daily news coverage.</p>
      <nav class="chips" aria-label="Filter by section"><a href="/shop"${!section && !merchant ? ' aria-current="page"' : ''}>All</a>${commerceSections.map((s) => `<a href="/shop?section=${esc(s.slug)}"${section === s.slug ? ' aria-current="page"' : ''}>${esc(s.name)}</a>`).join('')}</nav>
    </div>
    ${products.length ? `<ul class="product-grid product-grid-wide">${products.map(productCard).join('')}</ul>` : emptyState('No partner products in this view yet.')}
    ${merchants.filter((m) => m.display_name_allowed).length ? `<section class="merchants"><h2 class="row-title">Shop by partner</h2>
      <ul class="merchant-list">${merchants.filter((m) => m.display_name_allowed).map((m) => `<li><a href="/shop?merchant=${esc(m.id)}">${esc(m.name)}</a> <span class="muted">${m.n}</span></li>`).join('')}</ul></section>` : ''}
    <p class="cta-line"><a href="mailto:${esc(SITE(env).email)}?subject=${encodeURIComponent('[PARTNER] Feature our products')}">Feature your products on Boston Daily</a></p>`;
  return html(layout(env, chrome, { title: 'Partner picks', description: 'Affiliate partner products, clearly labeled.', canonical: '/shop', active: 'shop', body }));
}

export async function businessesPage(env) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const { results } = await env.DB.prepare(`SELECT * FROM businesses WHERE status = 'active' AND (health_ok IS NULL OR health_ok = 1) ORDER BY paid_listing, featured DESC, sort_order, name`).all();
  const owned = results.filter((b) => b.owned_by_network && !b.paid_listing);
  const paid = results.filter((b) => b.paid_listing);
  const groups = new Map();
  for (const b of owned) {
    const g = b.grp || 'More';
    if (!groups.has(g)) groups.set(g, []);
    groups.get(g).push(b);
  }
  const card = (b) => `<li class="biz-card"><a href="/businesses/${esc(b.slug)}">
      <strong>${esc(b.name)}</strong>${b.domain ? `<span class="biz-domain">${esc(b.domain)}</span>` : ''}
      <span>${esc(b.short_description || '')}</span></a></li>`;
  const body = `<div class="page-head"><h1>Recommended businesses</h1>
      <p class="page-sub">These businesses are part of the ${esc(site.network)} network, which also publishes Boston Daily. They are not independent reviews.</p></div>
    ${[...groups.entries()].map(([g, list]) => `<section class="biz-group"><h2 class="row-title">${esc(g)}</h2><ul class="biz-grid">${list.map(card).join('')}</ul></section>`).join('')}
    ${paid.length ? `<section class="biz-group"><h2 class="row-title">Paid listings</h2><p class="module-disclosure">These businesses paid to be listed.</p><ul class="biz-grid">${paid.map(card).join('')}</ul></section>` : ''}
    <p class="cta-line"><a href="mailto:${esc(site.email)}?subject=${encodeURIComponent('[LISTING] Get my business listed')}">Get your business listed</a></p>`;
  return html(layout(env, chrome, {
    title: 'Recommended businesses', description: `Businesses in the ${site.network} network.`, canonical: '/businesses', active: 'businesses', body,
    jsonLd: { '@context': 'https://schema.org', '@type': 'ItemList', itemListElement: owned.map((b, i) => ({ '@type': 'ListItem', position: i + 1, name: b.name, url: b.domain ? `https://${b.domain}` : undefined })) },
  }));
}

export async function businessProfile(env, slug) {
  const db = env.DB;
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const b = await db.prepare("SELECT * FROM businesses WHERE slug = ? AND status = 'active'").bind(slug).first();
  if (!b) return notFound(env, chrome);
  const [products, { results: posts }, courses] = await Promise.all([
    b.section_slug ? deals(db, { section: b.section_slug, limit: 6 }) : [],
    b.domain ? db.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.lane = 'partner_commerce' AND s.status IN ${PUBLIC} AND instr(lower(s.byline), ?) > 0 ORDER BY s.published_at DESC LIMIT 4`).bind(b.domain.toLowerCase()).all() : { results: [] },
    b.slug === 'realskillset' ? coursesFor(db, null, 6) : [],
  ]);
  const body = `<div class="page-head"><p class="crumb"><a href="/businesses">Recommended businesses</a></p>
      <h1>${esc(b.name)}</h1>
      <p class="page-sub">${b.paid_listing ? 'Paid listing.' : `Part of the ${esc(site.network)} network.`}</p></div>
    <div class="columns"><div class="col-main">
      <div class="prose">${b.long_description ? renderMarkdown(b.long_description) : `<p>${esc(b.short_description || '')}</p>`}</div>
      ${b.domain ? `<p><a class="button" href="/go/b/${esc(b.slug)}" rel="${b.paid_listing ? 'sponsored ' : ''}noopener" target="_blank">Visit ${esc(b.domain)}</a></p>` : ''}
      ${posts.length ? `<section class="section-row"><h2 class="row-title">Latest guides from ${esc(b.name)}</h2><div class="row-cards">${posts.map((s) => storyCard(s, { size: 'm', tz: site.tz })).join('')}</div></section>` : ''}
      ${courses.length ? `<section class="section-row"><h2 class="row-title">Featured courses</h2><ul class="course-list">${courses.map(courseItem).join('')}</ul></section>` : ''}
      ${partnerPicks(products, { title: 'Related partner picks' })}
    </div><aside class="col-rail">${houseAd(site, 'LISTING')}</aside></div>`;
  return html(layout(env, chrome, {
    title: b.name, description: b.short_description || '', canonical: `/businesses/${b.slug}`, active: 'businesses', body,
    jsonLd: { '@context': 'https://schema.org', '@type': 'Organization', name: b.name, url: b.domain ? `https://${b.domain}` : undefined, description: b.short_description || undefined },
  }));
}

export async function coursesPage(env, url) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const cat = url.searchParams.get('category');
  const { results } = cat
    ? await env.DB.prepare("SELECT * FROM courses WHERE status = 'active' AND category = ? ORDER BY title").bind(cat).all()
    : await env.DB.prepare("SELECT * FROM courses WHERE status = 'active' ORDER BY category, title").all();
  const { results: cats } = await env.DB.prepare("SELECT category, COUNT(*) AS n FROM courses WHERE status = 'active' AND category IS NOT NULL GROUP BY category ORDER BY category").all();
  const body = `<div class="page-head"><h1>Skill Center</h1>
      <p class="page-sub">Online courses to learn new skills, curated by RealSkillSet (part of the ${esc(site.network)} network). Partner courses are marked Affiliate; check certificate fees on the provider’s site.</p>
      ${cats.length ? `<nav class="chips" aria-label="Course categories"><a href="/courses"${!cat ? ' aria-current="page"' : ''}>All</a>${cats.map((c) => `<a href="/courses?category=${encodeURIComponent(c.category)}"${cat === c.category ? ' aria-current="page"' : ''}>${esc(c.category)}</a>`).join('')}</nav>` : ''}
    </div>
    ${results.length ? `<ul class="course-list course-list-wide">${results.map(courseItem).join('')}</ul>` : emptyState('The RealSkillSet catalog is being added. Visit realskillset.com in the meantime.', '<p><a class="button" href="https://realskillset.com" rel="noopener" target="_blank">Visit RealSkillSet</a></p>')}
    <p class="cta-line"><a href="mailto:${esc(site.email)}?subject=${encodeURIComponent('[COURSES] List my course')}">List your course</a></p>`;
  return html(layout(env, chrome, { title: 'Skill Center', description: 'Online courses to learn new skills: technology, business, languages, science and more.', canonical: '/courses', active: 'courses', body }));
}

export async function advertisePage(env, url) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const sent = url.searchParams.get('sent') === '1';
  const err = url.searchParams.get('error');
  const mail = (tag, label) => `<a href="mailto:${esc(site.email)}?subject=${encodeURIComponent(`[${tag}] ${label}`)}&body=${encodeURIComponent('Company:\nWebsite:\nPackage of interest:\nBudget:\nPreferred dates:\n')}">${esc(label)}</a>`;
  const products = [
    ['ADS', 'Display ads', 'Standard IAB sizes in labeled ad slots across sections.'],
    ['FRONT PAGE', 'Front page placement', 'Labeled sponsor slots on the homepage and in the daily edition.'],
    ['SPONSORED', 'Section sponsorship', '"Presented by" placement on a section, clearly labeled.'],
    ['LISTING', 'Business listings', 'A paid listing in Recommended Businesses, marked as paid.'],
    ['PARTNER', 'Product features', 'Sponsored product modules and partner picks.'],
    ['SPONSORED', 'Sponsored content', 'Advertiser-paid articles, labeled Sponsored and kept out of the news.'],
    ['NEWSLETTER', 'Newsletter sponsorship', 'A labeled block in the Boston Daily newsletter.'],
    ['COURSES', 'Course listings', 'Sponsored courses in the RealSkillSet section.'],
  ];
  const body = `<div class="page-head"><h1>Advertise with Boston Daily</h1>
      <p class="page-sub">Email <a href="mailto:${esc(site.email)}">${esc(site.email)}</a>${site.phone ? ` or call ${esc(site.phone)}` : ''}. Every campaign is reviewed before it runs.</p></div>
    ${sent ? '<p class="flash flash-ok">Thanks. Your inquiry reached our partnerships team, and we will reply by email.</p>' : ''}
    ${err ? `<p class="flash flash-err">${esc(err)}</p>` : ''}
    <div class="columns"><div class="col-main">
      <table class="ad-table"><thead><tr><th scope="col">Product</th><th scope="col">What it is</th><th scope="col">Ask about it</th></tr></thead>
      <tbody>${products.map(([tag, name, desc]) => `<tr><td>${esc(name)}</td><td>${esc(desc)}</td><td>${mail(tag, name)}</td></tr>`).join('')}</tbody></table>
      <section class="prose" id="protocols"><h2>How advertising works here</h2>
        <ul>
          <li>Every paid item is labeled Advertisement, Sponsored, Paid Listing or Presented by.</li>
          <li>Advertisers never buy, edit, approve or suppress news coverage. Ads never appear in news story lists, Top Stories or the lead slot.</li>
          <li>There are no ads or sponsors on US Politics pages, and no political advertising.</li>
          <li>Ads do not run beside tragedies, disasters, crime or other sensitive stories.</li>
          <li>We review every advertiser, creative and landing page before anything goes live. You must own the rights to your creative.</li>
          <li>We do not accept ads for illegal products, weapons, adult content, counterfeit goods, unapproved health or financial claims, or unreviewed crypto schemes.</li>
        </ul></section>
    </div>
    <aside class="col-rail"><form class="inquiry" method="post" action="/api/inquiry">
      <h2>Send an inquiry</h2>
      <label>Inquiry type<select name="type" required>
        ${['ADS', 'FRONT PAGE', 'SPONSORED', 'LISTING', 'PARTNER', 'NEWSLETTER', 'COURSES'].map((t) => `<option value="${t}">${t.charAt(0) + t.slice(1).toLowerCase()}</option>`).join('')}
      </select></label>
      <label>Company<input name="company" maxlength="160"></label>
      <label>Your name<input name="name" maxlength="120"></label>
      <label>Email<input name="email" type="email" required maxlength="200"></label>
      <label>Website<input name="website" type="url" maxlength="300" placeholder="https://"></label>
      <label>Budget<input name="budget" maxlength="80"></label>
      <label>Preferred dates<input name="dates" maxlength="120"></label>
      <label>Message<textarea name="message" rows="4" maxlength="3000"></textarea></label>
      <label class="hp" aria-hidden="true">Leave empty<input name="company_site" tabindex="-1" autocomplete="off"></label>
      <button class="button" type="submit">Send inquiry</button>
    </form></aside></div>`;
  return html(layout(env, chrome, { title: 'Advertise with us', description: 'Advertising, listings and sponsorships on Boston Daily.', canonical: '/advertise', body }));
}

export async function submitInquiry(env, request) {
  const form = await request.formData();
  const get = (k, max = 300) => String(form.get(k) || '').trim().slice(0, max);
  if (get('company_site')) return Response.redirect(new URL('/advertise?sent=1', request.url), 303); // honeypot
  const email = get('email', 200);
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return Response.redirect(new URL('/advertise?error=' + encodeURIComponent('Enter a valid email address.'), request.url), 303);
  const website = get('website');
  await env.DB.prepare('INSERT INTO inquiries (id, type, company, name, email, website, package, budget, dates, message, status, created_at) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)')
    .bind(uid(), get('type', 40) || 'ADS', get('company', 160), get('name', 120), email, website && isHttpUrl(website) ? website : null, get('type', 40),
      get('budget', 80), get('dates', 120), get('message', 3000), 'new', nowIso()).run();
  return Response.redirect(new URL('/advertise?sent=1', request.url), 303);
}

// ───────────────────────────── Trust pages, search, feeds ─────────────────────────────

export async function standardsPage(env) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const body = `<article class="prose standards"><h1>Editorial standards</h1>
    <p>Boston Daily is published by ${esc(site.network)}. AI tools help our newsroom find, research and draft stories. Editors decide what is published.</p>
    <h2 id="sourcing">Sourcing and copyright</h2>
    <p>We report from primary sources, official records, licensed wire services, permitted press releases and our own reporting. We do not copy or closely rewrite other publications’ articles. We use other outlets’ coverage only to discover stories, then report them from original sources. Images run only when we hold the rights to use them. Each story lists its public sources.</p>
    <h2 id="approval">Human approval</h2>
    <p>No news story is published without an editor’s approval. Stories about US politics and health always receive editor review, and sensitive or unverified material is never published automatically. Election results come only from official or licensed results feeds.</p>
    <h2 id="corrections">Updates and corrections</h2>
    <p>When a story changes with new information, we mark it Updated and add a note. When we fix an error, we mark it Corrected and explain what was wrong. Earlier versions are preserved. All corrections are listed on our <a href="/corrections">corrections page</a>. To report an error, email <a href="mailto:${esc(site.email)}">${esc(site.email)}</a>.</p>
    <h2 id="opinion">Opinion and analysis</h2>
    <p>Opinion pieces carry an Opinion label and live in the Opinion section. Analysis is labeled as analysis.</p>
    <h2 id="commercial">Commercial content</h2>
    <p>Boston Daily earns money from affiliate links, advertising, sponsored content and businesses in the ${esc(site.network)} network. Commercial content is always labeled Affiliate, Sponsored, Partner Content, Paid Listing or Advertisement, appears in separate modules and never in news story lists. Partner guides are not written by our newsroom and never carry a newsroom byline. Advertisers and partners cannot buy, edit, approve or suppress coverage. There is no commercial content on US Politics pages or beside sensitive stories.</p>
    <h2 id="ownership">Ownership</h2>
    <p>Businesses in our Recommended Businesses section and RealSkillSet are part of the ${esc(site.network)} network, which also owns Boston Daily. We say so wherever they appear.</p>
  </article>`;
  return html(layout(env, chrome, { title: 'Editorial standards', description: 'How Boston Daily sources, approves, corrects and labels content.', canonical: '/standards', body }));
}

export async function correctionsPage(env) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const { results } = await env.DB.prepare(`SELECT n.note, n.created_at, s.slug, s.headline FROM story_notices n JOIN stories s ON s.id = n.story_id
    WHERE n.kind = 'correction' AND s.status IN ${PUBLIC} ORDER BY n.created_at DESC LIMIT 200`).all();
  const body = `<div class="page-head"><h1>Corrections</h1><p class="page-sub">Every correction we have made, newest first.</p></div>
    ${results.length ? `<ul class="corrections">${results.map((c) => `<li><a href="/story/${esc(c.slug)}">${esc(c.headline)}</a><p>${esc(c.note)}</p><span class="muted">${esc(formatDateTime(c.created_at, site.tz))}</span></li>`).join('')}</ul>` : emptyState('No corrections have been issued.')}`;
  return html(layout(env, chrome, { title: 'Corrections', description: 'Corrections issued by Boston Daily.', canonical: '/corrections', body }));
}

export async function searchPage(env, url) {
  const site = SITE(env);
  const chrome = await loadChrome(env);
  const q = (url.searchParams.get('q') || '').trim().slice(0, 100);
  let results = [];
  if (q.length >= 2) {
    // D1 caps LIKE patterns at 50 bytes, so match with instr() instead.
    const term = q.toLowerCase();
    ({ results } = await env.DB.prepare(`SELECT ${STORY_COLS} FROM stories s JOIN sections sec ON sec.slug = s.section_slug
      WHERE s.status IN ${PUBLIC} AND (instr(lower(s.headline), ?) > 0 OR instr(lower(COALESCE(s.dek, '')), ?) > 0 OR instr(lower(s.body), ?) > 0)
      ORDER BY s.lane = 'newsroom' DESC, s.published_at DESC LIMIT 40`).bind(term, term, term).all());
  }
  const body = `<div class="page-head"><h1>Search</h1>
      <form class="search search-page" action="/search" method="get" role="search"><label class="sr" for="q2">Search</label><input id="q2" name="q" type="search" value="${esc(q)}" placeholder="Search stories"><button class="button" type="submit">Search</button></form></div>
    ${q ? (results.length ? `<div class="stream">${results.map((s) => storyCard(s, { size: 'm', tz: site.tz })).join('')}</div>` : emptyState(`No stories match “${q}”. Try fewer or different words.`)) : ''}`;
  return html(layout(env, chrome, { title: q ? `Search: ${q}` : 'Search', description: 'Search Boston Daily.', canonical: '/search', body, noindex: true }));
}

export async function notFound(env, chrome, message = 'We could not find that page.') {
  chrome = chrome || (await loadChrome(env));
  const body = `<div class="page-head"><h1>Page not found</h1></div>${emptyState(message, '<p><a class="button" href="/">Go to today’s edition</a></p>')}`;
  return html(layout(env, chrome, { title: 'Not found', body, noindex: true }), 404);
}

const xmlEsc = (s) => esc(s);

export async function rssFeed(env) {
  const site = SITE(env);
  const { results } = await env.DB.prepare(`SELECT slug, headline, dek, body, published_at, last_updated_at FROM stories WHERE lane = 'newsroom' AND status IN ${PUBLIC} ORDER BY published_at DESC LIMIT 50`).all();
  const base = site.url || '';
  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"><channel><title>${xmlEsc(site.name)}</title><link>${xmlEsc(base)}/</link><description>${xmlEsc(site.tagline)}</description>
${results.map((s) => `<item><title>${xmlEsc(s.headline)}</title><link>${xmlEsc(base)}/story/${xmlEsc(s.slug)}</link><guid>${xmlEsc(base)}/story/${xmlEsc(s.slug)}</guid><pubDate>${new Date(s.published_at).toUTCString()}</pubDate><description>${xmlEsc(s.dek || excerpt(s.body, 240))}</description></item>`).join('\n')}
</channel></rss>`;
  return new Response(xml, { headers: { 'content-type': 'application/rss+xml; charset=utf-8', 'cache-control': 'public, max-age=300' } });
}

export async function sitemap(env, news = false) {
  const site = SITE(env);
  const base = site.url || '';
  if (news) {
    // Google News sitemap: newsroom lane only, last 48 hours. Commercial content is never included.
    const since = new Date(Date.now() - 48 * 3600000).toISOString();
    const { results } = await env.DB.prepare(`SELECT slug, headline, published_at FROM stories WHERE lane = 'newsroom' AND status IN ${PUBLIC} AND published_at >= ? ORDER BY published_at DESC LIMIT 1000`).bind(since).all();
    const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">
${results.map((s) => `<url><loc>${xmlEsc(base)}/story/${xmlEsc(s.slug)}</loc><news:news><news:publication><news:name>${xmlEsc(site.name)}</news:name><news:language>en</news:language></news:publication><news:publication_date>${xmlEsc(s.published_at)}</news:publication_date><news:title>${xmlEsc(s.headline)}</news:title></news:news></url>`).join('\n')}
</urlset>`;
    return new Response(xml, { headers: { 'content-type': 'application/xml; charset=utf-8', 'cache-control': 'public, max-age=300' } });
  }
  const [{ results: stories }, { results: sections }, { results: biz }] = await Promise.all([
    env.DB.prepare(`SELECT slug, COALESCE(corrected_at, last_updated_at, published_at) AS mod FROM stories WHERE status IN ${PUBLIC} ORDER BY published_at DESC LIMIT 5000`).all(),
    env.DB.prepare('SELECT slug FROM sections WHERE active = 1').all(),
    env.DB.prepare("SELECT slug FROM businesses WHERE status = 'active'").all(),
  ]);
  const urls = ['/', '/editions', '/shop', '/businesses', '/courses', '/advertise', '/standards', '/corrections',
    ...sections.map((s) => `/section/${s.slug}`), ...biz.map((b) => `/businesses/${b.slug}`)];
  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls.map((u) => `<url><loc>${xmlEsc(base)}${xmlEsc(u)}</loc></url>`).join('\n')}
${stories.map((s) => `<url><loc>${xmlEsc(base)}/story/${xmlEsc(s.slug)}</loc>${s.mod ? `<lastmod>${xmlEsc(s.mod)}</lastmod>` : ''}</url>`).join('\n')}
</urlset>`;
  return new Response(xml, { headers: { 'content-type': 'application/xml; charset=utf-8', 'cache-control': 'public, max-age=900' } });
}

/** Outbound click redirect for products (/go/p), businesses (/go/b) and courses (/go/c). */
export async function outbound(env, kind, id, ctx) {
  const db = env.DB;
  let row = null;
  if (kind === 'p') row = await db.prepare("SELECT id, deep_link AS url FROM products WHERE id = ? AND status = 'active'").bind(id).first();
  if (kind === 'b') row = await db.prepare("SELECT id, 'https://' || domain AS url FROM businesses WHERE slug = ? AND status = 'active' AND domain IS NOT NULL").bind(id).first();
  if (kind === 'c') row = await db.prepare("SELECT id, url FROM courses WHERE slug = ? AND status = 'active'").bind(id).first();
  if (!row || !isHttpUrl(row.url)) return new Response('Link unavailable', { status: 404, headers: { 'content-type': 'text/plain' } });
  const table = { p: 'products', b: 'businesses', c: 'courses' }[kind];
  ctx?.waitUntil?.(db.prepare(`UPDATE ${table} SET clicks = clicks + 1 WHERE id = ?`).bind(row.id).run().catch(() => {}));
  return new Response(null, { status: 302, headers: { location: row.url, 'cache-control': 'no-store', 'x-robots-tag': 'noindex, nofollow', 'referrer-policy': 'no-referrer-when-downgrade' } });
}


// ───────────────────────────── Sharing and comments ─────────────────────────────

const SHARE_TARGETS = {
  x: (u, t) => `https://twitter.com/intent/tweet?url=${encodeURIComponent(u)}&text=${encodeURIComponent(t)}`,
  facebook: (u) => `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(u)}`,
  linkedin: (u) => `https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(u)}`,
  whatsapp: (u, t) => `https://wa.me/?text=${encodeURIComponent(`${t} ${u}`)}`,
  email: (u, t) => `mailto:?subject=${encodeURIComponent(t)}&body=${encodeURIComponent(u)}`,
};

function shareBar(story) {
  const label = { x: 'X', facebook: 'Facebook', linkedin: 'LinkedIn', whatsapp: 'WhatsApp', email: 'Email' };
  return `<nav class="share" aria-label="Share this story"><span class="share-label">Share</span>
    ${Object.keys(SHARE_TARGETS).map((k) => `<a href="/share/${esc(story.slug)}/${k}" rel="nofollow noopener" target="_blank">${label[k]}</a>`).join('')}
  </nav>`;
}

function commentsBlock(story, comments, note, tz) {
  const flash = note === 'sent' ? '<p class="flash flash-ok">Thanks. Your comment will appear once an editor approves it.</p>'
    : note === 'error' ? '<p class="flash flash-err">Add your name and a comment of at least 10 characters.</p>'
    : note === 'slow' ? '<p class="flash flash-err">You have posted several comments recently. Please try again in a few minutes.</p>' : '';
  return `<section class="comments" id="comments" aria-labelledby="comments-h">
    <h2 id="comments-h">Comments${comments.length ? ` (${comments.length})` : ''}</h2>
    ${flash}
    ${comments.length ? `<ol class="comment-list">${comments.map((c) => `<li><p class="comment-meta"><strong>${esc(c.name)}</strong> <span>${esc(formatDateTime(c.created_at, tz))}</span></p><p>${esc(c.body)}</p></li>`).join('')}</ol>`
      : '<p class="muted">No comments yet. Start the conversation.</p>'}
    <form class="comment-form" method="post" action="/story/${esc(story.slug)}/comment">
      <label>Name<input name="name" required maxlength="60" autocomplete="name"></label>
      <label>Comment<textarea name="body" required minlength="10" maxlength="1500" rows="4"></textarea></label>
      <label class="hp" aria-hidden="true">Leave empty<input name="website" tabindex="-1" autocomplete="off"></label>
      <p class="comment-rules">Comments are reviewed by an editor before they appear. Be civil and stay on topic.</p>
      <button class="button" type="submit">Post comment</button>
    </form>
  </section>`;
}

async function ipHash(request, env) {
  const ip = request.headers.get('cf-connecting-ip') || 'unknown';
  const data = new TextEncoder().encode(`${ip}|${env.INGEST_SECRET || env.SITE_NAME || 'bd'}`);
  const digest = await crypto.subtle.digest('SHA-256', data);
  return [...new Uint8Array(digest)].slice(0, 12).map((b) => b.toString(16).padStart(2, '0')).join('');
}

export async function submitComment(env, request, slug) {
  const back = (n) => Response.redirect(new URL(`/story/${slug}?comment=${n}#comments`, request.url), 303);
  const story = await env.DB.prepare(`SELECT id FROM stories WHERE slug = ? AND status IN ${PUBLIC}`).bind(slug).first();
  if (!story) return new Response('Story not found', { status: 404 });
  const form = await request.formData();
  if (String(form.get('website') || '').trim()) return back('sent'); // honeypot
  const name = String(form.get('name') || '').trim().slice(0, 60);
  const body = String(form.get('body') || '').trim().slice(0, 1500);
  if (!name || body.length < 10) return back('error');
  const hash = await ipHash(request, env);
  const recent = await env.DB.prepare('SELECT COUNT(*) AS n FROM comments WHERE ip_hash = ? AND created_at >= ?')
    .bind(hash, new Date(Date.now() - 10 * 60000).toISOString()).first();
  if ((recent?.n || 0) >= 3) return back('slow');
  await env.DB.prepare('INSERT INTO comments (id, story_id, name, body, status, ip_hash, created_at) VALUES (?,?,?,?,?,?,?)')
    .bind(uid(), story.id, name, body, 'pending', hash, nowIso()).run();
  return back('sent');
}

export async function shareRedirect(env, slug, network, ctx) {
  const make = SHARE_TARGETS[network];
  const story = make ? await env.DB.prepare(`SELECT id, slug, headline FROM stories WHERE slug = ? AND status IN ${PUBLIC}`).bind(slug).first() : null;
  if (!story) return new Response('Not found', { status: 404 });
  ctx?.waitUntil?.(env.DB.prepare('UPDATE stories SET share_count = share_count + 1 WHERE id = ?').bind(story.id).run().catch(() => {}));
  const base = (env.SITE_URL || '').replace(/\/$/, '');
  return new Response(null, { status: 302, headers: { location: make(`${base}/story/${story.slug}`, story.headline), 'cache-control': 'no-store', 'x-robots-tag': 'noindex' } });
}

function faqFromBody(body) {
  const text = String(body || '');
  const i = text.search(/^##\s+(frequently asked questions|faq)/im);
  if (i < 0) return [];
  const pairs = [];
  for (const block of text.slice(i).split(/^###\s+/m).slice(1)) {
    const [q, ...rest] = block.split('\n');
    const a = excerpt(rest.join('\n').split(/^##\s/m)[0], 600);
    if (q.trim() && a) pairs.push([q.trim(), a]);
  }
  return pairs.slice(0, 10);
}
