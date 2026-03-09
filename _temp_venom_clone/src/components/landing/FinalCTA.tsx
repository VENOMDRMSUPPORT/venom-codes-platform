import { Link } from "react-router-dom";
import { ArrowRight } from "lucide-react";

const FinalCTA = () => (
  <section className="venom-section bg-background">
    <div className="venom-container">
      <div className="relative overflow-hidden rounded-2xl venom-gradient-bg p-12 sm:p-16 text-center">
        <div className="absolute inset-0 bg-black/20" />
        <div className="relative">
          <h2 className="font-display text-3xl font-bold tracking-tight text-primary-foreground sm:text-4xl">
            Ready to Deploy?
          </h2>
          <p className="mx-auto mt-4 max-w-xl text-primary-foreground/80">
            Get started with VENOM CODES infrastructure solutions.
            Start with a 7-day trial — no commitment required.
          </p>
          <div className="mt-8 flex flex-col items-center gap-4 sm:flex-row sm:justify-center">
            <Link
              to="/register"
              className="inline-flex items-center gap-2 rounded-lg bg-card px-8 py-3.5 text-sm font-semibold text-card-foreground transition-all hover:opacity-90"
            >
              Get Started Now
              <ArrowRight className="h-4 w-4" />
            </Link>
            <a href="#pricing" className="text-sm font-medium text-primary-foreground/80 underline underline-offset-4 hover:text-primary-foreground">
              Compare Plans
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
);

export default FinalCTA;
