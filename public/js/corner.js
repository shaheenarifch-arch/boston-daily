// Boston Speakers' Corner: the open podium on the 1st Amendment Page (server side: src/corner.js).
(() => {
  const root = document.getElementById('corner');
  if (!root) return;
  const $ = (sel, el = root) => el.querySelector(sel);
  const MAX_REC = 180; // seconds
  const MAX_BYTES = 8 * 1024 * 1024;
  const store = {
    get(k, d) { try { const v = localStorage.getItem(k); return v ? JSON.parse(v) : d; } catch { return d; } },
    set(k, v) { try { localStorage.setItem(k, JSON.stringify(v)); } catch { /* private mode */ } },
  };
  let vid = store.get('sc-vid', '');
  if (!vid) { vid = (crypto.randomUUID ? crypto.randomUUID() : String(Math.random()).slice(2) + Date.now()).replace(/[^A-Za-z0-9-]/g, ''); store.set('sc-vid', vid); }
  const stood = new Set(store.get('sc-stood', []));
  const keys = store.get('sc-keys', {});
  const REASONS = JSON.parse(root.dataset.reasons || '[]');

  // ───────── helpers ─────────
  const h = (tag, attrs = {}, ...kids) => {
    const el = document.createElement(tag);
    for (const [k, v] of Object.entries(attrs)) {
      if (v === null || v === undefined || v === false) continue;
      if (k === 'class') el.className = v;
      else if (k === 'text') el.textContent = v;
      else if (k.startsWith('on')) el.addEventListener(k.slice(2), v);
      else el.setAttribute(k, v === true ? '' : v);
    }
    for (const kid of kids.flat()) if (kid !== null && kid !== undefined && kid !== false) el.append(kid.nodeType ? kid : document.createTextNode(String(kid)));
    return el;
  };
  const ago = (iso) => {
    const s = Math.max(0, (Date.now() - new Date(iso).getTime()) / 1000);
    if (s < 90) return 'just now';
    if (s < 3600) return Math.round(s / 60) + ' min ago';
    if (s < 86400) return Math.round(s / 3600) + ' hr ago';
    return new Intl.DateTimeFormat('en-US', { month: 'short', day: 'numeric' }).format(new Date(iso));
  };
  const timeEl = (iso) => h('time', { datetime: iso, 'data-ago': '' }, ago(iso));
  const clock = (s) => `${Math.floor(s / 60)}:${String(Math.floor(s % 60)).padStart(2, '0')}`;
  const initials = (name) => (name || 'A').split(/\s+/).filter(Boolean).slice(0, 2).map((w) => w[0]).join('').toUpperCase() || 'A';
  const hue = (s) => { let n = 0; for (const c of String(s)) n = (n * 31 + c.charCodeAt(0)) % 6; return n; };
  // Plain text with clickable links (rel=ugc), never raw HTML.
  const richText = (text) => {
    const p = h('p', { class: 'sc-text' });
    String(text).split(/(https?:\/\/[^\s<>"]+)/g).forEach((part, i) => {
      if (i % 2) p.append(h('a', { href: part, target: '_blank', rel: 'nofollow ugc noopener' }, part.length > 60 ? part.slice(0, 57) + '…' : part));
      else p.append(part);
    });
    return p;
  };
  const toast = (msg, bad = false) => {
    const t = document.getElementById('site-toast');
    if (!t) return;
    t.textContent = msg;
    t.className = 'site-toast ' + (bad ? 'site-toast-err' : 'site-toast-ok');
    t.hidden = false;
    clearTimeout(toast.timer);
    toast.timer = setTimeout(() => { t.hidden = true; }, 6000);
  };
  const api = async (path, opts = {}) => {
    const res = await fetch(path, opts);
    let data = null;
    try { data = await res.json(); } catch { /* not JSON */ }
    if (!res.ok || !data || data.ok === false) {
      const err = new Error((data && data.error) || 'Something went wrong. Please try again.');
      err.field = data && data.field;
      throw err;
    }
    return data;
  };
  const postJson = (path, body) => api(path, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify(body) });
  const ytId = (input) => {
    const raw = String(input || '').trim();
    if (/^[A-Za-z0-9_-]{11}$/.test(raw)) return raw;
    let u; try { u = new URL(/^https?:\/\//i.test(raw) ? raw : 'https://' + raw); } catch { return null; }
    const host = u.hostname.toLowerCase().replace(/^(www|m|music)\./, '');
    let id = null;
    if (host === 'youtu.be') id = u.pathname.split('/')[1];
    else if (host === 'youtube.com' || host === 'youtube-nocookie.com') id = u.pathname === '/watch' ? u.searchParams.get('v') : (u.pathname.match(/^\/(?:shorts|embed|live|v)\/([^/?#]+)/) || [])[1];
    return id && /^[A-Za-z0-9_-]{11}$/.test(id) ? id : null;
  };

  // ───────── composer ─────────
  const form = $('#sc-form');
  const tabs = [...form.querySelectorAll('[role=tab]')];
  const body = $('#sc-body');
  const err = $('#sc-error');
  const submit = $('#sc-submit');
  const recBtn = $('#sc-rec');
  const recLabel = $('[data-rec-label]');
  const recTime = $('#sc-rec-time');
  const preview = $('#sc-preview');
  const fileIn = $('#sc-file');
  const yt = $('#sc-yt');
  const ytPrev = $('#sc-yt-preview');
  const HELP = {
    voice: 'Tap Start recording and speak for up to 3 minutes. Listen back before you post. Your browser will ask to use the microphone: choose Allow.',
    text: 'Write anything from one line to a full letter. Line breaks are kept; links are clickable.',
    video: 'Paste a link to a YouTube video, yours or one you want Boston to see. Add a few words about why it matters.',
    song: 'Sing, rap or read a poem: record up to 3 minutes here, or upload an audio file (MP3, M4A, WAV, OGG, up to 8 MB).',
  };
  const BODY_LABEL = { voice: 'Caption (optional)', text: 'Your words', video: 'Why it matters (optional)', song: 'Title or caption (optional)' };
  let kind = 'text';
  let openedAt = 0;
  let audioBlob = null;
  let audioDuration = 0;
  let recorder = null;
  let recTimer = null;

  const showErr = (msg, field) => {
    err.textContent = msg;
    err.hidden = !msg;
    form.querySelectorAll('[aria-invalid]').forEach((el) => el.removeAttribute('aria-invalid'));
    const target = { body, name: $('#sc-name'), town: $('#sc-town'), youtube: yt, audio: kind === 'song' && !audioBlob ? fileIn : recBtn }[field];
    if (target) { target.setAttribute('aria-invalid', 'true'); target.focus(); }
  };

  function setKind(k) {
    kind = k;
    tabs.forEach((t) => { const on = t.dataset.kind === k; t.setAttribute('aria-selected', String(on)); t.classList.toggle('on', on); });
    form.querySelectorAll('[data-pane]').forEach((el) => { el.hidden = !el.dataset.pane.split(' ').includes(k); });
    $('[data-help]').textContent = HELP[k];
    $('[data-body-label]').textContent = BODY_LABEL[k];
    body.maxLength = k === 'text' ? 5000 : 500;
    body.rows = k === 'text' ? 5 : 2;
    body.placeholder = k === 'text' ? 'Say what you came to say.' : '';
    submit.textContent = { voice: 'Post my voice', text: 'Post to the podium', video: 'Share the video', song: 'Post my song' }[k];
    showErr('');
    count();
  }
  function open(k) {
    form.hidden = false;
    if (!openedAt) openedAt = Date.now();
    setKind(k);
    root.querySelector('#sc-composer').scrollIntoView({ behavior: 'smooth', block: 'start' });
    setTimeout(() => (k === 'text' ? body : k === 'video' ? yt : recBtn).focus({ preventScroll: true }), 300);
  }
  document.querySelectorAll('[data-open]').forEach((b) => b.addEventListener('click', () => open(b.dataset.open)));
  tabs.forEach((t) => t.addEventListener('click', () => setKind(t.dataset.kind)));
  $('#sc-cancel').addEventListener('click', () => { stopRec(true); form.hidden = true; });

  const count = () => {
    const n = body.value.length;
    $('#sc-count').textContent = n ? `${n.toLocaleString()} / ${body.maxLength.toLocaleString()}` : '';
    if (err.hidden === false && body.getAttribute('aria-invalid')) showErr('');
  };
  body.addEventListener('input', count);

  // Recording
  const pickMime = () => ['audio/webm;codecs=opus', 'audio/mp4', 'audio/ogg;codecs=opus', 'audio/webm', 'audio/aac']
    .find((m) => window.MediaRecorder && MediaRecorder.isTypeSupported && MediaRecorder.isTypeSupported(m)) || '';
  function setAudio(blob, secs) {
    audioBlob = blob;
    audioDuration = secs;
    if (preview.src) URL.revokeObjectURL(preview.src);
    if (blob) { preview.src = URL.createObjectURL(blob); preview.hidden = false; } else { preview.removeAttribute('src'); preview.hidden = true; }
  }
  function stopRec(discard = false) {
    clearInterval(recTimer);
    if (recorder && recorder.state !== 'inactive') { recorder.discard = discard; recorder.stop(); }
  }
  recBtn.addEventListener('click', async () => {
    if (recorder && recorder.state === 'recording') return stopRec();
    if (!navigator.mediaDevices || !window.MediaRecorder) {
      return showErr(kind === 'song' ? 'Your browser can’t record here. Use Upload a file instead.' : 'Your browser can’t record audio. Try Chrome, Edge, Firefox or Safari 14.1 or newer, or use Write.');
    }
    let stream;
    try { stream = await navigator.mediaDevices.getUserMedia({ audio: { echoCancellation: kind === 'voice', noiseSuppression: kind === 'voice' } }); } catch {
      return showErr('We couldn’t use your microphone. Allow microphone access for bostondaily.us in your browser settings (look for the lock or camera icon in the address bar), then try again.');
    }
    const mime = pickMime();
    const chunks = [];
    recorder = new MediaRecorder(stream, mime ? { mimeType: mime, audioBitsPerSecond: kind === 'song' ? 128000 : 48000 } : undefined);
    const started = Date.now();
    recorder.ondataavailable = (e) => { if (e.data && e.data.size) chunks.push(e.data); };
    recorder.onstop = () => {
      stream.getTracks().forEach((t) => t.stop());
      recBtn.classList.remove('recording');
      recLabel.textContent = 'Record again';
      if (recorder.discard) return;
      const secs = Math.round((Date.now() - started) / 1000);
      setAudio(new Blob(chunks, { type: recorder.mimeType || mime || 'audio/webm' }), secs);
      recTime.textContent = `${clock(secs)} recorded`;
      showErr('');
    };
    setAudio(null, 0);
    if (fileIn) fileIn.value = '';
    recorder.start(1000);
    recBtn.classList.add('recording');
    recLabel.textContent = 'Stop';
    recTimer = setInterval(() => {
      const s = (Date.now() - started) / 1000;
      recTime.textContent = `${clock(s)} / ${clock(MAX_REC)}`;
      if (s >= MAX_REC) stopRec();
    }, 250);
  });
  fileIn && fileIn.addEventListener('change', () => {
    const f = fileIn.files[0];
    if (!f) return;
    if (f.size > MAX_BYTES) { fileIn.value = ''; return showErr('That file is over 8 MB. Trim it or export a shorter or lower-quality version.', 'audio'); }
    if (f.type && !/^(audio|video)\//.test(f.type)) { fileIn.value = ''; return showErr('Choose an audio file (MP3, M4A, WAV, OGG or WEBM).', 'audio'); }
    stopRec(true);
    setAudio(f, 0);
    const probe = new Audio();
    probe.preload = 'metadata';
    probe.onloadedmetadata = () => { if (Number.isFinite(probe.duration)) { audioDuration = Math.round(probe.duration); recTime.textContent = `${clock(audioDuration)} file`; } };
    probe.src = preview.src;
    showErr('');
  });

  // YouTube preview
  yt.addEventListener('input', () => {
    const id = ytId(yt.value);
    ytPrev.replaceChildren();
    ytPrev.hidden = !id;
    if (id) ytPrev.append(h('img', { src: `https://i.ytimg.com/vi/${id}/hqdefault.jpg`, alt: 'Video preview', width: 480, height: 360, loading: 'lazy' }));
    if (id) showErr('');
  });

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    if (recorder && recorder.state === 'recording') return showErr('Stop the recording first.', 'audio');
    if (kind === 'text' && body.value.trim().length < 3) return showErr('Write a few words first.', 'body');
    if (kind === 'video' && !ytId(yt.value)) return showErr('Paste a YouTube link, like https://youtu.be/…', 'youtube');
    if ((kind === 'voice' || kind === 'song') && !audioBlob) return showErr(kind === 'voice' ? 'Record your voice first: tap Start recording.' : 'Record your song or choose a file first.', 'audio');
    const fd = new FormData(form);
    fd.set('kind', kind);
    fd.set('t', String(openedAt));
    fd.delete('youtube');
    if (kind === 'video') fd.set('youtube', yt.value.trim());
    if (audioBlob && (kind === 'voice' || kind === 'song')) {
      const ext = /mp4|m4a|aac/.test(audioBlob.type) ? 'm4a' : /ogg/.test(audioBlob.type) ? 'ogg' : /mpeg|mp3/.test(audioBlob.type) ? 'mp3' : /wav/.test(audioBlob.type) ? 'wav' : 'webm';
      fd.set('audio', audioBlob, audioBlob.name || `podium.${ext}`);
      fd.set('audio_type', audioBlob.type || '');
      fd.set('duration', String(audioDuration || 0));
    }
    submit.disabled = true;
    const label = submit.textContent;
    submit.textContent = audioBlob ? 'Uploading…' : 'Posting…';
    try {
      const data = await api('/api/corner/post', { method: 'POST', body: fd });
      if (data.post) {
        keys[data.post.id] = data.delete_key;
        store.set('sc-keys', keys);
        feedEl.querySelector('.sc-empty')?.remove();
        setPodium(data.post);
        newest = data.post.created_at > newest ? data.post.created_at : newest;
      }
      form.reset();
      setAudio(null, 0);
      recTime.textContent = `0:00 / ${clock(MAX_REC)}`;
      recLabel.textContent = 'Start recording';
      ytPrev.hidden = true;
      form.hidden = true;
      openedAt = 0;
      toast('You’re on the podium. Your post is live.');
      document.getElementById('sc-podium').scrollIntoView({ behavior: 'smooth', block: 'center' });
    } catch (ex) {
      showErr(ex.message, ex.field);
    } finally {
      submit.disabled = false;
      submit.textContent = label;
    }
  });

  // ───────── feed ─────────
  const feedEl = $('#sc-feed');
  const moreBtn = $('#sc-more');
  const newBtn = $('#sc-new');
  const sortSel = $('#sc-sort');
  const kindSel = $('#sc-kind');
  const tagSel = $('#sc-filter-tag');
  let next = null;
  let newest = '';
  let podiumId = null;
  const focusId = (location.hash.match(/^#v-([a-f0-9-]{36})$/) || [])[1] || null;
  const defaultView = () => sortSel.value === 'new' && !kindSel.value && !tagSel.value;

  function shareLinks(post) {
    const url = `${location.origin}/section/opinion#v-${post.id}`;
    const text = post.body ? post.body.slice(0, 120) : `${post.name} spoke at Boston Speakers’ Corner`;
    const menu = h('div', { class: 'sc-share-menu', role: 'menu' },
      h('a', { role: 'menuitem', href: `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`, target: '_blank', rel: 'noopener' }, 'Facebook'),
      h('a', { role: 'menuitem', href: `https://twitter.com/intent/tweet?url=${encodeURIComponent(url)}&text=${encodeURIComponent(text)}`, target: '_blank', rel: 'noopener' }, 'X (Twitter)'),
      h('a', { role: 'menuitem', href: `https://wa.me/?text=${encodeURIComponent(text + ' ' + url)}`, target: '_blank', rel: 'noopener' }, 'WhatsApp'),
      h('button', { type: 'button', role: 'menuitem', onclick: async () => {
        try { await navigator.clipboard.writeText(url); toast('Link copied.'); } catch { prompt('Copy this link:', url); }
        menu.hidden = true;
      } }, 'Copy link'));
    menu.hidden = true;
    return { url, text, menu };
  }

  function mediaFor(post) {
    if (post.kind === 'voice' || post.kind === 'song') {
      return h('div', { class: 'sc-audio' },
        h('span', { class: 'sc-audio-ico', 'aria-hidden': 'true' }, post.kind === 'song' ? '🎵' : '🎙️'),
        h('audio', { controls: true, preload: 'metadata', src: post.audio_url, 'aria-label': `${post.kind === 'song' ? 'Song' : 'Voice'} by ${post.name}` }),
        post.duration_s ? h('span', { class: 'sc-dur' }, clock(post.duration_s)) : null);
    }
    if (post.kind === 'video' && post.youtube_id) {
      const box = h('div', { class: 'sc-yt' });
      const play = h('button', { type: 'button', class: 'sc-yt-play', 'aria-label': 'Play video' },
        h('img', { src: `https://i.ytimg.com/vi/${post.youtube_id}/hqdefault.jpg`, alt: '', width: 480, height: 360, loading: 'lazy' }),
        h('span', { class: 'sc-yt-btn', 'aria-hidden': 'true' }, '▶'));
      play.addEventListener('click', () => {
        box.replaceChildren(h('iframe', { src: `https://www.youtube-nocookie.com/embed/${post.youtube_id}?autoplay=1&rel=0`, title: 'YouTube video', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: true, loading: 'lazy' }));
      });
      box.append(play);
      return box;
    }
    return null;
  }

  function replyEl(r) {
    return h('li', { class: 'sc-reply', 'data-reply': r.id },
      h('span', { class: `sc-avatar sc-avatar-sm sc-h${hue(r.name)}`, 'aria-hidden': 'true' }, initials(r.name)),
      h('div', { class: 'sc-bubble' }, h('strong', {}, r.name), ' ', richText(r.body), h('span', { class: 'sc-meta' }, timeEl(r.created_at))));
  }

  function postCard(post, { podium = false } = {}) {
    const card = h('article', { class: 'sc-card' + (podium ? ' sc-card-podium' : ''), id: podium ? null : `v-${post.id}`, 'data-id': post.id, 'data-kind': post.kind });
    const kindLabel = { voice: 'Voice', text: 'Writing', video: 'Video', song: 'Song' }[post.kind];
    card.append(h('header', { class: 'sc-card-head' },
      h('span', { class: `sc-avatar sc-h${hue(post.name)}`, 'aria-hidden': 'true' }, initials(post.name)),
      h('div', {},
        h('p', { class: 'sc-name' }, post.name, post.tag_label ? h('span', { class: 'sc-chip' }, post.tag_label) : null),
        h('p', { class: 'sc-meta' }, post.town ? `${post.town} · ` : '', timeEl(post.created_at), ` · ${kindLabel}`))));
    if (post.body) card.append(richText(post.body));
    const media = mediaFor(post);
    if (media) card.append(media);

    const standBtn = h('button', { type: 'button', class: 'sc-act sc-stand', 'aria-pressed': String(stood.has(post.id)) },
      h('span', { 'aria-hidden': 'true' }, '✊'), ' Stand with', h('span', { class: 'sc-n' }, post.stand_count ? ` · ${post.stand_count}` : ''));
    standBtn.addEventListener('click', async () => {
      standBtn.disabled = true;
      try {
        const d = await postJson(`/api/corner/${post.id}/stand`, { vid });
        d.standing ? stood.add(post.id) : stood.delete(post.id);
        store.set('sc-stood', [...stood].slice(-500));
        root.querySelectorAll(`[data-id="${post.id}"] .sc-stand`).forEach((b) => {
          b.setAttribute('aria-pressed', String(d.standing));
          b.querySelector('.sc-n').textContent = d.stand_count ? ` · ${d.stand_count}` : '';
        });
      } catch (ex) { toast(ex.message, true); } finally { standBtn.disabled = false; }
    });

    const replies = h('ul', { class: 'sc-replies' }, (post.replies || []).map(replyEl));
    const replyCount = h('span', { class: 'sc-n' }, post.reply_count ? ` · ${post.reply_count}` : '');
    const moreReplies = post.reply_count > (post.replies || []).length
      ? h('button', { type: 'button', class: 'sc-link', onclick: async (e) => {
        e.currentTarget.disabled = true;
        try { const d = await api(`/api/corner/${post.id}/replies`); replies.replaceChildren(...d.replies.map(replyEl)); e.currentTarget.remove(); } catch (ex) { toast(ex.message, true); e.currentTarget.disabled = false; }
      } }, `View all ${post.reply_count} comments`) : null;
    const rInput = h('textarea', { rows: 1, maxlength: 1500, placeholder: 'Write a comment…', 'aria-label': 'Write a comment' });
    const rName = h('input', { maxlength: 40, placeholder: 'Name (optional)', 'aria-label': 'Your name (optional)', value: store.get('sc-name', '') });
    const rErr = h('p', { class: 'sc-error', role: 'alert', hidden: true });
    const rForm = h('form', { class: 'sc-reply-form', hidden: true }, rName, rInput, h('button', { type: 'submit', class: 'sc-submit sc-submit-sm' }, 'Comment'), rErr);
    rForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      if (rInput.value.trim().length < 2) { rErr.textContent = 'Write a comment first.'; rErr.hidden = false; return rInput.focus(); }
      const b = rForm.querySelector('button');
      b.disabled = true;
      try {
        const d = await postJson(`/api/corner/${post.id}/reply`, { name: rName.value, body: rInput.value });
        store.set('sc-name', rName.value);
        if (d.reply) replies.append(replyEl(d.reply));
        post.reply_count += 1;
        replyCount.textContent = ` · ${post.reply_count}`;
        rInput.value = '';
        rErr.hidden = true;
      } catch (ex) { rErr.textContent = ex.message; rErr.hidden = false; } finally { b.disabled = false; }
    });
    rInput.addEventListener('input', () => { rErr.hidden = true; });
    const commentBtn = h('button', { type: 'button', class: 'sc-act', onclick: () => { rForm.hidden = !rForm.hidden; if (!rForm.hidden) rInput.focus(); } },
      h('span', { 'aria-hidden': 'true' }, '💬'), ' Comment', replyCount);

    const share = shareLinks(post);
    const shareBtn = h('button', { type: 'button', class: 'sc-act', 'aria-haspopup': 'menu', onclick: async () => {
      if (navigator.share && matchMedia('(pointer: coarse)').matches) {
        try { await navigator.share({ title: 'Boston Speakers’ Corner', text: share.text, url: share.url }); } catch { /* cancelled */ }
        return;
      }
      share.menu.hidden = !share.menu.hidden;
    } }, h('span', { 'aria-hidden': 'true' }, '↗'), ' Share');
    const reportBtn = h('button', { type: 'button', class: 'sc-act sc-act-quiet', onclick: () => openReport(post.id) }, h('span', { 'aria-hidden': 'true' }, '⚑'), ' Report');
    const del = keys[post.id] ? h('button', { type: 'button', class: 'sc-act sc-act-quiet', onclick: async () => {
      if (!confirm('Delete your post? This can’t be undone.')) return;
      try { await postJson(`/api/corner/${post.id}/delete`, { key: keys[post.id] }); root.querySelectorAll(`[data-id="${post.id}"]`).forEach((c) => c.remove()); toast('Your post was deleted.'); } catch (ex) { toast(ex.message, true); }
    } }, 'Delete') : null;

    card.append(...[h('div', { class: 'sc-actions-row' }, standBtn, commentBtn, h('span', { class: 'sc-share-wrap' }, shareBtn, share.menu), reportBtn, del), replies, moreReplies, rForm].filter(Boolean));
    return card;
  }

  function columnCard(c) {
    return h('article', { class: 'sc-card sc-card-column' },
      h('header', { class: 'sc-card-head' },
        h('span', { class: 'sc-avatar sc-avatar-editor', 'aria-hidden': 'true' }, 'BD'),
        h('div', {}, h('p', { class: 'sc-name' }, c.byline, h('span', { class: 'sc-chip sc-chip-editor' }, 'Column')), h('p', { class: 'sc-meta' }, timeEl(c.created_at), ' · Boston Daily'))),
      h('a', { class: 'sc-column-link', href: `/story/${c.slug}` },
        c.image ? h('img', { src: c.image, alt: '', loading: 'lazy', width: 640, height: 360 }) : null,
        h('strong', {}, c.headline), c.dek ? h('span', {}, c.dek) : null),
      c.image_credit ? h('p', { class: 'sc-credit' }, c.image_credit) : null);
  }

  function setPodium(post) {
    const box = $('#sc-podium');
    if (!post) { box.hidden = true; return; }
    // The previous podium speaker steps down into the feed.
    if (podiumId && podiumId !== post.id && prevPodium) feedEl.prepend(postCard(prevPodium));
    feedEl.querySelector(`#v-${CSS.escape(post.id)}`)?.remove();
    podiumId = post.id;
    prevPodium = post;
    $('#sc-podium-post').replaceChildren(postCard(post, { podium: true }));
    box.hidden = false;
  }
  let prevPodium = null;

  async function load(append = false) {
    const q = new URLSearchParams({ sort: sortSel.value });
    if (kindSel.value) q.set('kind', kindSel.value);
    if (tagSel.value) q.set('tag', tagSel.value);
    if (append && next) Object.entries(next).forEach(([k, v]) => q.set(k, v));
    if (!append && focusId) q.set('focus', focusId);
    moreBtn.disabled = true;
    try {
      const d = await api(`/api/corner/feed?${q}`);
      next = d.next;
      if (!append) {
        feedEl.replaceChildren();
        podiumId = null;
        prevPodium = null;
        const s = d.stats;
        $('#sc-stats').textContent = s.posts ? `${s.posts.toLocaleString()} ${s.posts === 1 ? 'voice' : 'voices'} from ${s.speakers.toLocaleString()} ${s.speakers === 1 ? 'speaker' : 'speakers'} · ${s.stands.toLocaleString()} stands of support` : '';
      }
      let items = d.items;
      if (!append) {
        const firstPost = items.find((i) => i.type === 'post');
        if (firstPost) newest = firstPost.created_at;
        if (defaultView() && firstPost && firstPost.id !== focusId) { setPodium(firstPost); items = items.filter((i) => i !== firstPost); } else setPodium(null);
      }
      for (const it of items) feedEl.append(it.type === 'column' ? columnCard(it) : postCard(it));
      if (!append && !feedEl.children.length && $('#sc-podium').hidden) {
        feedEl.append(h('div', { class: 'sc-empty' }, h('p', {}, h('strong', {}, 'The podium is empty. Be the first to speak.')), h('button', { type: 'button', class: 'sc-submit', onclick: () => open('voice') }, '🎙️ Speak now')));
      }
      moreBtn.hidden = !next;
      if (!append && focusId) {
        const el = document.getElementById(`v-${focusId}`);
        if (el) { el.classList.add('sc-focus'); setTimeout(() => el.scrollIntoView({ behavior: 'smooth', block: 'center' }), 200); }
      }
    } catch (ex) {
      if (!append) feedEl.replaceChildren(h('p', { class: 'sc-error' }, 'The feed didn’t load. ', h('button', { type: 'button', class: 'sc-link', onclick: () => load() }, 'Try again')));
      else toast(ex.message, true);
    } finally { moreBtn.disabled = false; }
  }
  moreBtn.addEventListener('click', () => load(true));
  [sortSel, kindSel, tagSel].forEach((s) => s.addEventListener('change', () => { stopCrowd(); load(); }));

  // New voices while you read: a quiet "N new" button instead of jumping the page.
  setInterval(async () => {
    if (document.hidden || !defaultView() || !newest) return;
    try {
      const d = await api('/api/corner/feed?sort=new');
      const fresh = d.items.filter((i) => i.type === 'post' && i.created_at > newest && !keys[i.id]);
      newBtn.hidden = !fresh.length;
      newBtn.textContent = `${fresh.length} new ${fresh.length === 1 ? 'voice' : 'voices'}: show`;
    } catch { /* try again next minute */ }
  }, 60000);
  newBtn.addEventListener('click', () => { newBtn.hidden = true; load(); });

  // ───────── listen to the crowd ─────────
  const listenBtn = $('#sc-listen');
  let crowd = null;
  function stopCrowd() {
    if (!crowd) return;
    crowd.audio && crowd.audio.pause();
    root.querySelectorAll('.sc-playing').forEach((c) => c.classList.remove('sc-playing'));
    crowd = null;
    listenBtn.setAttribute('aria-pressed', 'false');
    listenBtn.textContent = '🎧 Listen to the crowd';
  }
  function playNext() {
    if (!crowd) return;
    const list = [...root.querySelectorAll('.sc-card audio')];
    const i = crowd.audio ? list.indexOf(crowd.audio) + 1 : 0;
    root.querySelectorAll('.sc-playing').forEach((c) => c.classList.remove('sc-playing'));
    const a = list[i];
    if (!a) {
      if (next) { load(true).then(() => { if (crowd) playNext(); }); return; }
      toast('You’ve heard every voice on the podium.');
      return stopCrowd();
    }
    crowd.audio = a;
    const card = a.closest('.sc-card');
    card.classList.add('sc-playing');
    card.scrollIntoView({ behavior: 'smooth', block: 'center' });
    a.onended = playNext;
    a.play().catch(playNext);
  }
  listenBtn.addEventListener('click', () => {
    if (crowd) return stopCrowd();
    if (!root.querySelector('.sc-card audio')) return toast('No voices or songs to play yet. Be the first: tap Speak.');
    crowd = { audio: null };
    listenBtn.setAttribute('aria-pressed', 'true');
    listenBtn.textContent = '⏹ Stop listening';
    playNext();
  });
  // Browser recordings (WEBM) often carry no length, so players show 0:00 / ∞. Seeking to the end once makes the browser work it out.
  root.addEventListener('loadedmetadata', (e) => {
    const a = e.target;
    if (!(a instanceof HTMLAudioElement) || a.duration !== Infinity || a.dataset.fixed) return;
    a.dataset.fixed = '1';
    const back = () => { a.removeEventListener('timeupdate', back); a.currentTime = 0; };
    a.addEventListener('timeupdate', back);
    a.currentTime = 1e7;
  }, true);
  // Starting any player by hand stops the others.
  root.addEventListener('play', (e) => {
    root.querySelectorAll('audio').forEach((a) => { if (a !== e.target) a.pause(); });
    if (crowd && e.target !== crowd.audio) stopCrowd();
  }, true);

  // ───────── report dialog ─────────
  const dlg = $('#sc-report');
  const rForm = $('#sc-report-form');
  const rReasons = $('#sc-report-reasons');
  rReasons.append(...REASONS.map(([k, l]) => h('label', { class: 'sc-radio' }, h('input', { type: 'radio', name: 'reason', value: k }), ' ', l)));
  let reporting = null;
  function openReport(postId) {
    reporting = postId;
    rForm.reset();
    $('#sc-report-error').hidden = true;
    if (dlg.showModal) dlg.showModal(); else dlg.setAttribute('open', '');
  }
  rForm.addEventListener('submit', async (e) => {
    if (e.submitter && e.submitter.value === 'cancel') return;
    e.preventDefault();
    const reason = (rForm.querySelector('input[name=reason]:checked') || {}).value;
    const errEl = $('#sc-report-error');
    if (!reason) { errEl.textContent = 'Choose a reason.'; errEl.hidden = false; return; }
    try {
      const d = await postJson(`/api/corner/${reporting}/report`, { reason, note: $('#sc-report-note').value, vid });
      dlg.close ? dlg.close() : dlg.removeAttribute('open');
      if (d.hidden) root.querySelectorAll(`[data-id="${reporting}"]`).forEach((c) => c.remove());
      toast(d.already ? 'You already reported this post.' : 'Thank you. The editor will review it.');
    } catch (ex) { errEl.textContent = ex.message; errEl.hidden = false; }
  });

  // Close share menus when clicking elsewhere.
  document.addEventListener('click', (e) => {
    root.querySelectorAll('.sc-share-menu:not([hidden])').forEach((m) => { if (!m.parentElement.contains(e.target)) m.hidden = true; });
  });

  setKind('text');
  recTime.textContent = `0:00 / ${clock(MAX_REC)}`;

  // ───────── Podium | Events tabs ─────────
  const panels = { podium: $('#sc-panel-podium'), events: $('#sc-panel-events') };
  const tabBtns = [...root.querySelectorAll('[data-tab]')];
  let eventsLoaded = false;
  function showTab(name, { scroll = false } = {}) {
    tabBtns.forEach((b) => b.setAttribute('aria-selected', String(b.dataset.tab === name)));
    Object.entries(panels).forEach(([k, el]) => { el.hidden = k !== name; });
    if (name === 'events' && !eventsLoaded) { eventsLoaded = true; loadEvents(); }
    if (name === 'podium') stopCrowd();
    if (scroll) root.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }
  tabBtns.forEach((b) => b.addEventListener('click', () => {
    showTab(b.dataset.tab);
    history.replaceState(null, '', b.dataset.tab === 'events' ? '#events' : '#corner');
  }));
  document.querySelectorAll('[data-goto-events]').forEach((b) => b.addEventListener('click', () => showTab('events', { scroll: true })));
  // The hero's "Step up" buttons always open the podium.
  document.querySelectorAll('[data-open]').forEach((b) => b.addEventListener('click', () => showTab('podium')));

  // ───────── Events: assembly ─────────
  const EREASONS = JSON.parse(root.dataset.ereasons || '[]');
  const evList = $('#sc-events');
  const evForm = $('#sc-ev-form');
  const evErr = $('#sc-ev-error');
  const evStateSel = $('#sc-ev-state');
  const evKindSel = $('#sc-ev-kind');
  const evSeg = [...root.querySelectorAll('[data-when]')];
  const going = new Set(store.get('sc-going', []));
  const ekeys = store.get('sc-ekeys', {});
  const eFocus = (location.hash.match(/^#e-([a-f0-9-]{36})$/) || [])[1] || null;
  let evWhen = 'upcoming';
  let editing = null;
  evStateSel.value = store.get('sc-ev-state', 'MA');

  const zoned = (iso, tz, opts) => new Intl.DateTimeFormat('en-US', { timeZone: tz, ...opts }).format(new Date(iso));
  const tzShort = (iso, tz) => (new Intl.DateTimeFormat('en-US', { timeZone: tz, timeZoneName: 'short' }).formatToParts(new Date(iso)).find((p) => p.type === 'timeZoneName') || {}).value || '';
  const localParts = (iso, tz) => {
    const p = Object.fromEntries(new Intl.DateTimeFormat('en-CA', { timeZone: tz, hourCycle: 'h23', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' })
      .formatToParts(new Date(iso)).map((x) => [x.type, x.value]));
    return { date: `${p.year}-${p.month}-${p.day}`, time: `${p.hour}:${p.minute}` };
  };
  const whenText = (e) => {
    const day = zoned(e.starts_at, e.tz, { weekday: 'short', month: 'short', day: 'numeric' });
    const t = (iso) => zoned(iso, e.tz, { hour: 'numeric', minute: '2-digit' });
    return `${day} · ${t(e.starts_at)}${e.has_end ? `–${t(e.ends_at)}` : ''} ${tzShort(e.starts_at, e.tz)}`;
  };
  const isToday = (e) => localParts(e.starts_at, e.tz).date === localParts(new Date().toISOString(), e.tz).date;
  const gcalTime = (iso) => iso.replace(/[-:]/g, '').replace(/\.\d{3}/, '');
  const placeText = (e) => (e.online ? 'Online' : [e.venue, e.address, e.town, e.state].filter(Boolean).join(', '));

  function eventCard(e) {
    const card = h('article', { class: 'sc-card sc-ev', id: `e-${e.id}`, 'data-eid': e.id });
    const now = Date.now();
    const live = Date.parse(e.starts_at) <= now && Date.parse(e.ends_at) >= now;
    card.append(h('div', { class: 'sc-ev-top' },
      h('div', { class: 'sc-ev-date', 'aria-hidden': 'true' }, h('span', {}, zoned(e.starts_at, e.tz, { month: 'short' })), h('strong', {}, zoned(e.starts_at, e.tz, { day: 'numeric' }))),
      h('div', { class: 'sc-ev-main' },
        h('p', { class: 'sc-ev-kind' }, e.kind_label, live ? h('span', { class: 'sc-ev-live' }, 'Happening now') : null, e.tag_label ? h('span', { class: 'sc-chip' }, e.tag_label) : null),
        h('h4', { class: 'sc-ev-name' }, e.title),
        h('p', { class: 'sc-ev-when' }, '🕒 ', whenText(e)),
        h('p', { class: 'sc-ev-where' }, e.online ? '💻 Online' : '📍 ', e.online ? '' : placeText(e)),
        h('p', { class: 'sc-meta' }, `Organised by ${e.organizer}`))));
    if (e.body) card.append(richText(e.body));
    if (e.link) card.append(h('p', { class: 'sc-ev-linkline' }, h('a', { href: e.link, target: '_blank', rel: 'nofollow ugc noopener' }, 'Event page and sign-up ↗')));

    const goBtn = h('button', { type: 'button', class: 'sc-act sc-stand', 'aria-pressed': String(going.has(e.id)) },
      h('span', { 'aria-hidden': 'true' }, '🙋'), ' I’m going', h('span', { class: 'sc-n' }, e.going_count ? ` · ${e.going_count}` : ''));
    goBtn.addEventListener('click', async () => {
      goBtn.disabled = true;
      try {
        const d = await postJson(`/api/corner/events/${e.id}/going`, { vid });
        d.going ? going.add(e.id) : going.delete(e.id);
        store.set('sc-going', [...going].slice(-300));
        root.querySelectorAll(`[data-eid="${e.id}"] .sc-stand`).forEach((b) => { b.setAttribute('aria-pressed', String(d.going)); b.querySelector('.sc-n').textContent = d.going_count ? ` · ${d.going_count}` : ''; });
        if (d.going) toast('See you there. Add it to your calendar so you don’t miss it.');
      } catch (ex) { toast(ex.message, true); } finally { goBtn.disabled = false; }
    });
    const gcal = `https://calendar.google.com/calendar/render?action=TEMPLATE&text=${encodeURIComponent(e.title)}&dates=${gcalTime(e.starts_at)}/${gcalTime(e.ends_at)}&details=${encodeURIComponent(`${e.body ? e.body + '\n\n' : ''}Organised by ${e.organizer}. ${location.origin}/section/opinion#e-${e.id}`)}&location=${encodeURIComponent(e.online ? e.online_url : placeText(e))}`;
    const calMenu = h('div', { class: 'sc-share-menu', role: 'menu', hidden: true },
      h('a', { role: 'menuitem', href: gcal, target: '_blank', rel: 'noopener' }, 'Google Calendar'),
      h('a', { role: 'menuitem', href: `/api/corner/events/${e.id}/calendar.ics` }, 'Apple Calendar or Outlook (.ics)'));
    const calBtn = h('button', { type: 'button', class: 'sc-act', 'aria-haspopup': 'menu', onclick: () => { calMenu.hidden = !calMenu.hidden; } }, h('span', { 'aria-hidden': 'true' }, '📅'), ' Add to calendar');
    const whereBtn = e.online
      ? (e.online_url ? h('a', { class: 'sc-act', href: e.online_url, target: '_blank', rel: 'nofollow ugc noopener' }, h('span', { 'aria-hidden': 'true' }, '💻'), ' Join link') : null)
      : h('a', { class: 'sc-act', href: `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(placeText(e))}`, target: '_blank', rel: 'noopener' }, h('span', { 'aria-hidden': 'true' }, '🧭'), ' Directions');
    const url = `${location.origin}/section/opinion#e-${e.id}`;
    const text = `${e.title}: ${whenText(e)}, ${placeText(e)}`;
    const shareMenu = h('div', { class: 'sc-share-menu', role: 'menu', hidden: true },
      h('a', { role: 'menuitem', href: `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`, target: '_blank', rel: 'noopener' }, 'Facebook'),
      h('a', { role: 'menuitem', href: `https://twitter.com/intent/tweet?url=${encodeURIComponent(url)}&text=${encodeURIComponent(text)}`, target: '_blank', rel: 'noopener' }, 'X (Twitter)'),
      h('a', { role: 'menuitem', href: `https://wa.me/?text=${encodeURIComponent(text + ' ' + url)}`, target: '_blank', rel: 'noopener' }, 'WhatsApp'),
      h('button', { type: 'button', role: 'menuitem', onclick: async () => { try { await navigator.clipboard.writeText(url); toast('Link copied.'); } catch { prompt('Copy this link:', url); } shareMenu.hidden = true; } }, 'Copy link'));
    const shareBtn = h('button', { type: 'button', class: 'sc-act', 'aria-haspopup': 'menu', onclick: async () => {
      if (navigator.share && matchMedia('(pointer: coarse)').matches) { try { await navigator.share({ title: e.title, text, url }); } catch { /* cancelled */ } return; }
      shareMenu.hidden = !shareMenu.hidden;
    } }, h('span', { 'aria-hidden': 'true' }, '↗'), ' Share');
    const reportBtn = h('button', { type: 'button', class: 'sc-act sc-act-quiet', onclick: () => openEReport(e.id) }, h('span', { 'aria-hidden': 'true' }, '⚑'), ' Report');
    const own = ekeys[e.id];
    const editBtn = own ? h('button', { type: 'button', class: 'sc-act sc-act-quiet', onclick: () => openEventForm(e) }, 'Edit') : null;
    const delBtn = own ? h('button', { type: 'button', class: 'sc-act sc-act-quiet', onclick: async () => {
      if (!confirm('Delete this event from the board? This can’t be undone.')) return;
      try { await postJson(`/api/corner/events/${e.id}/delete`, { key: own }); root.querySelectorAll(`[data-eid="${e.id}"]`).forEach((c) => c.remove()); toast('Event deleted.'); refreshEventExtras(); } catch (ex) { toast(ex.message, true); }
    } }, 'Delete') : null;
    card.append(h('div', { class: 'sc-actions-row' }, goBtn, h('span', { class: 'sc-share-wrap' }, calBtn, calMenu), whereBtn, h('span', { class: 'sc-share-wrap' }, shareBtn, shareMenu), reportBtn, editBtn, delBtn));
    return card;
  }

  async function loadEvents() {
    const q = new URLSearchParams({ when: evWhen });
    if (evStateSel.value) q.set('state', evStateSel.value);
    if (evKindSel.value) q.set('kind', evKindSel.value);
    if (eFocus) q.set('focus', eFocus);
    try {
      const d = await api(`/api/corner/events?${q}`);
      evList.replaceChildren();
      let lastDay = '';
      for (const e of d.events) {
        const day = zoned(e.starts_at, e.tz, { weekday: 'long', month: 'long', day: 'numeric' });
        if (evWhen === 'upcoming' && day !== lastDay) { evList.append(h('h4', { class: 'sc-ev-day' }, isToday(e) ? `Today, ${day}` : day)); lastDay = day; }
        evList.append(eventCard(e));
      }
      if (!d.events.length) {
        const elsewhere = Object.values(d.upcoming_by_state || {}).reduce((a, b) => a + b, 0);
        evList.append(h('div', { class: 'sc-empty' },
          h('p', {}, h('strong', {}, evWhen === 'past' ? 'No past events here yet.' : `No upcoming events${evStateSel.value ? ` in ${evStateSel.selectedOptions[0].textContent}` : ''} yet.`)),
          evWhen === 'upcoming' ? h('p', {}, 'Organising something? Put it on the board so people can find it.') : null,
          evWhen === 'upcoming' && evStateSel.value && elsewhere ? h('button', { type: 'button', class: 'sc-link', onclick: () => { evStateSel.value = ''; store.set('sc-ev-state', ''); loadEvents(); } }, `See ${elsewhere} upcoming ${elsewhere === 1 ? 'event' : 'events'} in other states`) : null,
          evWhen === 'upcoming' ? h('button', { type: 'button', class: 'sc-submit', onclick: () => openEventForm() }, '＋ Post an event') : null));
      }
      if (eFocus) { const el = document.getElementById(`e-${eFocus}`); if (el) { el.classList.add('sc-focus'); setTimeout(() => el.scrollIntoView({ behavior: 'smooth', block: 'center' }), 200); } }
    } catch (ex) {
      evList.replaceChildren(h('p', { class: 'sc-error' }, 'Events didn’t load. ', h('button', { type: 'button', class: 'sc-link', onclick: loadEvents }, 'Try again')));
    }
  }
  evStateSel.addEventListener('change', () => { store.set('sc-ev-state', evStateSel.value); loadEvents(); });
  evKindSel.addEventListener('change', loadEvents);
  evSeg.forEach((b) => b.addEventListener('click', () => { evWhen = b.dataset.when; evSeg.forEach((x) => x.setAttribute('aria-pressed', String(x === b))); loadEvents(); }));

  // "Happening today" strip, the tab badge and the side box: one small request, on page load.
  async function refreshEventExtras() {
    try {
      const st = store.get('sc-ev-state', 'MA');
      let d = await api(`/api/corner/events?when=upcoming${st ? `&state=${st}` : ''}`);
      let list = d.events;
      if (!list.length && st) { d = await api('/api/corner/events?when=upcoming'); list = d.events; }
      const today = list.filter(isToday);
      const badge = $('#sc-events-count');
      badge.hidden = !list.length;
      badge.textContent = list.length > 9 ? '9+' : String(list.length);
      const strip = $('#sc-today');
      strip.hidden = !today.length;
      if (today.length) strip.textContent = `📣 Happening today: ${today[0].title} · ${zoned(today[0].starts_at, today[0].tz, { hour: 'numeric', minute: '2-digit' })}${today.length > 1 ? ` and ${today.length - 1} more` : ''}. See events`;
      const box = document.querySelector('.sc-coming');
      const ol = document.getElementById('sc-coming-list');
      if (box && ol) {
        ol.replaceChildren(...list.slice(0, 4).map((e) => h('li', {},
          h('a', { href: `#e-${e.id}`, onclick: (ev) => { ev.preventDefault(); showTab('events', { scroll: false }); setTimeout(() => document.getElementById(`e-${e.id}`)?.scrollIntoView({ behavior: 'smooth', block: 'center' }), 500); } }, e.title),
          h('span', {}, `${zoned(e.starts_at, e.tz, { weekday: 'short', month: 'short', day: 'numeric' })} · ${e.online ? 'Online' : `${e.town || ''}${e.town ? ', ' : ''}${e.state}`}`))));
        box.hidden = !list.length;
      }
    } catch { /* the board still works from the tab */ }
  }
  $('#sc-today').addEventListener('click', () => showTab('events', { scroll: true }));

  // Post / edit an event
  const evF = (n) => evForm.elements[n];
  const syncOnline = () => {
    const on = evF('online').checked;
    evForm.querySelectorAll('[data-ev="online"]').forEach((el) => { el.hidden = !on; });
    evForm.querySelectorAll('[data-ev="place"]').forEach((el) => { el.hidden = on; });
  };
  evF('online').addEventListener('change', syncOnline);
  const today = new Date();
  evF('date').min = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`;
  function openEventForm(e = null) {
    showTab('events');
    editing = e;
    evForm.reset();
    evF('state').value = evStateSel.value || 'MA';
    if (e) {
      const s = localParts(e.starts_at, e.tz);
      Object.assign(evF('kind'), { value: e.kind }); evF('title').value = e.title; evF('date').value = s.date; evF('start').value = s.time;
      evF('end').value = e.has_end ? localParts(e.ends_at, e.tz).time : '';
      evF('online').checked = e.online; evF('online_url').value = e.online_url; evF('venue').value = e.venue; evF('address').value = e.address; evF('town').value = e.town;
      evF('state').value = e.state; evF('tag').value = e.tag; evF('organizer').value = e.organizer; evF('link').value = e.link; evF('body').value = e.body; evF('public_place').checked = !e.online;
    } else {
      evF('organizer').value = store.get('sc-organizer', '');
    }
    $('#sc-ev-submit').textContent = e ? 'Save changes' : 'Post the event';
    evErr.hidden = true;
    syncOnline();
    evForm.hidden = false;
    evForm.scrollIntoView({ behavior: 'smooth', block: 'start' });
    setTimeout(() => evF('title').focus({ preventScroll: true }), 300);
  }
  $('#sc-ev-new').addEventListener('click', () => openEventForm());
  $('#sc-ev-cancel').addEventListener('click', () => { evForm.hidden = true; editing = null; });
  evForm.addEventListener('input', () => { evErr.hidden = true; evForm.querySelectorAll('[aria-invalid]').forEach((el) => el.removeAttribute('aria-invalid')); });
  evForm.addEventListener('submit', async (ev) => {
    ev.preventDefault();
    const b = {};
    for (const n of ['kind', 'title', 'date', 'start', 'end', 'online_url', 'venue', 'address', 'town', 'state', 'organizer', 'link', 'tag', 'body', 'website']) b[n] = evF(n).value;
    b.online = evF('online').checked;
    b.public_place = evF('public_place').checked;
    const btn = $('#sc-ev-submit');
    btn.disabled = true;
    try {
      const d = editing
        ? await postJson(`/api/corner/events/${editing.id}/edit`, { ...b, key: ekeys[editing.id] })
        : await postJson('/api/corner/events', b);
      if (!editing && d.event) { ekeys[d.event.id] = d.key; store.set('sc-ekeys', ekeys); }
      store.set('sc-organizer', b.organizer);
      evForm.hidden = true;
      if (d.event) { evStateSel.value = d.event.state; store.set('sc-ev-state', d.event.state); evWhen = 'upcoming'; evSeg.forEach((x) => x.setAttribute('aria-pressed', String(x.dataset.when === 'upcoming'))); }
      await loadEvents();
      refreshEventExtras();
      toast(editing ? 'Event updated.' : 'Your event is on the board. Share it so people come.');
      if (d.event) setTimeout(() => document.getElementById(`e-${d.event.id}`)?.scrollIntoView({ behavior: 'smooth', block: 'center' }), 300);
      editing = null;
    } catch (ex) {
      evErr.textContent = ex.message;
      evErr.hidden = false;
      const f = ex.field && evForm.elements[ex.field];
      if (f) { f.setAttribute('aria-invalid', 'true'); f.focus(); }
    } finally { btn.disabled = false; }
  });

  // Report an event
  const edlg = $('#sc-ereport');
  const erForm = $('#sc-ereport-form');
  $('#sc-ereport-reasons').append(...EREASONS.map(([k, l]) => h('label', { class: 'sc-radio' }, h('input', { type: 'radio', name: 'ereason', value: k }), ' ', l)));
  let ereporting = null;
  function openEReport(id) { ereporting = id; erForm.reset(); $('#sc-ereport-error').hidden = true; if (edlg.showModal) edlg.showModal(); else edlg.setAttribute('open', ''); }
  erForm.addEventListener('submit', async (ev) => {
    if (ev.submitter && ev.submitter.value === 'cancel') return;
    ev.preventDefault();
    const reason = (erForm.querySelector('input[name=ereason]:checked') || {}).value;
    const errEl = $('#sc-ereport-error');
    if (!reason) { errEl.textContent = 'Choose a reason.'; errEl.hidden = false; return; }
    try {
      const d = await postJson(`/api/corner/events/${ereporting}/report`, { reason, note: $('#sc-ereport-note').value, vid });
      edlg.close ? edlg.close() : edlg.removeAttribute('open');
      if (d.hidden) root.querySelectorAll(`[data-eid="${ereporting}"]`).forEach((c) => c.remove());
      toast(d.already ? 'You already reported this event.' : 'Thank you. The editor will review it.');
    } catch (ex) { errEl.textContent = ex.message; errEl.hidden = false; }
  });

  if (eFocus || location.hash === '#events') showTab('events');
  load();
  refreshEventExtras();
})();
