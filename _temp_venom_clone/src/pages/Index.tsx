import AnnouncementBanner from "../components/AnnouncementBanner";
import Header from "../components/landing/Header";
import Hero from "../components/landing/Hero";
import TrustStrip from "../components/landing/TrustStrip";
import Features from "../components/landing/Features";
import Pricing from "../components/landing/Pricing";
import WhyChoose from "../components/landing/WhyChoose";
import FAQ from "../components/landing/FAQ";
import FinalCTA from "../components/landing/FinalCTA";
import Footer from "../components/landing/Footer";

const Index = () => {
  return (
    <div className="min-h-screen bg-background">
      <AnnouncementBanner />
      <Header />
      <Hero />
      <TrustStrip />
      <Features />
      <Pricing />
      <WhyChoose />
      <FAQ />
      <FinalCTA />
      <Footer />
    </div>
  );
};

export default Index;
