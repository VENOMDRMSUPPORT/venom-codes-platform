import { BrowserRouter, Routes, Route } from "react-router-dom";
import CookieConsent from "./components/CookieConsent";
import ScrollToTop from "./components/ScrollToTop";
import Index from "./pages/Index";
import Login from "./pages/Login";
import Register from "./pages/Register";
import ForgotPassword from "./pages/ForgotPassword";
import ResetPassword from "./pages/ResetPassword";
import Verification from "./pages/Verification";
import Contact from "./pages/Contact";
import TermsOfService from "./pages/TermsOfService";
import PrivacyPolicy from "./pages/PrivacyPolicy";
import SLA from "./pages/SLA";
import Status from "./pages/Status";
import KnowledgeBase from "./pages/KnowledgeBase";
import NotFound from "./pages/NotFound";

/* Client Area Pages */
import ClientDashboard from "./pages/ClientDashboard";
import ServicesList from "./pages/ServicesList";
import ServiceDetails from "./pages/ServiceDetails";
import InvoicesList from "./pages/InvoicesList";
import InvoiceDetails from "./pages/InvoiceDetails";
import TicketsList from "./pages/TicketsList";
import TicketDetails from "./pages/TicketDetails";
import OpenTicket from "./pages/OpenTicket";
import ProfileSettings from "./pages/ProfileSettings";
import SecuritySettings from "./pages/SecuritySettings";
import GeneralSettings from "./pages/GeneralSettings";
import BillingPage from "./pages/BillingPage";
import DomainsList from "./pages/DomainsList";
import DomainDetails from "./pages/DomainDetails";

const App = () => (
  <BrowserRouter>
    <Routes>
      {/* Public */}
      <Route path="/" element={<Index />} />
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />
      <Route path="/forgot-password" element={<ForgotPassword />} />
      <Route path="/reset-password" element={<ResetPassword />} />
      <Route path="/verification" element={<Verification />} />
      <Route path="/contact" element={<Contact />} />
      <Route path="/terms" element={<TermsOfService />} />
      <Route path="/privacy" element={<PrivacyPolicy />} />
      <Route path="/sla" element={<SLA />} />
      <Route path="/status" element={<Status />} />
      <Route path="/knowledge-base" element={<KnowledgeBase />} />

      {/* Client Area */}
      <Route path="/client" element={<ClientDashboard />} />
      <Route path="/client/services" element={<ServicesList />} />
      <Route path="/client/services/:id" element={<ServiceDetails />} />
      <Route path="/client/invoices" element={<InvoicesList />} />
      <Route path="/client/invoices/:id" element={<InvoiceDetails />} />
      <Route path="/client/tickets" element={<TicketsList />} />
      <Route path="/client/tickets/new" element={<OpenTicket />} />
      <Route path="/client/tickets/:id" element={<TicketDetails />} />
      <Route path="/client/domains" element={<DomainsList />} />
      <Route path="/client/domains/:id" element={<DomainDetails />} />
      <Route path="/client/profile" element={<ProfileSettings />} />
      <Route path="/client/security" element={<SecuritySettings />} />
      <Route path="/client/settings" element={<GeneralSettings />} />
      <Route path="/client/billing" element={<BillingPage />} />

      <Route path="*" element={<NotFound />} />
    </Routes>
    <CookieConsent />
    <ScrollToTop />
  </BrowserRouter>
);

export default App;
