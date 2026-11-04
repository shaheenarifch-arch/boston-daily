// Dated newsroom content packages. Each loads once (tracked in content_imports) and only
// creates drafts in EDITORIAL_REVIEW; an editor approves before anything is published.
// The daily newsroom job adds one import line and one entry per day.
import d20261017 from './2026-10-17.sql';
import d20261017sections from './2026-10-17-sections.sql';
import d20261017guides from './2026-10-17-guides.sql';
import d20261018 from './2026-10-18.sql';
import d20261018sports from './2026-10-18-sports.sql';
import d20261018more from './2026-10-18-more.sql';
import d20261018courses from './2026-10-18-courses.sql';
import d20261018lead from './2026-10-18-lead.sql';
import d20261018long from './2026-10-18-guides-long.sql';
import d20261018opinion from './2026-10-18-opinion.sql';
import d20261018uniq from './2026-10-18-unique-images.sql';
import d20261018live1 from './2026-10-18-pats-live1.sql';
import d20261018maelection from './2026-10-18-ma-election.sql';
import d20261018missingimg from './2026-10-18-missing-images.sql';
import d20261018partnerproducts from './2026-10-18-partner-products.sql';
import d20261018partnerfix from './2026-10-18-partner-products-fix.sql';
import d20261019sectiondesc from './2026-10-19-section-descriptions.sql';
import d20261019 from './2026-10-19.sql';
import d20261019netgroups from './2026-10-19-network-groups.sql';
import d20261020 from './2026-10-20.sql';
import d20261019expand from './2026-10-19-expand-evergreen.sql';
import d20261020images from './2026-10-20-missing-images.sql';
import d20261020commerce from './2026-10-20-commerce-sync.sql';
import d20261020govrace from './2026-10-20-gov-race.sql';
import d20261020photos from './2026-10-20-partner-photos.sql';
import d20261021 from './2026-10-21.sql';
import d20261022 from './2026-10-22.sql';
import d20261022sirenis from './2026-10-22-sirenis.sql';
import d20261023 from './2026-10-23.sql';
import d20261023images from './2026-10-23-missing-images.sql';
import d20261024 from './2026-10-24.sql';
import d20261026 from './2026-10-26.sql';
import d20261027 from './2026-10-27.sql';
import d20261028 from './2026-10-28.sql';
import d20261028images from './2026-10-28-missing-images.sql';
import d20261029 from './2026-10-29.sql';
import d20261030 from './2026-10-30.sql';
import d20261031 from './2026-10-31.sql';
import d20261101 from './2026-11-01.sql';
import d20261102 from './2026-11-02.sql';
import d20261103 from './2026-11-03.sql';
import d20261104 from './2026-11-04.sql';
import d20261104results from './2026-11-04-results.sql';

export const CONTENT_PACKAGES = [
  ['2026-10-17', d20261017],
  ['2026-10-17-sections', d20261017sections],
  ['2026-10-17-guides', d20261017guides],
  ['2026-10-18', d20261018],
  ['2026-10-18-sports', d20261018sports],
  ['2026-10-18-more', d20261018more],
  ['2026-10-18-courses', d20261018courses],
  ['2026-10-18-lead', d20261018lead],
  ['2026-10-18-guides-long', d20261018long],
  ['2026-10-18-opinion', d20261018opinion],
  ['2026-10-18-unique-images', d20261018uniq],
  ['2026-10-18-pats-live1', d20261018live1],
  ['2026-10-18-ma-election', d20261018maelection],
  ['2026-10-18-missing-images', d20261018missingimg],
  ['2026-10-18-partner-products', d20261018partnerproducts],
  ['2026-10-18-partner-products-fix', d20261018partnerfix],
  ['2026-10-19-section-descriptions', d20261019sectiondesc],
  ['2026-10-19', d20261019],
  ['2026-10-19-network-groups', d20261019netgroups],
  ['2026-10-20', d20261020],
['2026-10-19-expand-evergreen', d20261019expand],
  ['2026-10-20-missing-images', d20261020images],
  ['2026-10-20-commerce-sync', d20261020commerce],
  ['2026-10-20-gov-race', d20261020govrace],
  ['2026-10-20-partner-photos', d20261020photos],
  ['2026-10-21', d20261021],
  ['2026-10-22', d20261022],
  ['2026-10-22-sirenis', d20261022sirenis],
  ['2026-10-23', d20261023],
  ['2026-10-23-missing-images', d20261023images],
  ['2026-10-24', d20261024],
  ['2026-10-26', d20261026],
  ['2026-10-27', d20261027],
  ['2026-10-28', d20261028],
  ['2026-10-28-missing-images', d20261028images],
  ['2026-10-29', d20261029],
  ['2026-10-30', d20261030],
  ['2026-10-31', d20261031],
  ['2026-11-01', d20261101],
  ['2026-11-02', d20261102],
  ['2026-11-03', d20261103],
  ['2026-11-04', d20261104],
  ['2026-11-04-results', d20261104results],
];
