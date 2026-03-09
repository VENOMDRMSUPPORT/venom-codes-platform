/**
 * WHMCS Mapping: clientareaheader.tpl / header.tpl (client-area variant)
 * Renders the top bar for authenticated client area pages.
 * Contains logo, search, notifications, and user menu.
 */
import { Link } from "react-router-dom";
import { Bell, Search, ChevronDown, LogOut, Settings, User } from "lucide-react";
import { useState } from "react";
import VenomLogo from "../VenomLogo";
import ThemeSwitcher from "../ThemeSwitcher";

interface ClientHeaderProps {
  userName?: string;
  userEmail?: string;
  notificationCount?: number;
  sidebarTrigger?: React.ReactNode;
}

const ClientHeader = ({
  userName = "User",
  userEmail = "user@example.com",
  notificationCount = 0,
  sidebarTrigger,
}: ClientHeaderProps) => {
  const [userMenuOpen, setUserMenuOpen] = useState(false);

  return (
    /* WHMCS: <header> block in clientareaheader.tpl */
    <header className="sticky top-0 z-40 h-14 border-b border-border bg-card/80 backdrop-blur-xl">
      <div className="flex h-full items-center justify-between gap-4 px-4 lg:px-6">
        {/* Left: sidebar trigger + logo */}
        <div className="flex items-center gap-3">
          {sidebarTrigger}
          <Link to="/client" className="flex items-center gap-2 lg:hidden">
            <VenomLogo size={24} />
            <span className="font-display text-sm font-bold tracking-tight">VENOM</span>
          </Link>
        </div>

        {/* Center: search (desktop) */}
        {/* WHMCS: {include file="search.tpl"} */}
        <div className="hidden flex-1 max-w-md mx-auto md:block">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
            <input
              type="text"
              placeholder="Search services, invoices, tickets…"
              className="w-full rounded-lg border bg-background py-2 pl-9 pr-4 text-sm placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/30 focus:border-primary transition-colors"
            />
          </div>
        </div>

        {/* Right: actions */}
        <div className="flex items-center gap-2">
          <ThemeSwitcher />

          {/* Notifications */}
          {/* WHMCS: {if $notifications_count > 0} */}
          <button className="relative rounded-lg p-2 text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors" aria-label="Notifications">
            <Bell className="h-4.5 w-4.5" />
            {notificationCount > 0 && (
              <span className="absolute -right-0.5 -top-0.5 flex h-4 w-4 items-center justify-center rounded-full venom-gradient-bg text-[10px] font-bold text-primary-foreground">
                {notificationCount > 9 ? "9+" : notificationCount}
              </span>
            )}
          </button>

          {/* User menu */}
          {/* WHMCS: {$clientsdetails.firstname} {$clientsdetails.lastname} */}
          <div className="relative">
            <button
              onClick={() => setUserMenuOpen(!userMenuOpen)}
              className="flex items-center gap-2 rounded-lg p-1.5 pr-2 text-sm hover:bg-secondary transition-colors"
            >
              <div className="flex h-7 w-7 items-center justify-center rounded-full venom-gradient-bg text-xs font-bold text-primary-foreground">
                {userName.charAt(0).toUpperCase()}
              </div>
              <span className="hidden font-medium sm:block">{userName}</span>
              <ChevronDown className="h-3.5 w-3.5 text-muted-foreground" />
            </button>

            {userMenuOpen && (
              <>
                <div className="fixed inset-0 z-40" onClick={() => setUserMenuOpen(false)} />
                <div className="absolute right-0 top-full z-50 mt-1 w-56 rounded-xl border bg-card p-1.5 shadow-lg">
                  <div className="border-b px-3 py-2 mb-1">
                    <p className="text-sm font-medium">{userName}</p>
                    <p className="text-xs text-muted-foreground">{userEmail}</p>
                  </div>
                  <Link to="/client/profile" onClick={() => setUserMenuOpen(false)} className="flex items-center gap-2 rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors">
                    <User className="h-4 w-4" /> Profile
                  </Link>
                  <Link to="/client/settings" onClick={() => setUserMenuOpen(false)} className="flex items-center gap-2 rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors">
                    <Settings className="h-4 w-4" /> Settings
                  </Link>
                  <hr className="my-1 border-border" />
                  <Link to="/login" onClick={() => setUserMenuOpen(false)} className="flex items-center gap-2 rounded-lg px-3 py-2 text-sm text-destructive hover:bg-destructive/10 transition-colors">
                    <LogOut className="h-4 w-4" /> Sign Out
                  </Link>
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </header>
  );
};

export default ClientHeader;
