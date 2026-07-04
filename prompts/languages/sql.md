# SQL / Databases — Review Add-on

> Use together with a general master prompt. Layers on SQL & schema-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these SQL/database-specific checks:

SECURITY
- Injection surface: any query built by string concatenation; enforce parameterization.
- Least privilege: app account with excessive grants (DDL, superuser); public schema perms.
- Sensitive data unencrypted at rest; PII without masking; secrets in migration files.
- Dynamic SQL/stored procedures executing untrusted input; overly permissive views.

CORRECTNESS
- Missing/incorrect constraints: PK, FK, UNIQUE, NOT NULL, CHECK; orphaned rows risk.
- Transaction boundaries and isolation level; race conditions (lost updates, phantom
  reads); missing SELECT ... FOR UPDATE where needed; non-idempotent migrations.
- NULL logic bugs (= NULL, NOT IN with NULLs); implicit type casts; timezone handling.

PERFORMANCE
- Missing indexes on JOIN/WHERE/ORDER BY columns; unused or redundant indexes.
- SELECT *; N+1 patterns; non-sargable predicates (functions on indexed columns);
  full table scans; missing pagination; large IN lists; Cartesian joins.
- Read the query plan mentally; suggest EXPLAIN/ANALYZE checks; note index that fixes it.

SCHEMA & MAINTAINABILITY
- Normalization vs. justified denormalization; data types too wide/narrow; naming
  consistency; missing created_at/updated_at; safe, reversible migrations with locks
  minimized on large tables.

Report in the base prompt's format, citing exact object/line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
