import { useState } from "react";
import { ChevronDown } from "lucide-react";

const faqs = [
  {
    q: "How fast is license activation?",
    a: "Licenses activate instantly — typically within 30 seconds of purchase. No manual review or approval process is required.",
  },
  {
    q: "Can I upgrade my plan later?",
    a: "Yes. You can upgrade from Trial to Pro or Ultra at any time. Your existing deployment stays online during the transition with zero downtime.",
  },
  {
    q: "What happens when my license expires?",
    a: "You'll receive reminders before expiration. If not renewed, your license will gracefully deactivate. Your data and configurations are preserved for 30 days.",
  },
  {
    q: "How do load balancers work?",
    a: "Pro includes 1 load balancer. Additional ones cost $15/mo each. Ultra includes unlimited load balancers at no extra cost. All provisioned instantly.",
  },
  {
    q: "Is there a refund policy?",
    a: "Please refer to our Terms of Service for details on our refund and cancellation policy.",
  },
  {
    q: "Do you offer custom plans?",
    a: "Please contact our team to discuss your specific requirements. We can work with you to find the right solution for your needs.",
  },
];

const FAQ = () => {
  const [open, setOpen] = useState<number | null>(null);

  return (
    <section id="faq" className="venom-section bg-surface-sunken">
      <div className="venom-container">
        <div className="mx-auto max-w-2xl text-center mb-16">
          <span className="venom-badge mb-4">FAQ</span>
          <h2 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">
            Frequently Asked Questions
          </h2>
        </div>

        <div className="mx-auto max-w-3xl space-y-3">
          {faqs.map((faq, i) => (
            <div key={i} className="rounded-xl border bg-card overflow-hidden">
              <button
                onClick={() => setOpen(open === i ? null : i)}
                className="flex w-full items-center justify-between p-5 text-left"
              >
                <span className="font-display text-sm font-semibold pr-4">{faq.q}</span>
                <ChevronDown
                  className={`h-4 w-4 shrink-0 text-muted-foreground transition-transform duration-200 ${open === i ? "rotate-180" : ""}`}
                />
              </button>
              <div
                className={`faq-answer transition-all duration-200 overflow-hidden ${
                  open === i ? "max-h-40 opacity-100" : "max-h-0 opacity-0"
                }`}
              >
                <p className="px-5 pb-5 text-sm text-muted-foreground leading-relaxed">{faq.a}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default FAQ;
