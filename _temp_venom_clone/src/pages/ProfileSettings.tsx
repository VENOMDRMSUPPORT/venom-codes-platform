/**
 * WHMCS Template Target: clientareadetails.tpl
 * Profile Settings — personal details, contact info.
 */
import { User, Shield, Settings } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import AccountSettingsLayout from "../components/client/AccountSettingsLayout";
import FormSection, { FormField } from "../components/client/FormSection";
import AlertNotice from "../components/client/AlertNotice";

const settingsNav = [
  { label: "Profile", href: "/client/profile", icon: <User className="h-4 w-4" /> },
  { label: "Security", href: "/client/security", icon: <Shield className="h-4 w-4" /> },
  { label: "Settings", href: "/client/settings", icon: <Settings className="h-4 w-4" /> },
];

const ProfileSettings = () => {
  return (
    <ClientLayout>
      <PageHeader
        title="Profile Settings"
        subtitle="Manage your personal information and contact details."
        breadcrumbs={[
          { label: "Settings", href: "/client/settings" },
          { label: "Profile" },
        ]}
      />

      <AccountSettingsLayout navItems={settingsNav}>
        <AlertNotice type="info">
          Changes to your profile may require verification. Keep your contact details up to date.
        </AlertNotice>

        {/* WHMCS: {$clientsdetails.*} fields */}
        <FormSection
          title="Personal Information"
          description="Your basic account details."
          actions={
            <>
              <button className="venom-btn-secondary text-sm py-2 px-3">Cancel</button>
              <button className="venom-btn-primary text-sm py-2 px-3">Save Changes</button>
            </>
          }
        >
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            <FormField label="First Name" htmlFor="firstname" required>
              <input type="text" id="firstname" className="venom-input" placeholder="—" />
            </FormField>
            <FormField label="Last Name" htmlFor="lastname" required>
              <input type="text" id="lastname" className="venom-input" placeholder="—" />
            </FormField>
          </div>
          <FormField label="Company Name" htmlFor="company">
            <input type="text" id="company" className="venom-input" placeholder="—" />
          </FormField>
          <FormField label="Email Address" htmlFor="email" required hint="We'll send important notifications to this address.">
            <input type="email" id="email" className="venom-input" placeholder="—" />
          </FormField>
          <FormField label="Phone Number" htmlFor="phone">
            <input type="tel" id="phone" className="venom-input" placeholder="—" />
          </FormField>
        </FormSection>

        {/* WHMCS: Address fields */}
        <FormSection
          title="Billing Address"
          description="Used for invoicing and tax purposes."
          actions={
            <>
              <button className="venom-btn-secondary text-sm py-2 px-3">Cancel</button>
              <button className="venom-btn-primary text-sm py-2 px-3">Save Address</button>
            </>
          }
        >
          <FormField label="Address Line 1" htmlFor="addr1" required>
            <input type="text" id="addr1" className="venom-input" placeholder="—" />
          </FormField>
          <FormField label="Address Line 2" htmlFor="addr2">
            <input type="text" id="addr2" className="venom-input" placeholder="—" />
          </FormField>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
            <FormField label="City" htmlFor="city" required>
              <input type="text" id="city" className="venom-input" placeholder="—" />
            </FormField>
            <FormField label="State/Region" htmlFor="state">
              <input type="text" id="state" className="venom-input" placeholder="—" />
            </FormField>
            <FormField label="Postal Code" htmlFor="postcode" required>
              <input type="text" id="postcode" className="venom-input" placeholder="—" />
            </FormField>
          </div>
          <FormField label="Country" htmlFor="country" required>
            <select id="country" className="venom-input">
              <option>— Select Country —</option>
            </select>
          </FormField>
        </FormSection>
      </AccountSettingsLayout>
    </ClientLayout>
  );
};

export default ProfileSettings;
