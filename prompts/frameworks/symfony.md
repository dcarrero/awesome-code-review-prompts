# Symfony — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/php-modern.md`.
> Layers on Symfony-specific checks (Doctrine, Security, DI, Forms, Twig).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Symfony-specific checks:

SECURITY
- Access control: security.yaml rules, #[IsGranted]/denyAccessUnlessGranted, Voters for
  object-level authorization; don't rely on route obscurity; check ownership (avoid IDOR).
- Authentication: password hashers configured (not plaintext/md5), CSRF protection on
  forms, remember-me/token handling, firewalls scoped correctly, session fixation handled.
- Input: validate with Constraints/Validator; bind data via Forms or DTOs, not raw request;
  avoid $request->query/request->request straight into logic without validation.
- Doctrine: DQL/native SQL built with concatenated input vs. parameters (setParameter);
  never interpolate user input into DQL.
- Twig: autoescaping on; flag |raw with user data; escaping per context (html/js/url);
  no injection via dynamic template names.
- Config/secrets: APP_ENV=prod & APP_DEBUG=0 in prod, secrets vault/env not committed,
  trusted proxies/hosts set, CORS configured, error pages don't leak stack traces.

CORRECTNESS & PERFORMANCE
- Doctrine N+1: missing fetch joins/eager fetch, lazy associations in loops; use partial/
  DTO hydration; avoid loading whole repositories; batch and clear() on bulk operations.
- EntityManager flush in loops; missing transactions for multi-entity writes; unit-of-work
  memory growth; second-level/query cache where appropriate.
- Heavy work synchronous instead of Messenger (async transport); missing retry/failure
  handling; events/subscribers doing blocking I/O.
- HTTP cache/ESI, and prod cache warmup considered.

QUALITY & ARCHITECTURE
- Dependency Injection via autowiring/constructor, not container fetches (no service
  locator abuse); services stateless; controllers thin, logic in services/handlers.
- Proper use of DTOs, Form types, Serializer groups to avoid over-exposure of entities.
- Doctrine migrations reversible; typed entity properties; tests via WebTestCase/KernelTestCase.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
