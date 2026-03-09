import { Link } from "react-router-dom";
import { ArrowRight, Zap } from "lucide-react";

const Hero = () => (
  <section className="relative overflow-hidden bg-hero-bg pt-32 pb-20">
    {/* Background glow */}
    <div className="absolute inset-0 overflow-hidden">
      <div className="absolute top-1/4 left-1/2 -translate-x-1/2 h-[500px] w-[800px] rounded-full venom-gradient-bg opacity-[0.07] blur-[120px]" />
    </div>

    <div className="venom-container relative">
      <div className="mx-auto max-w-3xl text-center animate-fade-in-up">
        <div className="mb-6 inline-flex items-center gap-2 rounded-full border bg-card px-4 py-1.5 text-xs font-medium">
          <Zap className="h-3 w-3 text-primary" />
          <span>Instant Activation &middot; Zero Downtime</span>
        </div>

        <h1 className="font-display text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          Server Licensing &<br />
          <span className="venom-gradient-text">Infrastructure Solutions</span>
        </h1>

        <p className="mt-6 text-lg leading-relaxed text-muted-foreground sm:text-xl">
          Deploy, scale, and manage your infrastructure with enterprise-grade licensing.
          Instant provisioning. Unlimited scalability. Premium support.
        </p>

        <div className="mt-10 flex flex-col items-center gap-4 sm:flex-row sm:justify-center">
          <Link to="/register" className="venom-btn-primary px-8 py-3.5 text-base">
            Start Free Trial
            <ArrowRight className="h-4 w-4" />
          </Link>
          <a href="#pricing" className="venom-btn-secondary px-8 py-3.5 text-base">
            View Pricing
          </a>
        </div>
      </div>

      {/* Stats — placeholders for WHMCS dynamic data */}
      <div className="mt-20 grid grid-cols-2 gap-8 sm:grid-cols-4 animate-fade-in-up" style={{ animationDelay: "0.3s" }}>
        {[
          { value: "—", label: "Uptime SLA" },
          { value: "<30s", label: "Activation Time" },
          { value: "24/7", label: "Monitoring" },
          { value: "—", label: "Active Licenses" },
        ].map((stat) => (
          <div key={stat.label} className="text-center">
            <div className="font-display text-2xl font-bold sm:text-3xl">{stat.value}</div>
            <div className="mt-1 text-sm text-muted-foreground">{stat.label}</div>
          </div>
        ))}
      </div>
    </div>
  </section>
);

export default Hero;
