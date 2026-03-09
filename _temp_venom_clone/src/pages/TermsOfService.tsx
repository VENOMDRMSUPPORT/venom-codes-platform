import PageLayout from "../components/PageLayout";
import { Link } from "react-router-dom";

const TermsOfService = () => (
  <PageLayout>
    <div className="venom-section pt-32">
      <div className="venom-container">
        <div className="mx-auto max-w-3xl">
          <span className="venom-badge mb-4">Legal</span>
          <h1 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">Terms of Service</h1>
          <p className="mt-2 text-sm text-muted-foreground">Last updated: {/* WHMCS: dynamic date */}March 8, 2026</p>

          <div className="mt-10 space-y-8 text-sm leading-relaxed text-muted-foreground">

            <div className="rounded-xl border border-primary/30 bg-primary/5 p-5">
              <h3 className="font-display text-base font-semibold text-foreground mb-2">⚠️ Important Notice</h3>
              <p>
                VENOM CODES is a <strong className="text-foreground">software licensing and infrastructure solutions provider</strong>. We develop, distribute, and license software products exclusively. We do <strong className="text-foreground">not</strong> provide, distribute, host, stream, or facilitate access to IPTV content, television broadcasts, video streams, or any media content of any kind.
              </p>
            </div>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">1. Acceptance of Terms</h2>
              <p>By accessing or using the VENOM CODES website, services, or software products ("Services"), you agree to be bound by these Terms of Service. If you do not agree, you must not use our Services.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">2. Description of Services</h2>
              <p>VENOM CODES provides software licensing solutions, server infrastructure tools, load balancer management, instant provisioning systems, and related deployment technologies. All products sold are software licenses granting usage rights under the terms specified in the applicable license agreement.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">3. Software License Grant</h2>
              <p>Upon purchase, you are granted a non-exclusive, non-transferable, revocable license to use the software for the duration specified in your selected plan. This license does not constitute a sale of the software. You may not sublicense, resell, redistribute, reverse-engineer, decompile, or modify the software without prior written consent.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">4. Acceptable Use</h2>
              <p className="mb-3">You agree to use VENOM CODES software exclusively for lawful purposes. You shall not:</p>
              <ul className="list-disc pl-5 space-y-1.5">
                <li>Use the software for any illegal activity or in violation of applicable laws</li>
                <li>Attempt to bypass, circumvent, or tamper with license validation mechanisms</li>
                <li>Share, distribute, or expose license keys to unauthorized third parties</li>
                <li>Use the software to distribute, stream, or facilitate access to copyrighted content without authorization</li>
                <li>Misrepresent the nature or purpose of the software</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">5. Payment & Billing</h2>
              <p>All prices are listed in USD. Payments are processed at the time of purchase. Recurring plans are billed monthly. Failure to maintain payment may result in license suspension.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">6. Refund Policy</h2>
              <p>{/* WHMCS: Replace with actual refund policy */}Refund eligibility and terms are determined on a case-by-case basis. Please contact support for refund requests.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">7. Termination</h2>
              <p>VENOM CODES reserves the right to suspend or terminate your license at any time for violation of these Terms. Upon termination, your right to use the software ceases immediately.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">8. Limitation of Liability</h2>
              <p>VENOM CODES software is provided "as is" without warranties of any kind. We shall not be liable for any indirect, incidental, or consequential damages arising from the use or inability to use our software.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">9. Disclaimer — No Content Provision</h2>
              <p>VENOM CODES is strictly a software company. We sell software licenses and infrastructure tools only. We have no involvement in content creation, content distribution, media streaming, IPTV services, or any form of content delivery. Users are solely responsible for how they deploy and use the software.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">10. Modifications</h2>
              <p>We reserve the right to update these Terms at any time. Continued use of our Services after changes constitutes acceptance.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">11. Contact</h2>
              <p>For questions regarding these Terms, contact us at <span className="text-primary">legal@venomcodes.com</span> or visit our <Link to="/contact" className="text-primary underline underline-offset-2">Contact page</Link>.</p>
            </section>

          </div>
        </div>
      </div>
    </div>
  </PageLayout>
);

export default TermsOfService;
