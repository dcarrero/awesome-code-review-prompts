# React / Next.js — Review Add-on

> Use together with a general master prompt (accessibility & performance pair especially well).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these React/Next.js-specific checks:

SECURITY
- XSS via dangerouslySetInnerHTML without sanitization; injecting user HTML/URLs
  (javascript: hrefs); untrusted data in <script>/inline styles.
- Next.js: secrets leaking to the client (NEXT_PUBLIC_ misuse); server-only code/keys
  imported into client components; unvalidated API route / server action inputs;
  missing auth checks in route handlers/middleware; SSRF in server fetch; open redirects.
- Exposed environment variables; missing CSRF/rate limiting on mutations.

CORRECTNESS (HOOKS & STATE)
- useEffect dependency arrays wrong/missing; effects that should be derived state;
  cleanup missing (subscriptions/timers); stale closures; setState in render.
- Keys using array index causing reconciliation bugs; mutating state directly;
  race conditions in async effects (no abort); Server/Client component boundary misuse.

PERFORMANCE
- Unnecessary re-renders: missing memo/useMemo/useCallback where profiled; context
  causing wide re-renders; large lists without virtualization; unstable props/objects
  created in render.
- Next.js: not using Server Components/streaming where beneficial; unoptimized images
  (use next/image); waterfalls vs. parallel data fetching; missing caching/revalidation
  strategy; oversized client bundles (dynamic import, tree-shaking).

ACCESSIBILITY & QUALITY
- Semantic elements over div/span; label associations; focus management on route
  changes and modals; ARIA correctness. Component API clarity; prop typing.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
