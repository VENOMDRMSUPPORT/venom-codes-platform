/**
 * WHMCS Mapping: Form layout partial — used in profile, settings, contact forms
 * Consistent form section with title + description + fields.
 */
import { ReactNode } from "react";

interface FormSectionProps {
  title: string;
  description?: string;
  children: ReactNode;
  actions?: ReactNode;
}

const FormSection = ({ title, description, children, actions }: FormSectionProps) => {
  return (
    <div className="rounded-xl border bg-card">
      <div className="border-b px-5 py-4">
        <h3 className="font-display text-sm font-semibold">{title}</h3>
        {description && <p className="mt-0.5 text-xs text-muted-foreground">{description}</p>}
      </div>
      <div className="p-5 space-y-4">
        {children}
      </div>
      {actions && (
        <div className="flex justify-end gap-2 border-t px-5 py-3.5">
          {actions}
        </div>
      )}
    </div>
  );
};

/* Reusable form field wrapper */
export const FormField = ({ label, htmlFor, required, children, hint }: {
  label: string;
  htmlFor?: string;
  required?: boolean;
  children: ReactNode;
  hint?: string;
}) => (
  <div>
    <label htmlFor={htmlFor} className="mb-1.5 block text-sm font-medium">
      {label}
      {required && <span className="text-destructive ml-0.5">*</span>}
    </label>
    {children}
    {hint && <p className="mt-1 text-xs text-muted-foreground">{hint}</p>}
  </div>
);

export default FormSection;
