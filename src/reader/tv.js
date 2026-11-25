// Boston Daily TV: a TV-style player on the front page that plays the latest news clips
// from official news channels on YouTube, one after another, muted until the reader taps for sound.
// Each channel button rotates through its sources' "uploads" playlists. Nothing is hosted here:
// the clips stay on YouTube (embedding is allowed by each channel), so it costs nothing to run.
// Checked Nov 24, 2026: all eight sources below played muted inside a player on bostondaily.us.
import { esc } from '../util.js';

export const TV_CHANNELS = [
  { key: 'boston', label: 'Boston', sources: [
    { name: 'NBC10 Boston', id: 'UCTaVAYaqEV3k6ZxIAP77-jQ' },
    { name: 'WCVB Channel 5', id: 'UC72UssJ1DNQcakZXm-B2-zw' },
    { name: 'CBS Boston', id: 'UCi4fcBVyo4CAnmdgXeO-NvA' },
  ] },
  { key: 'us', label: 'US', sources: [
    { name: 'NBC News', id: 'UCeY0bbntWzzVIaj2z3QigXg' },
    { name: 'ABC News', id: 'UCBi2mrWuNuyYy4gbM6fU18Q' },
    { name: 'CBS News', id: 'UC8p1vwvWtl6T73JiExfWs1g' },
  ] },
  { key: 'world', label: 'World', sources: [
    { name: 'Sky News', id: 'UCoMdktPbSTixAyNGwb-UYkQ' },
  ] },
  { key: 'business', label: 'Business', sources: [
    { name: 'Bloomberg Television', id: 'UCIALMKvObZNtJ6AmdCLP7Lg' },
  ] },
];

export function tvModule(channels = TV_CHANNELS) {
  const config = JSON.stringify(channels).replace(/</g, '\\u003c');
  return `<section class="bdtv" aria-labelledby="bdtv-h" data-bdtv>
    <header class="bdtv-head">
      <h2 class="bdtv-title" id="bdtv-h"><span class="bdtv-onair"><span class="bdtv-dot" aria-hidden="true"></span>On air</span> Live Boston TV</h2>
      <p class="bdtv-help">Latest news clips, playing one after another. Starts muted: tap <strong>Sound on</strong> to listen.</p>
    </header>
    <div class="bdtv-set">
      <div class="bdtv-screen">
        <div class="bdtv-player" id="bdtv-player"></div>
        <p class="bdtv-loading" data-bdtv-loading>Tuning in…</p>
      </div>
      <div class="bdtv-bar">
        <p class="bdtv-now" aria-live="polite"><span class="bdtv-now-label">Now playing</span> <a data-bdtv-now href="https://www.youtube.com/" target="_blank" rel="noopener">Loading the latest news</a> <span class="bdtv-src" data-bdtv-src></span></p>
        <div class="bdtv-controls">
          <button type="button" class="bdtv-btn" data-bdtv-sound aria-pressed="false">🔊 Sound on</button>
          <button type="button" class="bdtv-btn" data-bdtv-next>Next clip ⏭</button>
        </div>
      </div>
    </div>
    <nav class="bdtv-channels" aria-label="TV channels">${channels.map((c, i) => `<button type="button" class="bdtv-ch" data-bdtv-ch="${esc(c.key)}" aria-pressed="${i === 0 ? 'true' : 'false'}">${esc(c.label)}</button>`).join('')}</nav>
    <script type="application/json" id="bdtv-config">${config}</script>
    <script src="/js/tv.js?v=3" defer></script>
  </section>`;
}

/** One line for the site footer naming the TV's sources (the note lives there, not under the screen). */
export function tvFooterNote(channels = TV_CHANNELS) {
  return `<p>Live Boston TV plays clips from official news channels on YouTube (${channels.flatMap((c) => c.sources.map((x) => esc(x.name))).join(', ')}). Boston Daily does not produce or edit them. <a href="https://www.youtube.com/t/terms" target="_blank" rel="noopener">YouTube terms</a>.</p>`;
}
