# Java — Review Add-on

> Use together with a general master prompt. Layers on Java-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Java-specific checks:

SECURITY
- SQL injection via Statement string concat instead of PreparedStatement.
- Unsafe deserialization (ObjectInputStream on untrusted data); XXE in XML parsers
  (enable secure processing, disable DTD/external entities).
- Path traversal; command injection via Runtime.exec; SSRF via URL/HttpClient.
- Spring: missing @PreAuthorize/method security, CSRF disabled, actuator exposed,
  mass assignment via @ModelAttribute, SpEL injection, permit-all misconfig.
- Weak crypto (DES/ECB), hardcoded keys, insecure Random for tokens (use SecureRandom).

CORRECTNESS & CONCURRENCY
- NullPointerException risks; Optional misused; equals/hashCode contract violations.
- Thread safety: shared mutable state, non-atomic compound actions, missing volatile/
  synchronization, double-checked locking bugs, non-thread-safe SimpleDateFormat.
- Resource leaks: streams/connections not in try-with-resources; unclosed executors.
- Exception handling: swallowing, catching Throwable, losing stack traces.

PERFORMANCE & QUALITY
- N+1 (JPA/Hibernate), missing fetch strategy, entities loaded eagerly; boxing in
  hot loops; String concat in loops (use StringBuilder); unbounded collections.
- Overuse of reflection; leaky abstractions; God classes; missing immutability;
  proper use of streams vs. readability.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
