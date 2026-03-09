/**
 * WHMCS Template Target: submitticket.tpl
 * Open New Ticket — ticket submission form with department, priority, file attachment.
 */
import { useState } from "react";
import { Paperclip, Send } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import FormSection, { FormField } from "../components/client/FormSection";
import AlertNotice from "../components/client/AlertNotice";

const OpenTicket = () => {
  const [department, setDepartment] = useState("");

  return (
    <ClientLayout>
      <PageHeader
        title="Open New Ticket"
        subtitle="Submit a support request to our team."
        breadcrumbs={[
          { label: "Support Tickets", href: "/client/tickets" },
          { label: "New Ticket" },
        ]}
      />

      <div className="mx-auto max-w-2xl">
        <AlertNotice type="info">
          Please check the <a href="/knowledge-base" className="underline font-semibold">Knowledge Base</a> before opening a ticket — your question may already be answered.
        </AlertNotice>

        <div className="mt-6">
          {/* WHMCS: {foreach $departments as $dept} */}
          <FormSection
            title="Ticket Details"
            description="Provide as much detail as possible so we can assist you quickly."
            actions={
              <button className="venom-btn-primary text-sm py-2 px-4">
                <Send className="h-4 w-4" /> Submit Ticket
              </button>
            }
          >
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <FormField label="Department" htmlFor="department" required>
                <select
                  id="department"
                  className="venom-input"
                  value={department}
                  onChange={(e) => setDepartment(e.target.value)}
                >
                  <option value="">— Select Department —</option>
                  <option value="technical">Technical Support</option>
                  <option value="billing">Billing</option>
                  <option value="sales">Sales</option>
                </select>
              </FormField>
              <FormField label="Priority" htmlFor="priority" required>
                <select id="priority" className="venom-input">
                  <option>Low</option>
                  <option selected>Medium</option>
                  <option>High</option>
                </select>
              </FormField>
            </div>

            {/* WHMCS: Related service selector — {foreach $services as $service} */}
            <FormField label="Related Service" htmlFor="service" hint="Optional — link this ticket to a specific service.">
              <select id="service" className="venom-input">
                <option value="">— None —</option>
                <option>VPS — Standard (SVC-001)</option>
                <option>Dedicated Server (SVC-002)</option>
              </select>
            </FormField>

            <FormField label="Subject" htmlFor="subject" required>
              <input type="text" id="subject" className="venom-input" placeholder="Brief summary of your issue" />
            </FormField>

            <FormField label="Message" htmlFor="message" required>
              <textarea
                id="message"
                rows={6}
                className="venom-input min-h-[150px] resize-y"
                placeholder="Describe your issue in detail…"
              />
            </FormField>

            <FormField label="Attachments" hint="Max file size: 10MB. Allowed types: jpg, png, pdf, txt, zip.">
              <div className="flex items-center gap-3">
                <label className="venom-btn-secondary text-sm py-2 px-3 cursor-pointer">
                  <Paperclip className="h-4 w-4" /> Choose File
                  <input type="file" className="hidden" />
                </label>
                <span className="text-xs text-muted-foreground">No file selected</span>
              </div>
            </FormField>
          </FormSection>
        </div>
      </div>
    </ClientLayout>
  );
};

export default OpenTicket;
