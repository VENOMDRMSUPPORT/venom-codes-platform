/**
 * WHMCS Mapping: viewticket.tpl — ticket conversation thread
 * Displays messages in a ticket with author, date, and content.
 */

interface TicketMessage {
  id: string;
  author: string;
  isStaff: boolean;
  date: string;
  content: string;
}

interface TicketConversationProps {
  messages: TicketMessage[];
}

const TicketConversation = ({ messages }: TicketConversationProps) => {
  return (
    <div className="space-y-4">
      {messages.map((msg) => (
        <div
          key={msg.id}
          className={`rounded-xl border p-4 ${
            msg.isStaff ? "bg-primary/5 border-primary/20" : "bg-card"
          }`}
        >
          <div className="mb-2 flex items-center justify-between">
            <div className="flex items-center gap-2">
              <div className={`flex h-7 w-7 items-center justify-center rounded-full text-xs font-bold text-primary-foreground ${
                msg.isStaff ? "venom-gradient-bg" : "bg-muted-foreground/80"
              }`}>
                {msg.author.charAt(0).toUpperCase()}
              </div>
              <div>
                <span className="text-sm font-semibold">{msg.author}</span>
                {msg.isStaff && (
                  <span className="ml-1.5 rounded bg-primary/10 px-1.5 py-0.5 text-[10px] font-semibold text-primary">
                    Staff
                  </span>
                )}
              </div>
            </div>
            <time className="text-xs text-muted-foreground">{msg.date}</time>
          </div>
          <div className="text-sm text-foreground/90 leading-relaxed whitespace-pre-wrap pl-9">
            {msg.content}
          </div>
        </div>
      ))}
    </div>
  );
};

export default TicketConversation;
