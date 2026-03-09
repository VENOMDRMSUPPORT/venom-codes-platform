/**
 * WHMCS Mapping: Tab navigation — used in service detail, account settings
 * Simple CSS-based tab switching, no heavy JS dependency.
 */
import { useState, ReactNode } from "react";

export interface TabItem {
  id: string;
  label: string;
  content: ReactNode;
  count?: number;
}

interface ClientTabsProps {
  tabs: TabItem[];
  defaultTab?: string;
}

const ClientTabs = ({ tabs, defaultTab }: ClientTabsProps) => {
  const [active, setActive] = useState(defaultTab || tabs[0]?.id);

  return (
    <div>
      <div className="flex gap-1 border-b overflow-x-auto">
        {tabs.map((tab) => (
          <button
            key={tab.id}
            onClick={() => setActive(tab.id)}
            className={`relative shrink-0 px-4 py-2.5 text-sm font-medium transition-colors ${
              active === tab.id
                ? "text-primary"
                : "text-muted-foreground hover:text-foreground"
            }`}
          >
            {tab.label}
            {tab.count !== undefined && (
              <span className="ml-1.5 inline-flex items-center justify-center rounded-full bg-muted px-1.5 py-0.5 text-[10px] font-semibold">
                {tab.count}
              </span>
            )}
            {active === tab.id && (
              <span className="absolute bottom-0 left-0 right-0 h-0.5 venom-gradient-bg rounded-full" />
            )}
          </button>
        ))}
      </div>
      <div className="pt-4">
        {tabs.find((t) => t.id === active)?.content}
      </div>
    </div>
  );
};

export default ClientTabs;
