/**
 * WHMCS Template Target: clientareahome.tpl
 * Client Dashboard — account overview with stats, recent services, invoices, tickets.
 */
import { Server, FileText, LifeBuoy, Globe, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import StatCard from "../components/client/StatCard";
import StatusBadge from "../components/client/StatusBadge";
import SummaryPanel from "../components/client/SummaryPanel";
import AlertNotice from "../components/client/AlertNotice";

/* WHMCS: {$services}, {$invoices}, {$tickets} — placeholder data */
const recentServices = [
  { id: "SVC-001", name: "VPS — Standard", status: "active" as const, nextDue: "2025-08-01" },
  { id: "SVC-002", name: "Dedicated Server", status: "pending" as const, nextDue: "2025-07-15" },
];

const recentInvoices = [
  { id: "INV-1001", date: "2025-06-01", amount: "$29.99", status: "paid" as const },
  { id: "INV-1002", date: "2025-07-01", amount: "$42.98", status: "unpaid" as const },
];

const recentTickets = [
  { id: "TKT-501", subject: "Cannot access control panel", status: "answered" as const, date: "2025-06-20" },
];

const ClientDashboard = () => {
  return (
    <ClientLayout>
      {/* WHMCS: Page title block */}
      <PageHeader
        title="Dashboard"
        subtitle="Welcome back. Here's an overview of your account."
        breadcrumbs={[{ label: "Dashboard" }]}
      />

      {/* WHMCS: {if $pendingInvoicesCount > 0} */}
      <div className="mb-6">
        <AlertNotice type="warning" title="Unpaid Invoice">
          You have an outstanding invoice. <Link to="/client/invoices" className="underline font-semibold">View invoices →</Link>
        </AlertNotice>
      </div>

      {/* WHMCS: Dashboard stat widgets — {$stats.*} */}
      <div className="mb-8 grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <StatCard icon={<Server className="h-5 w-5" />} label="Active Services" value="—" />
        <StatCard icon={<FileText className="h-5 w-5" />} label="Unpaid Invoices" value="—" />
        <StatCard icon={<LifeBuoy className="h-5 w-5" />} label="Open Tickets" value="—" />
        <StatCard icon={<Globe className="h-5 w-5" />} label="Active Domains" value="—" />
      </div>

      {/* WHMCS: Recent items grid */}
      <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
        {/* Recent Services */}
        {/* WHMCS: {foreach $services as $service} */}
        <div className="rounded-xl border bg-card">
          <div className="flex items-center justify-between border-b px-5 py-3.5">
            <h2 className="font-display text-sm font-semibold">Recent Services</h2>
            <Link to="/client/services" className="flex items-center gap-1 text-xs text-primary hover:underline">
              View All <ArrowRight className="h-3 w-3" />
            </Link>
          </div>
          <div className="divide-y divide-border">
            {recentServices.map((svc) => (
              <Link key={svc.id} to={`/client/services/${svc.id}`} className="flex items-center justify-between px-5 py-3 text-sm hover:bg-muted/20 transition-colors">
                <div>
                  <p className="font-medium">{svc.name}</p>
                  <p className="text-xs text-muted-foreground">Due: {svc.nextDue}</p>
                </div>
                <StatusBadge variant={svc.status} />
              </Link>
            ))}
            {recentServices.length === 0 && (
              <p className="px-5 py-6 text-center text-sm text-muted-foreground">No active services.</p>
            )}
          </div>
        </div>

        {/* Recent Invoices */}
        {/* WHMCS: {foreach $invoices as $invoice} */}
        <div className="rounded-xl border bg-card">
          <div className="flex items-center justify-between border-b px-5 py-3.5">
            <h2 className="font-display text-sm font-semibold">Recent Invoices</h2>
            <Link to="/client/invoices" className="flex items-center gap-1 text-xs text-primary hover:underline">
              View All <ArrowRight className="h-3 w-3" />
            </Link>
          </div>
          <div className="divide-y divide-border">
            {recentInvoices.map((inv) => (
              <Link key={inv.id} to={`/client/invoices/${inv.id}`} className="flex items-center justify-between px-5 py-3 text-sm hover:bg-muted/20 transition-colors">
                <div>
                  <p className="font-medium">{inv.id}</p>
                  <p className="text-xs text-muted-foreground">{inv.date}</p>
                </div>
                <div className="flex items-center gap-3">
                  <span className="font-medium">{inv.amount}</span>
                  <StatusBadge variant={inv.status} />
                </div>
              </Link>
            ))}
          </div>
        </div>

        {/* Recent Tickets */}
        {/* WHMCS: {foreach $tickets as $ticket} */}
        <div className="rounded-xl border bg-card">
          <div className="flex items-center justify-between border-b px-5 py-3.5">
            <h2 className="font-display text-sm font-semibold">Recent Tickets</h2>
            <Link to="/client/tickets" className="flex items-center gap-1 text-xs text-primary hover:underline">
              View All <ArrowRight className="h-3 w-3" />
            </Link>
          </div>
          <div className="divide-y divide-border">
            {recentTickets.map((tkt) => (
              <Link key={tkt.id} to={`/client/tickets/${tkt.id}`} className="flex items-center justify-between px-5 py-3 text-sm hover:bg-muted/20 transition-colors">
                <div>
                  <p className="font-medium">{tkt.subject}</p>
                  <p className="text-xs text-muted-foreground">{tkt.id} · {tkt.date}</p>
                </div>
                <StatusBadge variant={tkt.status} />
              </Link>
            ))}
          </div>
        </div>

        {/* Account Summary */}
        {/* WHMCS: {$clientsdetails} */}
        <SummaryPanel
          title="Account Summary"
          rows={[
            { label: "Name", value: "—" },
            { label: "Email", value: "—" },
            { label: "Company", value: "—" },
            { label: "Account Status", value: <StatusBadge variant="active" /> },
          ]}
          footer={
            <Link to="/client/profile" className="text-xs text-primary hover:underline">Edit Profile →</Link>
          }
        />
      </div>
    </ClientLayout>
  );
};

export default ClientDashboard;
