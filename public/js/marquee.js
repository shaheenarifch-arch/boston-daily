// Slow, endless motion for the front-page store carousels.
// Love and Care drifts left; the Chambelli picks (a widget in its own shadow DOM) drift right.
// Pauses on hover, keyboard focus or touch, and in background tabs. Readers who ask their
// system for reduced motion get still carousels they can scroll by hand.
(function () {
  if (window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  const SPEED = 28; // pixels per second: slow enough to read

  function drift(track, hoverRoot, dir) {
    if (!track || track.dataset.marquee === 'on') return;
    const kids = Array.from(track.children);
    if (kids.length < 2) return;
    track.dataset.marquee = 'on';
    // Duplicate the cards once so the loop has no visible jump.
    kids.forEach((k) => { const c = k.cloneNode(true); c.setAttribute('aria-hidden', 'true'); c.setAttribute('tabindex', '-1'); c.querySelectorAll('a,button').forEach((a) => a.setAttribute('tabindex', '-1')); track.appendChild(c); });
    track.style.scrollSnapType = 'none';
    track.style.scrollBehavior = 'auto';
    let paused = false;
    let pos = 0;
    let last = 0;
    const half = () => track.scrollWidth / 2;
    if (dir === 'right') { pos = half(); track.scrollLeft = pos; }
    const stop = () => { paused = true; };
    const go = () => { paused = false; pos = track.scrollLeft; last = 0; };
    hoverRoot.addEventListener('mouseenter', stop);
    hoverRoot.addEventListener('mouseleave', go);
    hoverRoot.addEventListener('focusin', stop);
    hoverRoot.addEventListener('focusout', go);
    hoverRoot.addEventListener('touchstart', stop, { passive: true });
    hoverRoot.addEventListener('touchend', () => setTimeout(go, 2500), { passive: true });
    function step(t) {
      if (!paused && document.visibilityState === 'visible' && last) {
        const h = half();
        pos += (dir === 'right' ? -1 : 1) * SPEED * Math.min(t - last, 64) / 1000;
        if (pos >= h) pos -= h;
        if (pos <= 0) pos += h;
        track.scrollLeft = pos;
      }
      last = t;
      requestAnimationFrame(step);
    }
    requestAnimationFrame(step);
  }

  // Love and Care (ours, in the page).
  document.querySelectorAll('[data-marquee]').forEach((vp) => drift(vp.querySelector('.lc-track') || vp, vp, vp.getAttribute('data-marquee') === 'right' ? 'right' : 'left'));

  // Chambelli picks: wait for the widget to draw its cards, then drift the other way.
  let tries = 0;
  const timer = setInterval(() => {
    tries += 1;
    const host = document.querySelector('.chambelli-carousel');
    const track = host && host.shadowRoot && host.shadowRoot.querySelector('.track');
    if (track && track.children.length > 1) { clearInterval(timer); drift(track, host, 'right'); }
    else if (tries > 40) clearInterval(timer); // ~20 seconds, then leave it still
  }, 500);
})();
