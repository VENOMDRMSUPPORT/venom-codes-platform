/**
 * VENOM CODES — Scroll to Top Button
 * Shows after 400px scroll. Vanilla JS.
 */
(function () {
  'use strict';

  function init() {
    var btn = document.getElementById('scroll-to-top');
    if (!btn) return;

    window.addEventListener('scroll', function () {
      if (window.scrollY > 400) {
        btn.classList.remove('opacity-0', 'scale-75', 'pointer-events-none');
        btn.classList.add('opacity-100', 'scale-100');
      } else {
        btn.classList.add('opacity-0', 'scale-75', 'pointer-events-none');
        btn.classList.remove('opacity-100', 'scale-100');
      }
    }, { passive: true });

    btn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
