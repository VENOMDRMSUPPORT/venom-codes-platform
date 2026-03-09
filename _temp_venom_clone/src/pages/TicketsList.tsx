/**
 * WHMCS Template Target: supporttickets.tpl
 * Support Tickets List — all tickets with status filtering.
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

interface Ticket {
  id: string;
  subject: string;
  department: string;
  status: StatusVariant;
  lastReply: string;
  date: string;
}

/* WHMCS: {foreach $tickets as $ticket} */
const tickets: Ticket[] = [
  { id: "TKT-501", subject: "Cannot access control panel", department: "Technical Support", status: "answered", lastReply: "2025-06-20", date: "2025-06-19" },
  { id: "TKT-502", subject: "Billing inquiry about invoice #1002", department: "Billing", status: "open", lastReply: "2025-06-22", date: "2025-06-22" },
  { id: "TKT-503", subject: "Request for server migration", department: "Technical Support", status: "closed", lastReply: "2025-06-10", date: "2025-06-05" },
  { id: "TKT-504", subject: "Domain transfer assistance", department: "Sales", status: "pending", lastReply: "2025-06-25", date: "2025-06-25" },
];

const columns: Column<Ticket>[] = [
  { key: "id", header: "Ticket #", render: (r) => (
    <Link to={`/client/tickets/${r.id}`} className="font-mono text-xs text-primary hover:underline">{r.id}</Link>
  )},
  { key: "subject", header: "Subject", render: (r) => (
    <Link to={`/client/tickets/${r.id}`} className="font-medium hover:text-primary transition-colors">{r.subject}</Link>
  )},
  { key: "department", header: "Department", render: (r) => <span className="text-muted-foreground">{r.department}</span> },
  { key: "status", header: "Status", render: (r) => <StatusBadge variant={r.status} /> },
  { key: "lastReply", header: "Last Reply", render: (r) => <span className="text-muted-foreground">{r.lastReply}</span> },
];

const TicketsList = () => {
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);

  const filtered = tickets.filter((t) =>
    t.subject.toLowerCase().includes(search.toLowerCase()) ||
    t.id.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <ClientLayout>
      <PageHeader
        title="Support Tickets"
        subtitle="View and manage your support requests."
        breadcrumbs={[{ label: "Support Tickets" }]}
        actions={
          <Link to="/client/tickets/new" className="venom-btn-primary text-sm py-2 px-4 inline-flex items-center gap-2">
            <Plus className="h-4 w-4" /> Open Ticket
          </Link>
        }
      />

      <SearchFilterBar
        searchPlaceholder="Search tickets…"
        searchValue={search}
        onSearchChange={setSearch}
        filters={
          <>
            <select className="rounded-lg border bg-background px-3 py-2 text-sm">
              <option>All Statuses</option>
              <option>Open</option>
              <option>Answered</option>
              <option>Pending</option>
              <option>Closed</option>
            </select>
            <select className="rounded-lg border bg-background px-3 py-2 text-sm">
              <option>All Departments</option>
              <option>Technical Support</option>
              <option>Billing</option>
              <option>Sales</option>
            </select>
          </>
        }
      />

      <DataTable columns={columns} data={filtered} emptyMessage="No tickets found." />
      <ClientPagination currentPage={page} totalPages={1} onPageChange={setPage} />
    </ClientLayout>
  );
};

export default TicketsList;
