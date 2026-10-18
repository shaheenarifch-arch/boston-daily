/**
 * Lifestyle / commerce category structure. Each hub section lists its subcategories
 * (slug, label, keywords used to match products and reader questions) and related news sections.
 * notice: shown on the hub where editorial care is required (health, pets, auto).
 */
const sub = (label, ...keywords) => ({ slug: label.toLowerCase().replace(/&/g, 'and').replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, ''), label, keywords: [label.toLowerCase(), ...keywords] });

export const HUBS = {
  'beauty-hair': {
    tagline: 'Beauty, hair, skin and grooming: what works and what to buy.',
    subs: [sub('Beauty', 'makeup', 'cosmetic'), sub('Hair care', 'shampoo', 'conditioner'), sub('Skin care', 'skincare', 'moisturizer', 'serum', 'sunscreen'), sub('Grooming', 'razor', 'shaver', 'beard'), sub('Fragrance', 'perfume', 'cologne'), sub('Beauty devices', 'led mask', 'device'), sub('Hair tools', 'hair dryer', 'straightener', 'curler')],
    related: ['lifestyle', 'health-wellness'],
  },
  'fashion-style': {
    tagline: 'Clothing, shoes and accessories, season by season.',
    subs: [sub('Clothing', 'jacket', 'coat', 'sweater', 'dress', 'shirt'), sub('Footwear', 'shoes', 'boots', 'sneakers'), sub('Accessories', 'scarf', 'hat', 'gloves', 'sunglasses'), sub('Watches', 'watch', 'smartwatch'), sub('Bags', 'bag', 'handbag', 'tote', 'wallet'), sub('Seasonal fashion', 'winter', 'fall', 'summer')],
    related: ['lifestyle'],
  },
  outdoor: {
    tagline: 'Gear and guides for getting outside in New England and beyond.',
    subs: [sub('Camping', 'camp', 'sleeping bag'), sub('Hiking', 'hike', 'trail'), sub('Cycling', 'bike', 'bicycle', 'helmet'), sub('Running', 'run', 'running shoes'), sub('Outdoor fitness', 'fitness'), sub('Travel gear', 'travel'), sub('Tents', 'tent'), sub('Backpacks', 'backpack', 'pack'), sub('Footwear', 'boots', 'shoes'), sub('Outdoor tech', 'gps', 'headlamp', 'power bank')],
    related: ['travel', 'us-sports'],
  },
  auto: {
    tagline: 'Cars, EVs, accessories and how to look after them.',
    subs: [sub('Accessories', 'car accessory'), sub('Dash cameras', 'dash cam', 'dashcam'), sub('Car electronics', 'charger', 'carplay', 'stereo'), sub('EV accessories', 'ev', 'charging', 'electric vehicle'), sub('Maintenance', 'oil', 'wiper', 'battery'), sub('Cleaning and detailing', 'wax', 'cleaning', 'detailing'), sub('Tyres', 'tire', 'tyre', 'snow tire'), sub('Tools', 'tool', 'jack', 'jump starter')],
    related: ['us', 'technology'],
    notice: 'Product information here is general. For safety-critical work on brakes, tires, airbags or electrical systems, use a qualified technician.',
  },
  travel: {
    tagline: 'Destinations, trips and the gear that makes them easier.',
    subs: [sub('Destinations', 'city', 'trip'), sub('Hotels', 'hotel', 'stay'), sub('Flights', 'flight', 'airline', 'airport'), sub('Travel guides', 'guide'), sub('Luggage', 'suitcase', 'carry-on', 'luggage'), sub('Travel accessories', 'pillow', 'adapter'), sub('Travel tech', 'tracker', 'airtag'), sub('City passes', 'pass', 'sightseeing'), sub('Travel insurance', 'insurance')],
    related: ['world', 'lifestyle'],
  },
  'home-living': {
    tagline: 'Furniture, appliances, smart home and everyday upgrades.',
    subs: [sub('Furniture', 'sofa', 'chair', 'table', 'desk'), sub('Appliances', 'appliance', 'vacuum', 'air fryer'), sub('Kitchen', 'cookware', 'knife', 'blender'), sub('Smart home', 'smart', 'thermostat', 'speaker'), sub('Cleaning', 'cleaner', 'mop'), sub('Organization', 'storage', 'organizer'), sub('Bedding', 'mattress', 'sheets', 'pillow', 'blanket'), sub('Decor', 'lamp', 'rug'), sub('Home office', 'office', 'monitor', 'desk chair')],
    related: ['lifestyle', 'technology'],
  },
  garden: {
    tagline: 'Tools, outdoor living and growing advice for every season.',
    subs: [sub('Garden tools', 'shovel', 'pruner', 'rake'), sub('Outdoor furniture', 'patio'), sub('Plants and growing', 'seed', 'bulb', 'plant'), sub('Lawn equipment', 'mower', 'trimmer', 'leaf blower'), sub('BBQs', 'grill', 'bbq'), sub('Outdoor lighting', 'solar light', 'lighting'), sub('Garden tech', 'sprinkler', 'smart garden')],
    related: ['lifestyle', 'science'],
  },
  pets: {
    tagline: 'Caring for dogs, cats and the rest of the family.',
    subs: [sub('Pet food', 'food', 'treats'), sub('Beds', 'bed'), sub('Toys', 'toy'), sub('Carriers', 'carrier', 'crate'), sub('Training', 'leash', 'harness', 'training'), sub('Grooming', 'brush', 'shampoo'), sub('Pet tech', 'gps collar', 'feeder', 'camera'), sub('Pet travel', 'travel')],
    related: ['lifestyle'],
    notice: 'General information, not veterinary advice. Ask your veterinarian about your pet’s health, diet or medication.',
  },
  'health-wellness': {
    tagline: 'Fitness, sleep and healthy living, with editorial kept separate from products.',
    subs: [sub('Fitness equipment', 'treadmill', 'walking pad', 'dumbbell', 'bike'), sub('Wearables', 'fitness tracker', 'smartwatch'), sub('Sleep', 'sleep', 'mattress'), sub('Wellness tech', 'massage', 'device'), sub('Exercise accessories', 'yoga', 'mat', 'bands')],
    related: ['science', 'lifestyle'],
    notice: 'Products shown here are not intended to diagnose, treat, cure or prevent any condition. Health articles are editorial and independent of product placements. Talk to a clinician about medical questions.',
  },
  'food-culture': {
    tagline: 'Food, restaurants, books, arts and the gifts that go with them.',
    subs: [sub('Food', 'recipe'), sub('Restaurants', 'restaurant', 'dining'), sub('Kitchen products', 'cookware', 'knife'), sub('Coffee', 'coffee', 'espresso'), sub('Cooking equipment', 'oven', 'pan', 'air fryer'), sub('Books', 'book', 'cookbook'), sub('Arts and culture', 'museum', 'theater', 'concert'), sub('Gift guides', 'gift')],
    related: ['entertainment', 'lifestyle'],
  },
  deals: {
    tagline: 'Current deals from verified product data. No invented discounts.',
    subs: [sub('Technology', 'tech', 'laptop', 'phone', 'gpu', 'graphics card'), sub('Home', 'home', 'kitchen'), sub('Fashion', 'clothing', 'shoes'), sub('Beauty', 'beauty', 'skin'), sub('Travel', 'travel', 'pass', 'luggage')],
    related: ['business'],
  },
  'education-careers': {
    tagline: 'Careers, skills and learning, with paid placements kept separate.',
    subs: [sub('Careers', 'job', 'career'), sub('Skills', 'skill'), sub('Professional development', 'certificate'), sub('Learning resources', 'course', 'learn'), sub('Books', 'book'), sub('Software and tools', 'software', 'app'), sub('Training', 'training')],
    related: ['business', 'technology'],
  },
};

/** Map a product to a hub subcategory by keywords (used when a feed has no subcategory). */
export function guessSubcategory(section, text) {
  const hub = HUBS[section];
  if (!hub) return null;
  const t = String(text || '').toLowerCase();
  const hit = hub.subs.find((s) => s.keywords.some((k) => t.includes(k)));
  return hit ? hit.slug : null;
}

/** Find hub sections and subcategories mentioned in a reader's question. */
export function matchTaxonomy(text) {
  const t = ` ${String(text || '').toLowerCase()} `;
  const sections = new Set();
  const subs = [];
  for (const [section, hub] of Object.entries(HUBS)) {
    if (t.includes(` ${section.replace(/-/g, ' ')} `) || t.includes(section)) sections.add(section);
    for (const s of hub.subs) {
      if (s.keywords.some((k) => new RegExp(`\\b${k.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}s?\\b`).test(t))) { sections.add(section); subs.push({ section, ...s }); }
    }
  }
  return { sections: [...sections], subs };
}
