# FlightPHP — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/php-modern.md`.
> Layers on FlightPHP-specific checks (routing, filters, raw PDO, views, JSON). FlightPHP is a
> minimal micro-framework — most guardrails are the developer's responsibility, so review for
> what it does NOT do for you.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these FlightPHP-specific checks:

SECURITY
- No ORM: data access is raw PDO (or Flight::db()/PdoWrapper). Require prepared statements with
  bound parameters — flag any SQL built by string interpolation of request data.
- Authorization: Flight enforces nothing by itself. Verify protected routes run an auth check in
  a Flight::before() filter or route middleware; validate route params (@id) and confirm
  ownership on the record to prevent IDOR.
- XSS: Flight::render() uses plain PHP templates with NO auto-escaping — every echoed variable
  must go through htmlspecialchars()/a helper; flag user data printed raw in views. (Flight::json
  encodes safely.)
- CSRF: Flight has NO built-in CSRF protection — state-changing POST/PUT/DELETE routes must
  implement and verify a token; check SameSite cookie flags.
- Input: validate and sanitize Flight::request()->query/data and $_GET/$_POST/$_FILES; validate
  uploads (type, size); guard path traversal in any file-serving route.
- Config/errors: in production disable error display and stack traces (don't leak via Flight's
  default handler) — set flight.handle_errors/flight.log_errors appropriately; no secrets in
  code (use vlucas/phpdotenv); force HTTPS and set security headers (CSP, HSTS) manually; CORS
  via a before() filter, not a wildcard with credentials.
- SSRF: server-side HTTP calls (curl/streams) to user-supplied URLs.

CORRECTNESS & PERFORMANCE
- Global state: Flight is a static singleton facade — beware shared/global state and be careful
  overriding core methods with Flight::map/register; keep route handlers free of hidden state.
- Routing: first match wins — check route ordering, regex patterns, and 404/405 (notFound /
  method-not-allowed) handling; middleware/filter execution order.
- Data access: reuse a single PDO connection; avoid N+1 queries in loops; paginate large reads;
  add DB indexes for filtered/sorted columns.
- HTTP caching: Flight has no cache layer — use Flight::etag()/Flight::lastModified() for
  cacheable GETs; stream large responses instead of buffering.

QUALITY
- Thin handlers: keep logic out of route closures — extract to controller/service classes;
  register dependencies via Flight::map/register instead of globals.
- Standards: Composer autoloading (PSR-4), env-based config, typed code per php-modern.md.
- Tests: PHPUnit; exercise routes by dispatching requests and asserting response/status; don't
  rely on real network or DB where a double works.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
