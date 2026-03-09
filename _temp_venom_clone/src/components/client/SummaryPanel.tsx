/**
 * WHMCS Mapping: Summary/detail panel — used in service detail, invoice detail
 * Key-value display for service/invoice/domain summaries.
 */
import { ReactNode } from "react";

export interface SummaryRow {
  label: string;
  value: ReactNode;
}

interface SummaryPanelProps {
  title?: string;
  rows: SummaryRow[];
  footer?: ReactNode;
  className?: string;
}

const SummaryPanel = ({ title, rows, footer, className = "" }: SummaryPanelProps) => {
  return (
    <div className={`rounded-xl border bg-card ${className}`}>
      {title && (
        <div className="border-b px-5 py-3.5">
          <h3 className="font-display text-sm font-semibold">{title}</h3>
        </div>
      )}
      <div className="divide-y divide-border">
        {rows.map((row, i) => (
          <div key={i} className="flex items-center justify-between px-5 py-3 text-sm">
            <span className="text-muted-foreground">{row.label}</span>
            <span className="font-medium text-right">{row.value}</span>
          </div>
        ))}
      </div>
      {footer && (
        <div className="border-t px-5 py-3.5">{footer}</div>
      )}
    </div>
  );
};

export default SummaryPanel;
