/**
 * VENOM CODES — FAQ Accordion
 * Simple toggle for FAQ items. Vanilla JS.
 */
(function () {
  'use strict';

  function init() {
    document.addEventListener('click', function (e) {
      var trigger = e.target.closest('[data-faq-trigger]');
      if (!trigger) return;

      var item = trigger.closest('[data-faq-item]');
      if (!item) return;

      var answer = item.querySelector('[data-faq-answer]');
      var chevron = trigger.querySelector('[data-faq-chevron]');
      var isOpen = answer.classList.contains('max-h-40');

      // Close all
      document.querySelectorAll('[data-faq-answer]').forEach(function (a) {
        a.classList.remove('max-h-40', 'opacity-100');
        a.classList.add('max-h-0', 'opacity-0');
      });
      document.querySelectorAll('[data-faq-chevron]').forEach(function (c) {
        c.classList.remove('rotate-180');
      });

      // Toggle current
      if (!isOpen) {
        answer.classList.remove('max-h-0', 'opacity-0');
        answer.classList.add('max-h-40', 'opacity-100');
        if (chevron) chevron.classList.add('rotate-180');
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
