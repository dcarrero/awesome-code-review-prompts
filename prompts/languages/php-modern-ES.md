# PHP moderno (agnóstico de framework) — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general. Añade comprobaciones de PHP moderno (8.x)
> aplicables a **cualquier** framework o PHP plano. Para detalles de Laravel o Symfony,
> añade además el fichero correspondiente en `prompts/frameworks/`.

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones de PHP moderno (8.x) agnósticas de framework:

SEGURIDAD
- SQL: exige PDO/sentencias preparadas con parámetros vinculados; nunca interpoles la
  entrada en las consultas; desactiva prepares emulados cuando importe; valida las
  entradas de ordenación/límite.
- Escape de salida: htmlspecialchars con ENT_QUOTES en toda salida HTML; escape según el
  contexto (HTML/atributo/JS/URL); nada de echo crudo de datos de la petición.
- Comandos/ficheros: sin shell_exec/exec/system con entrada de usuario; manejo seguro de
  ficheros; path traversal vía include/require/fopen; valida subidas (mime, tamaño,
  extensión, almacenamiento fuera del webroot).
- Sesión y auth: cookies httponly/secure/samesite, regeneración de sesión al iniciar,
  password_hash/password_verify (nunca md5/sha1), tokens CSRF en cambios de estado.
- Deserialización: evita unserialize() sobre entrada no confiable (object injection);
  prefiere JSON.
- Configuración: sin secretos en el código/VCS (usa env), display_errors off en producción,
  comparaciones estrictas (===) para evitar bypass de auth por type juggling, mal uso de
  extract()/variables variables.

LENGUAJE MODERNO Y TIPOS
- declare(strict_types=1) al inicio de los ficheros; propiedades, parámetros, tipos de
  retorno y tipos nullable tipados y respetados; enums y propiedades readonly donde proceda.
- Null-safety: operadores de null coalescing/nullsafe frente a warnings suprimidos (@);
  evita abusar de isset ocultando bugs de lógica; match frente a switch laxo.
- Promoción de constructor, callables de primera clase y argumentos con nombre usados de
  forma idiomática (sin oscurecer).

CALIDAD, ESTÁNDARES Y RENDIMIENTO
- Formato PSR-12 y autoloading PSR-4; sin require manual de clases; dependencias de Composer
  fijadas y auditadas (composer audit); evita paquetes abandonados.
- Corrección: excepciones frente a retornos false silenciosos; limpieza con finally/recursos;
  DateTimeImmutable y zonas horarias explícitas; float/dinero sin bugs de precisión (usa
  enteros/decimales).
- Rendimiento: N+1 en el acceso a datos, consultas repetidas en bucles, falta de caché,
  conjuntos de resultados sin límite, suposiciones sobre opcache, trabajo pesado por petición
  que debería encolarse.
- Testeabilidad: dependencias inyectadas (sin `new` cableado), sin estado global/singletons
  que oculten acoplamiento, llamadas estáticas que limiten el mockeo.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
