/**
 * WHMCS Mapping: Dashboard stat widget — part of clientareahome.tpl
 * Displays a single metric with icon, value, label, and optional trend.
 */
import { ReactNode } from "react";
import { TrendingUp, TrendingDown } from "lucide-react";

interface StatCardProps {
  icon: ReactNode;
  label: string;
  value: string | number;
  trend?: { value: string; positive: boolean };
  className?: string;
}

const StatCard = ({ icon, label, value, trend, className = "" }: StatCardProps) => {
  return (
    <div className={`rounded-xl border bg-card p-5 transition-colors ${className}`}>
      <div className="flex items-start justify-between">
        <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary">
          {icon}
        </div>
        {trend && (
          <span className={`inline-flex items-center gap-1 text-xs font-medium ${trend.positive ? "text-emerald-500" : "text-destructive"}`}>
            {trend.positive ? <TrendingUp className="h-3 w-3" /> : <TrendingDown className="h-3 w-3" />}
            {trend.value}
          </span>
        )}
      </div>
      <div className="mt-3">
        <p className="font-display text-2xl font-bold tracking-tight">{value}</p>
        <p className="mt-0.5 text-xs text-muted-foreground">{label}</p>
      </div>
    </div>
  );
};

export default StatCard;
