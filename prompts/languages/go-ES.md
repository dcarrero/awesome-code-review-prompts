# Go — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Go:

SEGURIDAD
- Inyección SQL vía consultas con fmt.Sprintf en vez de database/sql parametrizado.
- Inyección de comandos vía os/exec con shell; path traversal por mal uso de filepath.Join.
- Redirecciones no validadas/SSRF vía http.Get sobre URLs de usuario; falta de
  verificación TLS.
- Secretos incrustados; math/rand para tokens (usar crypto/rand); confusión template
  vs html/template (autoescape).

CORRECCIÓN Y CONCURRENCIA
- Errores sin comprobar (err ignorado con _); envolver errores con %w para contexto.
- Fugas de goroutines: goroutines que nunca terminan, falta de cancelación por context,
  envíos/recepciones bloqueados en canales; mal uso de WaitGroup.
- Data races: estado compartido sin mutex/canal; piénsalo con -race en mente.
- Escrituras en mapas nil; aliasing de slices/sorpresas con append; defer en bucles
  reteniendo recursos; copiar structs con mutex; captura de variable de range en
  goroutines (pre-1.22).

RENDIMIENTO E IDIOMÁTICA
- Asignaciones innecesarias; concatenación de string en bucles (usar strings.Builder);
  uso prematuro de interfaces; falta de preasignación (make con cap); reflexión en
  rutas calientes.
- Propagación de context y timeouts en toda I/O; Close() correcto con defer + comprobación
  de error.
- Acepta interfaces, devuelve structs; interfaces pequeñas; evita abusar de interface{}/any.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
