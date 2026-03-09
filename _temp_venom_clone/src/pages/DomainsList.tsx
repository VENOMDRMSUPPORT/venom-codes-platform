/**
 * WHMCS Template Target: clientareadomains.tpl
 * Domains List — registered/transferred domains with management.
 */
import { useState } from "react";
import { Link } from "react-router-dom";
import { Plus } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import DataTable, { Column } from "../components/client/DataTable";
import SearchFilterBar from "../components/client/SearchFilterBar";
import ClientPagination from "../components/client/Pagination";
import StatusBadge, { StatusVariant } from "../components/client/StatusBadge";

interface Domain {
  id: string;
  domain: string;
  registrationDate: string;
  expiryDate: string;
  status: StatusVariant;
  autoRenew: boolean;
}

/* WHMCS: {foreach $domains as $domain} */
const domains: Domain[] = [
  { id: "DOM-001", domain: "example.com", registrationDate: "2024-01-15", expiryDate: "2026-01-15", status: "active", autoRenew: true },
  { id: "DOM-002", domain: "example.net", registrationDate: "2024-03-20", expiryDate: "2025-03-20", status: "active", autoRenew: false },
  { id: "DOM-003", domain: "mysite.org", registrationDate: "2023-06-10", expiryDate: "2025-06-10", status: "pending", autoRenew: true },
];

const columns: Column<Domain>[] = [
  { key: "domain", header: "Domain", render: (r) => (
    <Link to={`/client/domains/${r.id}`} className="font-medium text-primary hover:underline">{r.domain}</Link>
  )},
  { key: "registration", header: "Registered", render: (r) => <span className="text-muted-foreground">{r.registrationDate}</span> },
  { key: "expiry", header: "Expires", render: (r) => <span className="text-muted-foreground">{r.expiryDate}</span> },
  { key: "autoRenew", header: "Auto Renew", render: (r) => (
    <span className={`text-xs font-medium ${r.autoRenew ? "text-emerald-600 dark:text-emerald-400" : "text-muted-foreground"}`}>
      {r.autoRenew ? "On" : "Off"}
    </span>
  )},
  { key: "status", header: "Status", render: (r) => <StatusBadge variant={r.status} /> },
];

const DomainsList = () => {
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);

  const filtered = domains.filter((d) =>
    d.domain.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <ClientLayout>
      <PageHeader
        title="My Domains"
        subtitle="Manage your registered domains."
        breadcrumbs={[{ label: "Domains" }]}
        actions={
          <div className="flex gap-2">
            <button className="venom-btn-secondary text-sm py-2 px-4">Transfer Domain</button>
            <button className="venom-btn-primary text-sm py-2 px-4">
              <Plus className="h-4 w-4" /> Register New
            </button>
          </div>
        }
      />

      <SearchFilterBar
        searchPlaceholder="Search domains…"
        searchValue={search}
        onSearchChange={setSearch}
        filters={
          <select className="rounded-lg border bg-background px-3 py-2 text-sm">
            <option>All Statuses</option>
            <option>Active</option>
            <option>Pending</option>
            <option>Expired</option>
          </select>
        }
      />

      <DataTable columns={columns} data={filtered} emptyMessage="No domains found." />
      <ClientPagination currentPage={page} totalPages={1} onPageChange={setPage} />
    </ClientLayout>
  );
};

export default DomainsList;
