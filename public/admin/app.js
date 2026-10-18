// Boston Daily newsroom console. Vanilla JS, no build step.
// Shows safe operational status only; it never displays model reasoning.

const $ = (sel, root = document) => root.querySelector(sel);
const view = $('#view');
const TOKEN_KEY = 'bd_editor_token';
let META = null;

const STAGES = ['DISCOVERED', 'RESEARCHING', 'VERIFYING', 'DRAFTING', 'EDITORIAL_REVIEW', 'APPROVED', 'SCHEDULED', 'PUBLISHED', 'UPDATED', 'CORRECTED'];
const STAGE_LABEL = {
  DISCOVERED: 'Discovered', RESEARCHING: 'Under research', VERIFYING: 'Sources being checked', DRAFTING: 'Drafts in progress',
  EDITORIAL_REVIEW: 'Awaiting editor', APPROVED: 'Approved', SCHEDULED: 'Scheduled', PUBLISHED: 'Published', UPDATED: 'Updated',
  CORRECTED: 'Corrected', REJECTED: 'Rejected', ARCHIVED: 'Archived',
};
const PUBLIC = ['PUBLISHED', 'UPDATED', 'CORRECTED'];

function esc(v) {
  return String(v ?? '').replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
}
const when = (iso) => (iso ? new Date(iso).toLocaleString([], { month: 'short', day: 'numeric', hour: 'numeric', minute: '2-digit' }) : '');
const statusChip = (s) => `<span class="status status-${esc(String(s).toLowerCase())}">${esc(STAGE_LABEL[s] || s)}</span>`;
const laneChip = (l) => (l === 'partner_commerce' ? '<span class="lane lane-commerce">Partner</span>' : '<span class="lane lane-news">Newsroom</span>');

function toast(msg, kind = 'ok') {
  const t = $('#toast');
  t.textContent = msg;
  t.className = `toast toast-${kind}`;
  t.hidden = false;
  clearTimeout(toast._t);
  toast._t = setTimeout(() => { t.hidden = true; }, 4200);
}

async function api(method, path, body) {
  const res = await fetch(`/api/admin${path}`, {
    method,
    headers: { authorization: `Bearer ${sessionStorage.getItem(TOKEN_KEY) || ''}`, 'content-type': 'application/json' },
    body: body ? JSON.stringify(body) : undefined,
  });
  if (res.status === 401) { showLogin('Your session ended. Sign in again.'); throw new Error('Signed out'); }
  const data = await res.json().catch(() => ({}));
  if (!res.ok) {
    const err = new Error(data.error || `Request failed (${res.status})`);
    err.problems = data.problems || [];
    throw err;
  }
  return data;
}

function problemList(err) {
  return err.problems && err.problems.length ? `<ul class="problems">${err.problems.map((p) => `<li>${esc(p)}</li>`).join('')}</ul>` : '';
}

// ── Auth ──
function showLogin(message = '') {
  $('#app').hidden = true;
  $('#login').hidden = false;
  $('#login-error').textContent = message;
  $('#token').focus();
}
$('#login-form').addEventListener('submit', async (e) => {
  e.preventDefault();
  sessionStorage.setItem(TOKEN_KEY, $('#token').value.trim());
  try {
    const me = await api('GET', '/me');
    $('#token').value = '';
    start(me.editor);
  } catch (err) {
    sessionStorage.removeItem(TOKEN_KEY);
    $('#login-error').textContent = 'That token was not accepted.';
  }
});
$('#logout').addEventListener('click', () => { sessionStorage.removeItem(TOKEN_KEY); showLogin(); });

async function start(name) {
  $('#editor-name').textContent = name;
  $('#login').hidden = true;
  $('#app').hidden = false;
  META = await api('GET', '/meta');
  route();
}

// ── Router ──
const routes = {
  live: renderLive, queue: renderQueue, stories: renderStories, story: renderStory, new: renderNewStory,
  editions: renderEditions, commerce: renderCommerce, businesses: renderBusinesses, inquiries: renderInquiries, comments: renderComments,
};
window.addEventListener('hashchange', route);
async function route() {
  const [hashPath] = location.hash.slice(1).split('?');
  const [, name = 'live', arg] = hashPath.split('/');
  document.querySelectorAll('[data-nav]').forEach((a) => a.toggleAttribute('aria-current', a.dataset.nav === name || (name === 'story' && a.dataset.nav === 'stories')));
  view.innerHTML = '<p class="loading">Loading…</p>';
  try {
    await (routes[name] || renderLive)(arg);
  } catch (err) {
    if (err.message !== 'Signed out') view.innerHTML = `<div class="panel"><p class="error">${esc(err.message)}</p></div>`;
  }
  view.focus({ preventScroll: true });
  refreshBadges();
}
async function refreshBadges() {
  try {
    const o = await api('GET', '/overview');
  const nl = await api('GET', '/subscribers').catch(() => null);
    const q = (o.newsroom.EDITORIAL_REVIEW || 0) + (o.commerce_lane.EDITORIAL_REVIEW || 0);
    $('#queue-count').hidden = !q; $('#queue-count').textContent = q;
    $('#inq-count').hidden = !o.commerce.new_inquiries; $('#inq-count').textContent = o.commerce.new_inquiries;
    $('#com-count').hidden = !o.commerce.pending_comments; $('#com-count').textContent = o.commerce.pending_comments;
  } catch { /* ignore */ }
}

// ── Live newsroom ──
document.addEventListener('click', async (e) => {
  if (e.target && e.target.id === 'nl-csv') {
    e.preventDefault();
    const res = await fetch('/api/admin/subscribers.csv', { headers: { authorization: `Bearer ${sessionStorage.getItem(TOKEN_KEY) || ''}` } });
    const url = URL.createObjectURL(await res.blob());
    const a = Object.assign(document.createElement('a'), { href: url, download: 'subscribers.csv' }); a.click(); URL.revokeObjectURL(url);
  }
});

