# NestJS — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/javascript-typescript.md`.
> Layers on NestJS-specific checks (guards, pipes/DTOs, DI scope, interceptors, ORM).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these NestJS-specific checks:

SECURITY
- Auth: enforce Guards (@UseGuards with AuthGuard/RolesGuard) on protected controllers/handlers;
  verify JWTs (secret, exp, algorithm); never trust client roles; check record ownership to
  prevent IDOR.
- Validation & mass assignment: register a global ValidationPipe with whitelist: true and
  forbidNonWhitelisted: true; use class-validator DTOs; validate params/query; don't bind raw
  request bodies to entities.
- Serialization leakage: use ClassSerializerInterceptor with @Exclude on sensitive fields;
  never return ORM entities with password hashes/secrets directly.
- Injection: parameterized TypeORM/Prisma queries — no string-concatenated SQL; guard NoSQL
  injection; validate file uploads (Multer limits/type).
- Hardening: app.enableCors must not be wildcard-with-credentials; add helmet, rate limiting
  (@nestjs/throttler), and CSRF for cookie auth; load config from env (ConfigModule) with
  schema validation, no secrets in code; guard SSRF in outbound HTTP.

CORRECTNESS & PERFORMANCE
- DI scope: providers are singletons by default — REQUEST-scoped providers cascade through the
  chain and hurt performance; watch for shared mutable state in singletons.
- Async: flag floating promises (missing await) and unhandled rejections; route errors through
  exception filters; consistent async in guards/interceptors.
- Database: N+1 from TypeORM relations (use relations/joins/query builder); wrap multi-write ops
  in transactions (QueryRunner); connection-pool sizing; reversible migrations.
- Lifecycle: use OnModuleInit/OnApplicationShutdown for resource setup/teardown and enable
  shutdown hooks; mind interceptor/pipe overhead; cache with CacheModule.

QUALITY
- Architecture: clear module boundaries; constructor injection over service locators; avoid
  circular dependencies (a forwardRef is a smell); DTOs vs entities at the boundary.
- Consistency: centralized exception filters and response shape; typed everything, avoid any;
  structured logging (Nest Logger/pino).
- Tests: Test.createTestingModule with mocked providers for unit tests; e2e with supertest;
  override guards/DB to assert authorization and payloads.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
