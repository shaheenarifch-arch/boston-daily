// Left/right arrows for product carousels (.flower-carousel). Swipe and keyboard scrolling work without it.
document.querySelectorAll('.flower-carousel').forEach((box) => {
  const track = box.querySelector('.fc-track');
  if (!track) return;
  box.querySelectorAll('.fc-btn').forEach((btn) => btn.addEventListener('click', () => {
    track.scrollBy({ left: Number(btn.dataset.dir) * track.clientWidth * 0.8, behavior: 'smooth' });
  }));
});
