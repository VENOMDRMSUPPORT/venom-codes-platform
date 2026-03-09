/**
 * WHMCS Template Targets:
 *   - clientareacreditcard.tpl (Payment Methods tab)
 *   - addfunds.tpl (Add Funds tab)
 *   - clientareatransactions.tpl (Transaction History tab)
 * Combined into a single Billing page with tabs for cleaner UX.
 */
import { useState } from "react";
import { CreditCard, Plus, Wallet, Trash2, DollarSign, ArrowDownLeft, ArrowUpRight } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import StatCard from "../components/client/StatCard";
import ClientTabs from "../components/client/ClientTabs";
import SummaryPanel from "../components/client/SummaryPanel";
import StatusBadge from "../components/client/StatusBadge";
import DataTable, { Column } from "../components/client/DataTable";
import SearchFilterBar from "../components/client/SearchFilterBar";
import ClientPagination from "../components/client/Pagination";
import FormSection, { FormField } from "../components/client/FormSection";
import AlertNotice from "../components/client/AlertNotice";

/* ── Payment Methods (placeholder) ── */
/* WHMCS: {foreach $paymentmethods as $method} */
const paymentMethods = [
  { id: "PM-1", type: "Visa", last4: "4242", expiry: "12/2026", isDefault: true },
  { id: "PM-2", type: "PayPal", last4: "user@example.com", expiry: "—", isDefault: false },
];

/* ── Transaction History (placeholder) ── */
/* WHMCS: {foreach $transactions as $transaction} */
interface Transaction {
  id: string;
  date: string;
  description: string;
  amount: string;
  type: "payment" | "credit" | "refund";
  invoiceId?: string;
}

const transactions: Transaction[] = [
  { id: "TXN-3001", date: "2025-07-01", description: "Invoice #INV-1002 Payment", amount: "$42.98", type: "payment", invoiceId: "INV-1002" },
  { id: "TXN-3002", date: "2025-06-15", description: "Account Credit Added", amount: "$50.00", type: "credit" },
  { id: "TXN-3003", date: "2025-06-01", description: "Invoice #INV-1001 Payment", amount: "$29.99", type: "payment", invoiceId: "INV-1001" },
  { id: "TXN-3004", date: "2025-05-20", description: "Refund — Cancelled Service", amount: "$12.99", type: "refund" },
  { id: "TXN-3005", date: "2025-05-01", description: "Invoice #INV-1003 Payment", amount: "$29.99", type: "payment", invoiceId: "INV-1003" },
];

const txnColumns: Column<Transaction>[] = [
  { key: "date", header: "Date", render: (r) => <span className="text-muted-foreground">{r.date}</span> },
  { key: "id", header: "Transaction", render: (r) => <span className="font-mono text-xs">{r.id}</span> },
  { key: "description", header: "Description", render: (r) => (
    <span className="font-medium">{r.description}</span>
  )},
  { key: "type", header: "Type", render: (r) => {
    const icon = r.type === "refund"
      ? <ArrowDownLeft className="h-3 w-3" />
      : r.type === "credit"
      ? <ArrowDownLeft className="h-3 w-3" />
      : <ArrowUpRight className="h-3 w-3" />;
    const variant = r.type === "refund" ? "warning" : r.type === "credit" ? "info" : "paid";
    return <StatusBadge variant={variant} label={r.type.charAt(0).toUpperCase() + r.type.slice(1)} />;
  }},
  { key: "amount", header: "Amount", render: (r) => (
    <span className={`font-medium ${r.type === "refund" ? "text-amber-600 dark:text-amber-400" : ""}`}>
      {r.type === "refund" ? `-${r.amount}` : r.amount}
    </span>
  ), className: "text-right" },
];

