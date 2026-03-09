import { useState } from "react";
import { X, Megaphone } from "lucide-react";

const AnnouncementBanner = () => {
  const [visible, setVisible] = useState(true);

  if (!visible) return null;

  return (
    <div id="announcement-banner" className="venom-gradient-bg">
      <div className="venom-container flex items-center justify-center gap-3 py-2.5 px-10 text-center relative">
        <Megaphone className="hidden h-4 w-4 shrink-0 text-primary-foreground/80 sm:block" />
        <p className="text-xs font-medium text-primary-foreground sm:text-sm">
          🚀 <strong>New:</strong> {/* WHMCS: Replace with your announcement */}Check out our latest updates and offers.{" "}
          <a href="#pricing" className="underline underline-offset-2 hover:opacity-80">
            Learn More →
          </a>
        </p>
        <button
          onClick={() => setVisible(false)}
          className="absolute right-3 top-1/2 -translate-y-1/2 rounded p-1 text-primary-foreground/60 hover:text-primary-foreground transition-colors"
          aria-label="Dismiss"
        >
          <X className="h-3.5 w-3.5" />
        </button>
      </div>
    </div>
  );
};

export default AnnouncementBanner;
