import { esc } from '../util.js';

// Flower of Heaven carousel on the Garden page: products from flowerofheaven.store (a GetServices.ai
// network shop), linked straight to each product page. Real product photos only. To change the list,
// edit FLOWER_PRODUCTS below to match flowerofheaven.store/shop/.
const SITE = 'https://flowerofheaven.store';
const UTM = 'utm_source=bostondaily&utm_medium=carousel&utm_campaign=garden';
const FLOWER_PRODUCTS = [
  { name: 'Set of 4 Botanical Canvas Wall Art Prints', price: '$32.99', path: '/shop/botanical-canvas-wall-art/', image: 'https://m.media-amazon.com/images/I/61i6lNsIgqL._AC_SL500_.jpg' },
  { name: 'Handmade Willow Wicker Planter Basket', price: '$29.99', path: '/shop/willow-wicker-planter-basket/', image: 'https://m.media-amazon.com/images/I/61ofK2%2Bas%2BL._AC_SL500_.jpg' },
  { name: 'Metal Leaf Wall Art, 2 Pack', price: '$25.99', path: '/shop/metal-leaf-wall-art/', image: 'https://m.media-amazon.com/images/I/61xLTj5OzJL._AC_SL500_.jpg' },
  { name: 'Christmas Teardrop Swag with Red Bow', price: '$29.99', path: '/shop/christmas-teardrop-swag/', image: 'https://m.media-amazon.com/images/I/71EnwqyICkL._AC_SL500_.jpg' },
];
// Bouquet delivery ad (flowerofheaven.store/flowers/, delivered through Florist One). Photo is the one the shop itself uses.
const BOUQUET_IMAGE = 'https://images.unsplash.com/photo-1523693916903-027d144a2b7d?w=800&q=80&auto=format&fit=crop';
const withUtm = (path) => `${SITE}${path}?${UTM}`;

export function flowerCarousel(slug) {
  if (slug !== 'garden' || !FLOWER_PRODUCTS.length) return '';
  return `<section class="flower-carousel" aria-label="Shop Flower of Heaven">
    <header class="fc-head">
      <h2 class="fc-title"><a href="${esc(withUtm('/'))}" rel="sponsored noopener" target="_blank">Flower of Heaven</a></h2>
      <span class="label label-ad">Sponsored</span>
      <span class="fc-arrows"><button type="button" class="fc-btn" data-dir="-1" aria-label="Previous products">‹</button><button type="button" class="fc-btn" data-dir="1" aria-label="Next products">›</button></span>
    </header>
    <p class="fc-sub">Botanical decor, planters and seasonal florals.</p>
    <a class="fc-ad" href="${esc(withUtm('/flowers/'))}" rel="sponsored noopener" target="_blank">
      <span class="fc-ad-img"><img src="${esc(BOUQUET_IMAGE)}" alt="Hand-tied bouquet of pink roses wrapped in cream paper" loading="lazy" decoding="async"></span>
      <span class="fc-ad-body"><span class="fc-ad-kicker">Fresh flower delivery</span>
        <span class="fc-ad-title">Send a bouquet, hand-delivered by a local florist</span>
        <span class="fc-ad-desc">Birthdays, anniversaries, thank-yous and more. Check the recipient's ZIP code to see if delivery is available. US addresses only.</span>
        <span class="fc-ad-cta">Send flowers →</span></span>
    </a>
    <ul class="fc-track" tabindex="0">${FLOWER_PRODUCTS.map((p) => `<li class="fc-item"><a class="fc-card" href="${esc(withUtm(p.path))}" rel="sponsored noopener" target="_blank">
      <span class="fc-img"><img src="${esc(p.image)}" alt="${esc(p.name)}" loading="lazy" decoding="async"></span>
      <span class="fc-name">${esc(p.name)}</span>
      <span class="fc-price">${esc(p.price)}</span>
      <span class="fc-cta">View product →</span>
    </a></li>`).join('')}</ul>
    <p class="fc-more"><a href="${esc(withUtm('/shop/'))}" rel="sponsored noopener" target="_blank">Visit Flower of Heaven: shop all →</a></p>
    <p class="sp-note">A shop in the GetServices.ai network, which also publishes Boston Daily. <a href="/standards">How we label advertising</a></p>
    <script src="/js/carousel.js?v=1" defer></script>
  </section>`;
}

// Compact flower-delivery ad for right rails: the 1st Amendment Page (under the Printful card) and
// the front page (under the email sign-up), where the rail had blank space (Nov 2026).
// Links go to flowerofheaven.store/flowers/ (Florist One local-florist delivery). The photo is
// Florist One's own product photo of "The Red Rose Bouquet" (code E2-4305), the same image the shop shows.
// Florist One sets the price; if it changes, update RED_ROSES.price.
const RED_ROSES = { code: 'E2-4305', name: 'The Red Rose Bouquet', price: '$99.95', image: 'https://cdn.floristone.com/large/E2-4305_d1.jpg' };

export function flowerDeliveryRailAd(campaign = 'rail') {
  const utm = `utm_source=bostondaily&utm_medium=rail&utm_campaign=${encodeURIComponent(campaign)}`;
  const roses = `${SITE}/flowers/checkout/?code=${RED_ROSES.code}&${utm}`;
  const all = `${SITE}/flowers/?${utm}`;
  return `<div class="module fd-rail" aria-label="Sponsored: flower delivery from Flower of Heaven">
    <p class="fd-kicker">Sponsored · Flower of Heaven</p>
    <div class="fd-row">
      <a class="fd-photo" href="${esc(roses)}" target="_blank" rel="sponsored noopener" tabindex="-1" aria-hidden="true"><img src="${esc(RED_ROSES.image)}" alt="" loading="lazy" decoding="async"></a>
      <div><p class="fd-title">Flower &amp; bouquet delivery across the US</p>
        <p class="fd-text">${esc(RED_ROSES.name.replace(/^The /, ''))}, ${esc(RED_ROSES.price)}. Hand-delivered by a local florist.</p></div>
    </div>
    <div class="fd-ctas">
      <a class="pf-cta fd-cta" href="${esc(roses)}" target="_blank" rel="sponsored noopener">Send red roses <span aria-hidden="true">→</span></a>
      <a class="fd-more" href="${esc(all)}" target="_blank" rel="sponsored noopener">All bouquets <span aria-hidden="true">→</span></a>
    </div>
    <p class="pf-note">Check the recipient’s ZIP code for delivery. A GetServices.ai network shop. <a href="/standards#commercial">How we label ads</a></p>
  </div>`;
}
