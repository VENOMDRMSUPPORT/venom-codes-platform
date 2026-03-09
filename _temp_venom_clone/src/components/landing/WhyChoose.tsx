import { CheckCircle2 } from "lucide-react";

const reasons = [
  "Zero-downtime license transitions and upgrades",
  "Hardware-bound keys prevent unauthorized sharing",
  "Dedicated infrastructure, not shared tenancy",
  "Transparent pricing with no hidden fees",
  "Technical support available around the clock",
  "Secure infrastructure and processes",
];

const WhyChoose = () => (
  <section className="venom-section bg-background">
    <div className="venom-container">
      <div className="grid items-center gap-16 lg:grid-cols-2">
        <div className="animate-fade-in-left">
          <span className="venom-badge mb-4">Why VENOM CODES</span>
          <h2 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">
            Infrastructure You Can Trust
          </h2>
          <p className="mt-4 text-muted-foreground leading-relaxed">
            We don't just sell licenses — we provide the backbone for your production environment.
            Built by engineers, for engineers.
          </p>
        </div>

        <div className="space-y-4 animate-fade-in-right">
          {reasons.map((r) => (
            <div key={r} className="flex items-start gap-3 rounded-lg bg-card border p-4">
              <CheckCircle2 className="h-5 w-5 mt-0.5 shrink-0 text-primary" />
              <span className="text-sm font-medium">{r}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  </section>
);

export default WhyChoose;
