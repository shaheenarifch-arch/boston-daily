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

export const CONTENT_PACKAGES = [
  ['2026-10-17', d20261017],
  ['2026-10-17-sections', d20261017sections],
  ['2026-10-17-guides', d20261017guides],
  ['2026-10-18', d20261018],
  ['2026-10-18-sports', d20261018sports],
  ['2026-10-18-more', d20261018more],
  ['2026-10-18-courses', d20261018courses],
  ['2026-10-18-lead', d20261018lead],
];
