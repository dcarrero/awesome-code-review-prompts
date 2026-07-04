# JavaScript / TypeScript — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de JavaScript/TypeScript:

SEGURIDAD
- Prototype pollution, mezclas inseguras de __proto__/Object y JSON.parse no confiable.
- eval/new Function/setTimeout-con-cadena, y require/import dinámico de entrada de usuario.
- XSS vía innerHTML/dangerouslySetInnerHTML/insertAdjacentHTML; falta de saneado.
- Regex propensas a ReDoS; regex sin límite controladas por el usuario.
- Dependencias/scripts npm inseguros; riesgos de postinstall; versiones sin fijar.

TIPOS Y CORRECCIÓN
- Escapes de any/unknown, casts "as" inseguros, aserciones non-null (!) que ocultan bugs.
- Falta de modo estricto (strict, noUncheckedIndexedAccess); == vs ===; manejo de NaN.
- Promesas flotantes / rechazos no manejados; await ausente; manejo de errores olvidado.
- Mutación de estado compartido; binding incorrecto de this; closures con valores obsoletos.

ASYNC Y RENDIMIENTO
- await secuenciales que deberían ser Promise.all; bloqueo del event loop con I/O
  síncrono o CPU pesada; fugas de memoria por listeners/timers no limpiados.
- Bucles síncronos grandes; copias de arrays innecesarias; N+1 entre awaits.

CALIDAD
- Dependencias circulares por barrel files; límites de módulo inconsistentes; fuga de
  tipos internos.
- Uniones discriminadas y exhaustividad correctas; evita los foot-guns de enum.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
