/**
 * WHMCS Mapping: clientareasidebar.tpl / sidebar partial
 * Main navigation sidebar for the client area.
 * Each group maps to a WHMCS sidebar section.
 */
import {
  LayoutDashboard,
  Server,
  FileText,
  CreditCard,
  LifeBuoy,
  Globe,
  Shield,
  Settings,
  HelpCircle,
} from "lucide-react";
import { NavLink } from "../NavLink";
import VenomLogo from "../VenomLogo";
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupLabel,
  SidebarGroupContent,
  SidebarMenu,
  SidebarMenuItem,
  SidebarMenuButton,
  SidebarFooter,
  useSidebar,
} from "../ui/sidebar";

/* WHMCS: Each item maps to a {menuentry} in clientareasidebar.tpl */
const mainNav = [
  { title: "Dashboard", url: "/client", icon: LayoutDashboard },
  { title: "Services", url: "/client/services", icon: Server },
  { title: "Domains", url: "/client/domains", icon: Globe },
  { title: "Invoices", url: "/client/invoices", icon: FileText },
  { title: "Billing", url: "/client/billing", icon: CreditCard },
];

const supportNav = [
  { title: "Support Tickets", url: "/client/tickets", icon: LifeBuoy },
  { title: "Knowledge Base", url: "/knowledge-base", icon: HelpCircle },
];

const accountNav = [
  { title: "Security", url: "/client/security", icon: Shield },
  { title: "Settings", url: "/client/settings", icon: Settings },
];

const ClientSidebar = () => {
  const { state } = useSidebar();
  const collapsed = state === "collapsed";

  return (
    <Sidebar collapsible="icon" className="border-r border-border">
      <div className="flex h-14 items-center gap-2 border-b border-border px-4">
        <VenomLogo size={24} />
        {!collapsed && (
          <span className="font-display text-sm font-bold tracking-tight">VENOM CODES</span>
        )}
      </div>

      <SidebarContent>
        {/* WHMCS: Main navigation group */}
        <SidebarGroup>
          <SidebarGroupLabel>Main</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {mainNav.map((item) => (
                <SidebarMenuItem key={item.url}>
                  <SidebarMenuButton asChild>
                    <NavLink
                      to={item.url}
                      end={item.url === "/client"}
                      className="flex items-center gap-3 rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors"
                      activeClassName="bg-primary/10 text-primary font-medium"
                    >
                      <item.icon className="h-4 w-4 shrink-0" />
                      {!collapsed && <span>{item.title}</span>}
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>

        {/* WHMCS: Support navigation group */}
        <SidebarGroup>
          <SidebarGroupLabel>Support</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {supportNav.map((item) => (
                <SidebarMenuItem key={item.url}>
                  <SidebarMenuButton asChild>
                    <NavLink
                      to={item.url}
                      className="flex items-center gap-3 rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors"
                      activeClassName="bg-primary/10 text-primary font-medium"
                    >
                      <item.icon className="h-4 w-4 shrink-0" />
                      {!collapsed && <span>{item.title}</span>}
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>

        {/* WHMCS: Account navigation group */}
        <SidebarGroup>
          <SidebarGroupLabel>Account</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {accountNav.map((item) => (
                <SidebarMenuItem key={item.url}>
                  <SidebarMenuButton asChild>
                    <NavLink
                      to={item.url}
                      className="flex items-center gap-3 rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors"
                      activeClassName="bg-primary/10 text-primary font-medium"
                    >
                      <item.icon className="h-4 w-4 shrink-0" />
                      {!collapsed && <span>{item.title}</span>}
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>

      <SidebarFooter className="border-t border-border p-3">
        {!collapsed && (
          <p className="text-[11px] text-muted-foreground text-center">
            © {new Date().getFullYear()} Venom Codes
          </p>
        )}
      </SidebarFooter>
    </Sidebar>
  );
};

export default ClientSidebar;
