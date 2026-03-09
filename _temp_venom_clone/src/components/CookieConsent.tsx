import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { Cookie, X } from "lucide-react";

const CookieConsent = () => {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const consent = localStorage.getItem("venom-cookie-consent");
    if (!consent) {
      const timer = setTimeout(() => setVisible(true), 1500);
      return () => clearTimeout(timer);
    }
  }, []);

  const accept = () => {
    localStorage.setItem("venom-cookie-consent", "accepted");
    setVisible(false);
  };

  const decline = () => {
    localStorage.setItem("venom-cookie-consent", "declined");
    setVisible(false);
  };

  return (
    <div
      className={`fixed z-50 border bg-card shadow-lg rounded-xl transition-all duration-300 ${
        visible ? "translate-y-0 opacity-100" : "translate-y-full opacity-0 pointer-events-none"
      }`}
      style={{
        bottom: "1.5rem",
        left: "1.5rem",
        maxWidth: "340px",
      }}
    >
      <div className="flex items-start gap-3 p-4">
        <div className="shrink-0 rounded-lg p-2" style={{ background: "hsl(var(--accent-muted))" }}>
          <Cookie className="h-4 w-4 text-primary" />
        </div>
        <div className="flex-1">
          <h4 className="font-display text-sm font-semibold mb-1">Cookie Notice</h4>
          <p className="text-xs text-muted-foreground leading-relaxed">
            We use essential cookies for authentication and session management.{" "}
            <Link to="/privacy" className="text-primary underline underline-offset-2 hover:opacity-80">
              Learn more
            </Link>
          </p>
          <div className="mt-3 flex items-center gap-2">
            <button onClick={accept} className="venom-btn-primary px-3 py-1 text-xs">
              Accept
            </button>
            <button onClick={decline} className="venom-btn-secondary px-3 py-1 text-xs">
              Decline
            </button>
          </div>
        </div>
        <button onClick={decline} className="shrink-0 text-muted-foreground hover:text-foreground">
          <X className="h-4 w-4" />
        </button>
      </div>
    </div>
  );
};

export default CookieConsent;