const BillingPage = () => {
  const [txnSearch, setTxnSearch] = useState("");
  const [txnPage, setTxnPage] = useState(1);

  const filteredTxns = transactions.filter((t) =>
    t.description.toLowerCase().includes(txnSearch.toLowerCase()) ||
    t.id.toLowerCase().includes(txnSearch.toLowerCase())
  );

  return (
    <ClientLayout>
      <PageHeader
        title="Billing"
        subtitle="Manage your payment methods, funds, and transaction history."
        breadcrumbs={[{ label: "Billing" }]}
      />

      {/* WHMCS: Billing overview stats */}
      <div className="mb-6 grid grid-cols-1 gap-4 sm:grid-cols-3">
        <StatCard icon={<Wallet className="h-5 w-5" />} label="Account Credit" value="—" />
        <StatCard icon={<CreditCard className="h-5 w-5" />} label="Payment Methods" value={String(paymentMethods.length)} />
        <StatCard icon={<DollarSign className="h-5 w-5" />} label="Total Transactions" value={String(transactions.length)} />
      </div>

      <ClientTabs
        tabs={[
          /* ── Tab 1: Payment Methods ── */
          /* WHMCS: clientareacreditcard.tpl */
          {
            id: "methods",
            label: "Payment Methods",
            count: paymentMethods.length,
            content: (
              <div className="space-y-4">
                <AlertNotice type="info">
                  Your default payment method is used for automatic invoice payments and renewals.
                </AlertNotice>

                {/* WHMCS: {foreach $paymentmethods as $method} */}
                <div className="space-y-3">
                  {paymentMethods.map((pm) => (
                    <div key={pm.id} className="flex items-center justify-between rounded-xl border bg-card p-4">
                      <div className="flex items-center gap-4">
                        <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary">
                          <CreditCard className="h-5 w-5" />
                        </div>
                        <div>
                          <p className="text-sm font-semibold">
                            {pm.type} {pm.last4.includes("@") ? "" : `•••• ${pm.last4}`}
                            {pm.isDefault && (
                              <span className="ml-2 rounded bg-primary/10 px-1.5 py-0.5 text-[10px] font-semibold text-primary">
                                Default
                              </span>
                            )}
                          </p>
                          <p className="text-xs text-muted-foreground">
                            {pm.last4.includes("@") ? pm.last4 : `Expires ${pm.expiry}`}
                          </p>
                        </div>
                      </div>
                      <div className="flex items-center gap-2">
                        {!pm.isDefault && (
                          <button className="text-xs text-primary hover:underline">Set Default</button>
                        )}
                        <button className="rounded-lg p-2 text-muted-foreground hover:bg-destructive/10 hover:text-destructive transition-colors" aria-label="Remove">
                          <Trash2 className="h-4 w-4" />
                        </button>
                      </div>
                    </div>
                  ))}
                </div>

                {/* Add new method */}
                <FormSection
                  title="Add Payment Method"
                  description="Add a new credit card or payment method to your account."
                  actions={
                    <button className="venom-btn-primary text-sm py-2 px-4">
                      <Plus className="h-4 w-4" /> Add Method
                    </button>
                  }
                >
                  <FormField label="Card Number" htmlFor="cardnumber" required>
                    <input type="text" id="cardnumber" className="venom-input font-mono" placeholder="•••• •••• •••• ••••" />
                  </FormField>
                  <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
                    <FormField label="Expiry Date" htmlFor="expiry" required>
                      <input type="text" id="expiry" className="venom-input" placeholder="MM/YY" />
                    </FormField>
                    <FormField label="CVV" htmlFor="cvv" required>
                      <input type="text" id="cvv" className="venom-input" placeholder="•••" />
                    </FormField>
                    <FormField label="Cardholder Name" htmlFor="cardholder" required>
                      <input type="text" id="cardholder" className="venom-input" placeholder="Name on card" />
                    </FormField>
                  </div>
                </FormSection>
              </div>
            ),
          },

          /* ── Tab 2: Add Funds ── */
          /* WHMCS: addfunds.tpl */
          {
            id: "funds",
            label: "Add Funds",
            content: (
              <div className="mx-auto max-w-lg space-y-6">
                <SummaryPanel
                  title="Current Balance"
                  rows={[
                    { label: "Account Credit", value: <span className="font-display text-lg font-bold">—</span> },
                  ]}
                />

                <FormSection
                  title="Add Funds to Account"
                  description="Add credit to your account for future invoices and purchases."
                  actions={
                    <button className="venom-btn-primary text-sm py-2 px-4">
                      <Wallet className="h-4 w-4" /> Add Funds
                    </button>
                  }
                >
                  <FormField label="Amount" htmlFor="amount" required hint="Minimum: $10.00. Maximum: $1,000.00.">
                    <div className="relative">
                      <span className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground font-medium">$</span>
                      <input
                        type="number"
                        id="amount"
                        className="venom-input pl-7"
                        placeholder="0.00"
                        min="10"
                        max="1000"
                        step="0.01"
                      />
                    </div>
                  </FormField>
                  <FormField label="Payment Method" htmlFor="fund-method" required>
                    <select id="fund-method" className="venom-input">
                      <option>Visa •••• 4242 (Default)</option>
                      <option>PayPal — user@example.com</option>
                    </select>
                  </FormField>
                </FormSection>

                <AlertNotice type="info">
                  Account credit is applied automatically to new invoices. Unused credit does not expire.
                </AlertNotice>
              </div>
            ),
          },

          /* ── Tab 3: Transaction History ── */
          /* WHMCS: clientareatransactions.tpl */
          {
            id: "transactions",
            label: "Transactions",
            count: transactions.length,
            content: (
              <div>
                <SearchFilterBar
                  searchPlaceholder="Search transactions…"
                  searchValue={txnSearch}
                  onSearchChange={setTxnSearch}
                  filters={
                    <select className="rounded-lg border bg-background px-3 py-2 text-sm">
                      <option>All Types</option>
                      <option>Payment</option>
                      <option>Credit</option>
                      <option>Refund</option>
                    </select>
                  }
                />
                <DataTable columns={txnColumns} data={filteredTxns} emptyMessage="No transactions found." />
                <ClientPagination currentPage={txnPage} totalPages={2} onPageChange={setTxnPage} />
              </div>
            ),
          },
        ]}
      />
    </ClientLayout>
  );
};

export default BillingPage;
