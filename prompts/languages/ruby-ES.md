# Ruby — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general. Añade comprobaciones específicas de Ruby.
> Para apps Rails, añade también `prompts/frameworks/rails-ES.md`.

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Ruby:

SEGURIDAD
- Inyección de comandos: system/exec/`backticks`/%x/Open3 con entrada de usuario
  interpolada; Kernel#open o IO.read con una cadena "|comando"; prefiere la forma con array
  system(cmd, *args).
- Ejecución de código: eval/instance_eval/class_eval, send/public_send, const_get,
  define_method guiados por entrada no confiable; Marshal.load sobre datos no confiables;
  YAML.load (usa YAML.safe_load); JSON.parse(..., create_additions: true) con entrada hostil.
- Seguridad de regex: ReDoS por backtracking catastrófico; usa los anclajes \A y \z, no ^ y $
  (que casan límites de línea y permiten bypass); cuidado con Regexp.union de entrada de usuario.
- SSRF / ficheros: open-uri o Net::HTTP contra URLs controladas por el usuario; path traversal
  vía File.read/File.join/Dir.glob con entrada de usuario.
- Transporte/secretos: Net::HTTP con OpenSSL::SSL::VERIFY_NONE; credenciales/claves
  incrustadas; secretos leídos del código en vez de ENV/gestor de secretos.

CORRECCIÓN E IDIOMÁTICA
- Manejo de nil: NoMethodError sobre nil — usa navegación segura (&.), Hash#dig y fetch con
  valores por defecto en vez de []; guard clauses en vez de anidamiento profundo.
- Excepciones: rescue => e que traga errores; rescatar Exception (captura SystemExit e
  Interrupt) en vez de StandardError; falta de ensure para liberar recursos.
- Mutación: mutar constantes compartidas, strings congelados o argumentos por defecto
  mutables; dup/clone son superficiales; añade # frozen_string_literal: true.
- Igualdad y colecciones: == vs eql? vs equal?; claves símbolo vs string; each (devuelve el
  receptor) vs map (devuelve resultados); usa each_with_object para acumular.
- Concurrencia: estado mutable compartido entre hilos sin Mutex; variables de clase/singletons
  memoizados no thread-safe; el GVL impide paralelizar trabajo intensivo de CPU.

RENDIMIENTO
- Cargar colecciones enteras en memoria en vez de streaming (find_each, each_slice, lazy).
- Array#include? O(n) dentro de bucles — usa un Set; recompilación repetida de Regexp;
  construir strings con += en bucles en vez de << o StringIO.
- Bugs de memoización: ||= cacheando un resultado legítimamente nil/false; patrones N+1
  (ver rails-ES.md).
- Falta de timeouts en Net/HTTP y llamadas externas; asignación de objetos sin límite.

CALIDAD Y EMPAQUETADO
- Gemfile.lock commiteado y dependencias fijadas; ejecuta bundler-audit para CVEs conocidos;
  requiere solo lo que se usa.
- Adherencia a RuboCop/Standard; comentario mágico frozen_string_literal; nombres consistentes.
- Claridad en metaprogramación: acompaña method_missing con respond_to_missing?.
- Tests con RSpec/Minitest que verifican comportamiento (no implementación); factories/fixtures
  mínimas y deterministas.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
