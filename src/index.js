import { json, errorJson } from './util.js';
import { authenticateEditor, verifyIngestSignature } from './auth.js';
import { handleAdmin } from './admin-api.js';
import { ingestBlogPost, ingestProducts, ingestBusinesses, ingestCourses } from './ingest.js';
import { publishDueScheduled } from './lifecycle.js';
import { buildEdition } from './editions.js';
import { checkProductLinks, checkBusinessHealth } from './maintenance.js';
import { ensureDatabase } from './bootstrap.js';
import {
  homePage, editionsArchive, sectionPage, storyPage, shopPage, businessesPage, businessProfile, coursesPage,
  advertisePage, submitInquiry, submitComment, shareRedirect, standardsPage, correctionsPage, searchPage, notFound, rssFeed, sitemap, outbound,
} from './reader/pages.js';

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    const { pathname } = url;
    const method = request.method;

    // One canonical host: www.bostondaily.us → bostondaily.us
    if (url.hostname.startsWith('www.')) {
      url.hostname = url.hostname.slice(4);
      return Response.redirect(url.toString(), 301);
    }

    try {
      await ensureDatabase(env.DB);

      // ── Newsroom API (human editors only) ──
      if (pathname.startsWith('/api/admin')) {
        const editor = await authenticateEditor(request, env);
        if (!editor) return errorJson('Editor sign-in required', 401);
        return await handleAdmin(request, env, url, editor);
      }

      // ── Ingestion (HMAC-signed automated systems) ──
      if (pathname.startsWith('/api/ingest/') && method === 'POST') {
        const raw = await request.text();
        if (!(await verifyIngestSignature(request, raw, env))) return errorJson('Invalid signature', 401);
        let payload;
        try { payload = JSON.parse(raw); } catch { return errorJson('Body must be JSON', 400); }
        switch (pathname) {
          case '/api/ingest/blog': return await ingestBlogPost(env, payload);
          case '/api/ingest/products': return await ingestProducts(env, payload);
          case '/api/ingest/businesses': return await ingestBusinesses(env, payload);
          case '/api/ingest/courses': return await ingestCourses(env, payload);
          default: return errorJson('Unknown ingest endpoint', 404);
        }
      }

      if (pathname === '/api/inquiry' && method === 'POST') return await submitInquiry(env, request);
      let cm;
      if ((cm = pathname.match(/^\/story\/([a-z0-9-]+)\/comment$/)) && method === 'POST') return await submitComment(env, request, cm[1]);
      if (pathname === '/api/health') return json({ ok: true, service: 'boston-daily' });

      if (method !== 'GET' && method !== 'HEAD') return errorJson('Method not allowed', 405);

      // ── Reader site ──
      if (pathname === '/') return await homePage(env);
      if (pathname === '/editions') return await editionsArchive(env);
      let m;
      if ((m = pathname.match(/^\/edition\/(\d{4}-\d{2}-\d{2})\/?$/))) return await homePage(env, m[1]);
      if ((m = pathname.match(/^\/section\/([a-z0-9-]+)\/?$/))) return await sectionPage(env, m[1]);
      if ((m = pathname.match(/^\/story\/([a-z0-9-]+)\/?$/))) return await storyPage(env, m[1], ctx, url);
      if ((m = pathname.match(/^\/share\/([a-z0-9-]+)\/([a-z]+)$/))) return await shareRedirect(env, m[1], m[2], ctx);
      if (pathname === '/shop') return await shopPage(env, url);
      if (pathname === '/businesses') return await businessesPage(env);
      if ((m = pathname.match(/^\/businesses\/([a-z0-9-]+)\/?$/))) return await businessProfile(env, m[1]);
      if (pathname === '/courses') return await coursesPage(env, url);
      if (pathname === '/advertise') return await advertisePage(env, url);
      if (pathname === '/standards') return await standardsPage(env);
      if (pathname === '/corrections') return await correctionsPage(env);
      if (pathname === '/search') return await searchPage(env, url);
      if ((m = pathname.match(/^\/go\/([pbc])\/([A-Za-z0-9-]+)$/))) return await outbound(env, m[1], m[2], ctx);
      if (pathname === '/feed.xml') return await rssFeed(env);
      if (pathname === '/sitemap.xml') return await sitemap(env, false);
      if (pathname === '/news-sitemap.xml') return await sitemap(env, true);
      if (pathname === '/robots.txt') {
        const base = (env.SITE_URL || '').replace(/\/$/, '');
        return new Response(`User-agent: *\nDisallow: /admin/\nDisallow: /api/\nDisallow: /go/\nSitemap: ${base}/sitemap.xml\nSitemap: ${base}/news-sitemap.xml\n`, { headers: { 'content-type': 'text/plain' } });
      }
      return await notFound(env);
    } catch (err) {
      console.error(err);
      if (pathname.startsWith('/api/')) return errorJson('Server error', 500);
      return new Response('Boston Daily is temporarily unavailable. Please try again shortly.', { status: 500, headers: { 'content-type': 'text/plain' } });
    }
  },

  async scheduled(event, env, ctx) {
    await ensureDatabase(env.DB);
    if (event.cron === '*/5 * * * *') {
      ctx.waitUntil(publishDueScheduled(env.DB));
      return;
    }
    // Daily: build and publish today's edition, then routine link and health checks.
    ctx.waitUntil((async () => {
      await publishDueScheduled(env.DB);
      await buildEdition(env.DB, env, { actor: 'system:edition-builder' });
      await checkProductLinks(env.DB, 30);
      await checkBusinessHealth(env.DB, 15);
    })());
  },
};
