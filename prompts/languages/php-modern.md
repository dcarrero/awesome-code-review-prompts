# Modern PHP (framework-agnostic) — Review Add-on

> Use together with a general master prompt. Layers on modern PHP (8.x) checks that apply
> to **any** framework or plain PHP. For Laravel or Symfony specifics, also append the
> matching file in `prompts/frameworks/`.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these modern PHP (8.x) framework-agnostic checks:

SECURITY
- SQL: enforce PDO/prepared statements with bound params; never interpolate input into
  queries; disable emulated prepares where it matters; validate ordering/limit inputs.
- Output escaping: htmlspecialchars with ENT_QUOTES on all HTML output; context-aware
  escaping (HTML/attr/JS/URL); no raw echo of request data.
- Command/file: no shell_exec/exec/system with user input; safe file handling; path
  traversal via include/require/fopen; validate uploads (mime, size, extension, storage
  outside webroot).
- Session & auth: httponly/secure/samesite cookies, session regeneration on login,
  password_hash/password_verify (never md5/sha1), CSRF tokens on state changes.
- Deserialization: avoid unserialize() on untrusted input (object injection); prefer JSON.
- Config: no secrets in code/VCS (use env), display_errors off in prod, strict type
  comparisons (===) to avoid type juggling auth bypass, extract()/variable variables misuse.

MODERN LANGUAGE & TYPES
- declare(strict_types=1) at the top of files; typed properties, parameters, return types,
  and nullable types honored; enums and readonly properties used where appropriate.
- Null-safety: null coalescing/nullsafe operators vs. suppressed warnings (@); avoid
  isset-abuse hiding logic bugs; match vs. loose switch.
- Constructor promotion, first-class callables, named args used idiomatically (not obscuring).

QUALITY, STANDARDS & PERFORMANCE
- PSR-12 formatting and PSR-4 autoloading; no manual require of classes; Composer deps
  pinned and audited (composer audit); avoid abandoned packages.
- Correctness: exceptions vs. silent false returns; finally/resource cleanup; DateTimeImmutable
  and explicit timezones; float/money handled without precision bugs (use integers/decimals).
- Performance: N+1 across data access, repeated queries in loops, missing caching, unbounded
  result sets, opcache assumptions, heavy work per request that should be queued.
- Testability: dependencies injected (no `new` hard-wiring), no global state/singletons
  hiding coupling, static calls limiting mockability.

Report in the base prompt's format, citing exact file:line.
```

## Tips
- For CMS code use `php-wordpress.md`; for app frameworks add `laravel.md` or `symfony.md`.
- Ask it to confirm the PHP version — 8.1/8.2/8.3 unlock different idioms.

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
