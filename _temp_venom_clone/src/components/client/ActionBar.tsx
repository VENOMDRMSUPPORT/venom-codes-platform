/**
 * WHMCS Mapping: Action button bar — used at top/bottom of detail pages
 * Groups primary and secondary actions in a consistent layout.
 */
import { ReactNode } from "react";

interface ActionBarProps {
  children: ReactNode;
  align?: "left" | "right" | "between";
}

const ActionBar = ({ children, align = "right" }: ActionBarProps) => {
  const alignClass = {
    left: "justify-start",
    right: "justify-end",
    between: "justify-between",
  }[align];

  return (
    <div className={`flex flex-wrap items-center gap-2 ${alignClass}`}>
      {children}
    </div>
  );
};

export default ActionBar;
