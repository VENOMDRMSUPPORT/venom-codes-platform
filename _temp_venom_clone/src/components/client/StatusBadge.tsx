/**
 * WHMCS Mapping: Status labels across all client area templates
 * {if $status eq "Active"} etc.
 * Provides consistent status styling for services, invoices, tickets.
 */

type StatusVariant = "active" | "pending" | "suspended" | "cancelled" | "paid" | "unpaid" | "overdue" | "open" | "answered" | "closed" | "info" | "warning" | "error";

const variantStyles: Record<StatusVariant, string> = {
  active: "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400",
  paid: "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400",
  answered: "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400",
  pending: "bg-amber-500/10 text-amber-600 dark:text-amber-400",
  unpaid: "bg-amber-500/10 text-amber-600 dark:text-amber-400",
  open: "bg-primary/10 text-primary",
  info: "bg-primary/10 text-primary",
  suspended: "bg-destructive/10 text-destructive",
  overdue: "bg-destructive/10 text-destructive",
  error: "bg-destructive/10 text-destructive",
  warning: "bg-amber-500/10 text-amber-600 dark:text-amber-400",
  cancelled: "bg-muted text-muted-foreground",
  closed: "bg-muted text-muted-foreground",
};

interface StatusBadgeProps {
  variant: StatusVariant;
  label?: string;
  className?: string;
}

const StatusBadge = ({ variant, label, className = "" }: StatusBadgeProps) => {
  const displayLabel = label || variant.charAt(0).toUpperCase() + variant.slice(1);
  return (
    <span className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-semibold ${variantStyles[variant]} ${className}`}>
      {displayLabel}
    </span>
  );
};

export default StatusBadge;
export type { StatusVariant };
