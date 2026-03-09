import { ReactNode } from "react";
import { Link } from "react-router-dom";
import { Shield } from "lucide-react";
import PageLayout from "../PageLayout";

interface AuthLayoutProps {
  children: ReactNode;
  title: string;
  subtitle?: string;
  icon?: ReactNode;
}

const AuthLayout = ({ children, title, subtitle, icon }: AuthLayoutProps) => (
  <PageLayout>
    <div className="flex flex-1 items-center justify-center px-4 py-28 sm:py-32">
      <div className="w-full max-w-md">
        {/* Header */}
        <div className="mb-8 text-center">
          <div className="mx-auto mb-4 inline-flex h-12 w-12 items-center justify-center rounded-xl" style={{ background: "hsl(var(--accent-muted))" }}>
            {icon || <Shield className="h-6 w-6 text-primary" />}
          </div>
          <h1 className="font-display text-2xl font-bold tracking-tight">{title}</h1>
          {subtitle && <p className="mt-2 text-sm text-muted-foreground">{subtitle}</p>}
        </div>

        {/* Animated border card */}
        <div className="auth-card-wrapper relative rounded-2xl p-[1px]">
          <div className="auth-card-border absolute inset-0 rounded-2xl" />
          <div className="relative rounded-2xl border border-border/50 bg-card p-6 sm:p-8 shadow-lg backdrop-blur-sm">
            {children}
          </div>
        </div>

        {/* Security badge */}
        <div className="mt-6 flex items-center justify-center gap-2 text-xs text-muted-foreground">
          <Shield className="h-3 w-3" />
          <span>Protected by VENOM CODES security</span>
        </div>
      </div>
    </div>
  </PageLayout>
);

export default AuthLayout;
