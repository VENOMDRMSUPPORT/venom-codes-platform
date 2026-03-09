/**
 * WHMCS Template Target: clientareasettings.tpl
 * General Settings — notification preferences, language, display options.
 */
import { User, Shield, Settings as SettingsIcon } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import AccountSettingsLayout from "../components/client/AccountSettingsLayout";
import FormSection, { FormField } from "../components/client/FormSection";

const settingsNav = [
  { label: "Profile", href: "/client/profile", icon: <User className="h-4 w-4" /> },
  { label: "Security", href: "/client/security", icon: <Shield className="h-4 w-4" /> },
  { label: "Settings", href: "/client/settings", icon: <SettingsIcon className="h-4 w-4" /> },
];

const GeneralSettings = () => {
  return (
    <ClientLayout>
      <PageHeader
        title="General Settings"
        subtitle="Manage your notification and display preferences."
        breadcrumbs={[
          { label: "Settings" },
        ]}
      />

      <AccountSettingsLayout navItems={settingsNav}>
        {/* WHMCS: Notification preferences */}
        <FormSection
          title="Notification Preferences"
          description="Choose how and when you'd like to be notified."
          actions={<button className="venom-btn-primary text-sm py-2 px-3">Save Preferences</button>}
        >
          <FormField label="Email Notifications">
            <div className="space-y-2">
              {["Invoice reminders", "Support ticket updates", "Service status alerts", "Promotional offers"].map((item) => (
                <label key={item} className="flex items-center gap-2.5 text-sm cursor-pointer">
                  <input type="checkbox" defaultChecked className="rounded border-border text-primary focus:ring-primary/30" />
                  {item}
                </label>
              ))}
            </div>
          </FormField>
        </FormSection>

        {/* WHMCS: Language / display settings */}
        <FormSection
          title="Display Settings"
          description="Customize your client area experience."
          actions={<button className="venom-btn-primary text-sm py-2 px-3">Save Settings</button>}
        >
          <FormField label="Language" htmlFor="language">
            <select id="language" className="venom-input">
              <option>English</option>
              <option>العربية</option>
            </select>
          </FormField>
          <FormField label="Timezone" htmlFor="timezone">
            <select id="timezone" className="venom-input">
              <option>UTC (GMT+0)</option>
              <option>GMT+3 (Arabia Standard Time)</option>
            </select>
          </FormField>
          <FormField label="Date Format" htmlFor="dateformat">
            <select id="dateformat" className="venom-input">
              <option>YYYY-MM-DD</option>
              <option>DD/MM/YYYY</option>
              <option>MM/DD/YYYY</option>
            </select>
          </FormField>
        </FormSection>

        {/* WHMCS: Account actions */}
        <FormSection title="Account Actions" description="Manage your account status.">
          <div className="flex items-center justify-between rounded-lg border border-destructive/20 p-4">
            <div>
              <p className="text-sm font-semibold">Close Account</p>
              <p className="text-xs text-muted-foreground">Permanently close your account and cancel all services.</p>
            </div>
            <button className="rounded-lg border border-destructive px-3 py-1.5 text-xs font-semibold text-destructive hover:bg-destructive/10 transition-colors">
              Request Closure
            </button>
          </div>
        </FormSection>
      </AccountSettingsLayout>
    </ClientLayout>
  );
};

export default GeneralSettings;
