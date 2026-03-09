import { CheckCircle2, AlertTriangle, Clock, Activity, Server, Shield, Database, Globe } from "lucide-react";
import PageLayout from "../components/PageLayout";

const services = [
  { name: "License Validation API", status: "operational", icon: Shield },
  { name: "Activation Server", status: "operational", icon: Server },
  { name: "Load Balancer Provisioning", status: "operational", icon: Globe },
  { name: "Management Dashboard", status: "operational", icon: Activity },
  { name: "Database Cluster", status: "operational", icon: Database },
  { name: "Billing & Payments", status: "operational", icon: Clock },
];

const incidents = [
  {
    date: "March 5, 2026",
    title: "Scheduled Maintenance — Database Optimization",
    status: "resolved",
    description: "Routine database optimization completed. No user impact.",
  },
  {
    date: "February 22, 2026",
    title: "Intermittent API Latency",
    status: "resolved",
    description: "Brief increase in API response times detected and resolved within 12 minutes.",
  },
  {
    date: "February 10, 2026",
    title: "Scheduled Maintenance — Infrastructure Upgrade",
    status: "resolved",
    description: "Core infrastructure upgraded to improve capacity.",
  },
];

const statusColor = (status: string) => {
  switch (status) {
    case "operational": return "text-emerald-500";
    case "degraded": return "text-yellow-500";
    case "outage": return "text-red-500";
    default: return "text-muted-foreground";
  }
};

const statusIcon = (status: string) => {
  switch (status) {
    case "operational": return <CheckCircle2 className="h-5 w-5 text-emerald-500" />;
    case "degraded": return <AlertTriangle className="h-5 w-5 text-yellow-500" />;
    default: return <AlertTriangle className="h-5 w-5 text-red-500" />;
  }
};

const Status = () => {
  const allOperational = services.every((s) => s.status === "operational");

  return (
    <PageLayout>
      <div className="venom-section pt-32">
        <div className="venom-container">
          <div className="mx-auto max-w-3xl">

            {/* Overall status banner */}
            <div
              className={`mb-12 rounded-2xl border p-8 text-center animate-fade-in-up ${
                allOperational ? "border-emerald-500/30 bg-emerald-500/5" : "border-yellow-500/30 bg-yellow-500/5"
              }`}
            >
              <div className="flex items-center justify-center gap-3 mb-2">
                {allOperational ? (
                  <CheckCircle2 className="h-8 w-8 text-emerald-500" />
                ) : (
                  <AlertTriangle className="h-8 w-8 text-yellow-500" />
                )}
                <h1 className="font-display text-2xl font-bold sm:text-3xl">
                  {allOperational ? "All Systems Operational" : "Partial Degradation"}
                </h1>
              </div>
              <p className="text-sm text-muted-foreground">
                {/* WHMCS: Replace with dynamic timestamp */}
                Last checked: see system status dashboard for live updates
              </p>
            </div>

            {/* Services list */}
            <div className="mb-16">
              <h2 className="font-display text-xl font-bold mb-6">Service Status</h2>
              <div className="space-y-3">
                {services.map((service, i) => (
                  <div
                    key={service.name}
                    className="flex items-center justify-between rounded-xl border bg-card p-4 animate-fade-in-up"
                    style={{ animationDelay: `${i * 0.05}s` }}
                  >
                    <div className="flex items-center gap-3">
                      <service.icon className="h-5 w-5 text-muted-foreground" />
                      <span className="text-sm font-medium">{service.name}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className={`text-xs font-semibold capitalize ${statusColor(service.status)}`}>
                        {service.status}
                      </span>
                      {statusIcon(service.status)}
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Recent incidents */}
            <div>
              <h2 className="font-display text-xl font-bold mb-6">Recent Incidents</h2>
              <div className="space-y-4">
                {incidents.map((incident, i) => (
                  <div
                    key={i}
                    className="rounded-xl border bg-card p-5 animate-fade-in-up"
                    style={{ animationDelay: `${0.3 + i * 0.05}s` }}
                  >
                    <div className="flex items-start justify-between gap-4 mb-2">
                      <h3 className="font-display text-sm font-semibold">{incident.title}</h3>
                      <span className="shrink-0 inline-flex items-center gap-1 rounded-full bg-emerald-500/10 px-2 py-0.5 text-xs font-medium text-emerald-500 capitalize">
                        <CheckCircle2 className="h-3 w-3" />
                        {incident.status}
                      </span>
                    </div>
                    <p className="text-xs text-muted-foreground mb-1">{incident.date}</p>
                    <p className="text-sm text-muted-foreground leading-relaxed">{incident.description}</p>
                  </div>
                ))}
              </div>
            </div>

          </div>
        </div>
      </div>
    </PageLayout>
  );
};

export default Status;
