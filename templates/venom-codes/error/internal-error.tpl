<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Oops! - Internal Server Error</title>
    <style>
        :root {
            --primary: 262.1 83.3% 57.8%;
            --primary-foreground: 210 20% 98%;
            --background: 0 0% 100%;
            --foreground: 222.2 84% 4.9%;
            --muted: 210 40% 96.1%;
            --muted-foreground: 215.4 16.3% 46.9%;
            --border: 214.3 31.8% 91.4%;
            --destructive: 0 84.2% 60.2%;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: hsl(var(--background));
            color: hsl(var(--foreground));
            line-height: 1.6;
            display: flex;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }
        
        .error-container {
            width: 100%;
            max-width: 42rem;
            text-align: center;
        }
        
        .icon-wrapper {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 5rem;
            height: 5rem;
            margin-bottom: 2rem;
            border-radius: 1rem;
            background: hsl(var(--destructive) / 0.1);
        }
        
        .icon-wrapper svg {
            width: 3rem;
            height: 3rem;
            color: hsl(var(--destructive));
        }
        
        h1 {
            font-size: 3rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            margin-bottom: 1rem;
            color: hsl(var(--foreground));
        }
        
        h2 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: hsl(var(--muted-foreground));
        }
        
        p {
            font-size: 1rem;
            margin-bottom: 1rem;
            color: hsl(var(--muted-foreground));
        }
        
        .actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.2s;
            border: 1px solid transparent;
        }
        
        .btn-primary {
            background: hsl(var(--primary));
            color: hsl(var(--primary-foreground));
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }
        
        .btn-primary:hover {
            background: hsl(var(--primary) / 0.9);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-secondary {
            background: hsl(var(--muted));
            color: hsl(var(--foreground));
        }
        
        .btn-secondary:hover {
            background: hsl(var(--muted) / 0.8);
        }
        
        .debug-info {
            margin-top: 3rem;
            padding: 1.5rem;
            border-radius: 0.5rem;
            background: hsl(var(--muted));
            border: 1px solid hsl(var(--border));
            text-align: left;
        }
        
        .debug-info pre {
            font-family: 'Courier New', Courier, monospace;
            font-size: 0.875rem;
            white-space: pre-wrap;
            word-break: break-word;
            color: hsl(var(--foreground));
            line-height: 1.5;
        }
        
        .environment-issues {
            margin-top: 2rem;
            padding: 1rem;
            border-radius: 0.5rem;
            background: hsl(var(--muted));
            border-left: 4px solid hsl(var(--destructive));
        }
        
        @media (max-width: 640px) {
            h1 {
                font-size: 2rem;
            }
            
            h2 {
                font-size: 1.25rem;
            }
            
            .icon-wrapper {
                width: 4rem;
                height: 4rem;
            }
            
            .icon-wrapper svg {
                width: 2.5rem;
                height: 2.5rem;
            }
            
            .actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="icon-wrapper">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"/>
                <line x1="12" y1="8" x2="12" y2="12"/>
                <line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
        </div>
        
        <h1>Oops!</h1>
        <h2>Something went wrong on our end</h2>
        <p>We're sorry, but we couldn't process your request. Our team has been notified and we're working to fix the issue.</p>
        <p>Please try again in a few moments. If the problem persists, feel free to <a href="mailto:{{email}}" style="color: hsl(var(--primary)); text-decoration: underline;">contact us</a>.</p>
        
        <div class="actions">
            <a href="javascript:history.back()" class="btn btn-secondary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="19" y1="12" x2="5" y2="12"/>
                    <polyline points="12 19 5 12 12 5"/>
                </svg>
                Go Back
            </a>
            <a href="{{systemurl}}" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
                    <polyline points="9 22 9 12 15 12 15 22"/>
                </svg>
                Return to Homepage
            </a>
        </div>
        
        {{environmentIssues}}
        
        {{if $adminHelp || $stacktrace}}
            <div class="debug-info">
                <pre>{{$adminHelp}}

{{$stacktrace}}</pre>
            </div>
        {{/if}}
    </div>
</body>
</html>
