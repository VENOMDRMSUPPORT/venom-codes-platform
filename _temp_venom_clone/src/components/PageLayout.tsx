import { ReactNode } from "react";
import Header from "./landing/Header";
import Footer from "./landing/Footer";
import AnnouncementBanner from "./AnnouncementBanner";

interface PageLayoutProps {
  children: ReactNode;
}

const PageLayout = ({ children }: PageLayoutProps) => {
  return (
    <div className="min-h-screen bg-background flex flex-col">
      <AnnouncementBanner />
      <Header />
      <main className="flex-1">{children}</main>
      <Footer />
    </div>
  );
};

export default PageLayout;
