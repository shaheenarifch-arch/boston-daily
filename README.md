# Boston Daily

A daily digital newspaper run operationally by GetServices.ai. One Cloudflare Worker serves the public reader site, the newsroom command center and the ingestion API, backed by D1.

- **Reader site**: daily edition, sections, stories with update/correction history and public sources, edition archive, Partner picks (all vendors, affiliate), Recommended Businesses (GetServices.ai network), RealSkillSet courses, Advertise With Us, editorial standards, corrections, search, RSS and sitemaps.
- **Newsroom console** (`/admin`): live pipeline, editorial queue, story editor with provenance, approvals, scheduling, updates and corrections, edition curation, commerce, business registry, ad inquiries.
- **Ingestion API**: blog bot posts (seo-controller), merchant/product sync, business registry, RealSkillSet catalog.

## Editorial rules the platform enforces

| Rule | Where |
| --- | --- |
| Lifecycle DISCOVERED → RESEARCHING → VERIFYING → DRAFTING → EDITORIAL_REVIEW → APPROVED → SCHEDULED → PUBLISHED → UPDATED / CORRECTED → ARCHIVED (+ REJECTED); no skipping | `src/lifecycle.js` |
| Newsroom stories need a human editor to approve; automated systems cannot | `approvalProblems` |
| US Politics, Health & Wellness and anything flagged sensitive always need a human | `sections.always_human`, `stories.sensitive` |
| News needs provenance: at least one non-DISCOVERY_ONLY source, all verified | `sourceProblems` |
| Hero images need recorded usage rights | `approvalProblems` |
| PUBLISHED only after the DB confirms the guarded write; version snapshot written atomically | `guardedStatusChange`, `publish` |
| Live stories change only via Update or Correction, each with a public note; all versions kept | `revisePublished` |
| Editing approved content sends it back to review | `editStory` |
| Commercial content: disclosure label + line, no newsroom byline, no news framing, no medical/financial claims, valid links, not in commerce-free sections | `commerceGateProblems` |
| No products, network modules, courses or ads on US Politics, Opinion or sensitive stories | `commerceAllowed` |
| Commercial content excluded from the news sitemap and NewsArticle schema | `src/reader/pages.js` |

## Local development

```bash
npm install
cp .dev.vars.example .dev.vars      # editor tokens + ingest secret for local use
npm run db:migrate:local
npm run db:seed:local
npm run dev                          # http://localhost:8787  (console: /admin)
npm test                             # rule unit tests
npm run test:e2e                     # full workflow against the running dev server (use a fresh local DB)
```

## Deploy to Cloudflare

```bash
npx wrangler login
npx wrangler d1 create boston_daily          # copy database_id into wrangler.toml
npm run db:migrate:remote
npm run db:seed:remote
npx wrangler secret put ADMIN_TOKENS         # "Shaheen:<long random>,Talha:<long random>"
npx wrangler secret put INGEST_SECRET        # long random; share with seo-controller + sync job
# set SITE_URL in wrangler.toml to the real domain, then:
npm run deploy
```

Then add a custom domain to the Worker in the Cloudflare dashboard, and put **Cloudflare Access** in front of `/admin*` and `/api/admin*` so editors also sign in with SSO.

Crons (in `wrangler.toml`): every 5 minutes publishes due scheduled stories; daily at 09:50 UTC builds the edition, checks affiliate links and business site health.

## Connecting your systems

All ingest calls are `POST` JSON signed with `X-Signature: sha256=<HMAC-SHA256(body, INGEST_SECRET)>`. A ready Python client is in `integrations/boston_daily_client.py`.

| Endpoint | Sender | What happens |
| --- | --- | --- |
| `/api/ingest/blog` | seo-controller `blog_bot.py` | Creates a labeled Affiliate partner post. Auto-publishes if every gate passes and `AUTO_PUBLISH_COMMERCE=true`; otherwise waits in the editorial queue. Duplicates (same repo/path) are skipped. |
| `/api/ingest/products` | master affiliate database sync | Upserts merchants and products for every vendor; rejects invalid links; `full_sync` deactivates anything missing. |
| `/api/ingest/businesses` | registry sync | Upserts Recommended Businesses. |
| `/api/ingest/courses` | RealSkillSet | Upserts the course catalog. |

## Configuration

`wrangler.toml` `[vars]`: `SITE_NAME`, `SITE_URL`, `TIMEZONE`, `CONTACT_EMAIL`, `CONTACT_PHONE`, `NETWORK_NAME`, `AUTO_PUBLISH_COMMERCE`.
Sections are rows in the `sections` table (add a niche by inserting a row). The business seed in `seed/seed.sql` is a starting point; verify it against the master file.

## Phase 2 (not in this release)

Subscriber accounts, saved stories, newsletters and paywall; RealSkillSet checkout and My Courses; ad server and campaign scheduling; licensed wire, sports data and photo adapters; the Newsroom AI pod's automated discovery/research feeding DISCOVERED stories through the admin API.

## Admin analytics

The admin Live page shows unique visitors and page views (counted without cookies; bots excluded), newsletter subscribers, and Google Search Console data.

**Connect Google Search Console**

1. In Google Cloud Console, create a project, enable the **Google Search Console API**, and create a **service account**. Create a JSON key for it and download the file.
2. In Search Console (bostondaily.us property) go to **Settings → Users and permissions → Add user**, paste the service account's email (`...@...iam.gserviceaccount.com`) and give it **Restricted** access.
3. In Cloudflare, add to the Worker: secret `GSC_SERVICE_ACCOUNT` = the whole JSON key file contents, and `GSC_SITE` = `sc-domain:bostondaily.us` for a Domain property (or `https://bostondaily.us/` for a URL-prefix property).

Reports are cached for 6 hours; use Refresh on the Live page to update sooner.

## Partner Offers

Category-matched products from every affiliate merchant, in the side panel of section and story pages (`src/offers.js`). Desktop shows up to 4 (sticky, stops before the footer), tablet 3, mobile 2 after the article.

- **Scoring:** exact subcategory +100, primary category +70, each approved tag (category keywords or headline words) +15, region match +20, in stock +15, active promotion +10, editorially featured +10. Expired promotions, out-of-stock, missing image/link and region-ineligible products are excluded. Products that match nothing never fill the module; with fewer than two matches it shows one strong match or nothing. Commission plays no part.
- **Never automatic** on US Politics, Opinion/Columns, sensitive stories (and crime, emergencies, obituaries): an editor can hand-pick products for a page, and only products marked `sensitive_ok` will show there.
- **Disclosure:** one line above the first card; the footer carries the short partner-link line. Paid placements (`sponsored`) show a Sponsored label.
- **Editors** (`/api/admin`): `PATCH /products/:id` (tags, extra_sections, regions, section_slug, category, promo_label/start/end, featured, sponsored, sensitive_ok, availability, status) · `PATCH /offers/sections/:slug` (partner_offers on/off, offer_tags) · `PATCH /offers/stories/:id` (partner_offers on/off, partner_offer_ids) · `GET /offers/preview?story=|section=` · `GET /offers/stats?days=30`.
- **Merchant sync** (`/api/ingest/products`) may send `tags`, `sections`, `regions`, `promo_label`, `promo_start`, `promo_end`, `sponsored`; fields it omits keep their editor values.
- **Analytics:** `offer_stats` counts impressions and clicks per day, page category and product. No story, candidate or viewpoint is recorded, and merchant tracking links are not changed.
