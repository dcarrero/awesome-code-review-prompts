# Bash / Shell — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Bash/shell:

SEGURIDAD
- Inyección de comandos por variables sin comillas/interpoladas en comandos o eval.
- Word splitting y expansión de globs sobre "$var"/"$@" sin comillas; usa comillas
  siempre.
- Uso inseguro de curl|bash; descargar y ejecutar sin verificación; secretos en
  argumentos (visibles en ps) o commiteados; ficheros temporales predecibles (usa mktemp).
- Problemas de ruta: depender de PATH, ejecutar con privilegios elevados innecesariamente.

CORRECCIÓN Y ROBUSTEZ
- Falta de 'set -euo pipefail'; códigos de salida sin comprobar; ignorar fallos en pipes.
- Variables sin comillas; [ vs [[ ; comparación aritmética vs de cadena; parsear la salida
  de ls; leer líneas con for en vez de while read -r; falta de manejo de IFS.
- Sin trap de limpieza al salir; operaciones no idempotentes; asumir flags de herramientas
  GNU frente a BSD.

CALIDAD
- ShellCheck lo marcaría — señala esas categorías explícitamente.
- Portabilidad (bash vs sh/POSIX) declarada y consistente; funciones en vez de copiar-pegar;
  ayuda de uso y validación de argumentos; códigos de salida significativos; logging a stderr.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
