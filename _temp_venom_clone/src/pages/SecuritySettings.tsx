/**
 * WHMCS Template Target: clientareasecurity.tpl
 * Security Settings — password, 2FA, active sessions.
 */
import { User, Shield, Settings, Key, Smartphone, Monitor, LogOut } from "lucide-react";
import ClientLayout from "../components/client/ClientLayout";
import PageHeader from "../components/client/PageHeader";
import AccountSettingsLayout from "../components/client/AccountSettingsLayout";
import FormSection, { FormField } from "../components/client/FormSection";
import SummaryPanel from "../components/client/SummaryPanel";
import StatusBadge from "../components/client/StatusBadge";
import AlertNotice from "../components/client/AlertNotice";

const settingsNav = [
  { label: "Profile", href: "/client/profile", icon: <User className="h-4 w-4" /> },
  { label: "Security", href: "/client/security", icon: <Shield className="h-4 w-4" /> },
  { label: "Settings", href: "/client/settings", icon: <Settings className="h-4 w-4" /> },
];

const SecuritySettings = () => {
  return (
    <ClientLayout>
      <PageHeader
        title="Security Settings"
        subtitle="Manage your password, two-factor authentication, and sessions."
        breadcrumbs={[
          { label: "Settings", href: "/client/settings" },
          { label: "Security" },
        ]}
      />

      <AccountSettingsLayout navItems={settingsNav}>
        {/* WHMCS: Change password form */}
        <FormSection
          title="Change Password"
          description="Use a strong, unique password to protect your account."
          actions={
            <button className="venom-btn-primary text-sm py-2 px-3">Update Password</button>
          }
        >
          <FormField label="Current Password" htmlFor="current-pw" required>
            <input type="password" id="current-pw" className="venom-input" placeholder="••••••••" />
          </FormField>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            <FormField label="New Password" htmlFor="new-pw" required>
              <input type="password" id="new-pw" className="venom-input" placeholder="••••••••" />
            </FormField>
            <FormField label="Confirm New Password" htmlFor="confirm-pw" required>
              <input type="password" id="confirm-pw" className="venom-input" placeholder="••••••••" />
            </FormField>
          </div>
        </FormSection>

        {/* WHMCS: Two-factor auth — {if $twofaenabled} */}
        <div className="rounded-xl border bg-card">
          <div className="border-b px-5 py-4">
            <h3 className="font-display text-sm font-semibold">Two-Factor Authentication</h3>
            <p className="mt-0.5 text-xs text-muted-foreground">Add an extra layer of security to your account.</p>
          </div>
          <div className="p-5">
            <div className="flex items-center justify-between rounded-lg border p-4">
              <div className="flex items-center gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary">
                  <Smartphone className="h-5 w-5" />
                </div>
                <div>
                  <p className="text-sm font-semibold">Authenticator App</p>
                  <p className="text-xs text-muted-foreground">Use an authenticator app for verification codes.</p>
                </div>
              </div>
              <StatusBadge variant="cancelled" label="Disabled" />
            </div>
            <div className="mt-4">
              <button className="venom-btn-primary text-sm py-2 px-4">
                <Key className="h-4 w-4" /> Enable 2FA
              </button>
            </div>
          </div>
        </div>

        {/* WHMCS: Active sessions */}
        <SummaryPanel
          title="Active Sessions"
          rows={[
            {
              label: (
                <span className="flex items-center gap-2">
                  <Monitor className="h-4 w-4 text-muted-foreground" />
                  Current session
                </span>
              ) as unknown as string,
              value: <StatusBadge variant="active" label="Current" />,
            },
          ]}
          footer={
            <button className="flex items-center gap-2 text-xs text-destructive hover:underline">
              <LogOut className="h-3.5 w-3.5" /> Sign out all other sessions
            </button>
          }
        />

        <AlertNotice type="info">
          For additional security, consider using a unique password that you don't use on other websites.
        </AlertNotice>
      </AccountSettingsLayout>
    </ClientLayout>
  );
};

export default SecuritySettings;
