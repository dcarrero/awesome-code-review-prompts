# Django (Python) — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/python.md`.
> Layers on Django-specific checks (ORM, forms/DRF, auth, templates, settings, migrations).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Django-specific checks:

SECURITY
- Mass assignment: ModelForm/serializers with explicit fields, never fields = '__all__';
  validate every write through forms or DRF serializers, not request.data directly.
- Authorization: enforce LoginRequiredMixin/PermissionRequiredMixin or DRF permission_classes;
  scope object access to the request user (get_object_or_404(Model, id=id, owner=request.user))
  to prevent IDOR; don't gate on is_staff alone.
- SQL: raw()/extra()/cursor.execute() with string interpolation — use params=[...]; avoid
  .extra(); never interpolate user input into RawSQL, order_by(), or annotate().
- XSS: templates auto-escape — flag |safe, mark_safe(), format_html() misuse, and
  {% autoescape off %}; pass data to JS via {{ ...|json_script }}, not inline interpolation.
- CSRF: keep CsrfViewMiddleware on; @csrf_exempt on a state-changing view needs justification;
  set SESSION_COOKIE_SAMESITE / CSRF_COOKIE_SECURE.
- Settings: DEBUG=False in prod, SECRET_KEY from env, ALLOWED_HOSTS restricted, SECURE_SSL_
  REDIRECT / SECURE_HSTS_* / SESSION_COOKIE_SECURE set; no secrets committed in settings.
- Uploads/SSRF/deserialization: validate FileField/ImageField (content type, size); requests
  to user-supplied URLs; never pickle untrusted data (sessions/cache); sign with
  django.core.signing.
- Open redirect: redirect()/next param without url_has_allowed_host_and_scheme().

CORRECTNESS & PERFORMANCE
- N+1 queries: use select_related (FK/one-to-one) and prefetch_related (M2M/reverse);
  only()/defer() to trim columns; .exists() over bool(qs); .count() over len(qs); iterator()
  for large sets; bulk_create/bulk_update instead of per-row saves.
- Indexes: add db_index / Meta.indexes for filtered and ordered fields; queries in templates
  or loops; paginate list views.
- Transactions: wrap multi-write logic in transaction.atomic; select_for_update for races;
  transaction.on_commit for external side effects.
- Migrations: reversible; keep data migrations (RunPython with a reverse) separate from schema;
  add indexes concurrently on large Postgres tables; avoid long table locks.
- Signals/Celery: move heavy work out of signals into async tasks; make tasks idempotent.
- Caching: per-view/fragment caching with correct keys and invalidation; avoid per-user leaks.

QUALITY
- Thin views: push logic into services/managers; consistent CBV vs FBV; DRF ViewSets +
  serializers for APIs.
- Settings split (base/dev/prod), 12-factor config (django-environ); USE_TZ with timezone-aware
  datetimes; gettext for user-facing strings.
- Tests: pytest-django / TestCase with the test Client/APIClient and factory_boy; no real
  network; assert behavior and permissions, not implementation.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
