import { useState } from "react";
import { Link } from "react-router-dom";
import { Menu, X } from "lucide-react";
import VenomLogo from "../VenomLogo";
import ThemeSwitcher from "../ThemeSwitcher";

const navLinks = [
  { label: "Features", href: "#features" },
  { label: "Pricing", href: "#pricing" },
  { label: "Docs", href: "/knowledge-base", isRoute: true },
  { label: "Contact", href: "/contact", isRoute: true },
];

const Header = () => {
  const [mobileOpen, setMobileOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 border-b border-nav-border bg-nav-bg backdrop-blur-xl">
      <div className="venom-container flex h-16 items-center justify-between">
        <Link to="/" className="flex items-center gap-2">
          <VenomLogo size={32} />
          <span className="font-display text-lg font-bold tracking-tight">VENOM CODES</span>
        </Link>

        {/* Desktop nav */}
        <nav className="hidden items-center gap-8 md:flex">
          {navLinks.map((link) =>
            link.isRoute ? (
              <Link
                key={link.href}
                to={link.href}
                className="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground"
              >
                {link.label}
              </Link>
            ) : (
              <a
                key={link.href}
                href={link.href}
                className="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground"
              >
                {link.label}
              </a>
            )
          )}
        </nav>

        <div className="hidden items-center gap-3 md:flex">
          <ThemeSwitcher />
          <Link to="/login" className="venom-btn-secondary text-sm py-2 px-4">
            Sign In
          </Link>
          <Link to="/register" className="venom-btn-primary text-sm py-2 px-4">
            Get Started
          </Link>
        </div>

        {/* Mobile toggle */}
        <div className="flex items-center gap-2 md:hidden">
          <ThemeSwitcher />
          <button onClick={() => setMobileOpen(!mobileOpen)} className="p-2">
            {mobileOpen ? <X className="h-5 w-5" /> : <Menu className="h-5 w-5" />}
          </button>
        </div>
      </div>

      {/* Mobile menu */}
      {mobileOpen && (
        <div className="border-t bg-card p-4 md:hidden">
          <nav className="flex flex-col gap-3">
            {navLinks.map((link) =>
              link.isRoute ? (
                <Link
                  key={link.href}
                  to={link.href}
                  className="text-sm font-medium text-muted-foreground"
                  onClick={() => setMobileOpen(false)}
                >
                  {link.label}
                </Link>
              ) : (
                <a
                  key={link.href}
                  href={link.href}
                  className="text-sm font-medium text-muted-foreground"
                  onClick={() => setMobileOpen(false)}
                >
                  {link.label}
                </a>
              )
            )}
            <hr className="border-border" />
            <Link to="/login" className="text-sm font-medium" onClick={() => setMobileOpen(false)}>
              Sign In
            </Link>
            <Link to="/register" className="venom-btn-primary text-sm py-2 px-4 text-center" onClick={() => setMobileOpen(false)}>
              Get Started
            </Link>
          </nav>
        </div>
      )}
    </header>
  );
};

export default Header;
