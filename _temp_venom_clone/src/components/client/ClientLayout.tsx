/**
 * WHMCS Mapping: clientarea.tpl (main wrapper)
 * Wraps all client area pages with sidebar + header.
 * In WHMCS, this becomes the main clientarea.tpl structure.
 */
import { ReactNode } from "react";
import { SidebarProvider, SidebarTrigger } from "../ui/sidebar";
import ClientHeader from "./ClientHeader";
import ClientSidebar from "./ClientSidebar";

interface ClientLayoutProps {
  children: ReactNode;
}

const ClientLayout = ({ children }: ClientLayoutProps) => {
  return (
    <SidebarProvider>
      <div className="min-h-screen flex w-full bg-background">
        {/* WHMCS: {include file="clientareasidebar.tpl"} */}
        <ClientSidebar />

        <div className="flex-1 flex flex-col min-w-0">
          {/* WHMCS: {include file="clientareaheader.tpl"} */}
          <ClientHeader
            userName="User"
            userEmail="user@example.com"
            notificationCount={3}
            sidebarTrigger={<SidebarTrigger className="text-muted-foreground hover:text-foreground" />}
          />

          {/* WHMCS: {$content} */}
          <main className="flex-1 p-4 lg:p-6">
            {children}
          </main>
        </div>
      </div>
    </SidebarProvider>
  );
};

export default ClientLayout;
