/* Boston Daily: Advertise smart form.
   Every Advertise link opens a 5-step modal: business (website auto-fill), placement, ad copy
   (3 options + tone tweaks), house-policy check, contact and send. AI help is optional: the server
   answers with templates when it is unavailable, and the form always works without it.
   Without JavaScript, the links go to /advertise and its plain inquiry form. */
(() => {
  const cfgEl = document.getElementById('advertise-config');
  if (!cfgEl || !window.HTMLDialogElement) return;
  const cfg = JSON.parse(cfgEl.textContent);
  const LIMITS = { headline: 60, body: 150, cta: 24 };
  const STEPS = ['Business', 'Placement', 'Ad copy', 'Policy check', 'Send'];
  const TWEAKS = [['shorter', 'Shorter'], ['premium', 'More premium'], ['urgent', 'More urgent'], ['friendly', 'Friendlier']];
  const BUDGETS = ['Under $500', '$500 to $1,500', '$1,500 to $5,000', '$5,000 to $15,000', 'Over $15,000', 'Not sure yet'];
  const CATEGORIES = cfg.sections;

  const esc = (v) => String(v ?? '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const fresh = () => ({
    step: 0, website: '', company: '', category: '', description: '', audience: '', autofillNote: '',
    package: cfg.packages[0].name, sections: [], budget: '', start: '', end: '',
    options: [], selected: -1, copySource: '', copyNote: '', ad: { headline: '', body: '', cta: '' },
    policy: null, name: '', email: '', phone: '', note: '', company_site: '', sent: false, error: '',
  });
  let st = fresh();
  let dlg = null;
  let busy = '';

  async function post(path, data) {
    const res = await fetch(path, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify(data) });
    let body = {};
    try { body = await res.json(); } catch { /* keep empty */ }
    if (!res.ok || body.ok === false) throw Object.assign(new Error(body.error || 'Something went wrong. Please try again.'), { status: res.status });
    return body;
  }
  const biz = () => ({ company: st.company, website: st.website, description: st.description, category: st.category, audience: st.audience });

  // ── Opening ──
  document.addEventListener('click', (e) => {
    if (e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    const a = e.target.closest('a');
    if (!a) return;
    const isAdvertise = a.hasAttribute('data-advertise') || (a.origin === location.origin && a.pathname === '/advertise' && !a.hash);
    if (!isAdvertise) return;
    e.preventDefault();
    open(a.dataset.package);
  });

  function open(pkg) {
    if (!dlg) build();
    if (st.sent) st = fresh();
    if (pkg && cfg.packages.some((p) => p.name === pkg)) st.package = pkg;
    render();
    dlg.showModal();
    focusHeading();
  }

  function build() {
    dlg = document.createElement('dialog');
    dlg.className = 'adv';
    dlg.setAttribute('aria-labelledby', 'adv-title');
    dlg.innerHTML = `<form method="dialog" class="adv-frame" novalidate>
      <header class="adv-head">
        <div><p class="adv-kicker">Advertise with ${esc(cfg.site)}</p><h2 class="adv-title" id="adv-title" tabindex="-1">Plan your ad</h2></div>
        <button type="button" class="adv-close" data-act="close" aria-label="Close">×</button>
      </header>
      <ol class="adv-steps" aria-label="Steps"></ol>
      <div class="adv-body"></div>
      <p class="adv-status" role="status" aria-live="polite"></p>
      <footer class="adv-foot"></footer>
    </form>`;
    document.body.append(dlg);
    dlg.addEventListener('click', (e) => {
      if (e.target === dlg) { dlg.close(); return; } // backdrop
      const b = e.target.closest('[data-act]');
      if (!b || b.disabled) return;
      e.preventDefault();
      act(b.dataset.act, b);
    });
    dlg.addEventListener('input', (e) => {
      const k = e.target.dataset.k;
      if (!k) return;
      if (k.startsWith('ad.')) {
        st.ad[k.slice(3)] = e.target.value;
        st.copySource = st.copySource && !st.copySource.endsWith('+edited') ? `${st.copySource}+edited` : st.copySource || 'typed';
        st.policy = null;
        const c = dlg.querySelector(`[data-count="${k.slice(3)}"]`);
        if (c) { c.textContent = `${e.target.value.length}/${LIMITS[k.slice(3)]}`; c.classList.toggle('adv-over', e.target.value.length > LIMITS[k.slice(3)]); }
        updatePreview();
      } else if (k === 'sections') {
        st.sections = [...dlg.querySelectorAll('[data-k=sections]:checked')].map((x) => x.value);
        st.policy = null;
      } else if (k === 'package') {
        st.package = e.target.value;
        dlg.querySelectorAll('.adv-packages .adv-card').forEach((c) => c.classList.toggle('adv-card-on', c.contains(e.target)));
      } else {
        st[k] = e.target.value;
        if (['company', 'description', 'category', 'website'].includes(k)) st.policy = null;
      }
    });
    dlg.addEventListener('submit', (e) => { e.preventDefault(); next(); });
  }

  function focusHeading() { dlg.querySelector('#adv-title').focus({ preventScroll: true }); }
  function status(msg, bad = false) {
    const s = dlg.querySelector('.adv-status');
    s.textContent = msg || '';
    s.classList.toggle('adv-status-err', !!bad);
  }

  // ── Steps ──
  function render() {
    dlg.querySelector('.adv-steps').innerHTML = STEPS.map((name, i) => `<li${i === st.step && !st.sent ? ' aria-current="step"' : ''} class="${i < st.step || st.sent ? 'adv-done' : ''}"><span>${i + 1}</span>${esc(name)}</li>`).join('');
    const body = dlg.querySelector('.adv-body');
    const foot = dlg.querySelector('.adv-foot');
    status('');
    if (st.sent) {
      body.innerHTML = `<div class="adv-sent"><p class="adv-sent-mark" aria-hidden="true">✓</p><h3>Thank you. Your inquiry is in.</h3>
        <p>Our partnerships team will reply to <strong>${esc(st.email)}</strong>, usually within one business day. Every ad is reviewed before it runs.</p></div>`;
      foot.innerHTML = '<span></span><button type="button" class="button" data-act="close">Done</button>';
      return;
    }
    body.innerHTML = [stepBusiness, stepPlacement, stepCopy, stepPolicy, stepSend][st.step]();
    const last = st.step === STEPS.length - 1;
    const blocked = st.step === 3 && st.policy && st.policy.blocked.length;
    foot.innerHTML = `${st.step ? '<button type="button" class="button button-quiet" data-act="back">Back</button>' : '<span></span>'}
      <button type="submit" class="button adv-next"${busy ? ' disabled' : ''}>${last ? 'Send inquiry' : blocked ? 'Send for review anyway' : 'Continue'}</button>`;
    if (st.step === 2) updatePreview();
    if (st.step === 3 && !st.policy) runCheck();
  }

  const field = (k, label, { type = 'text', max = 300, ph = '', req = false, hint = '' } = {}) => `<label class="adv-field"><span>${esc(label)}${req ? ' <em>required</em>' : ''}</span>
    <input data-k="${k}" name="${k}" type="${type}" maxlength="${max}" value="${esc(st[k])}"${ph ? ` placeholder="${esc(ph)}"` : ''}${req ? ' required' : ''}${type === 'email' ? ' autocomplete="email"' : ''}>${hint ? `<small>${esc(hint)}</small>` : ''}</label>`;

  function stepBusiness() {
    return `<h3 class="adv-h">Tell us about your business</h3>
      <p class="adv-sub">Start with your website and we'll fill in what we can. You can change anything.</p>
      <div class="adv-row adv-autofill">
        <label class="adv-field"><span>Website</span><input data-k="website" name="website" type="url" inputmode="url" maxlength="300" placeholder="example.com" value="${esc(st.website)}"></label>
        <button type="button" class="button button-gold" data-act="autofill"${busy === 'autofill' ? ' disabled aria-busy="true"' : ''}>${busy === 'autofill' ? 'Reading your site…' : 'Auto-fill from website'}</button>
      </div>
      ${st.autofillNote ? `<p class="adv-note">${esc(st.autofillNote)}</p>` : ''}
      ${field('company', 'Business name', { max: 160, req: true })}
      <label class="adv-field"><span>Category</span><select data-k="category" name="category"><option value="">Choose a category</option>${CATEGORIES.map((c) => `<option value="${esc(c.slug)}"${st.category === c.slug ? ' selected' : ''}>${esc(c.name)}</option>`).join('')}</select></label>
      <label class="adv-field"><span>What you offer</span><textarea data-k="description" name="description" rows="3" maxlength="600">${esc(st.description)}</textarea></label>
      ${field('audience', 'Who you want to reach', { max: 160, ph: 'e.g. Boston families, visitors, small businesses' })}`;
  }

  function stepPlacement() {
    return `<h3 class="adv-h">Where and when</h3>
      <p class="adv-sub">Ads never run on US Politics or Opinion pages, or beside sensitive stories.</p>
      <fieldset class="adv-packages"><legend>Package</legend>${cfg.packages.map((p) => `<label class="adv-card${st.package === p.name ? ' adv-card-on' : ''}">
        <input type="radio" name="package" data-k="package" value="${esc(p.name)}"${st.package === p.name ? ' checked' : ''}><strong>${esc(p.name)}</strong><span>${esc(p.desc)}</span></label>`).join('')}</fieldset>
      <fieldset class="adv-chips"><legend>Sections <small>(optional)</small></legend>${cfg.sections.map((s) => `<label class="adv-chip"><input type="checkbox" data-k="sections" value="${esc(s.slug)}"${st.sections.includes(s.slug) ? ' checked' : ''}><span>${esc(s.name)}</span></label>`).join('')}</fieldset>
      <div class="adv-row">
        <label class="adv-field"><span>Budget</span><select data-k="budget" name="budget"><option value="">Choose a range</option>${BUDGETS.map((b) => `<option${st.budget === b ? ' selected' : ''}>${esc(b)}</option>`).join('')}</select></label>
        ${field('start', 'Start', { type: 'date', max: 20 })}
        ${field('end', 'End', { type: 'date', max: 20 })}
      </div>`;
  }

  function stepCopy() {
    const opts = st.options.map((o, i) => `<li><label class="adv-option${st.selected === i ? ' adv-card-on' : ''}"><input type="radio" name="option" data-act="pick" data-i="${i}"${st.selected === i ? ' checked' : ''}>
      <strong>${esc(o.headline)}</strong><span>${esc(o.body)}</span><em>${esc(o.cta)}</em></label></li>`).join('');
    const sourceNote = st.copySource.startsWith('ai') ? 'Written with AI from your details. Edit freely.'
      : st.copySource.startsWith('template') ? 'Suggested from your details. Edit freely.' : '';
    return `<h3 class="adv-h">Your ad copy</h3>
      <p class="adv-sub">Get three suggestions, pick one, then adjust the tone or edit it yourself.</p>
      <div class="adv-row adv-gen">
        <button type="button" class="button button-gold" data-act="generate"${busy ? ' disabled' : ''}${busy === 'generate' ? ' aria-busy="true"' : ''}>${busy === 'generate' ? 'Writing…' : st.options.length ? 'Suggest 3 more' : 'Suggest 3 ad options'}</button>
        ${sourceNote ? `<span class="adv-note">${esc(sourceNote)}</span>` : ''}
      </div>
      ${st.copyNote ? `<p class="adv-note">${esc(st.copyNote)}</p>` : ''}
      ${opts ? `<ul class="adv-options">${opts}</ul>` : ''}
      ${st.selected >= 0 ? `<div class="adv-tweaks" role="group" aria-label="Adjust the chosen ad">${TWEAKS.map(([k, l]) => `<button type="button" class="adv-tweak" data-act="tweak" data-t="${k}"${busy ? ' disabled' : ''}>${esc(l)}</button>`).join('')}</div>` : ''}
      <div class="adv-edit">
        <div class="adv-edit-fields">
          ${['headline', 'body', 'cta'].map((k) => `<label class="adv-field"><span>${{ headline: 'Headline', body: 'Text', cta: 'Button' }[k]} <small class="adv-count${(st.ad[k] || '').length > LIMITS[k] ? ' adv-over' : ''}" data-count="${k}">${(st.ad[k] || '').length}/${LIMITS[k]}</small></span>
            ${k === 'body' ? `<textarea data-k="ad.body" rows="3">${esc(st.ad.body)}</textarea>` : `<input data-k="ad.${k}" value="${esc(st.ad[k])}">`}</label>`).join('')}
        </div>
        <aside class="adv-preview" aria-label="Preview"><span class="label label-ad">Advertisement</span><p class="adv-pv-h"></p><p class="adv-pv-b"></p><span class="button button-gold adv-pv-c"></span><p class="adv-pv-from"></p></aside>
      </div>`;
  }

  function updatePreview() {
    const pv = dlg.querySelector('.adv-preview');
    if (!pv) return;
    pv.querySelector('.adv-pv-h').textContent = st.ad.headline || 'Your headline';
    pv.querySelector('.adv-pv-b').textContent = st.ad.body || 'Your ad text appears here.';
    pv.querySelector('.adv-pv-c').textContent = st.ad.cta || 'Learn more';
    pv.querySelector('.adv-pv-from').textContent = st.company ? `From ${st.company}` : '';
  }

  function stepPolicy() {
    const p = st.policy;
    if (!p) return '<h3 class="adv-h">House-policy check</h3><p class="adv-sub">Checking your ad against our advertising rules…</p>';
    const list = (items, cls) => items.length ? `<ul class="adv-policy ${cls}">${items.map((t) => `<li>${esc(t)}</li>`).join('')}</ul>` : '';
    return `<h3 class="adv-h">House-policy check</h3>
      ${p.blocked.length ? `<p class="adv-verdict adv-verdict-bad">This ad can't run as written.</p>${list(p.blocked, 'adv-policy-bad')}
        <p class="adv-sub">Go back to fix it, or send it anyway and our team will talk it through with you. Nothing runs until it passes review.</p>
        <p><button type="button" class="button button-quiet" data-act="edit">Edit the ad</button></p>`
        : `<p class="adv-verdict adv-verdict-ok">No problems found.</p>`}
      ${p.flags.length ? `<p class="adv-sub">We'll look closer at:</p>${list(p.flags, 'adv-policy-flag')}` : ''}
      <p class="adv-fine">Every paid item is labeled. Advertisers never buy, edit or approve news coverage. <a href="/advertise#protocols" target="_blank">Our advertising rules</a></p>`;
  }

  function stepSend() {
    const pkg = st.package;
    return `<h3 class="adv-h">Where should we reply?</h3>
      <div class="adv-row">${field('name', 'Your name', { max: 120 })}${field('email', 'Email', { type: 'email', max: 200, req: true })}</div>
      ${field('phone', 'Phone', { type: 'tel', max: 40, hint: 'Optional' })}
      <label class="adv-field"><span>Anything else?</span><textarea data-k="note" rows="3" maxlength="2000">${esc(st.note)}</textarea></label>
      <label class="hp" aria-hidden="true">Leave empty<input data-k="company_site" tabindex="-1" autocomplete="off"></label>
      <dl class="adv-review">
        <dt>Business</dt><dd>${esc(st.company)}${st.website ? ` · ${esc(st.website)}` : ''}</dd>
        <dt>Package</dt><dd>${esc(pkg)}${st.sections.length ? ` · ${esc(st.sections.map((s) => (cfg.sections.find((x) => x.slug === s) || {}).name || s).join(', '))}` : ''}</dd>
        ${st.budget || st.start ? `<dt>Budget and dates</dt><dd>${esc([st.budget, [st.start, st.end].filter(Boolean).join(' to ')].filter(Boolean).join(' · '))}</dd>` : ''}
        ${st.ad.headline ? `<dt>Ad</dt><dd><strong>${esc(st.ad.headline)}</strong> ${esc(st.ad.body)} <em>${esc(st.ad.cta)}</em></dd>` : ''}
      </dl>
      ${st.error ? `<p class="adv-note adv-note-err">${esc(st.error)} You can also email <a href="mailto:${esc(cfg.email)}?subject=${encodeURIComponent('[ADS] Advertising inquiry')}&body=${encodeURIComponent(summary())}">${esc(cfg.email)}</a>.</p>` : ''}
      <p class="adv-fine">We use these details only to reply about advertising. See our <a href="/privacy" target="_blank">privacy policy</a>.</p>`;
  }

  function summary() {
    return [`Company: ${st.company}`, `Website: ${st.website}`, `Package: ${st.package}`, `Sections: ${st.sections.join(', ')}`, `Budget: ${st.budget}`, `Dates: ${st.start} ${st.end}`,
      `Headline: ${st.ad.headline}`, `Text: ${st.ad.body}`, `Button: ${st.ad.cta}`, '', st.note].join('\n');
  }

  // ── Actions ──
  async function act(name, el) {
    if (name === 'close') { dlg.close(); return; }
    if (name === 'back') { st.step = Math.max(0, st.step - 1); render(); focusHeading(); return; }
    if (name === 'edit') { st.step = 2; render(); focusHeading(); return; }
    if (name === 'pick') { choose(+el.dataset.i); return; }
    if (name === 'autofill') return autofill();
    if (name === 'generate') return generate();
    if (name === 'tweak') return tweak(el.dataset.t);
  }

  function choose(i) {
    st.selected = i;
    st.ad = { ...st.options[i] };
    st.copySource = st.copySource.replace('+edited', '');
    st.policy = null;
    render();
    dlg.querySelector(`[data-i="${i}"]`)?.focus();
  }

  async function autofill() {
    if (!st.website.trim()) { status('Enter your website first.', true); dlg.querySelector('[data-k=website]').focus(); return; }
    busy = 'autofill'; render();
    try {
      const r = await post('/api/advertise/autofill', { website: st.website });
      const f = r.fields || {};
      st.website = r.website || st.website;
      for (const k of ['company', 'description', 'audience']) if (f[k === 'company' ? 'name' : k]) st[k] = f[k === 'company' ? 'name' : k];
      if (f.category && CATEGORIES.some((c) => c.slug === f.category)) st.category = f.category;
      st.autofillNote = r.source === 'ai' ? 'Filled in with AI from your website. Check the details.' : "Filled in from your website's description. Check the details.";
    } catch (e) {
      st.autofillNote = e.message || "We couldn't read that website. Fill the details in by hand.";
    }
    busy = ''; render();
    status(st.autofillNote);
  }

  async function generate() {
    if (!st.company.trim()) { st.step = 0; render(); status('Add your business name first.', true); return; }
    busy = 'generate'; render();
    try {
      const r = await post('/api/advertise/copy', biz());
      st.options = r.options;
      st.copySource = r.source;
      st.copyNote = '';
      busy = '';
      choose(0);
    } catch (e) {
      busy = '';
      st.copyNote = 'Suggestions are unavailable right now. Write your own below.';
      render();
    }
    status(st.copyNote || 'Three options ready. The first is selected.');
  }

  async function tweak(t) {
    if (st.selected < 0) return;
    busy = 'tweak'; render();
    try {
      const r = await post('/api/advertise/copy', { ...biz(), tweak: t, option: st.ad });
      st.options[st.selected] = r.options[0];
      st.copySource = r.source;
      busy = '';
      choose(st.selected);
      status('Updated the selected ad.');
    } catch (e) {
      busy = ''; render();
      status('That adjustment is unavailable right now. Edit the text directly.', true);
    }
  }

  async function runCheck() {
    try {
      st.policy = await post('/api/advertise/check', { ...biz(), sections: st.sections, ad: st.ad });
    } catch {
      // The check is repeated on the server when the inquiry is sent, so the form can carry on.
      st.policy = { blocked: [], flags: ['We could not run the automatic check right now; our team will review your ad.'] };
    }
    if (st.step === 3) render();
  }

  async function next() {
    if (busy) return;
    if (st.step === 0 && !st.company.trim()) { status('Add your business name to continue.', true); dlg.querySelector('[data-k=company]').focus(); return; }
    if (st.step === 2 && !(st.ad.headline.trim() && st.ad.body.trim())) { status('Pick a suggestion or write a headline and text to continue.', true); return; }
    if (st.step === 3 && !st.policy) return;
    if (st.step < STEPS.length - 1) { st.step += 1; render(); focusHeading(); return; }
    // Send
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(st.email.trim())) { status('Enter a valid email so we can reply.', true); dlg.querySelector('[data-k=email]').focus(); return; }
    const pkg = cfg.packages.find((p) => p.name === st.package) || cfg.packages[0];
    busy = 'send'; st.error = ''; render();
    const btn = dlg.querySelector('.adv-next'); btn.textContent = 'Sending…'; btn.setAttribute('aria-busy', 'true');
    try {
      await post('/api/inquiry', {
        type: pkg.type, package: pkg.name, company: st.company, name: st.name, email: st.email.trim(), phone: st.phone,
        website: st.website && !/^https?:\/\//i.test(st.website) ? `https://${st.website}` : st.website,
        budget: st.budget, start: st.start, end: st.end, sections: st.sections, category: st.category,
        description: st.description, audience: st.audience, ad: st.ad, copy_source: st.copySource, message: st.note, company_site: st.company_site,
      });
      st.sent = true;
    } catch (e) {
      st.error = e.status === 400 ? e.message : 'Your inquiry did not send. Please try again.';
    }
    busy = ''; render(); focusHeading();
  }
})();
