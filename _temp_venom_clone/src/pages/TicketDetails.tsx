/**
 * WHMCS Template Target: viewticket.tpl
 * Ticket Details — conversation thread with reply form.
 */
import { useParams, Link } from "react-router-dom";
import { Paperclip, Send } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import StatusBadge from "../components/client/StatusBadge";
import SummaryPanel from "../components/client/SummaryPanel";
import TicketConversation from "../components/client/TicketConversation";
import ActionBar from "../components/client/ActionBar";

/* WHMCS: {foreach $ticketreplies as $reply} */
const messages = [
  { id: "1", author: "User", isStaff: false, date: "Jun 19, 2025 10:30 AM", content: "I'm having trouble accessing my VPS control panel. The page loads but shows a blank screen after login. I've tried multiple browsers." },
  { id: "2", author: "Support Team", isStaff: true, date: "Jun 19, 2025 11:15 AM", content: "Thank you for reaching out. We've checked the server and everything appears to be running normally.\n\nCould you please try:\n1. Clear your browser cache\n2. Try an incognito/private window\n3. Check if any browser extensions might be interfering\n\nLet us know if the issue persists." },
  { id: "3", author: "User", isStaff: false, date: "Jun 20, 2025 09:00 AM", content: "Clearing the cache fixed it. Thank you for the quick response!" },
  { id: "4", author: "Support Team", isStaff: true, date: "Jun 20, 2025 09:30 AM", content: "Glad to hear that resolved the issue! If you experience any further problems, don't hesitate to reach out. We're here to help." },
];

const TicketDetails = () => {
  const { id } = useParams();
  const ticketId = id || "TKT-501";

  return (
    <ClientLayout>
      <PageHeader
        title="Cannot access control panel"
        subtitle={`Ticket ${ticketId}`}
        breadcrumbs={[
          { label: "Support Tickets", href: "/client/tickets" },
          { label: ticketId },
        ]}
        actions={
          <ActionBar>
            <button className="venom-btn-secondary text-sm py-2 px-3">Close Ticket</button>
          </ActionBar>
        }
      />

      <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
        <div className="lg:col-span-2 space-y-6">
          {/* WHMCS: {foreach $ticketreplies as $reply} */}
          <TicketConversation messages={messages} />

          {/* Reply form */}
          {/* WHMCS: Ticket reply form block */}
          <div className="rounded-xl border bg-card">
            <div className="border-b px-5 py-3.5">
              <h3 className="font-display text-sm font-semibold">Post Reply</h3>
            </div>
            <div className="p-5 space-y-4">
              <textarea
                rows={5}
                className="venom-input min-h-[120px] resize-y"
                placeholder="Type your reply…"
              />
              <div className="flex items-center justify-between">
                <button className="venom-btn-secondary text-sm py-2 px-3">
                  <Paperclip className="h-4 w-4" /> Attach File
                </button>
                <button className="venom-btn-primary text-sm py-2 px-3">
                  <Send className="h-4 w-4" /> Submit Reply
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* Sidebar */}
        <div className="space-y-4">
          {/* WHMCS: {$ticketinfo} */}
          <SummaryPanel
            title="Ticket Information"
            rows={[
              { label: "Ticket ID", value: <span className="font-mono text-xs">{ticketId}</span> },
              { label: "Department", value: "Technical Support" },
              { label: "Status", value: <StatusBadge variant="answered" /> },
              { label: "Priority", value: "Medium" },
              { label: "Created", value: "Jun 19, 2025" },
              { label: "Last Updated", value: "Jun 20, 2025" },
            ]}
          />
          <SummaryPanel
            title="Related Service"
            rows={[
              { label: "Service", value: <Link to="/client/services/SVC-001" className="text-xs text-primary hover:underline">VPS — Standard</Link> },
            ]}
          />
        </div>
      </div>
    </ClientLayout>
  );
};

export default TicketDetails;
