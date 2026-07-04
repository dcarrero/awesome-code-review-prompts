# FlightPHP — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/php-modern-ES.md`.
> Añade comprobaciones específicas de FlightPHP (routing, filtros, PDO en crudo, vistas, JSON).
> FlightPHP es un micro-framework minimalista — la mayoría de las protecciones son
> responsabilidad del desarrollador, así que revisa lo que NO hace por ti.

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de FlightPHP:

SEGURIDAD
- Sin ORM: el acceso a datos es PDO en crudo (o Flight::db()/PdoWrapper). Exige sentencias
  preparadas con parámetros vinculados — marca cualquier SQL construido por interpolación de
  datos de la petición.
- Autorización: Flight no aplica nada por sí mismo. Verifica que las rutas protegidas ejecutan
  una comprobación de auth en un filtro Flight::before() o middleware de ruta; valida los
  parámetros de ruta (@id) y confirma la propiedad del registro para evitar IDOR.
- XSS: Flight::render() usa plantillas PHP planas SIN autoescapado — toda variable impresa debe
  pasar por htmlspecialchars()/un helper; marca datos de usuario impresos en crudo en las vistas.
  (Flight::json codifica de forma segura.)
- CSRF: Flight NO trae protección CSRF integrada — las rutas POST/PUT/DELETE que cambian estado
  deben implementar y verificar un token; revisa los flags SameSite de las cookies.
- Entrada: valida y sanea Flight::request()->query/data y $_GET/$_POST/$_FILES; valida las
  subidas (tipo, tamaño); protege del path traversal cualquier ruta que sirva ficheros.
- Config/errores: en producción desactiva la visualización de errores y los stack traces (que no
  se filtren por el handler por defecto de Flight) — configura flight.handle_errors/
  flight.log_errors adecuadamente; sin secretos en el código (usa vlucas/phpdotenv); fuerza
  HTTPS y define cabeceras de seguridad (CSP, HSTS) manualmente; CORS vía un filtro before(), no
  un comodín con credenciales.
- SSRF: llamadas HTTP del servidor (curl/streams) a URLs suministradas por el usuario.

CORRECCIÓN Y RENDIMIENTO
- Estado global: Flight es una fachada singleton estática — cuidado con el estado global/
  compartido y ten cuidado al sobrescribir métodos del core con Flight::map/register; mantén los
  handlers de ruta libres de estado oculto.
- Routing: gana la primera coincidencia — revisa el orden de las rutas, los patrones regex y el
  manejo de 404/405 (notFound / método no permitido); el orden de ejecución de middleware/filtros.
- Acceso a datos: reutiliza una única conexión PDO; evita consultas N+1 en bucles; pagina las
  lecturas grandes; añade índices de BD para columnas filtradas/ordenadas.
- Caché HTTP: Flight no tiene capa de caché — usa Flight::etag()/Flight::lastModified() para GETs
  cacheables; haz streaming de respuestas grandes en vez de bufferizarlas.

CALIDAD
- Handlers ligeros: mantén la lógica fuera de las closures de ruta — extrae a clases
  controller/service; registra dependencias vía Flight::map/register en vez de globales.
- Estándares: autoload de Composer (PSR-4), config basada en entorno, código tipado según
  php-modern-ES.md.
- Tests: PHPUnit; ejercita las rutas despachando peticiones y verificando respuesta/estado; no
  dependas de red o BD reales donde sirva un doble.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
