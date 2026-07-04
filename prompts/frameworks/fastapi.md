# FastAPI (Python) — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/python.md`.
> Layers on FastAPI-specific checks (dependencies/auth, Pydantic, async, serialization).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these FastAPI-specific checks:

SECURITY
- Auth: enforce auth via Depends() on every protected route; with OAuth2/JWT verify signature,
  exp, aud, and algorithm (reject alg=none); apply scopes; never trust client-supplied claims.
  Check ownership on path params (/items/{id}) to prevent IDOR.
- Response leakage: set an explicit response_model (or a dedicated Read schema) so ORM objects
  don't leak fields like password hashes or internal flags; don't return the DB model directly.
- Mass assignment: build objects from explicit Pydantic schema fields, never spread a raw request
  body dict into an ORM model.
- Injection: parameterized DB access (no text() with f-strings / string-built SQL); validate and
  constrain query/path params; validate uploads (size, content type).
- CORS/secrets: CORSMiddleware must not combine allow_origins=["*"] with allow_credentials=True;
  load config via pydantic BaseSettings from env, no secrets in code; consider disabling or
  protecting /docs and /openapi.json in production.
- Abuse: FastAPI has no built-in rate limiting — add it (e.g. slowapi); cap request body size;
  guard SSRF in server-side httpx/requests calls to user-supplied URLs.

CORRECTNESS & PERFORMANCE (async)
- Event loop: blocking work inside `async def` (sync DB drivers, requests, time.sleep, heavy
  CPU) stalls the whole loop — use async drivers or run_in_executor; know that a plain `def`
  endpoint runs in a threadpool while `async def` runs on the loop.
- DB sessions: yield a request-scoped session via a dependency; prefer async SQLAlchemy; watch
  N+1 queries and connection-pool sizing.
- Background work: BackgroundTasks is for light post-response work — offload heavy/long jobs to a
  real queue (Celery/arq); manage resources with lifespan/startup-shutdown, not module globals.
- Serialization/deps: large response serialization cost; avoid heavy work in per-request
  dependencies; use dependency caching where safe; be explicit about Pydantic v1 vs v2 behavior.

QUALITY
- Structure: organize with APIRouter and tags; inject collaborators via Depends over globals;
  keep endpoints thin.
- Schemas: separate Create/Read/Update Pydantic models from ORM entities (a clear DTO boundary);
  accurate status codes and HTTPException/exception handlers.
- Tests: TestClient or httpx AsyncClient with pytest; override auth/DB dependencies; assert
  status, payload shape, and authorization.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
