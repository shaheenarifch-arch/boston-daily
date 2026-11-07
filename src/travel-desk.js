import { esc } from './util.js';

// "Plan your trip" on /section/travel: affiliate partners grouped by how readers travel.
// Products are loaded by id (content/2026-11-06-travel-desk.sql and earlier loads); a group with
// no active products is skipped. City passes and GetOut already show in the page's ad blocks.
export const TRAVEL_DESK = [
  { key: 'air', title: 'Air travel', note: 'Flights, plus business and first class fares.',
    ids: ['p-54380-intl', 'p-54380-us', 'p-54380-latam', 'p-54380-skylux', 'p-54380-vagamo'] },
  { key: 'mercedes', title: 'Mercedes-Benz ground travel', note: 'Chauffeured Mercedes-Benz Sprinter rides between cities.',
    ids: ['p-128231-chauffeur', 'p-128231-members'] },
  { key: 'sea', title: 'Sea travel', note: 'Boat rentals and yacht charters.',
    ids: ['p-32679-rentals', 'p-92667-00b3db15c5', 'p-92667-52a5000e82', 'p-92667-da7846d536'] },
  { key: 'passport', title: 'Passport and visa services', note: 'Need a passport fast? Check the official State Department times first.',
    help: { href: 'https://travel.state.gov/content/travel/en/passports/how-apply/processing-times.html', label: 'US passport processing times' },
    ids: ['p-24807-passport'] },
  { key: 'hotels', title: 'Hotels and resorts', note: 'All-inclusive resorts in the Caribbean and Mexico.',
    ids: ['p-109948-fce420fd6a', 'p-109948-71845e5676'] },
  { key: 'gear', title: 'Travel gear on Amazon', note: 'Packing basics worth having before you fly.',
    ids: ['p-amz-carryon', 'p-amz-cubes', 'p-amz-adapter', 'p-amz-pillow', 'p-amz-tracker'] },
];

export async function travelDeskProducts(db) {
  const ids = TRAVEL_DESK.flatMap((g) => g.ids);
  const { results } = await db.prepare(`SELECT p.*, m.name AS merchant_name, m.display_name_allowed FROM products p JOIN merchants m ON m.id = p.merchant_id
    WHERE p.status = 'active' AND m.status = 'active' AND p.id IN (${ids.map(() => '?').join(',')})`).bind(...ids).all();
  return new Map(results.map((p) => [p.id, p]));
}

export function travelDesk(byId) {
  const groups = TRAVEL_DESK.map((g) => ({ ...g, items: g.ids.map((id) => byId.get(id)).filter((p) => p && p.image_url && p.image_rights_ok) }))
    .filter((g) => g.items.length);
  if (!groups.length) return '';
  return `<section class="travel-desk" id="plan-your-trip" aria-labelledby="travel-desk-h">
    <header class="module-head"><h2 class="row-title" id="travel-desk-h">Plan your trip</h2><span class="label label-commerce">Affiliate</span></header>
    <p class="module-disclosure">Partner offers with affiliate links: we may earn a commission, and partners never influence our news coverage. Prices and availability are set by each partner. <a href="/standards">How we label advertising</a></p>
    <nav class="chips" aria-label="Jump to a travel category">${groups.map((g) => `<a href="#td-${esc(g.key)}">${esc(g.title)}</a>`).join('')}</nav>
    ${groups.map((g) => `<div class="td-group" id="td-${esc(g.key)}">
      <h3 class="td-title">${esc(g.title)}</h3>
      <p class="td-note">${esc(g.note)}${g.help ? ` <a href="${esc(g.help.href)}" target="_blank" rel="noopener">${esc(g.help.label)}</a>` : ''}</p>
      <ul class="td-grid">${g.items.map((p) => `<li class="td-card">
        <a href="/go/p/${esc(p.id)}" rel="sponsored nofollow noopener" target="_blank">
          <span class="td-img${/linksynergy\.com/.test(p.image_url) ? ' td-logo' : ''}"><img src="${esc(p.image_url)}" alt="${esc(p.name)}" loading="lazy" decoding="async"></span>
          <span class="td-name">${esc(p.name)}</span>
          ${p.description ? `<span class="td-desc">${esc(p.description)}</span>` : ''}
          <span class="td-cta">${p.merchant_id === 'amazon-us' ? 'Shop on Amazon' : 'See offer'}</span>
        </a></li>`).join('')}</ul>
    </div>`).join('')}
  </section>`;
}
