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
];
