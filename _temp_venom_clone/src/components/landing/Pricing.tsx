import { Link } from "react-router-dom";
import { Check, ArrowRight, Star } from "lucide-react";

const plans = [
  {
    name: "Trial",
    price: "$50",
    period: "One-Time",
    duration: "7 Days License",
    features: [
      "Main server license",
      "Instant activation",
      "Full core features",
      "No load balancer",
    ],
    highlighted: false,
    badge: null,
    cta: "Start Trial",
  },
  {
    name: "Pro",
    price: "$100",
    period: "/month",
    duration: "30 Days",
    features: [
      "Main server license",
      "1 load balancer included",
      "Additional LB: $15/mo",
      "Instant provisioning",
    ],
    highlighted: true,
    badge: "Most Popular",
    cta: "Get Pro",
  },
  {
    name: "Ultra",
    price: "$300",
    period: "/month",
    duration: "30 Days",
    features: [
      "Multi-server license",
      "Unlimited load balancers",
      "No additional LB fees",
      "Instant provisioning",
    ],
    highlighted: false,
    badge: "Enterprise",
    cta: "Get Ultra",
  },
];

const Pricing = () => (
  <section id="pricing" className="venom-section bg-background">
    <div className="venom-container">
      <div className="mx-auto max-w-2xl text-center mb-16">
        <span className="venom-badge mb-4">Pricing</span>
        <h2 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">
          Simple, Transparent Pricing
        </h2>
        <p className="mt-4 text-muted-foreground">
          Choose the plan that fits your infrastructure. Scale up anytime with zero downtime.
        </p>
      </div>

      <div className="grid gap-8 md:grid-cols-3">
        {plans.map((plan, i) => (
          <div
            key={plan.name}
            className={`relative rounded-2xl border p-8 transition-all animate-fade-in-up ${
              plan.highlighted
                ? "border-primary/50 bg-card shadow-xl venom-glow"
                : "bg-card hover:border-primary/20"
            }`}
            style={{ animationDelay: `${i * 0.1}s` }}
          >
            {plan.badge && (
              <div className="absolute -top-3 left-1/2 -translate-x-1/2">
                <span className={`inline-flex items-center gap-1 rounded-full px-3 py-1 text-xs font-semibold ${
                  plan.highlighted ? "venom-gradient-bg text-primary-foreground" : "venom-badge"
                }`}>
                  {plan.highlighted && <Star className="h-3 w-3" />}
                  {plan.badge}
                </span>
              </div>
            )}

            <div className="mb-6">
              <h3 className="font-display text-xl font-bold">{plan.name}</h3>
              <p className="text-xs text-muted-foreground mt-1">{plan.duration}</p>
            </div>

            <div className="mb-8">
              <span className="font-display text-4xl font-bold">{plan.price}</span>
              <span className="text-sm text-muted-foreground">{plan.period}</span>
            </div>

            <ul className="mb-8 space-y-3">
              {plan.features.map((f) => (
                <li key={f} className="flex items-start gap-3 text-sm">
                  <Check className="h-4 w-4 mt-0.5 shrink-0 text-primary" />
                  <span>{f}</span>
                </li>
              ))}
            </ul>

            <Link
              to="/register"
              className={`flex w-full items-center justify-center gap-2 rounded-lg py-3 text-sm font-semibold transition-all ${
                plan.highlighted
                  ? "venom-btn-primary"
                  : "venom-btn-secondary"
              }`}
            >
              {plan.cta}
              <ArrowRight className="h-4 w-4" />
            </Link>
          </div>
        ))}
      </div>
    </div>
  </section>
);

export default Pricing;
