/**
 * WHMCS Template Target: clientareaproductdetails.tpl
 * Service Details — individual service info, actions, and related items.
 */
import { Link, useParams } from "react-router-dom";
import { Power, RefreshCw, Settings, Terminal } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import SummaryPanel from "../components/client/SummaryPanel";
import StatusBadge from "../components/client/StatusBadge";
import ActionBar from "../components/client/ActionBar";
import ClientTabs from "../components/client/ClientTabs";
import AlertNotice from "../components/client/AlertNotice";

const ServiceDetails = () => {
  const { id } = useParams();

  return (
    <ClientLayout>
      <PageHeader
        title="VPS — Standard"
        subtitle={`Service ID: ${id || "SVC-001"}`}
        breadcrumbs={[
          { label: "Services", href: "/client/services" },
          { label: id || "SVC-001" },
        ]}
        actions={
          <ActionBar>
            <button className="venom-btn-secondary text-sm py-2 px-3"><RefreshCw className="h-4 w-4" /> Restart</button>
            <button className="venom-btn-secondary text-sm py-2 px-3"><Power className="h-4 w-4" /> Stop</button>
            <button className="venom-btn-primary text-sm py-2 px-3"><Terminal className="h-4 w-4" /> Console</button>
          </ActionBar>
        }
      />

      {/* WHMCS: {if $status eq "Suspended"} */}
      <div className="mb-6">
        <AlertNotice type="info">
          This service is currently active. Manage it using the controls above.
        </AlertNotice>
      </div>

      <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {/* Main content */}
        <div className="lg:col-span-2">
          <ClientTabs
            tabs={[
              {
                id: "overview",
                label: "Overview",
                content: (
                  <div className="space-y-6">
                    {/* WHMCS: {$product}, {$domain}, {$billingcycle}, etc. */}
                    <SummaryPanel
                      title="Service Information"
                      rows={[
                        { label: "Product", value: "VPS — Standard" },
                        { label: "Hostname", value: <span className="font-mono text-xs">vps1.example.com</span> },
                        { label: "Primary IP", value: <span className="font-mono text-xs">—</span> },
                        { label: "Status", value: <StatusBadge variant="active" /> },
                        { label: "Registration Date", value: "—" },
                        { label: "Next Due Date", value: "—" },
                      ]}
                    />
                    <SummaryPanel
                      title="Server Configuration"
                      rows={[
                        { label: "Operating System", value: "—" },
                        { label: "CPU Cores", value: "—" },
                        { label: "RAM", value: "—" },
                        { label: "Storage", value: "—" },
                        { label: "Bandwidth", value: "—" },
                      ]}
                    />
                  </div>
                ),
              },
              {
                id: "billing",
                label: "Billing",
                content: (
                  <SummaryPanel
                    title="Billing Details"
                    rows={[
                      { label: "Billing Cycle", value: "Monthly" },
                      { label: "Amount", value: "$29.99/mo" },
                      { label: "Payment Method", value: "—" },
                      { label: "Next Invoice", value: "—" },
                    ]}
                    footer={
                      <div className="flex gap-2">
                        <button className="venom-btn-secondary text-xs py-1.5 px-3">Change Cycle</button>
                        <button className="venom-btn-secondary text-xs py-1.5 px-3">Cancel Service</button>
                      </div>
                    }
                  />
                ),
              },
              {
                id: "addons",
                label: "Addons",
                content: (
                  <div className="rounded-xl border border-dashed bg-card p-10 text-center">
                    <Settings className="mx-auto mb-3 h-8 w-8 text-muted-foreground" />
                    <p className="text-sm text-muted-foreground">No addons configured for this service.</p>
                    <button className="venom-btn-primary text-sm py-2 px-4 mt-4">Browse Addons</button>
                  </div>
                ),
              },
            ]}
          />
        </div>

        {/* Sidebar */}
        <div className="space-y-4">
          <SummaryPanel
            title="Quick Actions"
            rows={[
              { label: "Upgrade/Downgrade", value: <Link to="#" className="text-xs text-primary hover:underline">Change Plan</Link> },
              { label: "Request Cancellation", value: <Link to="#" className="text-xs text-primary hover:underline">Cancel</Link> },
              { label: "View Invoices", value: <Link to="/client/invoices" className="text-xs text-primary hover:underline">Invoices</Link> },
            ]}
          />
          <SummaryPanel
            title="Related Tickets"
            rows={[]}
            footer={
              <Link to="/client/tickets" className="text-xs text-primary hover:underline">Open Support Ticket →</Link>
            }
          />
        </div>
      </div>
    </ClientLayout>
  );
};

export default ServiceDetails;
