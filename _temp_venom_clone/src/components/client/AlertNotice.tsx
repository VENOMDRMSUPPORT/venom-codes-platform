/**
 * WHMCS Mapping: {include file="alert.tpl" type="info|success|warning|danger"}
 * Reusable alert/notice banners for client area.
 */
import { ReactNode } from "react";
import { Info, CheckCircle2, AlertTriangle, XCircle, X } from "lucide-react";

type AlertType = "info" | "success" | "warning" | "error";

const alertConfig: Record<AlertType, { icon: ReactNode; classes: string }> = {
  info: {
    icon: <Info className="h-4 w-4" />,
    classes: "border-primary/30 bg-primary/5 text-primary",
  },
  success: {
    icon: <CheckCircle2 className="h-4 w-4" />,
    classes: "border-emerald-500/30 bg-emerald-500/5 text-emerald-600 dark:text-emerald-400",
  },
  warning: {
    icon: <AlertTriangle className="h-4 w-4" />,
    classes: "border-amber-500/30 bg-amber-500/5 text-amber-600 dark:text-amber-400",
  },
  error: {
    icon: <XCircle className="h-4 w-4" />,
    classes: "border-destructive/30 bg-destructive/5 text-destructive",
  },
};

interface AlertNoticeProps {
  type: AlertType;
  title?: string;
  children: ReactNode;
  dismissible?: boolean;
  onDismiss?: () => void;
}

const AlertNotice = ({ type, title, children, dismissible, onDismiss }: AlertNoticeProps) => {
  const config = alertConfig[type];

  return (
    <div className={`relative rounded-xl border p-4 ${config.classes}`}>
      <div className="flex gap-3">
        <div className="shrink-0 mt-0.5">{config.icon}</div>
        <div className="flex-1 text-sm">
          {title && <p className="font-semibold mb-0.5">{title}</p>}
          <div className="opacity-90">{children}</div>
        </div>
        {dismissible && (
          <button onClick={onDismiss} className="shrink-0 opacity-60 hover:opacity-100 transition-opacity" aria-label="Dismiss">
            <X className="h-4 w-4" />
          </button>
        )}
      </div>
    </div>
  );
};

export default AlertNotice;
