# Laravel — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/php-modern.md`.
> Layers on Laravel-specific checks (Eloquent, validation, auth, queues, Blade).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Laravel-specific checks:

SECURITY
- Mass assignment: models with $guarded = [] or unguarded fillable; use $fillable and
  $request->validated() instead of $request->all(); avoid forceFill with user input.
- Authorization: enforce Policies/Gates (authorize/can) and route middleware; don't rely
  on hidden UI; check ownership on route-model-bound records (avoid IDOR).
- Validation: every request validated via Form Requests or $request->validate(); validate
  file uploads (mimes, max), and sanitize/whitelist sortable/filterable columns.
- SQL: raw queries via DB::raw / whereRaw with user input; enforce bindings; avoid
  interpolating request data into orderBy/column names.
- Blade output: {{ }} auto-escapes — flag {!! !!} (raw) with user data; XSS via unescaped
  HTML, javascript: hrefs, or @json misuse.
- Secrets/config: APP_DEBUG=false in prod, APP_KEY set, no secrets committed, correct
  filesystem visibility, signed URLs for sensitive links, CSRF on web forms.
- CORS, throttle middleware on auth/APIs, and sensitive routes rate-limited.

CORRECTNESS & PERFORMANCE
- Eloquent N+1: missing eager loading (with()), lazy loads in loops; enable/inspect
  preventLazyLoading in non-prod; select only needed columns; chunk large datasets.
- Queries in Blade/views; missing indexes; whereHas performance; pagination present.
- Long/heavy work run synchronously in requests instead of Jobs/queues; missing retry/
  timeout/backoff; events/listeners doing blocking I/O.
- Caching (cache()/remember), config/route caching for prod; avoid caching per-user leaks.
- Transactions around multi-write operations; DB::transaction for atomicity; observers vs.
  fat controllers; business logic pushed into services/actions, not controllers/models.

QUALITY
- Fat controllers; logic in models vs. services; use of Form Requests, Resources/API
  Resources for output shaping; config() over env() outside config files; typed casts;
  migrations reversible; tests via feature/HTTP tests and factories.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
