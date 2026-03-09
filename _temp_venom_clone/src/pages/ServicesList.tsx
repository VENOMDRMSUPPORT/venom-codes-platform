/**
 * WHMCS Template Target: clientareaproducts.tpl
 * Services List — all active/inactive services with filtering.
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

interface Service {
  id: string;
  product: string;
  hostname: string;
  status: StatusVariant;
  billingCycle: string;
  nextDue: string;
  amount: string;
}

/* WHMCS: {foreach $services as $service} — placeholder data */
const services: Service[] = [
  { id: "SVC-001", product: "VPS — Standard", hostname: "vps1.example.com", status: "active", billingCycle: "Monthly", nextDue: "2025-08-01", amount: "$29.99" },
  { id: "SVC-002", product: "Dedicated Server", hostname: "ded1.example.com", status: "pending", billingCycle: "Monthly", nextDue: "2025-07-15", amount: "$99.99" },
  { id: "SVC-003", product: "SSL Certificate", hostname: "—", status: "active", billingCycle: "Annually", nextDue: "2026-01-15", amount: "$12.99" },
  { id: "SVC-004", product: "VPS — Pro", hostname: "vps2.example.com", status: "suspended", billingCycle: "Monthly", nextDue: "2025-06-01", amount: "$59.99" },
  { id: "SVC-005", product: "Web Hosting", hostname: "web1.example.com", status: "cancelled", billingCycle: "Annually", nextDue: "—", amount: "$49.99" },
];

const columns: Column<Service>[] = [
  { key: "product", header: "Product/Service", render: (r) => (
    <Link to={`/client/services/${r.id}`} className="font-medium text-primary hover:underline">{r.product}</Link>
  )},
  { key: "hostname", header: "Hostname", render: (r) => <span className="font-mono text-xs text-muted-foreground">{r.hostname}</span> },
  { key: "status", header: "Status", render: (r) => <StatusBadge variant={r.status} /> },
  { key: "cycle", header: "Billing Cycle", render: (r) => <span className="text-muted-foreground">{r.billingCycle}</span> },
  { key: "nextDue", header: "Next Due", render: (r) => <span className="text-muted-foreground">{r.nextDue}</span> },
  { key: "amount", header: "Amount", render: (r) => r.amount, className: "text-right font-medium" },
];

const ServicesList = () => {
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);

  const filtered = services.filter((s) =>
    s.product.toLowerCase().includes(search.toLowerCase()) ||
    s.hostname.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <ClientLayout>
      <PageHeader
        title="My Services"
        subtitle="Manage your active products and services."
        breadcrumbs={[{ label: "Services" }]}
        actions={
          <button className="venom-btn-primary text-sm py-2 px-4">
            <Plus className="h-4 w-4" /> Order New
          </button>
        }
      />

      <SearchFilterBar
        searchPlaceholder="Search services…"
        searchValue={search}
        onSearchChange={setSearch}
        filters={
          <select className="rounded-lg border bg-background px-3 py-2 text-sm">
            <option>All Statuses</option>
            <option>Active</option>
            <option>Pending</option>
            <option>Suspended</option>
            <option>Cancelled</option>
          </select>
        }
      />

      <DataTable columns={columns} data={filtered} emptyMessage="No services found." />
      <ClientPagination currentPage={page} totalPages={3} onPageChange={setPage} />
    </ClientLayout>
  );
};

export default ServicesList;