async function renderLive() {
  const o = await api('GET', '/overview');
  const tile = (s) => `<a class="stage" href="#/stories?status=${s}" data-status="${s}">
      <span class="stage-n">${o.newsroom[s] || 0}</span><span class="stage-l">${esc(STAGE_LABEL[s])}</span></a>`;
  const ed = o.edition;
  view.innerHTML = `
    <header class="view-head"><div><h1>GetServices.ai newsroom live</h1><p class="sub">Operational status for ${esc(o.today)}. Refreshes every 30 seconds.</p></div>
      <a class="btn btn-primary" href="#/new">New story</a></header>
    ${nl ? `<section class="panel"><h2 class="panel-title">Newsletter subscribers</h2>
      <p>Daily: <strong>${esc(nl.counts?.daily || 0)}</strong> · Weekly: <strong>${esc(nl.counts?.weekly || 0)}</strong> · Unsubscribed: ${esc(nl.counts?.unsubscribed || 0)}
      · <a href="#" id="nl-csv">Download CSV</a></p>
      <p class="sub">${nl.email_configured ? 'Sending is on: daily after the morning edition, weekly on Sundays.' : 'Sending is off until RESEND_API_KEY and NEWSLETTER_FROM are set in Cloudflare. Sign-ups are being saved.'}</p></section>` : ''}
    <section class="panel">
      <h2 class="panel-title">Newsroom pipeline</h2>
      <div class="pipeline">${STAGES.map(tile).join('')}</div>
    </section>
    <div class="grid-3">
      <section class="panel stat ${o.politics_queue ? 'stat-alert' : ''}"><p class="stat-n">${o.politics_queue}</p><p class="stat-l">US Politics awaiting editor</p><p class="stat-note">Always requires human approval</p></section>
      <section class="panel stat ${o.sources_pending ? 'stat-warn' : ''}"><p class="stat-n">${o.sources_pending}</p><p class="stat-l">Sources not yet verified</p></section>
      <section class="panel stat ${o.overdue_scheduled ? 'stat-alert' : ''}"><p class="stat-n">${o.overdue_scheduled}</p><p class="stat-l">Scheduled stories overdue</p></section>
      <section class="panel stat"><p class="stat-n">${o.published_24h}</p><p class="stat-l">Published in the last 24 hours</p></section>
      <section class="panel stat"><p class="stat-n">${o.commerce_lane.EDITORIAL_REVIEW || 0}</p><p class="stat-l">Partner posts awaiting review</p></section>
      <section class="panel stat"><p class="stat-n">${(o.commerce_lane.PUBLISHED || 0) + (o.commerce_lane.UPDATED || 0)}</p><p class="stat-l">Partner posts live</p></section>
    </div>
    <div class="grid-2">
      <section class="panel">
        <h2 class="panel-title">Today’s edition</h2>
        ${ed ? `<p class="big">Edition ${esc(ed.edition_number)}</p><p class="sub">${esc(ed.items)} stories placed, built by ${esc(ed.built_by)}</p>
          <p><a class="btn" href="#/editions">Curate edition</a></p>`
          : `<p class="sub">Not built yet. It builds automatically each morning, or you can build it now.</p><p><button class="btn" id="build-now">Build today’s edition</button></p>`}
        <h2 class="panel-title mt">Commerce</h2>
        <dl class="kv">
          <dt>Active merchants</dt><dd>${o.commerce.merchants}</dd>
          <dt>Live products</dt><dd>${o.commerce.products}</dd>
          <dt>Broken affiliate links</dt><dd class="${o.commerce.broken ? 'warn' : ''}">${o.commerce.broken}</dd>
          <dt>Product clicks</dt><dd>${o.commerce.product_clicks}</dd>
          <dt>Network businesses</dt><dd>${o.commerce.businesses}</dd>
          <dt>Business clicks</dt><dd>${o.commerce.business_clicks}</dd>
          <dt>RealSkillSet courses</dt><dd>${o.commerce.courses}</dd>
          <dt>New ad inquiries</dt><dd>${o.commerce.new_inquiries}</dd>
        </dl>
      </section>
      <section class="panel">
        <h2 class="panel-title">Activity</h2>
        <ol class="feed">${o.activity.map((a) => `<li>
          <span class="feed-time">${esc(when(a.created_at))}</span>
          <span class="feed-body"><a href="#/story/${esc(a.story_id)}">${esc(a.headline)}</a>
            <span class="feed-move">${a.from_status && a.from_status !== a.to_status ? `${esc(STAGE_LABEL[a.from_status] || a.from_status)} to ` : ''}${statusChip(a.to_status)} by ${esc(a.actor)}</span>
            ${a.note ? `<span class="feed-note">${esc(a.note)}</span>` : ''}</span></li>`).join('') || '<li class="sub">No activity yet.</li>'}</ol>
      </section>
    </div>`;
  $('#build-now')?.addEventListener('click', async () => {
    try { await api('POST', '/editions/build', {}); toast('Edition built.'); renderLive(); } catch (err) { toast(err.message, 'err'); }
  });
  clearTimeout(renderLive._t);
  renderLive._t = setTimeout(() => { if (location.hash === '' || location.hash.startsWith('#/live')) renderLive().catch(() => {}); }, 30000);
}

// ── Queue ──
async function renderQueue() {
  const { stories } = await api('GET', '/stories?status=EDITORIAL_REVIEW');
  const politics = stories.filter((s) => s.always_human && s.lane === 'newsroom');
  const news = stories.filter((s) => s.lane === 'newsroom' && !s.always_human);
  const partner = stories.filter((s) => s.lane === 'partner_commerce');
  const table = (list, empty) => list.length ? storyTable(list) : `<p class="sub">${empty}</p>`;
  const newsroom = [...politics, ...news];
  view.innerHTML = `<header class="view-head"><div><h1>Editorial queue</h1><p class="sub">Stories waiting for an editor. Nothing here publishes without approval.</p></div>
      ${newsroom.length ? `<button class="btn btn-primary" id="approve-all">Approve &amp; publish all ready (${newsroom.length})</button>` : ''}</header>
    <div id="bulk-result"></div>
    <section class="panel"><h2 class="panel-title">US Politics and health (human approval required)</h2>${table(politics, 'Nothing waiting.')}</section>
    <section class="panel"><h2 class="panel-title">Newsroom</h2>${table(news, 'Nothing waiting.')}</section>
    <section class="panel"><h2 class="panel-title">Partner content held by policy gates</h2>${table(partner, 'Nothing held.')}</section>`;
  const btn = $('#approve-all');
  if (btn) btn.addEventListener('click', () => approveAllReady(newsroom, btn));
}

