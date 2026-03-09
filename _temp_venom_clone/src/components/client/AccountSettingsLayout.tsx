/**
 * WHMCS Mapping: clientareadetails.tpl / clientareasecurity.tpl
 * Two-column layout for account/settings pages.
 * Left: nav tabs, Right: content area.
 */
import { ReactNode } from "react";
import { NavLink } from "../NavLink";

interface SettingsNavItem {
  label: string;
  href: string;
  icon: ReactNode;
}

interface AccountSettingsLayoutProps {
  navItems: SettingsNavItem[];
  children: ReactNode;
}

const AccountSettingsLayout = ({ navItems, children }: AccountSettingsLayoutProps) => {
  return (
    <div className="flex flex-col gap-6 lg:flex-row">
      {/* Settings nav */}
      <nav className="w-full lg:w-56 shrink-0">
        <div className="rounded-xl border bg-card p-2">
          {navItems.map((item) => (
            <NavLink
              key={item.href}
              to={item.href}
              className="flex items-center gap-2.5 rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors"
              activeClassName="bg-primary/10 text-primary font-medium"
            >
              {item.icon}
              {item.label}
            </NavLink>
          ))}
        </div>
      </nav>

      {/* Content */}
      <div className="flex-1 space-y-5 min-w-0">
        {children}
      </div>
    </div>
  );
};

export default AccountSettingsLayout;
