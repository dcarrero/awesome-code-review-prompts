# Go — Review Add-on

> Use together with a general master prompt. Layers on Go-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Go-specific checks:

SECURITY
- SQL injection via fmt.Sprintf queries instead of parameterized database/sql.
- Command injection via os/exec with shell; path traversal via filepath.Join misuse.
- Unvalidated redirects/SSRF via http.Get on user URLs; missing TLS verification.
- Hardcoded secrets; math/rand for tokens (use crypto/rand); template vs html/template
  (autoescaping) confusion.

CORRECTNESS & CONCURRENCY
- Unchecked errors (err ignored with _); wrapping errors with %w for context.
- Goroutine leaks: goroutines that never exit, missing context cancellation, blocked
  channel sends/receives; WaitGroup misuse.
- Data races: shared state without mutex/channel; run mentally with -race in mind.
- nil map writes; slice aliasing/append surprises; defer in loops holding resources;
  copying structs with mutexes; range-variable capture in goroutines (pre-1.22).

PERFORMANCE & IDIOM
- Unnecessary allocations; string concat in loops (use strings.Builder); premature
  interface use; missing preallocation (make with cap); reflection in hot paths.
- Context propagation and timeouts on all I/O; proper Close() with defer + error check.
- Accept interfaces, return structs; small interfaces; avoid empty interface{}/any abuse.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
