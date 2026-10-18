/**
 * Direct-sold display campaigns. Each one replaces the "Advertise with us" house ad in its
 * placements and is always labeled Advertisement with rel="sponsored". Ads only render where
 * commerce is allowed (never in US Politics or other commerce-free sections).
 * placements: 'home' for the front page, or section slugs. Dates are YYYY-MM-DD (inclusive, UTC).
 */
export const CAMPAIGNS = [
  {
    id: 'ticketsonline-boston-passes',
    advertiser: 'tickets.online',
    headline: 'Boston passes',
    copy: 'Plan your Boston sightseeing with one pass. Compare Boston pass options at tickets.online.',
    cta: 'See Boston passes',
    url: 'https://tickets.online/?utm_source=bostondaily&utm_medium=display&utm_campaign=boston-passes',
    placements: ['home', 'travel', 'lifestyle', 'entertainment', 'us', 'food-culture', 'outdoor', 'deals'],
    // Paused: tickets.online does not resolve (no such domain). Set the correct URL, then set active: true.
    active: false,
    start: '2026-10-18',
    end: null,
  },
];

export function campaignFor(placement, now = new Date()) {
  const today = now.toISOString().slice(0, 10);
  return CAMPAIGNS.find((c) => c.active !== false && c.placements.includes(placement) && (!c.start || c.start <= today) && (!c.end || c.end >= today)) || null;
}