// One click for the whole newsroom queue. Each story still goes through the normal approve and
// publish endpoints, so every gate runs per story and the approval is recorded under this editor.
// Stories that fail a check are skipped and listed with the reason. Partner content is not included.
async function approveAllReady(list, btn) {
  if (!confirm(`Approve and publish every newsroom story in the queue that passes all checks (${list.length} waiting)? Stories with problems are skipped.`)) return;
  btn.disabled = true;
  const published = [];
  const skipped = [];
  for (const [i, s] of list.entries()) {
    btn.textContent = `Working… ${i + 1} of ${list.length}`;
    try {
      await api('POST', `/stories/${s.id}/approve`, { note: 'Approved with "Approve & publish all ready"' });
    } catch (err) {
      skipped.push({ s, why: err.problems?.length ? err.problems : [err.message] });
      continue;
    }
    try {
      await api('POST', `/stories/${s.id}/publish`);
      published.push(s);
    } catch (err) {
      skipped.push({ s, why: [`Approved but not published: ${err.message}`, ...(err.problems || [])] });
    }
  }
  await renderQueue();
  const link = (s) => `<a href="#/story/${esc(s.id)}">${esc(s.headline)}</a>`;
  $('#bulk-result').innerHTML = `<section class="panel"><h2 class="panel-title">Published ${published.length} of ${list.length}</h2>
    ${published.length ? `<ul>${published.map((s) => `<li>${link(s)}</li>`).join('')}</ul>` : ''}
    ${skipped.length ? `<h3>Skipped (${skipped.length}): fix these and approve them one by one</h3>
      <ul>${skipped.map(({ s, why }) => `<li>${link(s)}<ul class="problems">${why.map((w) => `<li>${esc(w)}</li>`).join('')}</ul></li>`).join('')}</ul>` : ''}</section>`;
  toast(`Published ${published.length}. Skipped ${skipped.length}.`, skipped.length ? 'err' : 'ok');
}

function storyTable(list) {
  return `<div class="table-wrap"><table class="table"><thead><tr><th>Headline</th><th>Lane</th><th>Section</th><th>Status</th><th>Sources</th><th>Updated</th></tr></thead>
    <tbody>${list.map((s) => `<tr>
      <td><a href="#/story/${esc(s.id)}">${esc(s.headline)}</a>${s.sensitive ? ' <span class="flag">Sensitive</span>' : ''}</td>
      <td>${laneChip(s.lane)}</td><td>${esc(s.section_name)}</td><td>${statusChip(s.status)}</td>
      <td>${s.lane === 'newsroom' ? esc(s.source_count) : '—'}</td><td class="nowrap">${esc(when(s.updated_at))}</td></tr>`).join('')}</tbody></table></div>`;
}

// ── Stories list ──
async function renderStories() {
  const params = new URLSearchParams(location.hash.split('?')[1] || '');
  const { stories } = await api('GET', `/stories?${params}`);
  const opt = (v, label, cur) => `<option value="${esc(v)}"${cur === v ? ' selected' : ''}>${esc(label)}</option>`;
  view.innerHTML = `<header class="view-head"><div><h1>Story pipeline</h1><p class="sub">${stories.length} stories</p></div><a class="btn btn-primary" href="#/new">New story</a></header>
    <form class="filters panel" id="filters">
      <label>Status<select name="status">${opt('', 'All')}${META.states.map((s) => opt(s, STAGE_LABEL[s] || s, params.get('status'))).join('')}</select></label>
      <label>Lane<select name="lane">${opt('', 'All')}${opt('newsroom', 'Newsroom', params.get('lane'))}${opt('partner_commerce', 'Partner', params.get('lane'))}</select></label>
      <label>Section<select name="section">${opt('', 'All')}${META.sections.filter((s) => !s.parent_slug).map((s) => opt(s.slug, s.name, params.get('section'))).join('')}</select></label>
      <label class="grow">Search<input name="q" value="${esc(params.get('q') || '')}" placeholder="Headline or text"></label>
      <button class="btn" type="submit">Filter</button>
    </form>
    <section class="panel">${stories.length ? storyTable(stories) : '<p class="sub">No stories match these filters.</p>'}</section>`;
  $('#filters').addEventListener('submit', (e) => {
    e.preventDefault();
    const q = new URLSearchParams([...new FormData(e.target)].filter(([, v]) => v));
    location.hash = `#/stories?${q}`;
  });
}

function sectionOptions(current, lane) {
  return META.sections.filter((s) => s.active && (lane !== 'partner_commerce' || s.commerce_allowed))
    .map((s) => `<option value="${esc(s.slug)}"${s.slug === current ? ' selected' : ''}>${s.parent_slug ? '— ' : ''}${esc(s.name)}${s.always_human ? ' (human approval)' : ''}</option>`).join('');
}

