/**
 * VENOM CODES — Client Sidebar Toggle
 * Handles sidebar collapse/expand on mobile + desktop icon mode.
 */
(function () {
  'use strict';

  function init() {
    var trigger = document.getElementById('sidebar-trigger');
    var sidebar = document.getElementById('client-sidebar');
    if (!trigger || !sidebar) return;

    trigger.addEventListener('click', function () {
      sidebar.classList.toggle('sidebar-collapsed');
      sidebar.classList.toggle('sidebar-expanded');
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
