# Cloudflare Workers — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/javascript-typescript-ES.md`.
> Añade comprobaciones del runtime edge/Workers (bindings, modelo de isolate, KV/D1/R2/DO, wrangler).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Cloudflare Workers:

SEGURIDAD
- Secretos: usa `wrangler secret` / secret bindings, nunca los incrustes — recuerda que [vars]
  en wrangler.toml son PÚBLICOS; nunca loguees secretos.
- Auth en el edge: verifica JWT/HMAC en las peticiones entrantes; valida el Origin; no confíes en
  cabeceras de cliente falsificables; añade rate limiting (Rate Limiting API o un Durable Object)
  — el edge está expuesto directamente a internet.
- Inyección: el acceso a D1 debe usar sentencias preparadas con .bind(), nunca SQL construido por
  cadenas; valida la construcción de claves de KV; protege del SSRF los fetch() a URLs
  controladas por el usuario (incluidos hostnames de servicios internos).
- CORS/entrada: orígenes permitidos explícitos (no comodín-con-credenciales) y preflight
  correcto; valida el cuerpo/query de la petición y aplica límites de tamaño (Workers tiene
  techos de CPU/memoria).

CORRECCIÓN Y RENDIMIENTO (runtime de isolate)
- Nada de estado global entre peticiones: las variables mutables a nivel de módulo se comparten
  entre peticiones dentro de un isolate y se filtran entre usuarios — nunca caches datos de
  usuario/auth en globales.
- Límites del runtime: sin APIs de Node salvo que actives nodejs_compat; evita bucles síncronos
  pesados (el tiempo de CPU está limitado); haz streaming de respuestas grandes en vez de
  bufferizarlas.
- Ciclo de vida async: usa ctx.waitUntil() para el trabajo post-respuesta (logging, escrituras de
  caché) para que no se cancele al devolver la respuesta; nunca bloquees la respuesta.
- Semántica de almacenamiento — elige la correcta: KV es eventualmente consistente (no
  read-after-write); D1 para relacional; Durable Objects para consistencia fuerte / coordinación
  / sesiones con estado; R2 para blobs. Cachea con la Cache API / cabeceras, pero nunca caches
  respuestas autenticadas.
- Subrequests: ten en cuenta el límite de subrequests; evita fetches N+1; reutiliza conexiones.

CALIDAD
- Config: los bindings de wrangler.toml (KV/D1/R2/DO/Queues), compatibility_date/flags y los
  ajustes por entorno son explícitos y tipados (una interfaz `Env`); activa la observabilidad
  (tail/logpush).
- Routing/errores: un router (Hono/itty-router) con handlers que siempre devuelven una Response
  correcta y manejan errores; consumidores de Queue idempotentes con retry/backoff.
- Tests: Vitest con @cloudflare/vitest-pool-workers / Miniflare, ejercitando bindings reales.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