// ── New story ──
async function renderNewStory() {
  view.innerHTML = `<header class="view-head"><div><h1>New story</h1><p class="sub">Start a story in the pipeline. Approval comes later.</p></div></header>
    <form class="panel form" id="new-form">
      <label>Lane<select name="lane" id="lane"><option value="newsroom">Newsroom (journalism)</option><option value="partner_commerce">Partner content (labeled commercial)</option></select></label>
      <label>Type<select name="type" id="type"></select></label>
      <label>Section<select name="section_slug" id="section"></select></label>
      <label>Starting stage<select name="status"><option value="DISCOVERED">Discovered</option><option value="RESEARCHING">Researching</option><option value="DRAFTING">Drafting</option></select></label>
      <label class="full">Headline<input name="headline" required maxlength="220"></label>
      <label class="full">Summary (dek)<input name="dek" maxlength="400"></label>
      <label class="full">Body (Markdown: ## headings, - lists, [link](https://…))<textarea name="body" rows="10"></textarea></label>
      <div class="full commerce-only" hidden>
        <label>Disclosure label<select name="disclosure_label">${META.disclosure_labels.map((l) => `<option>${esc(l)}</option>`).join('')}</select></label>
        <label>Disclosure line<input name="disclosure_text" value="This article contains affiliate links. Boston Daily and the GetServices.ai network may earn a commission at no extra cost to you."></label>
        <label>Sponsor (for sponsored content)<input name="sponsor_name"></label>
      </div>
      <label class="check"><input type="checkbox" name="sensitive"> Sensitive (forces human approval, hides commercial modules)</label>
      <div class="full"><button class="btn btn-primary" type="submit">Create story</button></div>
    </form>`;
  const sync = () => {
    const lane = $('#lane').value;
    const types = lane === 'newsroom' ? META.newsroom_types : META.commerce_types;
    $('#type').innerHTML = types.map((t) => `<option value="${t}">${t.replace('_', ' ')}</option>`).join('');
    $('#section').innerHTML = sectionOptions($('#section').value, lane);
    document.querySelectorAll('.commerce-only').forEach((el) => { el.hidden = lane !== 'partner_commerce'; });
  };
  $('#lane').addEventListener('change', sync);
  sync();
  $('#new-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const fd = Object.fromEntries(new FormData(e.target));
    fd.sensitive = !!fd.sensitive;
    if (fd.lane === 'newsroom') { delete fd.disclosure_label; delete fd.disclosure_text; delete fd.sponsor_name; }
    try {
      const r = await api('POST', '/stories', fd);
      toast('Story created.');
      location.hash = `#/story/${r.id}`;
    } catch (err) { toast(err.message, 'err'); }
  });
}

