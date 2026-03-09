import { useState } from "react";
import { Send, Mail, User, MessageSquare, AlertCircle, CheckCircle2 } from "lucide-react";
import { z } from "zod";
import PageLayout from "../components/PageLayout";

const contactSchema = z.object({
  name: z.string().trim().min(1, "Name is required").max(100, "Name must be under 100 characters"),
  email: z.string().trim().email("Please enter a valid email address").max(255, "Email must be under 255 characters"),
  subject: z.string().trim().min(1, "Subject is required").max(200, "Subject must be under 200 characters"),
  message: z.string().trim().min(10, "Message must be at least 10 characters").max(2000, "Message must be under 2000 characters"),
});

type ContactForm = z.infer<typeof contactSchema>;
type FormErrors = Partial<Record<keyof ContactForm, string>>;

const Contact = () => {
  const [form, setForm] = useState<ContactForm>({ name: "", email: "", subject: "", message: "" });
  const [errors, setErrors] = useState<FormErrors>({});
  const [submitted, setSubmitted] = useState(false);

  const handleChange = (field: keyof ContactForm, value: string) => {
    setForm((prev) => ({ ...prev, [field]: value }));
    if (errors[field]) setErrors((prev) => ({ ...prev, [field]: undefined }));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const result = contactSchema.safeParse(form);
    if (!result.success) {
      const fieldErrors: FormErrors = {};
      result.error.errors.forEach((err) => {
        const field = err.path[0] as keyof ContactForm;
        if (!fieldErrors[field]) fieldErrors[field] = err.message;
      });
      setErrors(fieldErrors);
      return;
    }
    setErrors({});
    setSubmitted(true);
  };

  return (
    <PageLayout>
      <div className="venom-section pt-32">
        <div className="venom-container">
          <div className="mx-auto max-w-2xl">
            <div className="text-center mb-12">
              <span className="venom-badge mb-4">Support</span>
              <h1 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">Contact Us</h1>
              <p className="mt-4 text-muted-foreground">
                Have a question about our software licensing or infrastructure services? We're here to help.
              </p>
            </div>

            {submitted ? (
              <div className="venom-card text-center py-12">
                <div className="mx-auto inline-flex rounded-full p-4 mb-4" style={{ background: "hsl(var(--accent-muted))" }}>
                  <CheckCircle2 className="h-8 w-8 text-primary" />
                </div>
                <h2 className="font-display text-xl font-bold mb-2">Message Sent</h2>
                <p className="text-sm text-muted-foreground max-w-sm mx-auto">
                  Thank you for reaching out. Our support team will get back to you as soon as possible.
                </p>
              </div>
            ) : (
              <div className="venom-card">
                <form onSubmit={handleSubmit} className="space-y-5" noValidate>
                  <div className="grid gap-5 sm:grid-cols-2">
                    <div>
                      <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium">
                        <User className="h-3.5 w-3.5 text-muted-foreground" />
                        Full Name
                      </label>
                      <input
                        type="text"
                        className={`venom-input ${errors.name ? "border-destructive focus:ring-destructive/30" : ""}`}
                        placeholder="John Doe"
                        value={form.name}
                        onChange={(e) => handleChange("name", e.target.value)}
                        maxLength={100}
                      />
                      {errors.name && (
                        <p className="mt-1 flex items-center gap-1 text-xs text-destructive">
                          <AlertCircle className="h-3 w-3" /> {errors.name}
                        </p>
                      )}
                    </div>
                    <div>
                      <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium">
                        <Mail className="h-3.5 w-3.5 text-muted-foreground" />
                        Email Address
                      </label>
                      <input
                        type="email"
                        className={`venom-input ${errors.email ? "border-destructive focus:ring-destructive/30" : ""}`}
                        placeholder="you@example.com"
                        value={form.email}
                        onChange={(e) => handleChange("email", e.target.value)}
                        maxLength={255}
                      />
                      {errors.email && (
                        <p className="mt-1 flex items-center gap-1 text-xs text-destructive">
                          <AlertCircle className="h-3 w-3" /> {errors.email}
                        </p>
                      )}
                    </div>
                  </div>

                  <div>
                    <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium">
                      <MessageSquare className="h-3.5 w-3.5 text-muted-foreground" />
                      Subject
                    </label>
                    <input
                      type="text"
                      className={`venom-input ${errors.subject ? "border-destructive focus:ring-destructive/30" : ""}`}
                      placeholder="License inquiry, technical support, billing..."
                      value={form.subject}
                      onChange={(e) => handleChange("subject", e.target.value)}
                      maxLength={200}
                    />
                    {errors.subject && (
                      <p className="mt-1 flex items-center gap-1 text-xs text-destructive">
                        <AlertCircle className="h-3 w-3" /> {errors.subject}
                      </p>
                    )}
                  </div>

                  <div>
                    <label className="mb-1.5 block text-sm font-medium">Message</label>
                    <textarea
                      rows={5}
                      className={`venom-input resize-none ${errors.message ? "border-destructive focus:ring-destructive/30" : ""}`}
                      placeholder="Describe your inquiry in detail..."
                      value={form.message}
                      onChange={(e) => handleChange("message", e.target.value)}
                      maxLength={2000}
                    />
                    <div className="mt-1 flex items-center justify-between">
                      {errors.message ? (
                        <p className="flex items-center gap-1 text-xs text-destructive">
                          <AlertCircle className="h-3 w-3" /> {errors.message}
                        </p>
                      ) : (
                        <span />
                      )}
                      <span className="text-xs text-muted-foreground">{form.message.length}/2000</span>
                    </div>
                  </div>

                  <button type="submit" className="venom-btn-primary w-full py-3">
                    <Send className="h-4 w-4" />
                    Send Message
                  </button>
                </form>

                <div className="mt-6 rounded-lg border bg-secondary/50 p-4">
                  <p className="text-xs text-muted-foreground text-center">
                    For urgent issues, email us directly at{" "}
                    <span className="text-primary font-medium">support@venomcodes.com</span>
                  </p>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </PageLayout>
  );
};

export default Contact;
