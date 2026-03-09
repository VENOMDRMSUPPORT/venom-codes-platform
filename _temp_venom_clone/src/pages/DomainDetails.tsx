/**
 * WHMCS Template Target: clientareadomaindetails.tpl
 * Domain Details — DNS, nameservers, registrar lock, contact info.
 */
import { useParams, Link } from "react-router-dom";
import { RefreshCw, Lock, Shield } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import SummaryPanel from "../components/client/SummaryPanel";
import StatusBadge from "../components/client/StatusBadge";
import ClientTabs from "../components/client/ClientTabs";
import ActionBar from "../components/client/ActionBar";
import FormSection, { FormField } from "../components/client/FormSection";
import AlertNotice from "../components/client/AlertNotice";

const DomainDetails = () => {
  const { id } = useParams();

  return (
    <ClientLayout>
      <PageHeader
        title="example.com"
        subtitle={`Domain ID: ${id || "DOM-001"}`}
        breadcrumbs={[
          { label: "Domains", href: "/client/domains" },
          { label: "example.com" },
        ]}
        actions={
          <ActionBar>
            <button className="venom-btn-secondary text-sm py-2 px-3"><RefreshCw className="h-4 w-4" /> Renew</button>
            <button className="venom-btn-primary text-sm py-2 px-3"><Lock className="h-4 w-4" /> Manage</button>
          </ActionBar>
        }
      />

      <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
        <div className="lg:col-span-2">
          <ClientTabs
            tabs={[
              {
                id: "overview",
                label: "Overview",
                content: (
                  <div className="space-y-6">
                    {/* WHMCS: {$domain}, {$registrationdate}, {$expirydate} */}
                    <SummaryPanel
                      title="Domain Information"
                      rows={[
                        { label: "Domain Name", value: <span className="font-mono text-sm">example.com</span> },
                        { label: "Status", value: <StatusBadge variant="active" /> },
                        { label: "Registration Date", value: "—" },
                        { label: "Expiry Date", value: "—" },
                        { label: "Auto Renew", value: <span className="text-emerald-600 dark:text-emerald-400 text-xs font-medium">Enabled</span> },
                        { label: "Registrar Lock", value: <StatusBadge variant="active" label="Locked" /> },
                      ]}
                    />
                  </div>
                ),
              },
              {
                id: "nameservers",
                label: "Nameservers",
                content: (
                  <FormSection
                    title="Nameservers"
                    description="Configure the nameservers for your domain."
                    actions={<button className="venom-btn-primary text-sm py-2 px-3">Update Nameservers</button>}
                  >
                    {[1, 2, 3, 4].map((n) => (
                      <FormField key={n} label={`Nameserver ${n}`} htmlFor={`ns${n}`}>
                        <input type="text" id={`ns${n}`} className="venom-input font-mono text-sm" placeholder={`ns${n}.example.com`} />
                      </FormField>
                    ))}
                  </FormSection>
                ),
              },
              {
                id: "dns",
                label: "DNS Management",
                content: (
                  <div className="rounded-xl border border-dashed bg-card p-10 text-center">
                    <Shield className="mx-auto mb-3 h-8 w-8 text-muted-foreground" />
                    <p className="text-sm font-semibold">DNS Management</p>
                    <p className="mt-1 text-xs text-muted-foreground">Manage DNS records for this domain.</p>
                    <button className="venom-btn-primary text-sm py-2 px-4 mt-4">Manage DNS</button>
                  </div>
                ),
              },
              {
                id: "contact",
                label: "Contact Info",
                content: (
                  <FormSection
                    title="WHOIS Contact Information"
                    description="Update the registrant contact details for this domain."
                    actions={
                      <>
                        <button className="venom-btn-secondary text-sm py-2 px-3">Cancel</button>
                        <button className="venom-btn-primary text-sm py-2 px-3">Save Contact</button>
                      </>
                    }
                  >
                    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
                      <FormField label="First Name" required><input className="venom-input" placeholder="—" /></FormField>
                      <FormField label="Last Name" required><input className="venom-input" placeholder="—" /></FormField>
                    </div>
                    <FormField label="Email" required><input type="email" className="venom-input" placeholder="—" /></FormField>
                    <FormField label="Organization"><input className="venom-input" placeholder="—" /></FormField>
                    <FormField label="Phone" required><input type="tel" className="venom-input" placeholder="—" /></FormField>
                  </FormSection>
                ),
              },
            ]}
          />
        </div>

        <div className="space-y-4">
          <SummaryPanel
            title="Quick Actions"
            rows={[
              { label: "Transfer Away", value: <Link to="#" className="text-xs text-primary hover:underline">Get EPP Code</Link> },
              { label: "ID Protection", value: <span className="text-xs text-muted-foreground">—</span> },
              { label: "Email Forwarding", value: <Link to="#" className="text-xs text-primary hover:underline">Configure</Link> },
            ]}
          />
          <AlertNotice type="info">
            Domain changes may take up to 48 hours to propagate globally.
          </AlertNotice>
        </div>
      </div>
    </ClientLayout>
  );
};

export default DomainDetails;
