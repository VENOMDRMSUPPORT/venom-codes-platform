import { Link } from "react-router-dom";
import VenomLogo from "../VenomLogo";

const Footer = () => (
  <footer className="bg-footer-bg">
    <div className="venom-container venom-section">
      <div className="grid gap-12 md:grid-cols-4">
        <div className="md:col-span-1">
          <div className="flex items-center gap-2 mb-4">
            <VenomLogo size={28} animate={false} />
            <span className="font-display text-lg font-bold footer-heading">VENOM CODES</span>
          </div>
          <p className="text-sm leading-relaxed footer-text">
            Premium server licensing and infrastructure solutions. Instant activation, scalable deployment.
          </p>
        </div>
        <div>
          <h4 className="mb-4 font-display text-sm font-semibold uppercase tracking-wider footer-heading">Product</h4>
          <ul className="space-y-2.5 text-sm">
            <li><a href="#features" className="footer-link">Features</a></li>
            <li><a href="#pricing" className="footer-link">Pricing</a></li>
            <li><Link to="/contact" className="footer-link">Contact</Link></li>
            <li><a href="#faq" className="footer-link">FAQ</a></li>
            <li><Link to="/knowledge-base" className="footer-link">Knowledge Base</Link></li>
            <li><Link to="/status" className="footer-link">System Status</Link></li>
          </ul>
        </div>
        <div>
          <h4 className="mb-4 font-display text-sm font-semibold uppercase tracking-wider footer-heading">Account</h4>
          <ul className="space-y-2.5 text-sm">
            <li><Link to="/login" className="footer-link">Sign In</Link></li>
            <li><Link to="/register" className="footer-link">Register</Link></li>
            <li><Link to="/forgot-password" className="footer-link">Reset Password</Link></li>
          </ul>
        </div>
        <div>
          <h4 className="mb-4 font-display text-sm font-semibold uppercase tracking-wider footer-heading">Legal</h4>
          <ul className="space-y-2.5 text-sm">
            <li><Link to="/terms" className="footer-link">Terms of Service</Link></li>
            <li><Link to="/privacy" className="footer-link">Privacy Policy</Link></li>
            <li><Link to="/sla" className="footer-link">SLA</Link></li>
          </ul>
        </div>
      </div>
      <div className="mt-12 border-t border-border/20 pt-8 text-center text-xs footer-text">
        &copy; {new Date().getFullYear()} VENOM CODES. All rights reserved.
      </div>
    </div>
  </footer>
);

export default Footer;
