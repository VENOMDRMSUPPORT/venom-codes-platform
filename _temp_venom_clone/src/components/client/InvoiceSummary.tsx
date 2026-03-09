/**
 * WHMCS Mapping: viewinvoice.tpl — invoice summary block
 * Displays invoice header info and line items total.
 */
import StatusBadge, { StatusVariant } from "./StatusBadge";

interface InvoiceLineItem {
  description: string;
  amount: string;
}

interface InvoiceSummaryProps {
  invoiceNumber: string;
  date: string;
  dueDate: string;
  status: StatusVariant;
  items: InvoiceLineItem[];
  subtotal: string;
  tax?: string;
  total: string;
}

const InvoiceSummary = ({ invoiceNumber, date, dueDate, status, items, subtotal, tax, total }: InvoiceSummaryProps) => {
  return (
    <div className="rounded-xl border bg-card overflow-hidden">
      {/* Header */}
      <div className="flex flex-col gap-2 border-b px-5 py-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h3 className="font-display text-sm font-semibold">Invoice #{invoiceNumber}</h3>
          <p className="mt-0.5 text-xs text-muted-foreground">
            Issued: {date} · Due: {dueDate}
          </p>
        </div>
        <StatusBadge variant={status} />
      </div>

      {/* Line items */}
      <div className="divide-y divide-border">
        {items.map((item, i) => (
          <div key={i} className="flex items-center justify-between px-5 py-3 text-sm">
            <span className="text-muted-foreground">{item.description}</span>
            <span className="font-medium">{item.amount}</span>
          </div>
        ))}
      </div>

      {/* Totals */}
      <div className="border-t bg-muted/20">
        <div className="flex items-center justify-between px-5 py-2.5 text-sm">
          <span className="text-muted-foreground">Subtotal</span>
          <span>{subtotal}</span>
        </div>
        {tax && (
          <div className="flex items-center justify-between px-5 py-2.5 text-sm">
            <span className="text-muted-foreground">Tax</span>
            <span>{tax}</span>
          </div>
        )}
        <div className="flex items-center justify-between border-t px-5 py-3 text-sm font-semibold">
          <span>Total</span>
          <span className="font-display text-base">{total}</span>
        </div>
      </div>
    </div>
  );
};

export default InvoiceSummary;
