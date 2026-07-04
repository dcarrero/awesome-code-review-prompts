# Spring Boot (Java) — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/java.md`.
> Layers on Spring Boot-specific checks (Security, JPA, DTOs, transactions, Actuator, config).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Spring Boot-specific checks:

SECURITY
- Spring Security: explicit authorizeHttpRequests rules; method security (@PreAuthorize) on
  sensitive service methods; permitAll() only where intended; a global CSRF disable or
  permitAll() is a red flag unless it's a stateless token API.
- Authorization / IDOR: verify ownership before returning or mutating an entity; don't expose
  internal IDs without an access check; @PreAuthorize SpEL or explicit guards.
- SQL/JPA injection: string-concatenated JPQL or native queries — use bound parameters
  (:name / ?1); validate and whitelist Pageable/Sort fields (user-controlled sort is injection
  and a DoS vector).
- Deserialization/SpEL: unsafe Jackson polymorphic typing (activateDefaultTyping / @JsonTypeInfo
  on untrusted input) is an RCE risk; ObjectInputStream and SnakeYAML load() on untrusted data;
  SpEL built from user input.
- Mass assignment/validation: bind requests to DTOs, not entities; @Valid + Bean Validation on
  DTOs; restrict fields with @InitBinder allowlists.
- Actuator/config: secure /actuator (management.endpoints.web.exposure), never expose env,
  heapdump, or beans publicly; no secrets in application.properties/yml — use env/Vault/config
  server; CORS not wildcard-with-credentials; enable HTTPS and security headers.
- SSRF: RestTemplate/WebClient calls to user-supplied URLs.

CORRECTNESS & PERFORMANCE
- JPA N+1: LAZY associations accessed in loops — use JOIN FETCH or @EntityGraph; avoid
  FetchType.EAGER as a default; use DTO projections; always paginate large reads; keep
  open-session-in-view disabled.
- Transactions: correct @Transactional boundaries; self-invocation bypasses the proxy (no
  transaction/retry applied); readOnly=true for reads; sensible propagation/isolation.
- Concurrency/pools: HikariCP pool sizing; in WebFlux, never block the event loop (no blocking
  JDBC/RestTemplate in reactive chains); configure @Async executors explicitly.
- Caching: @Cacheable with correct keys and eviction; avoid caching per-user data globally.
- Error handling: centralized @ControllerAdvice / @ExceptionHandler; never leak stack traces or
  internal messages to clients.

QUALITY
- Layering: controller → service → repository; DTOs vs entities at the boundary; constructor
  injection over field @Autowired; no business logic in controllers.
- Config: profiles (application-prod.yml); typed @ConfigurationProperties over scattered @Value;
  fail-fast on missing required config.
- Tests: use slices (@WebMvcTest, @DataJpaTest) and MockMvc rather than always @SpringBootTest;
  Testcontainers for real DB behavior; assert status, payload, and authorization.
- Observability: Actuator health/metrics via Micrometer; structured logging with correlation IDs.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
