# Django (Python) — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/python-ES.md`.
> Añade comprobaciones específicas de Django (ORM, forms/DRF, auth, plantillas, settings, migraciones).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Django:

SEGURIDAD
- Mass assignment: ModelForm/serializers con campos explícitos, nunca fields = '__all__';
  valida cada escritura con forms o serializers de DRF, no request.data directamente.
- Autorización: aplica LoginRequiredMixin/PermissionRequiredMixin o permission_classes de DRF;
  acota el acceso a objetos al usuario (get_object_or_404(Model, id=id, owner=request.user))
  para evitar IDOR; no bases la autorización solo en is_staff.
- SQL: raw()/extra()/cursor.execute() con interpolación de cadenas — usa params=[...]; evita
  .extra(); nunca interpoles entrada de usuario en RawSQL, order_by() o annotate().
- XSS: las plantillas autoescapan — marca |safe, mark_safe(), mal uso de format_html() y
  {% autoescape off %}; pasa datos a JS con {{ ...|json_script }}, no por interpolación inline.
- CSRF: mantén CsrfViewMiddleware activo; @csrf_exempt en una vista que cambia estado requiere
  justificación; define SESSION_COOKIE_SAMESITE / CSRF_COOKIE_SECURE.
- Settings: DEBUG=False en producción, SECRET_KEY desde el entorno, ALLOWED_HOSTS restringido,
  SECURE_SSL_REDIRECT / SECURE_HSTS_* / SESSION_COOKIE_SECURE definidos; sin secretos
  commiteados en settings.
- Subidas/SSRF/deserialización: valida FileField/ImageField (tipo de contenido, tamaño);
  peticiones a URLs suministradas por el usuario; nunca hagas pickle de datos no confiables
  (sesiones/caché); firma con django.core.signing.
- Open redirect: redirect()/parámetro next sin url_has_allowed_host_and_scheme().

CORRECCIÓN Y RENDIMIENTO
- Consultas N+1: usa select_related (FK/one-to-one) y prefetch_related (M2M/inverso);
  only()/defer() para recortar columnas; .exists() en vez de bool(qs); .count() en vez de
  len(qs); iterator() en conjuntos grandes; bulk_create/bulk_update en vez de saves por fila.
- Índices: añade db_index / Meta.indexes en campos filtrados y ordenados; consultas en
  plantillas o bucles; pagina las vistas de lista.
- Transacciones: envuelve la lógica multi-escritura en transaction.atomic; select_for_update
  para races; transaction.on_commit para efectos externos.
- Migraciones: reversibles; mantén las migraciones de datos (RunPython con reverse) separadas
  del esquema; añade índices concurrently en tablas Postgres grandes; evita locks largos.
- Signals/Celery: saca el trabajo pesado de los signals a tareas asíncronas; hazlas idempotentes.
- Caché: caché por vista/fragmento con claves e invalidación correctas; evita fugas por usuario.

CALIDAD
- Vistas ligeras: mueve la lógica a services/managers; consistencia CBV vs FBV; ViewSets +
  serializers de DRF para APIs.
- Settings divididos (base/dev/prod), config 12-factor (django-environ); USE_TZ con datetimes
  con zona horaria; gettext para cadenas de cara al usuario.
- Tests: pytest-django / TestCase con el Client/APIClient de test y factory_boy; sin red real;
  verifica comportamiento y permisos, no implementación.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
