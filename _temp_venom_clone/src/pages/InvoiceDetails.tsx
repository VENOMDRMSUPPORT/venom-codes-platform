/**
 * WHMCS Template Target: viewinvoice.tpl
 * Invoice Details — full invoice view with line items, payment actions.
 */
import { useParams, Link } from "react-router-dom";
import { Download, CreditCard, Printer } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import InvoiceSummary from "../components/client/InvoiceSummary";
import SummaryPanel from "../components/client/SummaryPanel";
import ActionBar from "../components/client/ActionBar";
import AlertNotice from "../components/client/AlertNotice";

const InvoiceDetails = () => {
  const { id } = useParams();
  const invoiceId = id || "INV-1002";

  return (
    <ClientLayout>
      <PageHeader
        title={`Invoice #${invoiceId}`}
        breadcrumbs={[
          { label: "Invoices", href: "/client/invoices" },
          { label: invoiceId },
        ]}
        actions={
          <ActionBar>
            <button className="venom-btn-secondary text-sm py-2 px-3"><Printer className="h-4 w-4" /> Print</button>
            <button className="venom-btn-secondary text-sm py-2 px-3"><Download className="h-4 w-4" /> Download PDF</button>
            <button className="venom-btn-primary text-sm py-2 px-3"><CreditCard className="h-4 w-4" /> Pay Now</button>
          </ActionBar>
        }
      />

      {/* WHMCS: {if $status eq "Unpaid"} */}
      <div className="mb-6">
        <AlertNotice type="warning" title="Payment Due">
          This invoice is unpaid. Please make payment before the due date.
        </AlertNotice>
      </div>

      <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
        <div className="lg:col-span-2">
          {/* WHMCS: Invoice line items — {foreach $invoiceitems as $item} */}
          <InvoiceSummary
            invoiceNumber={invoiceId.replace("INV-", "")}
            date="2025-07-01"
            dueDate="2025-07-15"
            status="unpaid"
            items={[
              { description: "VPS Hosting — Standard Plan (01/07/2025 - 01/08/2025)", amount: "$29.99" },
              { description: "SSL Certificate — Annual", amount: "$12.99" },
            ]}
            subtotal="$42.98"
            tax="$0.00"
            total="$42.98"
          />
        </div>

        <div className="space-y-4">
          {/* WHMCS: {$paymentmethod}, {$invoicenum} */}
          <SummaryPanel
            title="Payment Information"
            rows={[
              { label: "Payment Method", value: "—" },
              { label: "Transaction ID", value: "—" },
              { label: "Invoice Date", value: "2025-07-01" },
              { label: "Due Date", value: "2025-07-15" },
            ]}
          />
          <SummaryPanel
            title="Billing Address"
            rows={[
              { label: "Name", value: "—" },
              { label: "Company", value: "—" },
              { label: "Address", value: "—" },
            ]}
          />
        </div>
      </div>
    </ClientLayout>
  );
};

export default InvoiceDetails;
