import PageLayout from "../components/PageLayout";
import { Link } from "react-router-dom";

const SLA = () => (
  <PageLayout>
    <div className="venom-section pt-32">
      <div className="venom-container">
        <div className="mx-auto max-w-3xl">
          <span className="venom-badge mb-4">Legal</span>
          <h1 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">Service Level Agreement</h1>
          <p className="mt-2 text-sm text-muted-foreground">Last updated: {/* WHMCS: dynamic date */}March 8, 2026</p>

          <div className="mt-10 space-y-8 text-sm leading-relaxed text-muted-foreground">

            <div className="rounded-xl border border-primary/30 bg-primary/5 p-5">
              <h3 className="font-display text-base font-semibold text-foreground mb-2">⚠️ Important Notice</h3>
              <p>
                This SLA applies exclusively to <strong className="text-foreground">VENOM CODES software licensing and infrastructure services</strong>. VENOM CODES does <strong className="text-foreground">not</strong> provide IPTV content, media streaming, or any content delivery services.
              </p>
            </div>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">1. Service Scope</h2>
              <p>This SLA covers the following VENOM CODES services:</p>
              <ul className="list-disc pl-5 space-y-1.5 mt-3">
                <li>License validation and activation systems</li>
                <li>License management dashboard and API</li>
                <li>Load balancer provisioning infrastructure</li>
                <li>Server deployment and management tools</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">2. Uptime Guarantee</h2>
              <p>{/* WHMCS: Replace table with actual SLA numbers */}</p>
              <div className="overflow-x-auto mt-3">
                <table className="w-full border-collapse">
                  <thead>
                    <tr className="border-b">
                      <th className="py-3 pr-4 text-left font-display font-semibold text-foreground">Plan</th>
                      <th className="py-3 pr-4 text-left font-display font-semibold text-foreground">Uptime SLA</th>
                      <th className="py-3 text-left font-display font-semibold text-foreground">Max Downtime/Month</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr className="border-b border-border/50">
                      <td className="py-3 pr-4">Trial</td>
                      <td className="py-3 pr-4">—</td>
                      <td className="py-3">—</td>
                    </tr>
                    <tr className="border-b border-border/50">
                      <td className="py-3 pr-4">Pro</td>
                      <td className="py-3 pr-4">—</td>
                      <td className="py-3">—</td>
                    </tr>
                    <tr>
                      <td className="py-3 pr-4">Ultra</td>
                      <td className="py-3 pr-4">—</td>
                      <td className="py-3">—</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">3. Response Times</h2>
              <p>{/* WHMCS: Replace with actual response time commitments */}</p>
              <div className="overflow-x-auto mt-3">
                <table className="w-full border-collapse">
                  <thead>
                    <tr className="border-b">
                      <th className="py-3 pr-4 text-left font-display font-semibold text-foreground">Severity</th>
                      <th className="py-3 pr-4 text-left font-display font-semibold text-foreground">Description</th>
                      <th className="py-3 text-left font-display font-semibold text-foreground">Response Time</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr className="border-b border-border/50">
                      <td className="py-3 pr-4 font-medium text-foreground">Critical</td>
                      <td className="py-3 pr-4">Service completely unavailable</td>
                      <td className="py-3">—</td>
                    </tr>
                    <tr className="border-b border-border/50">
                      <td className="py-3 pr-4 font-medium text-foreground">High</td>
                      <td className="py-3 pr-4">Major feature impaired</td>
                      <td className="py-3">—</td>
                    </tr>
                    <tr className="border-b border-border/50">
                      <td className="py-3 pr-4 font-medium text-foreground">Medium</td>
                      <td className="py-3 pr-4">Minor feature issue</td>
                      <td className="py-3">—</td>
                    </tr>
                    <tr>
                      <td className="py-3 pr-4 font-medium text-foreground">Low</td>
                      <td className="py-3 pr-4">General inquiry</td>
                      <td className="py-3">—</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">4. Service Credits</h2>
              <p>{/* WHMCS: Replace with actual credit policy */}Service credit eligibility and terms will be defined based on agreed SLA targets. Contact support for details.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">5. Exclusions</h2>
              <p>This SLA does not apply to:</p>
              <ul className="list-disc pl-5 space-y-1.5 mt-3">
                <li>Scheduled maintenance (communicated in advance)</li>
                <li>Force majeure events</li>
                <li>Issues caused by customer's own infrastructure or misconfiguration</li>
                <li>Third-party service outages beyond our control</li>
                <li>Abuse or violation of our Terms of Service</li>
              </ul>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">6. Maintenance Windows</h2>
              <p>Scheduled maintenance is performed during low-traffic hours. Emergency maintenance may occur at any time but will be communicated via email and status page as soon as possible.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">7. Software-Only Disclaimer</h2>
              <p>VENOM CODES provides software licensing and infrastructure management tools exclusively. This SLA covers the availability and performance of our software systems only. We do not provide, host, distribute, or guarantee any media content, IPTV services, streaming capabilities, or content delivery networks.</p>
            </section>

            <section>
              <h2 className="font-display text-lg font-semibold text-foreground mb-3">8. Contact</h2>
              <p>For SLA-related inquiries, contact us at <span className="text-primary">support@venomcodes.com</span> or visit our <Link to="/contact" className="text-primary underline underline-offset-2">Contact page</Link>.</p>
            </section>

          </div>
        </div>
      </div>
    </div>
  </PageLayout>
);

export default SLA;
