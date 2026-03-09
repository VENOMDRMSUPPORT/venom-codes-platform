import { Link } from "react-router-dom";
import { Mail } from "lucide-react";
import AuthLayout from "../components/auth/AuthLayout";

const ForgotPassword = () => (
  <AuthLayout title="Reset Password" subtitle="Enter your email to receive a password reset link" icon={<Mail className="h-6 w-6 text-primary" />}>
    <form className="space-y-5" onSubmit={(e) => e.preventDefault()}>
      <div>
        <label className="mb-1.5 block text-sm font-medium">Email Address</label>
        <input type="email" className="venom-input" placeholder="you@example.com" />
      </div>
      <button type="submit" className="venom-btn-primary w-full py-3">
        <Mail className="h-4 w-4" />
        Send Reset Link
      </button>
    </form>
    <p className="mt-6 text-center text-sm text-muted-foreground">
      Remember your password?{" "}
      <Link to="/login" className="font-medium text-primary hover:underline">
        Sign in
      </Link>
    </p>
  </AuthLayout>
);

export default ForgotPassword;
