// Guest post form (/write-for-us): shows one step at a time with Back/Next, and a live word count.
// Without JavaScript the whole form shows at once and still works.
(() => {
  const MIN = 800, MAX = 1500;
  const count = (t) => (t.replace(/\]\([^)]*\)/g, ' ').replace(/https?:\/\/\S+/g, ' ').replace(/[#>*_|\-[\]()]/g, ' ').match(/\b[\w'’]+\b/g) || []).length;
  document.querySelectorAll('.gp-form textarea[name="body"]').forEach((ta) => {
    const out = ta.closest('form').querySelector('[data-wordcount]');
    if (!out) return;
    const show = () => {
      const n = count(ta.value);
      out.textContent = `Word count: ${n}${n < MIN ? ` (${MIN - n} more needed)` : n > MAX ? ` (${n - MAX} over the limit)` : ' ✓'}`;
      out.className = n >= MIN && n <= MAX ? 'gp-wc-ok' : 'gp-wc-warn';
    };
    ta.addEventListener('input', show);
    show();
  });

  const form = document.querySelector('#guest-form');
  if (!form) return;
  const steps = [...form.querySelectorAll('.gp-step')];
  const back = form.querySelector('[data-gp-back]');
  const next = form.querySelector('[data-gp-next]');
  const submit = form.querySelector('[data-gp-submit]');
  // If the server sent errors back, keep everything open so the author can see each field.
  if (form.querySelector('.flash-err') || steps.length < 2) return;
  let i = 0;
  const show = () => {
    steps.forEach((s, n) => { s.hidden = n !== i; });
    back.hidden = i === 0;
    next.hidden = i === steps.length - 1;
    submit.hidden = i !== steps.length - 1;
  };
  const valid = () => {
    for (const el of steps[i].querySelectorAll('input, select, textarea')) {
      if (!el.checkValidity()) { el.reportValidity(); return false; }
    }
    if (i === 1) {
      const ta = steps[i].querySelector('textarea[name="body"]');
      const n = count(ta.value);
      if (n < MIN || n > MAX) { ta.setCustomValidity(`Guest posts must be ${MIN}–${MAX} words (now ${n}).`); ta.reportValidity(); ta.setCustomValidity(''); return false; }
    }
    return true;
  };
  next.addEventListener('click', () => { if (valid()) { i += 1; show(); steps[i].querySelector('input, select, textarea')?.focus(); } });
  back.addEventListener('click', () => { i -= 1; show(); });
  form.addEventListener('submit', (e) => {
    const boxes = [...steps[steps.length - 1].querySelectorAll('input[type="checkbox"]')];
    if (boxes.some((b) => !b.checked)) { e.preventDefault(); alertBox('Tick all four agreement boxes before sending.'); return; }
    submit.disabled = true;
    submit.textContent = 'Sending…';
  });
  function alertBox(msg) {
    let el = form.querySelector('.gp-inline-err');
    if (!el) { el = document.createElement('p'); el.className = 'flash flash-err gp-inline-err'; el.setAttribute('role', 'alert'); form.querySelector('.gp-nav').before(el); }
    el.textContent = msg;
  }
  show();
})();
