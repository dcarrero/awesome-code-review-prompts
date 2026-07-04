# Laravel — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/php-modern.md`.
> Añade comprobaciones específicas de Laravel (Eloquent, validación, auth, colas, Blade).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Laravel:

SEGURIDAD
- Mass assignment: modelos con $guarded = [] o fillable sin proteger; usa $fillable y
  $request->validated() en vez de $request->all(); evita forceFill con entrada de usuario.
- Autorización: aplica Policies/Gates (authorize/can) y middleware de rutas; no confíes en
  ocultar la UI; comprueba la propiedad en registros con route-model binding (evita IDOR).
- Validación: valida cada petición con Form Requests o $request->validate(); valida subidas
  (mimes, max) y sanea/whitelist de columnas ordenables/filtrables.
- SQL: consultas crudas vía DB::raw / whereRaw con entrada de usuario; exige bindings; evita
  interpolar datos de la petición en orderBy/nombres de columna.
- Salida Blade: {{ }} autoescapa — marca {!! !!} (crudo) con datos de usuario; XSS por HTML
  sin escapar, hrefs javascript: o mal uso de @json.
- Secretos/config: APP_DEBUG=false en producción, APP_KEY definido, sin secretos
  commiteados, visibilidad correcta del filesystem, URLs firmadas para enlaces sensibles,
  CSRF en formularios web.
- CORS, middleware de throttle en auth/APIs y rutas sensibles con rate limiting.

CORRECCIÓN Y RENDIMIENTO
- N+1 en Eloquent: falta de eager loading (with()), lazy loads en bucles; activa/inspecciona
  preventLazyLoading fuera de producción; selecciona solo las columnas necesarias; usa chunk
  en datasets grandes.
- Consultas en Blade/vistas; índices ausentes; rendimiento de whereHas; paginación presente.
- Trabajo largo/pesado ejecutado de forma síncrona en las peticiones en vez de Jobs/colas;
  falta de retry/timeout/backoff; events/listeners haciendo I/O bloqueante.
- Caché (cache()/remember), config/route caching para producción; evita cachear fugas por
  usuario.
- Transacciones alrededor de operaciones multi-escritura; DB::transaction para atomicidad;
  observers frente a controladores obesos; lógica de negocio movida a services/actions, no a
  controladores/modelos.

CALIDAD
- Controladores obesos; lógica en modelos frente a services; uso de Form Requests,
  Resources/API Resources para dar forma a la salida; config() en vez de env() fuera de los
  ficheros de config; casts tipados; migraciones reversibles; tests mediante feature/HTTP
  tests y factories.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
