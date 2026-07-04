# Node.js / Express — Review Add-on

> Use together with a general master prompt. Layers on Node.js backend-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Node.js/Express-specific checks:

SECURITY
- Injection into child_process (exec vs execFile), fs paths, and DB drivers; SSRF via
  outbound http; prototype pollution via body parsers/merge utils.
- Missing security middleware: helmet, CORS locked down, rate limiting, body-size limits,
  input validation (zod/joi/express-validator) on every route.
- Auth: JWT verification (alg, expiry, audience), secure/httpOnly/sameSite cookies,
  session handling; secrets in env not code; no eval/vm on untrusted input.
- Path traversal in static/file serving; unrestricted file uploads; ReDoS regexes.
- Error handler doesn't leak stack traces in prod; dependency audit (npm audit).

CORRECTNESS & RELIABILITY
- Unhandled promise rejections / uncaught exceptions crashing the process; missing
  async error propagation in Express (wrap async handlers); floating promises.
- Blocking the event loop with sync fs/crypto/JSON on large data; missing streaming.
- Graceful shutdown (SIGTERM), connection draining, and DB pool cleanup.

PERFORMANCE
- No connection pooling; N+1 queries; missing caching; unbounded concurrency to
  downstreams; no timeouts on outbound calls; memory leaks from listeners/closures;
  large in-memory buffering instead of streams.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