// ── Story editor ──
async function renderStory(id) {
  const d = await api('GET', `/stories/${id}`);
  const s = d.story;
  const isPublic = PUBLIC.includes(s.status);
  const locked = isPublic || s.status === 'ARCHIVED';
  const types = s.lane === 'newsroom' ? META.newsroom_types : META.commerce_types;
  const canApprove = s.status === 'EDITORIAL_REVIEW';
  const canPublish = ['APPROVED', 'SCHEDULED'].includes(s.status);
  const canReject = ['EDITORIAL_REVIEW', 'APPROVED', 'SCHEDULED'].includes(s.status);

  view.innerHTML = `
    <header class="view-head">
      <div><p class="crumbs"><a href="#/stories">Story pipeline</a></p>
        <h1 class="story-h">${esc(s.headline)}</h1>
        <p class="sub">${laneChip(s.lane)} ${statusChip(s.status)} <span>${esc(d.section?.name || s.section_slug)}</span>
          ${d.requires_human ? '<span class="flag">Human approval required</span>' : ''} ${s.sensitive ? '<span class="flag">Sensitive</span>' : ''}
          <span>v${esc(s.version)}</span> ${s.approved_by ? `<span>Approved by ${esc(s.approved_by)}</span>` : ''}</p></div>
      ${isPublic ? `<a class="btn" href="/story/${esc(s.slug)}" target="_blank" rel="noopener">View live</a>` : `<button class="btn" id="preview-btn" type="button">Preview</button>`}
    </header>

    <div class="editor-grid">
      <div>
        <section class="panel">
          <h2 class="panel-title">Publication controls</h2>
          ${d.problems.length && !locked ? `<div class="gate"><p class="gate-title">Blocking approval and publishing</p><ul class="problems">${d.problems.map((p) => `<li>${esc(p)}</li>`).join('')}</ul></div>` : (!locked ? '<p class="ok-line">All checks pass.</p>' : '')}
          <div class="actions">
            ${d.transitions.filter((t) => t !== 'ARCHIVED').map((t) => `<button class="btn" data-transition="${t}">Move to ${esc(STAGE_LABEL[t] || t)}</button>`).join('')}
            ${canApprove ? '<button class="btn btn-primary" id="approve">Approve</button>' : ''}
            ${canReject ? '<button class="btn btn-danger" id="reject">Reject</button>' : ''}
            ${s.status === 'APPROVED' ? '<span class="sched"><input type="datetime-local" id="sched-at" aria-label="Schedule time"><button class="btn" id="schedule">Schedule</button></span>' : ''}
            ${canPublish ? '<button class="btn btn-primary" id="publish">Publish now</button>' : ''}
            ${d.transitions.includes('ARCHIVED') ? '<button class="btn btn-quiet" data-transition="ARCHIVED">Archive</button>' : ''}
          </div>
          <div id="action-result"></div>
          ${s.scheduled_at ? `<p class="sub">Scheduled for ${esc(when(s.scheduled_at))}</p>` : ''}
        </section>

        ${isPublic ? `<section class="panel">
          <h2 class="panel-title">Update or correct this live story</h2>
          <p class="sub">Readers see a public note. The previous version is preserved.</p>
          <form class="form" id="revise-form">
            <label class="full">Headline<input name="headline" value="${esc(s.headline)}"></label>
            <label class="full">Summary<input name="dek" value="${esc(s.dek || '')}"></label>
            <label class="full">Body<textarea name="body" rows="12">${esc(s.body)}</textarea></label>
            <label class="full">Public note (required)<input name="note" required minlength="10" placeholder="What changed, in a sentence readers will see"></label>
            <div class="full actions"><button class="btn" type="submit" data-kind="update">Publish update</button><button class="btn btn-danger" type="submit" data-kind="correct">Publish correction</button></div>
          </form>
        </section>` : `<section class="panel">
          <h2 class="panel-title">Edit</h2>
          ${['APPROVED', 'SCHEDULED'].includes(s.status) ? '<p class="warn-line">Saving changes returns this story to editorial review.</p>' : ''}
          <form class="form" id="edit-form">
            <label>Type<select name="type" ${locked ? 'disabled' : ''}>${types.map((t) => `<option value="${t}"${t === s.type ? ' selected' : ''}>${t.replace('_', ' ')}</option>`).join('')}</select></label>
            <label>Section<select name="section_slug" ${locked ? 'disabled' : ''}>${sectionOptions(s.section_slug, s.lane)}</select></label>
            <label class="full">Headline<input name="headline" value="${esc(s.headline)}" maxlength="220"></label>
            <label class="full">Summary (dek)<input name="dek" value="${esc(s.dek || '')}" maxlength="400"></label>
            <label class="full">Body<textarea name="body" rows="14">${esc(s.body)}</textarea></label>
            <label>Byline<input name="byline" value="${esc(s.byline || '')}"></label>
            <label>Priority (higher leads the edition)<input name="priority" type="number" value="${esc(s.priority)}"></label>
            <label>Hero image URL<input name="hero_image_url" value="${esc(s.hero_image_url || '')}" placeholder="https://"></label>
            <label>Image rights<select name="hero_image_rights"><option value="">None recorded</option>${['licensed', 'owned', 'public_domain', 'permitted_release'].map((r) => `<option value="${r}"${r === s.hero_image_rights ? ' selected' : ''}>${r.replace('_', ' ')}</option>`).join('')}</select></label>
            <label class="full">Image credit<input name="hero_image_credit" value="${esc(s.hero_image_credit || '')}"></label>
            ${s.lane === 'partner_commerce' ? `
              <label>Disclosure label<select name="disclosure_label">${META.disclosure_labels.map((l) => `<option${l === s.disclosure_label ? ' selected' : ''}>${esc(l)}</option>`).join('')}</select></label>
              <label>Sponsor<input name="sponsor_name" value="${esc(s.sponsor_name || '')}"></label>
              <label class="full">Disclosure line<input name="disclosure_text" value="${esc(s.disclosure_text || '')}"></label>` : ''}
            <label class="check"><input type="checkbox" name="sensitive" ${s.sensitive ? 'checked' : ''}> Sensitive</label>
            <label class="check"><input type="checkbox" name="is_lead_candidate" ${s.is_lead_candidate ? 'checked' : ''}> Lead story candidate</label>
            <div class="full"><button class="btn btn-primary" type="submit">Save changes</button></div>
          </form>
        </section>`}

        <section class="panel" id="preview-panel" hidden><h2 class="panel-title">Preview</h2><div class="preview" id="preview"></div></section>
      </div>

      <div>
        <section class="panel">
          <h2 class="panel-title">Sources and provenance</h2>
          ${d.sources.length ? `<ul class="sources">${d.sources.map((src) => `<li>
            <div><strong>${src.url ? `<a href="${esc(src.url)}" target="_blank" rel="noopener">${esc(src.title)}</a>` : esc(src.title)}</strong>
              <span class="rights rights-${esc(src.rights_type.toLowerCase())}">${esc(src.rights_type.replace(/_/g, ' ').toLowerCase())}</span></div>
            <div class="sub">${esc([src.publisher, src.channel, src.license_ref && `License ${src.license_ref}`].filter(Boolean).join(', '))}</div>
            <div class="sub">Added by ${esc(src.added_by)}, ${esc(when(src.created_at))}${src.public ? '' : ', not shown publicly'}</div>
            <div class="src-actions">${src.rights_type !== 'DISCOVERY_ONLY' ? `<label class="check"><input type="checkbox" data-verify="${esc(src.id)}" ${src.verified ? 'checked' : ''}> Verified</label>` : '<span class="sub">Discovery only, never published</span>'}
              ${!isPublic ? `<button class="link-btn" data-del-source="${esc(src.id)}">Remove</button>` : ''}</div>
          </li>`).join('')}</ul>` : '<p class="sub">No sources yet.</p>'}
          ${s.status !== 'ARCHIVED' ? `<form class="form compact" id="source-form">
            <label class="full">Source title<input name="title" required></label>
            <label class="full">URL<input name="url" type="url" placeholder="https://"></label>
            <label>Publisher<input name="publisher"></label>
            <label>Channel<input name="channel" placeholder="e.g. FEC, PR Newswire"></label>
            <label>Rights type<select name="rights_type">${META.rights_types.map((r) => `<option value="${r}">${r.replace(/_/g, ' ').toLowerCase()}</option>`).join('')}</select></label>
            <label>License reference<input name="license_ref" placeholder="Required for licensed"></label>
            <label class="check"><input type="checkbox" name="verified"> Verified</label>
            <label class="check"><input type="checkbox" name="public" checked> Show in public Sources</label>
            <div class="full"><button class="btn" type="submit">Add source</button></div>
          </form>` : ''}
          ${s.source_system !== 'newsroom' && s.source_system !== 'manual' ? `<p class="sub mt">Ingested from ${esc(s.source_system)}${s.source_ref ? `: ${esc(s.source_ref)}` : ''}</p>` : ''}
        </section>

        <section class="panel">
          <h2 class="panel-title">History</h2>
          ${d.versions.length ? `<p class="sub">Versions</p><ul class="versions">${d.versions.map((v) => `<li>v${esc(v.version)} ${esc(v.change_type)} by ${esc(v.editor)}, ${esc(when(v.created_at))}${v.note ? `<span class="sub"> ${esc(v.note)}</span>` : ''}</li>`).join('')}</ul>` : ''}
          <ol class="feed">${d.events.map((e) => `<li><span class="feed-time">${esc(when(e.created_at))}</span>
            <span class="feed-body">${e.from_status !== e.to_status ? statusChip(e.to_status) : ''} <span>${esc(e.actor)}</span>${e.note ? `<span class="feed-note">${esc(e.note)}</span>` : ''}</span></li>`).join('')}</ol>
        </section>
      </div>
    </div>`;

  const result = $('#action-result');
  const act = async (fn, okMsg) => {
    result.innerHTML = '';
    try { await fn(); toast(okMsg); renderStory(id); } catch (err) { result.innerHTML = `<div class="gate"><p class="gate-title">${esc(err.message)}</p>${problemList(err)}</div>`; }
  };
  view.querySelectorAll('[data-transition]').forEach((b) => b.addEventListener('click', () => {
    const to = b.dataset.transition;
    if (to === 'ARCHIVED' && !confirm('Archive this story? It will leave the site and the pipeline.')) return;
    act(() => api('POST', `/stories/${id}/transition`, { to }), `Moved to ${STAGE_LABEL[to] || to}.`);
  }));
  $('#approve')?.addEventListener('click', () => act(() => api('POST', `/stories/${id}/approve`, { note: prompt('Approval note (optional)') || '' }), 'Approved.'));
  $('#reject')?.addEventListener('click', () => {
    const note = prompt('Reason for rejecting (required)');
    if (note) act(() => api('POST', `/stories/${id}/reject`, { note }), 'Rejected.');
  });
  $('#schedule')?.addEventListener('click', () => {
    const v = $('#sched-at').value;
    if (!v) return toast('Pick a date and time first.', 'err');
    act(() => api('POST', `/stories/${id}/schedule`, { at: new Date(v).toISOString() }), 'Scheduled.');
  });
  $('#publish')?.addEventListener('click', () => {
    if (confirm('Publish this story now?')) act(() => api('POST', `/stories/${id}/publish`), 'Published.');
  });
  $('#edit-form')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    const fd = Object.fromEntries(new FormData(e.target));
    fd.sensitive = !!e.target.sensitive.checked;
    fd.is_lead_candidate = !!e.target.is_lead_candidate.checked;
    try {
      const r = await api('PATCH', `/stories/${id}`, fd);
      toast(r.returned_to_review ? 'Saved. Returned to editorial review.' : 'Saved.');
      renderStory(id);
    } catch (err) { toast(err.message, 'err'); }
  });
  $('#revise-form')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    const kind = e.submitter?.dataset.kind || 'update';
    const fd = Object.fromEntries(new FormData(e.target));
    if (kind === 'correct' && !confirm('Publish a correction? Readers will see the correction note.')) return;
    act(() => api('POST', `/stories/${id}/${kind}`, fd), kind === 'correct' ? 'Correction published.' : 'Update published.');
  });
  $('#source-form')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    const fd = Object.fromEntries(new FormData(e.target));
    fd.verified = !!e.target.verified.checked;
    fd.public = !!e.target.public.checked;
    if (!fd.url) delete fd.url;
    try { await api('POST', `/stories/${id}/sources`, fd); toast('Source added.'); renderStory(id); } catch (err) { toast(err.message, 'err'); }
  });
  view.querySelectorAll('[data-verify]').forEach((cb) => cb.addEventListener('change', async () => {
    try { await api('PATCH', `/sources/${cb.dataset.verify}`, { verified: cb.checked }); toast(cb.checked ? 'Source verified.' : 'Verification removed.'); renderStory(id); } catch (err) { toast(err.message, 'err'); }
  }));
  view.querySelectorAll('[data-del-source]').forEach((b) => b.addEventListener('click', async () => {
    if (!confirm('Remove this source?')) return;
    try { await api('DELETE', `/sources/${b.dataset.delSource}`); renderStory(id); } catch (err) { toast(err.message, 'err'); }
  }));
  $('#preview-btn')?.addEventListener('click', () => {
    const f = $('#edit-form');
    $('#preview-panel').hidden = false;
    $('#preview').innerHTML = `<h1>${esc(f.headline.value)}</h1><p class="dek">${esc(f.dek.value)}</p>${mdPreview(f.body.value)}`;
    $('#preview-panel').scrollIntoView({ behavior: 'smooth' });
  });
}

