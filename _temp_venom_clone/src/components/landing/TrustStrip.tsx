import { Shield, Globe, Clock, Award } from "lucide-react";

const items = [
  { icon: Shield, label: "Enterprise Security" },
  { icon: Globe, label: "Global Infrastructure" },
  { icon: Clock, label: "Instant Provisioning" },
  { icon: Award, label: "Premium Support" },
];

const TrustStrip = () => (
  <section className="bg-trust-bg border-y">
    <div className="venom-container flex flex-wrap items-center justify-center gap-8 py-6 sm:gap-16">
      {items.map((item) => (
        <div key={item.label} className="flex items-center gap-2 text-muted-foreground">
          <item.icon className="h-4 w-4 text-primary" />
          <span className="text-sm font-medium">{item.label}</span>
        </div>
      ))}
    </div>
  </section>
);

export default TrustStrip;
