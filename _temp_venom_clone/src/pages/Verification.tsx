import { Link } from "react-router-dom";
import { ShieldCheck, Mail } from "lucide-react";
import AuthLayout from "../components/auth/AuthLayout";

const Verification = () => (
  <AuthLayout title="Verify Your Identity" subtitle="A security verification step is required" icon={<ShieldCheck className="h-6 w-6 text-primary" />}>
    <div className="text-center space-y-6">
      <div className="mx-auto inline-flex rounded-full p-4" style={{ background: "hsl(var(--accent-muted))" }}>
        <ShieldCheck className="h-8 w-8 text-primary" />
      </div>
      <div>
        <h3 className="font-display text-base font-semibold mb-2">Check Your Email</h3>
        <p className="text-sm text-muted-foreground leading-relaxed">
          We've sent a verification link to your registered email address.
          Please check your inbox and click the link to verify your account.
        </p>
      </div>
      <div className="rounded-lg border bg-secondary/50 p-4">
        <div className="flex items-center gap-3">
          <Mail className="h-5 w-5 text-muted-foreground shrink-0" />
          <p className="text-xs text-muted-foreground text-left">
            If you don't see the email, check your spam folder. The link expires in 24 hours.
          </p>
        </div>
      </div>
      <button
        onClick={(e) => e.preventDefault()}
        className="venom-btn-secondary w-full py-3 text-sm"
      >
        Resend Verification Email
      </button>
    </div>
    <p className="mt-6 text-center text-sm text-muted-foreground">
      <Link to="/login" className="font-medium text-primary hover:underline">
        Back to Sign In
      </Link>
    </p>
  </AuthLayout>
);

export default Verification;
