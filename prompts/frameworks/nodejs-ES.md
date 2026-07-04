# Node.js / Express — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Node.js/Express:

SEGURIDAD
- Inyección en child_process (exec vs execFile), rutas fs y drivers de BD; SSRF vía
  http saliente; prototype pollution vía parsers de body/utilidades de merge.
- Falta de middleware de seguridad: helmet, CORS restringido, rate limiting, límites de
  tamaño de body, validación de entrada (zod/joi/express-validator) en cada ruta.
- Auth: verificación de JWT (alg, expiración, audiencia), cookies secure/httpOnly/sameSite,
  manejo de sesión; secretos en env, no en el código; nada de eval/vm sobre entrada no
  confiable.
- Path traversal al servir estáticos/ficheros; subidas sin restricción; regex con ReDoS.
- El manejador de errores no filtra stack traces en producción; auditoría de dependencias
  (npm audit).

CORRECCIÓN Y FIABILIDAD
- Rechazos de promesa no manejados / excepciones no capturadas que tumban el proceso;
  falta de propagación de errores async en Express (envuelve handlers async); promesas
  flotantes.
- Bloqueo del event loop con fs/crypto/JSON síncrono sobre datos grandes; falta de streaming.
- Apagado ordenado (SIGTERM), drenaje de conexiones y limpieza del pool de BD.

RENDIMIENTO
- Sin pooling de conexiones; consultas N+1; falta de caché; concurrencia sin límite hacia
  servicios aguas abajo; sin timeouts en llamadas salientes; fugas de memoria por
  listeners/closures; buffering grande en memoria en vez de streams.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
