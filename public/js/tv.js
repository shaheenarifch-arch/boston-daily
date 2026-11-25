// Boston Daily TV player. Loads the YouTube player only when the TV scrolls near view,
// plays a channel's sources' latest-uploads playlists in turn, and skips anything that won't play.
(function () {
  const root = document.querySelector('[data-bdtv]');
  const cfgEl = document.getElementById('bdtv-config');
  if (!root || !cfgEl) return;
  let channels;
  try { channels = JSON.parse(cfgEl.textContent); } catch (e) { return; }
  if (!channels.length) return;

  const $ = (sel) => root.querySelector(sel);
  const nowLink = $('[data-bdtv-now]');
  const srcEl = $('[data-bdtv-src]');
  const loading = $('[data-bdtv-loading]');
  const soundBtn = $('[data-bdtv-sound]');
  const nextBtn = $('[data-bdtv-next]');
  const chBtns = Array.from(root.querySelectorAll('[data-bdtv-ch]'));

  let player = null;
  let chIdx = 0;
  let srcIdx = 0;
  let muted = true;
  let errors = 0;
  let stallTimer = null;

  const uploads = (id) => 'UU' + id.slice(2);
  const source = () => channels[chIdx].sources[srcIdx % channels[chIdx].sources.length];

  function setNow(title, videoId) {
    const s = source();
    nowLink.textContent = title || 'The latest news';
    nowLink.href = videoId ? 'https://www.youtube.com/watch?v=' + encodeURIComponent(videoId) : 'https://www.youtube.com/channel/' + s.id;
    srcEl.textContent = '· ' + s.name;
  }

  // Switching playlists inside one player is unreliable (it can keep playing the old channel),
  // so each source change builds a fresh player. `gen` ignores events from the old one.
  let gen = 0;
  function play() {
    if (!window.YT || !window.YT.Player) return;
    clearTimeout(stallTimer);
    loading.hidden = false;
    setNow('', '');
    if (player) { try { player.destroy(); } catch (e) { /* already gone */ } player = null; }
    const screen = root.querySelector('.bdtv-screen');
    let slot = document.getElementById('bdtv-player');
    if (!slot) { slot = document.createElement('div'); slot.className = 'bdtv-player'; slot.id = 'bdtv-player'; screen.prepend(slot); }
    build();
  }

  function nextSource() {
    srcIdx += 1;
    if (srcIdx >= channels[chIdx].sources.length * 2) { // every source failed twice: try the next channel
      srcIdx = 0;
      chIdx = (chIdx + 1) % channels.length;
      markChannel();
    }
    play();
  }

  function markChannel() {
    chBtns.forEach((b, i) => b.setAttribute('aria-pressed', i === chIdx ? 'true' : 'false'));
  }

  function onState(e) {
    if (e.target !== player) return;
    if (e.data === 1) { // playing
      clearTimeout(stallTimer);
      errors = 0;
      loading.hidden = true;
      const d = player.getVideoData() || {};
      setNow(d.title, d.video_id);
      if (muted) player.mute(); else player.unMute();
    } else if (e.data === 0) { // ended: playlists advance by themselves; at the end move to the next source
      const list = player.getPlaylist() || [];
      if (player.getPlaylistIndex() >= list.length - 1) nextSource();
    }
  }

  function onError(e) {
    if (e && e.target !== player) return;
    errors += 1;
    if (errors > 3) { errors = 0; nextSource(); return; }
    try { player.nextVideo(); } catch (e) { nextSource(); }
  }

  function build() {
    const mine = ++gen;
    player = new window.YT.Player('bdtv-player', {
      host: 'https://www.youtube-nocookie.com',
      width: '100%',
      height: '100%',
      playerVars: { autoplay: 1, mute: 1, playsinline: 1, rel: 0, modestbranding: 1, listType: 'playlist', list: uploads(source().id) },
      events: {
        onReady: (e) => {
          if (mine !== gen) return;
          if (muted) e.target.mute(); else e.target.unMute();
          e.target.playVideo();
          // If nothing starts within 15 seconds, move to the next source.
          clearTimeout(stallTimer);
          stallTimer = setTimeout(nextSource, 15000);
        },
        onStateChange: onState,
        onError,
      },
    });
  }

  function loadApi() {
    if (window.YT && window.YT.Player) { build(); return; }
    const prev = window.onYouTubeIframeAPIReady;
    window.onYouTubeIframeAPIReady = function () { if (typeof prev === 'function') prev(); build(); };
    const s = document.createElement('script');
    s.src = 'https://www.youtube.com/iframe_api';
    s.async = true;
    document.head.appendChild(s);
  }

  soundBtn.addEventListener('click', () => {
    if (!player) return;
    muted = !muted;
    if (muted) { player.mute(); } else { player.unMute(); player.setVolume(70); player.playVideo(); }
    soundBtn.setAttribute('aria-pressed', muted ? 'false' : 'true');
    soundBtn.textContent = muted ? '🔊 Sound on' : '🔇 Sound off';
  });
  nextBtn.addEventListener('click', () => { if (player) { try { loading.hidden = false; player.nextVideo(); } catch (e) { nextSource(); } } });
  chBtns.forEach((b, i) => b.addEventListener('click', () => { chIdx = i; srcIdx = 0; markChannel(); play(); }));

  if ('IntersectionObserver' in window) {
    const io = new IntersectionObserver((entries) => {
      if (entries.some((en) => en.isIntersecting)) { io.disconnect(); loadApi(); }
    }, { rootMargin: '300px' });
    io.observe(root);
  } else {
    loadApi();
  }
})();
