// Love and Care: the publisher's own Amazon store (seller A1VAJOPX9UVY80), shown as a moving
// carousel above the Chambelli picks on the front page. Real Amazon listing photos; each card
// opens the listing on Amazon. One T-shirt only, by the editor's choice (the "I Am Jane Doe" tee).
// Prices are left off on purpose: they change on Amazon, and a stale price here would mislead.
// Products picked from the live storefront on Nov 24, 2026; holiday gifts first for the season.
import { esc } from '../util.js';

// Amazon Associates tracking ID: if a Love and Care listing is ever unavailable and the reader
// buys something else on Amazon, the visit still earns an affiliate commission.
export const AMAZON_TAG = 'get786-20';
export const LOVE_CARE_STORE = `https://www.amazon.com/s?me=A1VAJOPX9UVY80&tag=${AMAZON_TAG}`;

export const LOVE_CARE_HOLIDAY = [
  ['B0HSH8RH8B', '711YEtDH+OL', 'Christmas Snow Globe Candle Light with Santa Scene'],
  ['B0HSHNDBBW', '51fswxzfqhL', '24K Gold Rose Flower Set with Gift Box and Tote Bag'],
  ['B0HSJPB91L', '41V7+o3y-AL', 'Christmas Gnome Decorations, Set of 2'],
  ['B0HPJW21B4', '71E2OjO-gVL', 'Boston Terrier Fleece Throw Blanket with Hearts'],
  ['B0HPJN49P4', '71EnwqyICkL', 'Christmas Teardrop Swag with Red Bow'],
  ['B0HPHFW6N4', '518dRrlrL7L', 'Felt Christmas Snowman Set for Kids'],
  ['B0HPCWXWC7', '61sdaptMuRL', 'Retro Merry Christmas Metal Sign'],
  ['B0HP728WRS', '41lS+8dlBvL', 'Satin Sleep Set, 4 Piece, with Eye Mask'],
  ['B0HPJFPQM9', '91+rBUggsTL', 'Christmas Tree Collar'],
  ['B0HPJBJW19', '61PTjmvDfOL', '3D Basset Hound Dog Coffee Mug'],
  ['B0HPC6X49W', '713v0xTiihL', 'Vintage Santa Metal Sign'],
  ['B0HPJF6957', '610JzEWTRjL', 'Cute Bunny Coffee Mug with Lid'],
];

const EVERYDAY = [
  ['B0HSJHBXSP', '51NtJSgfksL', 'I Am Jane Doe T-Shirt: Unisex Survivor Support Awareness Tee'],
  ['B0HSN45P6M', '31E-YlpIUVS', 'Expandable Gym Bag for Women'],
  ['B0HSKHL3J9', '61hre+z3JSL', "Men's Black Leather Moto Jacket with Stand-up Collar"],
  ['B0HSKHZX5L', '411DHAoqU9L', 'Evil Eye Sun Ray Gold Stainless Steel Adjustable Ring'],
  ['B0HSR4D2LZ', '61f46beW0FL', '6 Piece Forged Stainless Steel Kitchen Knife Set with Scissors'],
  ['B0HSKSMRQG', '6127+D0i+oL', "Women's Bell Sleeve Striped Knit Sweater"],
  ['B0HSJKTWXZ', '51kCSb0pcBL', 'Convertible Travel Duffle Bag, PU Leather'],
  ['B0HSFQ7Z52', '416mdk+jcDL', 'Rainbow Crystal Pendant Necklace for Women'],
  ['B0HSK9T2YJ', '61uKPXzctHL', "Women's Casual Loose Hoodie Sweatshirt with Pocket"],
  ['B0HSJ51T56', '41K8YfRUVcL', 'Roll-Top Backpack, Waterproof Nylon, Gray'],
  ['B0HSR8DJXH', '51N++VLIDhL', 'Christmas Advent Calendar Charm Bracelet Making Kit, 24 Pieces'],
  ['B0HSH8MF22', '51LKy2a05GL', 'Plaid Tartan Winter Scarf with Fringe'],
  ['B0HSH3BP4P', '61vuWIte02L', 'Women PU Leather Pleated Cloud Crossbody Bag'],
  ['B0HPJXZGT6', '61LimNJMRtL', 'Home Metal Wall Sign'],
  ['B0HSKLXDW4', '51mAcFtWrUL', "Women's Solid Color Button Front Knit Cardigan Sweater"],
  ['B0HSHZ923K', '51f0AJ6DQQL', 'Large Travel Backpack for Women with USB Port'],
  ['B0HPHT2SNN', '41X+PdtROKL', 'Oversized Blanket Scarf for Women and Men'],
  ['B0HSKMWRC6', '511vl8w4J9L', 'Unisex Black Knitted Touch Screen Winter Gloves'],
  ['B0HPD6VB25', '61h+qFXqFeL', 'Travel Toiletry Bag'],
  ['B0HSHSDB31', '61HzOGV6urL', 'Winter Knit Balaclava Hat and Scarf with Pom Pom'],
  ['B0HSFGPTJB', '51ON+c-kMZL', 'Tree of Life Pendant Necklace'],
];

const toItem = (holiday) => ([asin, img, name]) => ({ asin, name, holiday, image: `https://m.media-amazon.com/images/I/${img}._AC_SL500_.jpg`, url: `https://www.amazon.com/dp/${asin}?tag=${AMAZON_TAG}` });

// Holiday gifts lead, then the T-shirt and everyday picks; the advent kit counts as a gift.
export const LOVE_CARE_PRODUCTS = [
  ...LOVE_CARE_HOLIDAY.map(toItem(true)),
  ...EVERYDAY.map((r) => toItem(r[0] === 'B0HSR8DJXH')(r)),
];

export function loveCareCarousel(items = LOVE_CARE_PRODUCTS) {
  if (!items.length) return '';
  const card = (p) => `<a class="lc-card" href="${esc(p.url)}" target="_blank" rel="sponsored noopener" aria-label="${esc(`${p.name} on Amazon (opens in a new tab)`)}">
      <span class="lc-frame">${p.holiday ? '<span class="lc-badge">Holiday gift</span>' : ''}<img src="${esc(p.image)}" alt="${esc(p.name)}" width="220" height="220" loading="lazy" decoding="async"></span>
      <span class="lc-name">${esc(p.name)}</span>
      <span class="lc-cta">View on Amazon <span aria-hidden="true">→</span></span>
    </a>`;
  return `<section class="lc-store wrap" aria-labelledby="lc-h">
    <header class="lc-head">
      <div>
        <p class="lc-kicker">Our store on Amazon · Holiday gifts inside</p>
        <h2 class="lc-title" id="lc-h">Shop Love and Care</h2>
      </div>
      <a class="lc-all" href="${esc(LOVE_CARE_STORE)}" target="_blank" rel="sponsored noopener">See all products <span aria-hidden="true">→</span></a>
    </header>
    <div class="lc-viewport" data-marquee="left">
      <div class="lc-track">${items.map(card).join('')}</div>
    </div>
    <p class="lc-note">Love and Care is an Amazon store run by Boston Daily’s publisher. As an Amazon Associate we earn from qualifying purchases. Prices and delivery are shown on Amazon. Hover or tap to pause the carousel. <a href="/standards#commercial">How we label commercial content</a></p>
  </section>`;
}
