import { Server, Zap, Shield, Layers, RefreshCw, BarChart3 } from "lucide-react";

const features = [
  {
    icon: Zap,
    title: "Instant Activation",
    desc: "Licenses activate in under 30 seconds. No manual review, no delays. Deploy and go.",
  },
  {
    icon: Server,
    title: "Multi-Server Support",
    desc: "Scale across unlimited servers with our Ultra plan. One license, infinite deployments.",
  },
  {
    icon: Shield,
    title: "Enterprise Security",
    desc: "Hardware-bound licensing with encrypted validation. Tamper-proof and audit-ready.",
  },
  {
    icon: Layers,
    title: "Load Balancing",
    desc: "Built-in load balancer management. Add capacity on demand with instant provisioning.",
  },
  {
    icon: RefreshCw,
    title: "Auto-Renewal",
    desc: "Seamless license renewal with zero service interruption. Set it and forget it.",
  },
  {
    icon: BarChart3,
    title: "Real-Time Analytics",
    desc: "Monitor usage, performance, and license health from a single unified dashboard.",
  },
];

const Features = () => (
  <section id="features" className="venom-section bg-surface-sunken">
    <div className="venom-container">
      <div className="mx-auto max-w-2xl text-center mb-16">
        <span className="venom-badge mb-4">Features</span>
        <h2 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">
          Built for Scale. Designed for Speed.
        </h2>
        <p className="mt-4 text-muted-foreground">
          Every feature engineered for production-grade infrastructure management.
        </p>
      </div>

      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {features.map((f, i) => (
          <div
            key={f.title}
            className="venom-card animate-fade-in-up"
            style={{ animationDelay: `${i * 0.05}s` }}
          >
            <div className="mb-4 inline-flex rounded-lg p-2.5" style={{ background: "hsl(var(--accent-muted))" }}>
              <f.icon className="h-5 w-5 text-primary" />
            </div>
            <h3 className="font-display text-lg font-semibold mb-2">{f.title}</h3>
            <p className="text-sm text-muted-foreground leading-relaxed">{f.desc}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);

export default Features;