function mdPreview(src) {
  return String(src || '').split(/\n{2,}/).map((block) => {
    const b = block.trim();
    if (!b) return '';
    if (b.startsWith('## ')) return `<h2>${esc(b.slice(3))}</h2>`;
    if (b.startsWith('### ')) return `<h3>${esc(b.slice(4))}</h3>`;
    if (/^[-*] /.test(b)) return `<ul>${b.split('\n').map((l) => `<li>${esc(l.replace(/^[-*] /, ''))}</li>`).join('')}</ul>`;
    return `<p>${esc(b).replace(/\[([^\]]+)\]\((https?:[^)]+)\)/g, '<a href="$2" target="_blank" rel="noopener">$1</a>')}</p>`;
  }).join('');
}

// ── Editions ──
async function renderEditions() {
  const { editions, today } = await api('GET', '/editions');
  const current = editions.find((e) => e.edition_date === today);
  let items = [];
  if (current) ({ items } = await api('GET', `/editions/${current.id}`));
  const { stories: published } = await api('GET', '/stories?lane=newsroom&limit=60');
  const live = published.filter((s) => PUBLIC.includes(s.status) && !items.some((i) => i.id === s.id));
  const slotName = { lead: 'Lead', top: 'Top stories', editors_selection: 'Editor’s selection', section: 'Section' };
  view.innerHTML = `<header class="view-head"><div><h1>Daily editions</h1><p class="sub">The edition builds automatically each morning. Editors can rebuild and curate it.</p></div>
      <button class="btn btn-primary" id="rebuild">${current ? 'Rebuild today’s edition' : 'Build today’s edition'}</button></header>
    ${current ? `<section class="panel"><h2 class="panel-title">Edition ${esc(current.edition_number)}, ${esc(today)}</h2>
      ${items.length ? `<div class="table-wrap"><table class="table"><thead><tr><th>Slot</th><th>Story</th><th>Status</th><th></th></tr></thead><tbody>
        ${items.map((i) => `<tr><td>${esc(slotName[i.slot])}</td><td><a href="#/story/${esc(i.id)}">${esc(i.headline)}</a></td><td>${statusChip(i.status)}</td>
          <td class="nowrap">${i.slot !== 'lead' ? `<button class="link-btn" data-lead="${esc(i.id)}">Make lead</button>` : ''} <button class="link-btn" data-remove="${esc(i.id)}">Remove</button></td></tr>`).join('')}
      </tbody></table></div>` : '<p class="sub">No stories placed. Publish newsroom stories, then rebuild.</p>'}
      ${live.length ? `<form class="form compact mt" id="add-form"><label class="full">Add a published story<select name="story_id">${live.map((s) => `<option value="${esc(s.id)}">${esc(s.headline)}</option>`).join('')}</select></label>
        <label>Slot<select name="slot"><option value="top">Top stories</option><option value="editors_selection">Editor’s selection</option><option value="section">Section</option></select></label>
        <div><button class="btn" type="submit">Add to edition</button></div></form>` : ''}
    </section>` : ''}
    <section class="panel"><h2 class="panel-title">Archive</h2>
      <div class="table-wrap"><table class="table"><thead><tr><th>Date</th><th>Edition</th><th>Stories</th><th>Built by</th></tr></thead><tbody>
      ${editions.map((e) => `<tr><td><a href="/edition/${esc(e.edition_date)}" target="_blank" rel="noopener">${esc(e.edition_date)}</a></td><td>${esc(e.edition_number)}</td><td>${esc(e.items)}</td><td>${esc(e.built_by)}</td></tr>`).join('') || '<tr><td colspan="4" class="sub">No editions yet.</td></tr>'}
      </tbody></table></div></section>`;
  $('#rebuild').addEventListener('click', async () => {
    try { await api('POST', '/editions/build', { rebuild: true }); toast('Edition built.'); renderEditions(); } catch (err) { toast(err.message, 'err'); }
  });
  const curate = async (op, story_id, slot) => {
    try { await api('POST', `/editions/${current.id}/curate`, { op, story_id, slot }); renderEditions(); } catch (err) { toast(err.message, 'err'); }
  };
  view.querySelectorAll('[data-lead]').forEach((b) => b.addEventListener('click', () => curate('lead', b.dataset.lead)));
  view.querySelectorAll('[data-remove]').forEach((b) => b.addEventListener('click', () => curate('remove', b.dataset.remove)));
  $('#add-form')?.addEventListener('submit', (e) => { e.preventDefault(); const fd = Object.fromEntries(new FormData(e.target)); curate('add', fd.story_id, fd.slot); });
}

