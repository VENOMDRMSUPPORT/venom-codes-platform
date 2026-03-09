import { createRoot } from "react-dom/client";
import App from "./App.tsx";
import "./index.css";

// Initialize theme from localStorage (no React context needed)
const savedMode = localStorage.getItem("venom-theme-mode") || "dark";
const savedAccent = localStorage.getItem("venom-accent-color") || "blue";
document.documentElement.classList.toggle("dark", savedMode === "dark");
document.documentElement.setAttribute("data-accent", savedAccent);

createRoot(document.getElementById("root")!).render(<App />);
