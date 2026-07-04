# Cloudflare Workers — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/javascript-typescript.md`.
> Layers on Workers/edge-runtime checks (bindings, isolate model, KV/D1/R2/DO, wrangler).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Cloudflare Workers-specific checks:

SECURITY
- Secrets: use `wrangler secret` / secret bindings, never hardcode — remember [vars] in
  wrangler.toml are PUBLIC; never log secrets.
- Edge auth: verify JWT/HMAC on incoming requests; validate Origin; don't trust spoofable client
  headers; add rate limiting (Rate Limiting API or a Durable Object) — the edge is directly
  internet-exposed.
- Injection: D1 access must use prepared statements with .bind(), never string-built SQL; validate
  KV key construction; guard SSRF in fetch() to user-controlled URLs (including internal service
  hostnames).
- CORS/input: explicit allowed origins (not wildcard-with-credentials) and correct preflight;
  validate request body/query and enforce size limits (Workers has CPU/memory ceilings).

CORRECTNESS & PERFORMANCE (isolate runtime)
- No cross-request global state: module-scope mutable variables are shared across requests within
  an isolate and leak between users — never cache per-user/auth data in globals.
- Runtime limits: no Node APIs unless nodejs_compat is set; avoid heavy synchronous loops (CPU
  time is capped); stream large responses instead of buffering.
- Async lifecycle: use ctx.waitUntil() for post-response work (logging, cache writes) so it isn't
  cancelled when the response returns; never block the response.
- Storage semantics — pick the right one: KV is eventually consistent (not read-after-write); D1
  for relational; Durable Objects for strong consistency / coordination / stateful sessions; R2
  for blobs. Cache with the Cache API / cache headers, but never cache authenticated responses.
- Subrequests: mind the subrequest limit; avoid N+1 fetches; reuse connections.

QUALITY
- Config: wrangler.toml bindings (KV/D1/R2/DO/Queues), compatibility_date/flags, and per-env
  settings are explicit and typed (an `Env` interface); enable observability (tail/logpush).
- Routing/errors: a router (Hono/itty-router) with handlers that always return a proper Response
  and handle errors; idempotent Queue consumers with retry/backoff.
- Tests: Vitest with @cloudflare/vitest-pool-workers / Miniflare, exercising real bindings.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
