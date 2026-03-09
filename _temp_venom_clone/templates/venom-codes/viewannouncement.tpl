{* VENOM CODES — View Single Announcement *}

<div style="max-width: 48rem; margin: 0 auto;">

  {* Breadcrumb *}
  <nav style="margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
    <a href="{$WEB_ROOT}/announcements" style="text-decoration: none; color: inherit;">Announcements</a>
    <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
    <span style="color: hsl(var(--foreground)); font-weight: 500;">{$announcement.title|truncate:40}</span>
  </nav>

  <article style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem;">
    <header style="margin-bottom: 1.5rem; padding-bottom: 1.5rem; border-bottom: 1px solid hsl(var(--border));">
      <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">{$announcement.title}</h1>
      <time class="text-sm text-muted-foreground" style="margin-top: 0.5rem; display: block;">{$announcement.date}</time>
    </header>
    <div style="font-size: 0.9375rem; line-height: 1.75; color: hsl(var(--foreground) / 0.9);">
      {$announcement.text}
    </div>
  </article>

  <div style="margin-top: 1.5rem; text-align: center;">
    <a href="{$WEB_ROOT}/announcements" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1.25rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
      Back to Announcements
    </a>
  </div>

</div>