// ── Commerce ──
async function renderCommerce() {
  const { merchants, broken, log } = await api('GET', '/commerce');
  const { courses } = await api('GET', '/courses');
  view.innerHTML = `<header class="view-head"><div><h1>Commerce</h1><p class="sub">Merchants and products sync from the master affiliate database. Every item is labeled on the reader site.</p></div>
      <button class="btn" id="linkcheck">Run link check now</button></header>
    <section class="panel"><h2 class="panel-title">Merchants (${merchants.length})</h2>
      ${merchants.length ? `<div class="table-wrap"><table class="table"><thead><tr><th>Merchant</th><th>Network</th><th>Publisher ID</th><th>Name shown</th><th>Status</th><th>Live products</th><th>Broken</th><th>Clicks</th></tr></thead><tbody>
      ${merchants.map((m) => `<tr><td><a href="/shop?merchant=${esc(m.id)}" target="_blank" rel="noopener">${esc(m.name)}</a></td><td>${esc(m.network)} ${esc(m.network_merchant_id)}</td><td>${esc(m.publisher_account_id || '')}</td>
        <td>${m.display_name_allowed ? 'Yes' : 'Hidden'}</td><td>${esc(m.status)}</td><td>${esc(m.active_products)}</td><td class="${m.broken_products ? 'warn' : ''}">${esc(m.broken_products)}</td><td>${esc(m.clicks)}</td></tr>`).join('')}
      </tbody></table></div>` : '<p class="sub">No merchants yet. Point the merchant sync job at POST /api/ingest/products.</p>'}</section>
    <div class="grid-2">
      <section class="panel"><h2 class="panel-title">Broken affiliate links</h2>
        ${broken.length ? `<ul class="plain">${broken.map((p) => `<li><strong>${esc(p.name)}</strong> <span class="sub">${esc(p.merchant)}, checked ${esc(when(p.last_verified_at))}</span>
          <button class="link-btn" data-deact="${esc(p.id)}">Deactivate</button></li>`).join('')}</ul>` : '<p class="sub">None. Broken links are hidden from readers automatically.</p>'}</section>
      <section class="panel"><h2 class="panel-title">RealSkillSet courses (${courses.length})</h2>
        ${courses.length ? `<ul class="plain">${courses.map((c) => `<li><strong>${esc(c.title)}</strong> <span class="sub">${esc(c.type)}, ${esc(c.status)}, ${esc(c.clicks)} clicks</span></li>`).join('')}</ul>` : '<p class="sub">No courses yet. Sync via POST /api/ingest/courses.</p>'}</section>
    </div>
    <section class="panel"><h2 class="panel-title">Ingestion log</h2>
      <div class="table-wrap"><table class="table"><thead><tr><th>Time</th><th>Source</th><th>Result</th><th>Detail</th></tr></thead><tbody>
      ${log.map((l) => `<tr><td class="nowrap">${esc(when(l.created_at))}</td><td>${esc(l.source)}</td><td><span class="result result-${esc(l.result.split('_')[0])}">${esc(l.result.replace(/_/g, ' '))}</span></td><td class="detail">${esc(l.ref ? `${l.ref}: ` : '')}${esc(l.detail || '')}</td></tr>`).join('') || '<tr><td colspan="4" class="sub">Nothing ingested yet.</td></tr>'}
      </tbody></table></div></section>`;
  $('#linkcheck').addEventListener('click', async (e) => {
    e.target.disabled = true;
    try { const r = await api('POST', '/maintenance/link-check'); toast(`Checked ${r.products.checked} links, ${r.products.broken} broken.`); renderCommerce(); } catch (err) { toast(err.message, 'err'); }
  });
  view.querySelectorAll('[data-deact]').forEach((b) => b.addEventListener('click', async () => {
    try { await api('PATCH', `/products/${b.dataset.deact}`, { status: 'inactive' }); renderCommerce(); } catch (err) { toast(err.message, 'err'); }
  }));
}

