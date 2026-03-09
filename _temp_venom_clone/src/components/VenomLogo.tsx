interface VenomLogoProps {
  size?: number;
  className?: string;
  animate?: boolean;
}

const VenomLogo = ({ size = 40, className = "", animate = true }: VenomLogoProps) => {
  return (
    <div className={`relative inline-flex items-center justify-center ${className}`} style={{ width: size, height: size }}>
      {/* Subtle glow behind — CSS animation */}
      {animate && (
        <div
          className="absolute inset-0 venom-gradient-bg rounded-sm blur-md animate-logo-pulse"
        />
      )}
      <svg
        viewBox="0 0 48 48"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style={{ width: size, height: size }}
        className="relative z-10"
      >
        <defs>
          <linearGradient id="venom-logo-grad" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stopColor="hsl(var(--accent-gradient-from))" />
            <stop offset="100%" stopColor="hsl(var(--accent-gradient-to))" />
          </linearGradient>
        </defs>

        {/* Diamond / Rhombus frame */}
        <path
          d="M24 2L46 24L24 46L2 24Z"
          stroke="url(#venom-logo-grad)"
          strokeWidth="2.5"
          strokeLinejoin="round"
          fill="none"
          className={animate ? "animate-draw-path" : ""}
        />

        {/* V letter centered inside */}
        <path
          d="M15 14L24 34L33 14"
          stroke="url(#venom-logo-grad)"
          strokeWidth="3"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
          className={animate ? "animate-draw-path-delayed" : ""}
        />
      </svg>
    </div>
  );
};

export default VenomLogo;
