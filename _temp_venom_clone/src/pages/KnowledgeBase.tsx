import { useState, useMemo } from "react";
import { Search, BookOpen, Server, Shield, Zap, CreditCard, HelpCircle, ChevronRight, ArrowLeft } from "lucide-react";
import { Link } from "react-router-dom";
import PageLayout from "../components/PageLayout";

interface Article {
  id: string;
  title: string;
  summary: string;
  category: string;
  content: string;
}

const categories = [
  { key: "all", label: "All Articles", icon: BookOpen },
  { key: "licensing", label: "Licensing", icon: Shield },
  { key: "infrastructure", label: "Infrastructure", icon: Server },
  { key: "activation", label: "Activation", icon: Zap },
  { key: "billing", label: "Billing", icon: CreditCard },
  { key: "general", label: "General", icon: HelpCircle },
];

const articles: Article[] = [
  {
    id: "license-types",
    category: "licensing",
    title: "Understanding License Types",
    summary: "Learn the differences between Trial, Pro, and Ultra licenses and which one fits your needs.",
    content: `VENOM CODES offers three license tiers:\n
**Trial** — A 7-day, one-time license that gives you access to the full core feature set on a single server. No load balancer is included. Ideal for evaluation.\n
**Pro** — A monthly license for production use. Includes a main server license with 1 load balancer. Additional load balancers can be added. Supports instant provisioning.\n
**Ultra** — A monthly license for enterprise-scale deployments. Includes multi-server licensing with unlimited load balancers. Full instant provisioning support.\n
All licenses activate instantly upon purchase.`,
  },
  {
    id: "hardware-binding",
    category: "licensing",
    title: "Hardware-Bound License Keys",
    summary: "How hardware binding works to protect your license and prevent unauthorized use.",
    content: `Every VENOM CODES license is bound to specific hardware identifiers on your server. This ensures that:\n
- Your license cannot be used on unauthorized machines
- License sharing or redistribution is prevented
- Each activation is uniquely tied to your infrastructure

When you activate a license, our system records a hardware fingerprint. If you need to migrate to new hardware, contact support to transfer your license binding.`,
  },
  {
    id: "instant-activation",
    category: "activation",
    title: "Instant Activation Process",
    summary: "Step-by-step guide to activating your license.",
    content: `VENOM CODES licenses activate instantly. Here's the process:\n
1. **Purchase** your chosen plan through our website
2. **Receive** your license key via email immediately
3. **Install** the VENOM CODES agent on your server
4. **Enter** your license key in the agent configuration
5. **Activate** — the system validates and binds your license in seconds

No manual approval or human review is needed. If activation fails, check your network connectivity and ensure your server meets the minimum requirements.`,
  },
  {
    id: "load-balancer-setup",
    category: "infrastructure",
    title: "Load Balancer Configuration",
    summary: "How to provision and manage load balancers with your VENOM CODES license.",
    content: `Load balancers distribute traffic across your infrastructure for improved reliability and performance.\n
**Setup Steps:**
1. Navigate to Load Balancers in your dashboard
2. Click "Add Load Balancer"
3. Configure your upstream servers
4. Set health check intervals
5. Deploy — provisioning completes instantly

Load balancers support TCP and HTTP protocols with configurable health checks and failover policies.`,
  },
  {
    id: "multi-server",
    category: "infrastructure",
    title: "Multi-Server Deployment Guide",
    summary: "Deploy across multiple servers with Ultra plan's multi-server licensing.",
    content: `The Ultra plan supports multi-server deployments, allowing a single license to cover your entire infrastructure.\n
**Key benefits:**
- Single license key for all servers
- Centralized management dashboard
- Unified billing and renewal

**Setup:**
1. Install the VENOM CODES agent on each server
2. Use your Ultra license key on all instances
3. Each server registers automatically
4. Manage all servers from the central dashboard`,
  },
  {
    id: "server-requirements",
    category: "infrastructure",
    title: "Server Requirements & Compatibility",
    summary: "Minimum server specifications and supported operating systems.",
    content: `**Minimum Requirements:**
- 1 vCPU core
- 512MB RAM
- 1GB disk space
- Stable internet connection

**Supported OS:**
- Ubuntu 20.04+ LTS
- Debian 11+
- CentOS 8+ / Rocky Linux 8+
- AlmaLinux 8+

**Network Requirements:**
- Outbound HTTPS (port 443) for license validation
- Inbound ports as required by your deployment`,
  },
  {
    id: "billing-cycles",
    category: "billing",
    title: "Billing Cycles & Payment Methods",
    summary: "Understanding billing periods, payment processing, and accepted methods.",
    content: `**Payment Methods:**
- Visa, Mastercard, American Express
- PayPal
- Cryptocurrency (Bitcoin, Ethereum)

**Billing Cycle:**
Monthly plans renew on the same date each month. You'll receive a reminder before renewal. Payments are processed automatically.

**Invoices** are generated automatically and available in your dashboard.`,
  },
  {
    id: "refund-policy",
    category: "billing",
    title: "Refund & Cancellation Policy",
    summary: "Learn about our refund policy and how to cancel your subscription.",
    content: `**Cancellation:**
1. Go to your dashboard → Billing → Subscription
2. Click "Cancel Subscription"
3. Your license remains active until the end of the current billing period

For refund requests, please contact support@venomcodes.com with your order details.`,
  },
  {
    id: "license-renewal",
    category: "licensing",
    title: "License Renewal & Expiration",
    summary: "What happens when your license expires and how auto-renewal works.",
    content: `**Auto-Renewal:**
Pro and Ultra plans auto-renew monthly. You'll receive email notifications before renewal.

**Expiration Process:**
1. License expires → grace period
2. Grace period ends → license deactivates gracefully
3. Your server configurations are preserved temporarily

**Re-activation:**
If your license expires, simply purchase a new plan and re-activate.`,
  },
  {
    id: "software-only",
    category: "general",
    title: "What Does VENOM CODES Provide?",
    summary: "Understanding our software-only business model and what we do and don't offer.",
    content: `VENOM CODES is a **software licensing and infrastructure solutions company**. We provide:

✅ Software licenses for server management
✅ Load balancer provisioning tools
✅ Infrastructure deployment automation
✅ License validation and management systems

**We do NOT provide:**
❌ IPTV content or media streams
❌ Video broadcasting services
❌ Content delivery networks for media
❌ Any form of content distribution

Our software is a tool. Users are solely responsible for how they deploy and use it.`,
  },
];

