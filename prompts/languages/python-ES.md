# Python — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Python:

SEGURIDAD
- eval/exec/compile sobre entrada no confiable; pickle/marshal/yaml.load (loader
  inseguro); subprocess con shell=True; os.system; inyección de comandos por formateo
  de cadenas.
- SQL construido con f-strings/%/.format en vez de consultas parametrizadas.
- Deserialización insegura; path traversal en open()/os.path.join con entrada de usuario.
- Flask/Django: debug=True en producción, SECRET_KEY en el código, CSRF desactivado,
  render de plantillas inseguro (|safe, mark_safe), falta de parametrización del ORM.
- requests sin timeout/verify; secretos incrustados.

CORRECCIÓN E IDIOMÁTICA
- Argumentos por defecto mutables; closures de binding tardío en bucles; `except:`
  amplios; excepciones tragadas; `==` vs `is` para None; falta de context managers (with).
- Type hints presentes y respetados; ejecuta mypy/pyright mentalmente; manejo de Optional.
- Confusión generador vs lista; agotamiento de iteradores; f-string vs args %- de logging.

RENDIMIENTO
- Consultas ORM N+1; cargar querysets completos; materialización innecesaria con
  list(); recompilación repetida de regex; trabajo CPU limitado por el GIL que debería
  ser multiprocessing; concatenación de cadenas en bucles; no usar sets/dicts para
  pertenencia.

CALIDAD Y EMPAQUETADO
- Falta de __all__/claridad de API pública; imports circulares; requirements fijados;
  nada de `pip install` de fuentes no confiables; higiene de virtualenv/deps; logging
  vs print.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
