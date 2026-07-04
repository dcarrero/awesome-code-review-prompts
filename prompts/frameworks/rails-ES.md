# Ruby on Rails — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/ruby-ES.md`.
> Añade comprobaciones específicas de Rails (Active Record, strong params, auth, jobs, vistas).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Ruby on Rails:

SEGURIDAD
- Mass assignment: exige Strong Parameters (params.require(...).permit(...)); marca permit!,
  o update(params[...]) sin permit; no confíes en params anidados sin permits explícitos.
- Autorización: aplica Pundit/CanCanCan o comprobaciones explícitas en un before_action; acota
  las lecturas al usuario actual (current_user.orders.find(id)) para evitar IDOR; no confíes en
  ocultar la UI.
- Inyección SQL: interpolación de cadenas en where/order/pluck/find_by_sql/exists?; usa
  where("col = ?", val) parametrizado o condiciones con hash; whitelist de columnas para
  order/sort; Arel.sql con entrada de usuario es una señal de alarma.
- XSS: ERB <%= %> autoescapa — marca html_safe, raw(), <%== %> y content_tag con datos de
  usuario; usa el helper sanitize con allowlist; define una Content-Security-Policy.
- CSRF: protect_from_forgery está activo por defecto — un skip_before_action
  :verify_authenticity_token en una acción que cambia estado requiere justificación; las APIs
  deben usar tokens, no CSRF desactivado.
- Secretos/config: master.key / credentials.yml.enc sin commitear; secret_key_base definido;
  config.force_ssl = true en producción; sin secretos incrustados.
- Open redirect / SSRF: redirect_to con entrada de usuario (usa allow_other_host: false);
  llamadas HTTP del servidor a URLs suministradas por el usuario; valida subidas (tipo de
  contenido, tamaño), Active Storage.
- Integridad de datos: update_column/update_all saltan validaciones y callbacks — márcalos en
  escrituras de cara al usuario; cookies firmadas/cifradas para datos de sesión.

CORRECCIÓN Y RENDIMIENTO
- Consultas N+1: falta de includes/preload/eager_load (verifica con la gema bullet); prefiere
  exists? sobre present?, size sobre count cuando la colección ya está cargada; selecciona solo
  las columnas necesarias; usa find_each/in_batches en conjuntos grandes.
- Transacciones y callbacks: envuelve operaciones multi-escritura en una transacción; usa
  after_commit (no after_save) para efectos externos; haz jobs/callbacks idempotentes.
- Migraciones: reversibles (up/down o change); añade índices para claves foráneas y búsquedas;
  add_index ..., algorithm: :concurrently (con disable_ddl_transaction!) en tablas grandes;
  respalda las validaciones de unicidad con un índice único en BD (la validación sola tiene
  race conditions).
- Trabajo en segundo plano: mueve el trabajo pesado/lento a ActiveJob/Sidekiq, no a la
  petición; pasa IDs de registros, no objetos Active Record; configura retries/backoff.
- Caché: fragment/russian-doll caching y counter_cache donde proceda; claves de caché estables;
  evita fugas de caché por usuario. Sin consultas en las vistas; pagina (kaminari/pagy).

CALIDAD
- Controladores/modelos ligeros: extrae la lógica de negocio a service objects/POROs/concerns;
  evita efectos secundarios guiados por callbacks difíciles de testear.
- Forma de la salida: usa serializers/jbuilder; evita to_json sin only/except (fuga de
  atributos); centraliza los strong params.
- I18n: sin cadenas de cara al usuario incrustadas — usa t(); autoloading conforme a zeitwerk.
- Tests: request/system specs más validaciones de modelo; factories de FactoryBot; evita tests
  lentos y sobre-mockeados. Revisa la versión de Rails por deprecaciones y CVEs sin parchear.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
