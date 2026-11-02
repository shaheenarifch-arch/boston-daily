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

/**
 * Paid product advertisements, labeled "Paid advertisement" with the advertiser's name.
 * Each item links to the advertiser's own site (rel="sponsored").
 * awin: true marks the network's Awin affiliate websites; their product images run in the
 * page's side panel. Other advertisers run as a strip in the main column.
 */
const UTM = (c) => `utm_source=bostondaily&utm_medium=paid_ad&utm_campaign=${c}`;
export const PRODUCT_ADS = [
  {
    id: 'getout-usa-memberships',
    advertiser: 'GetOut',
    domain: 'getout.com',
    title: 'Family attraction passes in the USA',
    // GetOut via Awin (merchant 124814): US destinations, so the front page doesn't only show European city passes.
    placements: ['home', 'travel', 'us', 'entertainment'],
    awin: true,
    active: true,
    items: [
      { name: 'New England', note: 'Boston-area family attractions with one membership', image: 'https://media.getout.com/markets/62a1b510-4211-435f-8ff0-b1eeb9e2e99f/market-banner/LifestyleMarketImages_2000x900_MiniGolf_20260303183820_d5f5401e600f431d.jpg', url: 'https://www.awin1.com/cread.php?awinmid=124814&awinaffid=3067297&clickref=bostondaily&ued=https%3A%2F%2Fwww.getout.com%2Fmemberships%2Fnew-england', cta: 'View GetOut New England' },
      { name: 'Southern California', note: 'Theme parks, museums and family days out', image: 'https://media.getout.com/markets/269c6c71-a492-4e92-81f3-5214a6ccc52a/market-banner/LifestyleMarketImages_2000x900_duckygirlsplash_20260303182338_ac3fd87def227f1d.jpg', url: 'https://www.awin1.com/cread.php?awinmid=124814&awinaffid=3067297&clickref=bostondaily&ued=https%3A%2F%2Fwww.getout.com%2Fmemberships%2Fcalifornia-southern', cta: 'View GetOut SoCal' },
      { name: 'Dallas-Fort Worth', note: 'Attractions and experiences across DFW', image: 'https://media.getout.com/markets/b3f5e2a0-2f86-49e3-9428-5507f57e8e5a/market-banner/LifestyleMarketImages_2000x900_waterparkoverhead_20260303184912_0a09a9ef99f90fe2.jpg', url: 'https://www.awin1.com/cread.php?awinmid=124814&awinaffid=3067297&clickref=bostondaily&ued=https%3A%2F%2Fwww.getout.com%2Fmemberships%2Ftexas-dfw', cta: 'View GetOut DFW' },
    ],
  },
  {
    id: 'ezpass-uk-city-passes',
    advertiser: 'EasyPass',
    domain: 'ezpass.uk',
    title: 'City sightseeing passes',
    placements: ['uk', 'travel', 'home'],
    awin: true,
    active: true,
    // On UK pages the block also carries the Turbopass city passes (Awin affiliate products, linked via /go/p).
    // Turbopass's Rome City Pass replaces EasyPass's own Rome card there, so Rome appears once.
    partnerProducts: {
      placements: ['uk'],
      ids: ['p-100613-a0b3912a4d', 'p-100613-37f09d518c', 'p-100613-e26a73850f', 'p-100613-3470056d63',
        'p-100613-4ebecab254', 'p-100613-dbc45402e6', 'p-100613-fad28500e4', 'p-100613-6ce325e48d'],
      replaces: ['Rome City Pass'],
    },
    items: [
      { name: 'London City Pass', note: 'From €129', image: 'https://ezpass.uk/london-480.webp', url: `https://ezpass.uk/?${UTM('city-passes')}` },
      { name: 'Paris Flex Pass', note: 'From €130', image: 'https://ezpass.uk/paris-480.webp', url: `https://ezpass.uk/?${UTM('city-passes')}` },
      { name: 'Rome City Pass', note: 'From €99', image: 'https://ezpass.uk/rome-480.webp', url: `https://ezpass.uk/?${UTM('city-passes')}` },
    ],
  },
  {
    id: 'buybeststores-uk-tech',
    advertiser: 'BuyBestStores',
    domain: 'buybeststores.uk',
    title: 'Tech and home fitness',
    // UK pages only: a UK store.
    placements: ['uk'],
    awin: true,
    active: true,
    items: [
      { name: 'X20 Auto Incline Treadmill', note: '', image: 'https://cdn.shopify.com/s/files/1/0867/7274/4478/files/1-ap01-main-image-1027.jpg?v=1761546416', url: `https://buybeststores.uk/?${UTM('home-fitness')}` },
      { name: 'Q1 Walking Pad', note: '', image: 'https://cdn.shopify.com/s/files/1/0867/7274/4478/files/Deerrunn-under-desk-treadmill-BA10-Halloween_33_bfd4c2a0-94e4-4826-94e1-d53020276d5b.jpg?v=1756871458', url: `https://buybeststores.uk/?${UTM('home-fitness')}` },
      { name: 'iPhone 16 Pro Max case with camera stand', note: '', image: 'https://cdn.shopify.com/s/files/1/0657/3811/3283/files/2-2_e2e2d5c3-d48e-41c2-b0e0-d1b5cca5475d.jpg?v=1788771704&width=900', url: `https://buybeststores.uk/?${UTM('accessories')}` },
    ],
  },
  {
    id: 'getservices-ai-pods-atlas',
    advertiser: 'GetServices.ai',
    domain: 'getservices.ai',
    title: 'AI for your business',
    placements: ['ai'],
    active: true,
    items: [
      { name: 'AI Pods', note: 'AI services, AI pods and automation for small businesses and regulated industries.', image: '', url: `https://getservices.ai/?${UTM('ai-pods')}`, cta: 'Explore AI Pods' },
      { name: 'ATLAS AEO engine', note: 'Answer-engine and search optimization for your website, so AI assistants and search can find you.', image: '', url: `https://app.getservices.ai/?${UTM('atlas-aeo')}`, cta: 'Try ATLAS AEO' },
    ],
  },
];

export function productAdsFor(placement, { awin } = {}) {
  return PRODUCT_ADS.filter((a) => a.active !== false && a.placements.includes(placement) && (awin === undefined || Boolean(a.awin) === awin));
}

/** Product ids an ad pulls into its block on this placement (see partnerProducts). */
export function adPartnerProductIds(placement) {
  return productAdsFor(placement, { awin: true }).flatMap((a) => (a.partnerProducts?.placements.includes(placement) ? a.partnerProducts.ids : []));
}

export function campaignFor(placement, now = new Date()) {
  const today = now.toISOString().slice(0, 10);
  return CAMPAIGNS.find((c) => c.active !== false && c.placements.includes(placement) && (!c.start || c.start <= today) && (!c.end || c.end >= today)) || null;
}
