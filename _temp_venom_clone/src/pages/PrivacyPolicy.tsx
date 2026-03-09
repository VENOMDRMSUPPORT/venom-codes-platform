import PageLayout from "../components/PageLayout";
import { Link } from "react-router-dom";

const PrivacyPolicy = () => (
  <PageLayout>
    <div className="venom-section pt-32">
      <div className="venom-container">
        <div className="mx-auto max-w-3xl">
          <span className="venom-badge mb-4">Legal</span>
          <h1 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">Privacy Policy</h1>
          <p className="mt-2 text-sm text-muted-foreground">Last updated: March 8, 2026</p>

          <div className="mt-10 space-y-8 text-sm leading-relaxed text-muted-foreground">

            <div className="rounded-xl border border-primary/30 bg-primary/5 p-5">
              <h3 className="font-display text-base font-semibold text-foreground mb-2">⚠️ Important Notice</h3>
              <p>
                VENOM CODES is a <strong className="text-foreground">software licensing company</strong>. We do <strong className="text-foreground">not</strong> provide, distribute, or facilitate access to IPTV content, media streams, or any broadcast material. This Privacy Policy covers data collected solely in relation to our software licensing and infrastructure services.
              </p>
            </div>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">1. Information We Collect</h2>
              <p className="mb-3">We collect the following categories of information:</p>
              <ul className="list-disc pl-5 space-y-1.5">
                <li><strong className="text-foreground">Account Information:</strong> Name, email address, and billing details provided during registration</li>
                <li><strong className="text-foreground">License Data:</strong> Hardware identifiers used for license binding and validation</li>
                <li><strong className="text-foreground">Usage Data:</strong> License activation status, server health metrics, and feature usage analytics</li>
                <li><strong className="text-foreground">Technical Data:</strong> IP address, browser type, operating system, and access timestamps</li>
                <li><strong className="text-foreground">Payment Data:</strong> Processed securely through third-party payment processors; we do not store full card details</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">2. How We Use Your Information</h2>
              <ul className="list-disc pl-5 space-y-1.5">
                <li>Provision and manage software licenses</li>
                <li>Process payments and manage billing</li>
                <li>Validate license authenticity and prevent unauthorized use</li>
                <li>Provide technical support and service communications</li>
                <li>Improve our software products and infrastructure</li>
                <li>Comply with legal obligations</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">3. Data Sharing</h2>
              <p>We do not sell your personal information. We may share data with:</p>
              <ul className="list-disc pl-5 space-y-1.5 mt-3">
                <li><strong className="text-foreground">Payment Processors:</strong> To complete financial transactions securely</li>
                <li><strong className="text-foreground">Infrastructure Providers:</strong> For hosting and service delivery</li>
                <li><strong className="text-foreground">Legal Authorities:</strong> When required by law or to protect our rights</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">4. Data Security</h2>
              <p>We implement industry-standard security measures including encryption in transit (TLS), encrypted storage, access controls, and regular security audits. However, no system is completely secure, and we cannot guarantee absolute data security.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">5. Data Retention</h2>
              <p>Account data is retained for the duration of your active license and for 90 days after account closure. License validation logs are retained for 12 months. Payment records are retained as required by applicable financial regulations.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">6. Your Rights</h2>
              <p>Depending on your jurisdiction, you may have the right to:</p>
              <ul className="list-disc pl-5 space-y-1.5 mt-3">
                <li>Access the personal data we hold about you</li>
                <li>Request correction of inaccurate data</li>
                <li>Request deletion of your data (subject to legal obligations)</li>
                <li>Object to or restrict processing of your data</li>
                <li>Data portability</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">7. Cookies</h2>
              <p>We use essential cookies for authentication and session management. We may use analytics cookies to understand service usage. You can manage cookie preferences through your browser settings.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">8. No Content Services</h2>
              <p>As VENOM CODES exclusively provides software licenses and infrastructure tools, we do not collect, process, or store any data related to media content, IPTV streams, video broadcasts, or content consumption. Any data collected pertains solely to software licensing and server management functionality.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">9. Changes to This Policy</h2>
              <p>We may update this Privacy Policy periodically. Changes will be posted on this page with an updated revision date. Continued use of our Services constitutes acceptance of the updated policy.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">10. Contact</h2>
              <p>For privacy-related inquiries, contact us at <span className="text-primary">privacy@venomcodes.com</span> or visit our <Link to="/contact" className="text-primary underline underline-offset-2">Contact page</Link>.</p>
            </section>

          </div>
        </div>
      </div>
    </div>
  </PageLayout>
);

export default PrivacyPolicy;
