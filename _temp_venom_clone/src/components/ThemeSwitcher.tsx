import { Sun, Moon, Palette } from "lucide-react";
import { useState, useRef, useEffect } from "react";

const accents = [
  { key: "blue", label: "Blue", color: "bg-blue-500" },
  { key: "purple", label: "Purple", color: "bg-purple-500" },
  { key: "emerald", label: "Emerald", color: "bg-emerald-500" },
  { key: "orange", label: "Orange", color: "bg-orange-500" },
  { key: "rose", label: "Rose", color: "bg-rose-500" },
];

const ThemeSwitcher = () => {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  const isDark = () => document.documentElement.classList.contains("dark");

  const toggleMode = () => {
    const next = isDark() ? "light" : "dark";
    document.documentElement.classList.toggle("dark", next === "dark");
    localStorage.setItem("venom-theme-mode", next);
    // Force re-render for icon
    setOpen((o) => o);
  };

  const setAccent = (accent: string) => {
    document.documentElement.setAttribute("data-accent", accent);
    localStorage.setItem("venom-accent-color", accent);
    setOpen(false);
  };

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  const currentAccent = document.documentElement.getAttribute("data-accent") || "blue";

  return (
    <div className="flex items-center gap-2">
      <button
        onClick={toggleMode}
        className="rounded-lg p-2 transition-colors hover:bg-secondary"
        aria-label="Toggle theme"
      >
        {isDark() ? <Sun className="h-4 w-4" /> : <Moon className="h-4 w-4" />}
      </button>
      <div ref={ref} className="relative">
        <button
          onClick={() => setOpen(!open)}
          className="rounded-lg p-2 transition-colors hover:bg-secondary"
          aria-label="Change accent color"
        >
          <Palette className="h-4 w-4" />
        </button>
        {open && (
          <div className="absolute right-0 top-full mt-2 z-50 rounded-xl border bg-card p-3 shadow-lg">
            <p className="mb-2 text-xs font-medium text-muted-foreground">Accent</p>
            <div className="flex gap-2">
              {accents.map((a) => (
                <button
                  key={a.key}
                  onClick={() => setAccent(a.key)}
                  className={`h-6 w-6 rounded-full ${a.color} transition-transform ${currentAccent === a.key ? "scale-125 ring-2 ring-foreground ring-offset-2 ring-offset-background" : "hover:scale-110"}`}
                  aria-label={a.label}
                />
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default ThemeSwitcher;
