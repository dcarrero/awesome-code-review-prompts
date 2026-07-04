# Ruby on Rails — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/ruby.md`.
> Layers on Rails-specific checks (Active Record, strong params, auth, jobs, views).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Ruby on Rails-specific checks:

SECURITY
- Mass assignment: enforce Strong Parameters (params.require(...).permit(...)); flag permit!,
  or update(params[...]) without permit; never trust nested params without explicit permits.
- Authorization: enforce Pundit/CanCanCan or explicit checks in a before_action; scope reads
  to the current user (current_user.orders.find(id)) to prevent IDOR; don't rely on hidden UI.
- SQL injection: string interpolation into where/order/pluck/find_by_sql/exists?; use
  parameterized where("col = ?", val) or hash conditions; whitelist columns for order/sort;
  Arel.sql on user input is a red flag.
- XSS: ERB <%= %> auto-escapes — flag html_safe, raw(), <%== %>, and content_tag with user
  data; use the sanitize helper with an allowlist; set a Content-Security-Policy.
- CSRF: protect_from_forgery is on by default — a skip_before_action :verify_authenticity_token
  on a state-changing action needs justification; APIs should use tokens, not disabled CSRF.
- Secrets/config: master.key / credentials.yml.enc not committed; secret_key_base set;
  config.force_ssl = true in production; no secrets hardcoded.
- Open redirect / SSRF: redirect_to with user input (set allow_other_host: false); server-side
  HTTP calls to user-supplied URLs; validate uploads (content type, size), Active Storage.
- Data integrity: update_column/update_all skip validations and callbacks — flag on
  user-facing writes; signed/encrypted cookies for session data.

CORRECTNESS & PERFORMANCE
- N+1 queries: missing includes/preload/eager_load (verify with the bullet gem); prefer
  exists? over present?, size over count where a collection is loaded; select only needed
  columns; use find_each/in_batches for large sets.
- Transactions & callbacks: wrap multi-write operations in a transaction; use after_commit
  (not after_save) for external side effects; make jobs/callbacks idempotent.
- Migrations: reversible (up/down or change); add indexes for foreign keys and lookups;
  add_index ..., algorithm: :concurrently (with disable_ddl_transaction!) on large tables;
  back uniqueness validations with a DB unique index (validation alone races).
- Background work: move heavy/slow work to ActiveJob/Sidekiq, not the request; pass record
  IDs, not Active Record objects; configure retries/backoff.
- Caching: fragment/russian-doll caching and counter_cache where appropriate; stable cache
  keys; avoid per-user cache leaks. No queries in views; paginate (kaminari/pagy).

QUALITY
- Skinny controllers/models: extract business logic to service objects/POROs/concerns; avoid
  callback-driven side effects that are hard to test.
- Output shaping: use serializers/jbuilder; avoid to_json without only/except (attribute
  leakage); centralize strong params.
- I18n: no hardcoded user-facing strings — use t(); zeitwerk-compliant autoloading.
- Tests: request/system specs plus model validations; FactoryBot factories; avoid slow,
  over-mocked tests. Check the Rails version for deprecations and unpatched CVEs.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
