// Printful print-on-demand card, shown once at the end of the front page (not on edition archives
// or other pages). Printful affiliate link from the publisher's Printful affiliate dashboard (Nov 2026).
// The photo is Printful's own "30% off your first order" creative (tote, mug, tee), sent by the publisher Nov 2026.
// The offer line repeats Printful's own wording; Printful sets the offer and can change it.
export const PRINTFUL_LINK = 'https://www.printful.com/a/getservices';

export function printfulCard() {
  return `<section class="pf-card" aria-labelledby="pf-h">
    <a class="pf-photo" href="${PRINTFUL_LINK}" target="_blank" rel="sponsored noopener" tabindex="-1" aria-hidden="true"><img src="/img/printful-30-off-products.webp" alt="" width="800" height="735" loading="lazy" decoding="async"></a>
    <div class="pf-copy">
      <p class="pf-kicker">Partner offer · Printful</p>
      <h2 class="pf-title" id="pf-h">Start your own merch brand</h2>
      <p class="pf-text">Have a design, a team or a Boston idea people would wear? Printful prints and ships t-shirts, mugs, tote bags and more only after a customer orders, so there’s no upfront inventory or monthly fee. It connects to popular ecommerce platforms and marketplaces.</p>
      <p class="pf-offer"><strong>Printful’s welcome offer:</strong> sign up free and get 30% off a sample order placed within your first 24 hours. Printful says this discount is for ecommerce sellers only.</p>
      <a class="pf-cta" href="${PRINTFUL_LINK}" target="_blank" rel="sponsored noopener">Start free with Printful <span aria-hidden="true">→</span></a>
      <p class="pf-note">This opens Printful’s own site. It’s an affiliate link, so we may earn a commission at no extra cost to you. Printful sets the offer and can change it, so check the terms on its site. <a href="/standards#commercial">How we label commercial content</a></p>
    </div>
  </section>`;
}

// Compact Printful ad for the right rail (1st Amendment Page), under the guest-post box.
// Photo is Printful's own "30% off your first order" creative (sent by the publisher, Nov 2026).
export function printfulRailAd() {
  return `<div class="module pf-rail" aria-label="Partner offer from Printful">
    <p class="pf-kicker">Partner offer · Printful</p>
    <a class="pf-rail-photo" href="${PRINTFUL_LINK}" target="_blank" rel="sponsored noopener" tabindex="-1" aria-hidden="true"><img src="/img/printful-30-off-products.webp" alt="" width="800" height="735" loading="lazy" decoding="async"></a>
    <p class="pf-rail-title">30% off your first order</p>
    <p class="pf-rail-text">Sign up free and get 30% off a sample order placed within your first 24 hours. Printful says this discount is for ecommerce sellers only.</p>
    <a class="pf-cta" href="${PRINTFUL_LINK}" target="_blank" rel="sponsored noopener">Get 30% off <span aria-hidden="true">→</span></a>
    <p class="pf-note">Affiliate link: we may earn a commission at no extra cost to you. Printful sets the offer and can change it. <a href="/standards#commercial">How we label commercial content</a></p>
  </div>`;
}
