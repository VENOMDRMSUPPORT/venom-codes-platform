/**
 * WHMCS Template Target: clientareainvoices.tpl
 * Invoices List — all invoices with status filtering.
 */
import { useState } from "react";
import { Link } from "react-router-dom";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import DataTable, { Column } from "../components/client/DataTable";
import SearchFilterBar from "../components/client/SearchFilterBar";
import ClientPagination from "../components/client/Pagination";
import StatusBadge, { StatusVariant } from "../components/client/StatusBadge";

interface Invoice {
  id: string;
  date: string;
  dueDate: string;
  total: string;
  status: StatusVariant;
}

/* WHMCS: {foreach $invoices as $invoice} */
const invoices: Invoice[] = [
  { id: "INV-1001", date: "2025-06-01", dueDate: "2025-06-15", total: "$29.99", status: "paid" },
  { id: "INV-1002", date: "2025-07-01", dueDate: "2025-07-15", total: "$42.98", status: "unpaid" },
  { id: "INV-1003", date: "2025-05-01", dueDate: "2025-05-15", total: "$29.99", status: "paid" },
  { id: "INV-1004", date: "2025-04-01", dueDate: "2025-04-15", total: "$99.99", status: "paid" },
  { id: "INV-1005", date: "2025-03-01", dueDate: "2025-03-10", total: "$12.99", status: "overdue" },
];

const columns: Column<Invoice>[] = [
  { key: "id", header: "Invoice #", render: (r) => (
    <Link to={`/client/invoices/${r.id}`} className="font-medium text-primary hover:underline">{r.id}</Link>
  )},
  { key: "date", header: "Date", render: (r) => <span className="text-muted-foreground">{r.date}</span> },
  { key: "dueDate", header: "Due Date", render: (r) => <span className="text-muted-foreground">{r.dueDate}</span> },
  { key: "total", header: "Total", render: (r) => <span className="font-medium">{r.total}</span>, className: "text-right" },
  { key: "status", header: "Status", render: (r) => <StatusBadge variant={r.status} /> },
];

const InvoicesList = () => {
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);

  const filtered = invoices.filter((inv) =>
    inv.id.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <ClientLayout>
      <PageHeader
        title="Invoices"
        subtitle="View and manage your billing history."
        breadcrumbs={[{ label: "Invoices" }]}
      />

      <SearchFilterBar
        searchPlaceholder="Search invoices…"
        searchValue={search}
        onSearchChange={setSearch}
        filters={
          <select className="rounded-lg border bg-background px-3 py-2 text-sm">
            <option>All Statuses</option>
            <option>Paid</option>
            <option>Unpaid</option>
            <option>Overdue</option>
          </select>
        }
      />

      <DataTable columns={columns} data={filtered} emptyMessage="No invoices found." />
      <ClientPagination currentPage={page} totalPages={2} onPageChange={setPage} />
    </ClientLayout>
  );
};

export default InvoicesList;
