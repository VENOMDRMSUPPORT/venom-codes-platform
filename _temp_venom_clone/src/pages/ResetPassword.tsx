import { useState } from "react";
import { Link } from "react-router-dom";
import { Eye, EyeOff, KeyRound } from "lucide-react";
import AuthLayout from "../components/auth/AuthLayout";

const ResetPassword = () => {
  const [showPass, setShowPass] = useState(false);

  return (
    <AuthLayout title="Set New Password" subtitle="Choose a strong password for your account" icon={<KeyRound className="h-6 w-6 text-primary" />}>
      <form className="space-y-5" onSubmit={(e) => e.preventDefault()}>
        <div>
          <label className="mb-1.5 block text-sm font-medium">New Password</label>
          <div className="relative">
            <input
              type={showPass ? "text" : "password"}
              className="venom-input pr-10"
              placeholder="Min. 8 characters"
            />
            <button
              type="button"
              onClick={() => setShowPass(!showPass)}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
            >
              {showPass ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
            </button>
          </div>
        </div>
        <div>
          <label className="mb-1.5 block text-sm font-medium">Confirm New Password</label>
          <input type="password" className="venom-input" placeholder="••••••••" />
        </div>
        <button type="submit" className="venom-btn-primary w-full py-3">
          <KeyRound className="h-4 w-4" />
          Update Password
        </button>
      </form>
      <p className="mt-6 text-center text-sm text-muted-foreground">
        <Link to="/login" className="font-medium text-primary hover:underline">
          Back to Sign In
        </Link>
      </p>
    </AuthLayout>
  );
};

export default ResetPassword;