// ── Businesses ──
async function renderBusinesses() {
  const { businesses } = await api('GET', '/businesses');
  view.innerHTML = `<header class="view-head"><div><h1>Business registry</h1><p class="sub">Recommended Businesses. Network-owned businesses always show an ownership disclosure; paid listings are labeled.</p></div></header>
    <section class="panel"><div class="table-wrap"><table class="table"><thead><tr><th>Business</th><th>Domain</th><th>Group</th><th>Section</th><th>Type</th><th>Health</th><th>Clicks</th><th>Featured</th><th>Status</th></tr></thead><tbody>
    ${businesses.map((b) => `<tr><td><a href="/businesses/${esc(b.slug)}" target="_blank" rel="noopener">${esc(b.name)}</a></td><td>${esc(b.domain || '')}</td><td>${esc(b.grp || '')}</td><td>${esc(b.section_slug || '')}</td>
      <td>${b.paid_listing ? 'Paid listing' : b.owned_by_network ? 'Network' : 'Other'}</td>
      <td>${b.health_ok === null ? '<span class="sub">Not checked</span>' : b.health_ok ? 'Up' : '<span class="warn">Down</span>'}</td><td>${esc(b.clicks)}</td>
      <td><input type="checkbox" data-feat="${esc(b.id)}" ${b.featured ? 'checked' : ''} aria-label="Featured"></td>
      <td><select data-status="${esc(b.id)}" aria-label="Status">${['active', 'unverified', 'hidden'].map((st) => `<option${st === b.status ? ' selected' : ''}>${st}</option>`).join('')}</select></td></tr>`).join('')}
    </tbody></table></div></section>`;
  view.querySelectorAll('[data-feat]').forEach((cb) => cb.addEventListener('change', async () => {
    try { await api('PATCH', `/businesses/${cb.dataset.feat}`, { featured: cb.checked }); toast('Saved.'); } catch (err) { toast(err.message, 'err'); }
  }));
  view.querySelectorAll('select[data-status]').forEach((sel) => sel.addEventListener('change', async () => {
    try { await api('PATCH', `/businesses/${sel.dataset.status}`, { status: sel.value }); toast('Saved.'); } catch (err) { toast(err.message, 'err'); }
  }));
}

// ── Inquiries ──
async function renderInquiries() {
  const { inquiries } = await api('GET', '/inquiries');
  view.innerHTML = `<header class="view-head"><div><h1>Ad inquiries</h1><p class="sub">From the Advertise page and CTAs. Nothing runs until creative is reviewed and approved.</p></div></header>
    <section class="panel">${inquiries.length ? `<div class="table-wrap"><table class="table"><thead><tr><th>Received</th><th>Type</th><th>Company</th><th>Contact</th><th>Budget</th><th>Message</th><th>Status</th></tr></thead><tbody>
    ${inquiries.map((q) => `<tr><td class="nowrap">${esc(when(q.created_at))}</td><td>${esc(q.type)}</td><td>${esc(q.company || '')}${q.website ? `<br><a href="${esc(q.website)}" target="_blank" rel="noopener nofollow">${esc(q.website)}</a>` : ''}</td>
      <td>${esc(q.name || '')}<br><a href="mailto:${esc(q.email)}">${esc(q.email)}</a></td><td>${esc(q.budget || '')}</td><td class="detail">${esc(q.message || '')}</td>
      <td><select data-inq="${esc(q.id)}" aria-label="Status">${['new', 'responded', 'negotiating', 'won', 'declined'].map((st) => `<option${st === q.status ? ' selected' : ''}>${st}</option>`).join('')}</select></td></tr>`).join('')}
    </tbody></table></div>` : '<p class="sub">No inquiries yet.</p>'}</section>`;
  view.querySelectorAll('[data-inq]').forEach((sel) => sel.addEventListener('change', async () => {
    try { await api('PATCH', `/inquiries/${sel.dataset.inq}`, { status: sel.value }); toast('Saved.'); refreshBadges(); } catch (err) { toast(err.message, 'err'); }
  }));
}

// ── Comments ──
async function renderComments() {
  const params = new URLSearchParams(location.hash.split('?')[1] || '');
  const status = params.get('status') || 'pending';
  const { comments } = await api('GET', `/comments?status=${status}`);
  const tab = (st, label) => `<a class="btn ${st === status ? 'btn-primary' : ''}" href="#/comments?status=${st}">${label}</a>`;
  view.innerHTML = `<header class="view-head"><div><h1>Reader comments</h1><p class="sub">Comments appear on the site only after an editor approves them.</p></div>
      <div class="actions">${tab('pending', 'Pending')}${tab('approved', 'Approved')}${tab('rejected', 'Rejected')}</div></header>
    <section class="panel">${comments.length ? `<div class="table-wrap"><table class="table"><thead><tr><th>Received</th><th>Story</th><th>Name</th><th>Comment</th><th></th></tr></thead><tbody>
    ${comments.map((c) => `<tr><td class="nowrap">${esc(when(c.created_at))}</td><td><a href="/story/${esc(c.slug)}" target="_blank" rel="noopener">${esc(c.headline)}</a></td>
      <td>${esc(c.name)}</td><td class="detail">${esc(c.body)}</td>
      <td class="nowrap">${c.status !== 'approved' ? `<button class="btn btn-primary" data-mod="approved" data-id="${esc(c.id)}">Approve</button>` : ''} ${c.status !== 'rejected' ? `<button class="btn btn-danger" data-mod="rejected" data-id="${esc(c.id)}">Reject</button>` : ''}</td></tr>`).join('')}
    </tbody></table></div>` : '<p class="sub">Nothing here.</p>'}</section>`;
  view.querySelectorAll('[data-mod]').forEach((b) => b.addEventListener('click', async () => {
    try { await api('PATCH', `/comments/${b.dataset.id}`, { status: b.dataset.mod }); toast(b.dataset.mod === 'approved' ? 'Comment approved.' : 'Comment rejected.'); renderComments(); refreshBadges(); } catch (err) { toast(err.message, 'err'); }
  }));
}

// ── Boot ──
(async () => {
  if (!sessionStorage.getItem(TOKEN_KEY)) return showLogin();
  try { const me = await api('GET', '/me'); start(me.editor); } catch { showLogin(); }
})();
