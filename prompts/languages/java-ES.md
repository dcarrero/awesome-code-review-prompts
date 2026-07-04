# Java — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Java:

SEGURIDAD
- Inyección SQL por concatenación con Statement en vez de PreparedStatement.
- Deserialización insegura (ObjectInputStream sobre datos no confiables); XXE en
  parsers XML (activar secure processing, desactivar DTD/entidades externas).
- Path traversal; inyección de comandos vía Runtime.exec; SSRF vía URL/HttpClient.
- Spring: falta de @PreAuthorize/method security, CSRF desactivado, actuator expuesto,
  mass assignment vía @ModelAttribute, inyección SpEL, permit-all mal configurado.
- Criptografía débil (DES/ECB), claves incrustadas, Random inseguro para tokens (usar
  SecureRandom).

CORRECCIÓN Y CONCURRENCIA
- Riesgos de NullPointerException; Optional mal usado; violaciones del contrato
  equals/hashCode.
- Seguridad de hilos: estado mutable compartido, acciones compuestas no atómicas,
  falta de volatile/sincronización, bugs de double-checked locking, SimpleDateFormat
  no seguro para hilos.
- Fugas de recursos: streams/conexiones fuera de try-with-resources; executors sin cerrar.
- Manejo de excepciones: tragado, capturar Throwable, perder stack traces.

RENDIMIENTO Y CALIDAD
- N+1 (JPA/Hibernate), estrategia de fetch ausente, entidades cargadas en eager;
  boxing en bucles calientes; concatenación de String en bucles (usar StringBuilder);
  colecciones sin límite.
- Abuso de reflexión; abstracciones con fugas; clases-Dios; falta de inmutabilidad;
  uso adecuado de streams frente a legibilidad.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