const KnowledgeBase = () => {
  const [search, setSearch] = useState("");
  const [activeCategory, setActiveCategory] = useState("all");
  const [selectedArticle, setSelectedArticle] = useState<Article | null>(null);

  const filtered = useMemo(() => {
    return articles.filter((a) => {
      const matchCat = activeCategory === "all" || a.category === activeCategory;
      const matchSearch =
        !search ||
        a.title.toLowerCase().includes(search.toLowerCase()) ||
        a.summary.toLowerCase().includes(search.toLowerCase());
      return matchCat && matchSearch;
    });
  }, [search, activeCategory]);

  if (selectedArticle) {
    return (
      <PageLayout>
        <div className="venom-section pt-32">
          <div className="venom-container">
            <div className="mx-auto max-w-3xl">
              <button
                onClick={() => setSelectedArticle(null)}
                className="mb-6 inline-flex items-center gap-2 text-sm text-muted-foreground hover:text-foreground transition-colors"
              >
                <ArrowLeft className="h-4 w-4" />
                Back to Knowledge Base
              </button>
              <span className="venom-badge mb-4 capitalize">{selectedArticle.category}</span>
              <h1 className="font-display text-2xl font-bold tracking-tight sm:text-3xl mt-3">
                {selectedArticle.title}
              </h1>
              <p className="mt-3 text-muted-foreground">{selectedArticle.summary}</p>
              <div className="mt-8 rounded-xl border bg-card p-6 sm:p-8">
                <div className="prose-sm text-sm leading-relaxed text-muted-foreground space-y-4">
                  {selectedArticle.content.split("\n\n").map((paragraph, i) => (
                    <p key={i} className="whitespace-pre-line">
                      {paragraph.split(/(\*\*[^*]+\*\*)/).map((part, j) => {
                        if (part.startsWith("**") && part.endsWith("**")) {
                          return <strong key={j} className="text-foreground">{part.slice(2, -2)}</strong>;
                        }
                        return part;
                      })}
                    </p>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </PageLayout>
    );
  }

  return (
    <PageLayout>
      <div className="venom-section pt-32">
        <div className="venom-container">
          <div className="mx-auto max-w-4xl">
            <div className="text-center mb-12">
              <span className="venom-badge mb-4">Knowledge Base</span>
              <h1 className="font-display text-3xl font-bold tracking-tight sm:text-4xl mt-4">
                Documentation & Guides
              </h1>
              <p className="mt-4 text-muted-foreground">
                Everything you need to know about VENOM CODES licensing and infrastructure.
              </p>
            </div>

            <div className="relative mb-8">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <input
                type="text"
                className="venom-input pl-11 py-3.5"
                placeholder="Search articles..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                maxLength={200}
              />
            </div>

            <div className="mb-8 flex flex-wrap gap-2">
              {categories.map((cat) => (
                <button
                  key={cat.key}
                  onClick={() => setActiveCategory(cat.key)}
                  className={`inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-xs font-medium transition-colors ${
                    activeCategory === cat.key
                      ? "venom-gradient-bg text-primary-foreground"
                      : "bg-secondary text-muted-foreground hover:text-foreground"
                  }`}
                >
                  <cat.icon className="h-3.5 w-3.5" />
                  {cat.label}
                </button>
              ))}
            </div>

            {filtered.length === 0 ? (
              <div className="text-center py-16">
                <HelpCircle className="mx-auto h-10 w-10 text-muted-foreground/40 mb-4" />
                <p className="text-sm text-muted-foreground">No articles found matching your search.</p>
              </div>
            ) : (
              <div className="grid gap-4 sm:grid-cols-2">
                {filtered.map((article) => {
                  const catDef = categories.find((c) => c.key === article.category);
                  const CatIcon = catDef?.icon || BookOpen;
                  return (
                    <button
                      key={article.id}
                      onClick={() => setSelectedArticle(article)}
                      className="venom-card text-left group cursor-pointer"
                    >
                      <div className="flex items-start gap-3">
                        <div className="shrink-0 rounded-lg p-2" style={{ background: "hsl(var(--accent-muted))" }}>
                          <CatIcon className="h-4 w-4 text-primary" />
                        </div>
                        <div className="flex-1 min-w-0">
                          <h3 className="font-display text-sm font-semibold mb-1 group-hover:text-primary transition-colors">
                            {article.title}
                          </h3>
                          <p className="text-xs text-muted-foreground leading-relaxed line-clamp-2">
                            {article.summary}
                          </p>
                          <div className="mt-3 flex items-center gap-1 text-xs text-primary font-medium">
                            Read article <ChevronRight className="h-3 w-3" />
                          </div>
                        </div>
                      </div>
                    </button>
                  );
                })}
              </div>
            )}

            <div className="mt-16 rounded-xl border bg-card p-8 text-center">
              <h3 className="font-display text-lg font-semibold mb-2">Can't find what you're looking for?</h3>
              <p className="text-sm text-muted-foreground mb-4">
                Our support team is available to help with any questions.
              </p>
              <Link to="/contact" className="venom-btn-primary px-6 py-2.5 text-sm">
                Contact Support
              </Link>
            </div>
          </div>
        </div>
      </div>
    </PageLayout>
  );
};

export default KnowledgeBase;
