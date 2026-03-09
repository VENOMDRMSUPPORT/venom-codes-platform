import { useState } from "react";
import { Link } from "react-router-dom";
import { Eye, EyeOff, UserPlus } from "lucide-react";
import AuthLayout from "../components/auth/AuthLayout";

const Register = () => {
  const [showPass, setShowPass] = useState(false);

  return (
    <AuthLayout title="Create Account" subtitle="Get started with VENOM CODES today" icon={<UserPlus className="h-6 w-6 text-primary" />}>
      <form className="space-y-5" onSubmit={(e) => e.preventDefault()}>
        <div className="grid gap-5 sm:grid-cols-2">
          <div>
            <label className="mb-1.5 block text-sm font-medium">First Name</label>
            <input type="text" className="venom-input" placeholder="John" />
          </div>
          <div>
            <label className="mb-1.5 block text-sm font-medium">Last Name</label>
            <input type="text" className="venom-input" placeholder="Doe" />
          </div>
        </div>
        <div>
          <label className="mb-1.5 block text-sm font-medium">Email Address</label>
          <input type="email" className="venom-input" placeholder="you@example.com" />
        </div>
        <div>
          <label className="mb-1.5 block text-sm font-medium">Password</label>
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
          <label className="mb-1.5 block text-sm font-medium">Confirm Password</label>
          <input type="password" className="venom-input" placeholder="••••••••" />
        </div>
        <div className="flex items-start gap-2">
          <input type="checkbox" id="terms" className="mt-1 rounded border-input" />
          <label htmlFor="terms" className="text-xs text-muted-foreground">
            I agree to the{" "}
            <a href="#" className="text-primary hover:underline">Terms of Service</a>{" "}
            and{" "}
            <a href="#" className="text-primary hover:underline">Privacy Policy</a>
          </label>
        </div>
        <button type="submit" className="venom-btn-primary w-full py-3">
          <UserPlus className="h-4 w-4" />
          Create Account
        </button>
      </form>
      <p className="mt-6 text-center text-sm text-muted-foreground">
        Already have an account?{" "}
        <Link to="/login" className="font-medium text-primary hover:underline">
          Sign in
        </Link>
      </p>
    </AuthLayout>
  );
};

export default Register;
