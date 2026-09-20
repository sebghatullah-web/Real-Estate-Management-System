(function () {
    'use strict';
    function closePopovers() {
        document.querySelectorAll('.kw-popover').forEach(function (menu) { menu.hidden = true; });
        document.querySelectorAll('.kw-notification-toggle, .kw-user-toggle').forEach(function (button) { button.setAttribute('aria-expanded', 'false'); });
    }
    document.addEventListener('DOMContentLoaded', function () {
        var body = document.body;
        var sidebarToggle = document.querySelector('.kw-sidebar-toggle');
        var sidebarClose = document.querySelector('.kw-sidebar-close');
        function toggleSidebar() {
            if (window.innerWidth <= 767) { body.classList.toggle('kw-mobile-sidebar-open'); return; }
            body.classList.toggle('kw-sidebar-collapsed');
            localStorage.setItem('kw-sidebar-collapsed', body.classList.contains('kw-sidebar-collapsed') ? '1' : '0');
        }
        if (localStorage.getItem('kw-sidebar-collapsed') === '1' && window.innerWidth > 767) body.classList.add('kw-sidebar-collapsed');
        if (sidebarToggle) sidebarToggle.addEventListener('click', toggleSidebar);
        if (sidebarClose) sidebarClose.addEventListener('click', function () { body.classList.remove('kw-mobile-sidebar-open'); });
        document.querySelectorAll('.kw-nav-group').forEach(function (button) {
            button.addEventListener('click', function () {
                var section = button.closest('.kw-nav-section');
                var isOpen = section.classList.toggle('is-open');
                button.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
            });
        });
        var currentPage = window.location.pathname.split('/').pop() || 'index.php';
        document.querySelectorAll('.kw-sidebar a[href]').forEach(function (link) {
            if (link.getAttribute('href') === currentPage) {
                link.classList.add('is-active');
                var section = link.closest('.kw-nav-section');
                if (section && section.querySelector('.kw-nav-group')) {
                    section.classList.add('is-open');
                    section.querySelector('.kw-nav-group').setAttribute('aria-expanded', 'true');
                }
            }
        });
        [['.kw-notification-toggle', '.kw-notification-menu'], ['.kw-user-toggle', '.kw-user-menu']].forEach(function (pair) {
            var button = document.querySelector(pair[0]); var menu = document.querySelector(pair[1]);
            if (!button || !menu) return;
            button.addEventListener('click', function (event) {
                event.stopPropagation(); var willOpen = menu.hidden; closePopovers(); menu.hidden = !willOpen; button.setAttribute('aria-expanded', willOpen ? 'true' : 'false');
            });
        });
        document.addEventListener('click', function (event) {
            if (!event.target.closest('.kw-posrel')) closePopovers();
            if (window.innerWidth <= 767 && !event.target.closest('.kw-sidebar') && !event.target.closest('.kw-sidebar-toggle')) body.classList.remove('kw-mobile-sidebar-open');
        });
        var search = document.getElementById('kwMenuSearch');
        if (search) search.addEventListener('input', function () {
            var query = search.value.trim().toLowerCase();
            document.querySelectorAll('.kw-nav-section').forEach(function (section) {
                var matches = !query || section.textContent.toLowerCase().indexOf(query) !== -1;
                section.hidden = !matches;
                if (query && matches && section.querySelector('.kw-nav-group')) section.classList.add('is-open');
            });
        });
    });
}());