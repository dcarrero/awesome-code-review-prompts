# Symfony — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/php-modern.md`.
> Añade comprobaciones específicas de Symfony (Doctrine, Security, DI, Forms, Twig).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Symfony:

SEGURIDAD
- Control de acceso: reglas de security.yaml, #[IsGranted]/denyAccessUnlessGranted, Voters
  para autorización a nivel de objeto; no confíes en la oscuridad de rutas; comprueba la
  propiedad (evita IDOR).
- Autenticación: hashers de contraseña configurados (no texto plano/md5), protección CSRF en
  formularios, manejo de remember-me/tokens, firewalls con alcance correcto, fijación de
  sesión gestionada.
- Entrada: valida con Constraints/Validator; vincula datos vía Forms o DTOs, no la petición
  cruda; evita meter $request->query/request->request directo en la lógica sin validar.
- Doctrine: DQL/SQL nativo construido con entrada concatenada frente a parámetros
  (setParameter); nunca interpoles entrada de usuario en DQL.
- Twig: autoescape activado; marca |raw con datos de usuario; escape según contexto
  (html/js/url); sin inyección vía nombres de plantilla dinámicos.
- Config/secretos: APP_ENV=prod y APP_DEBUG=0 en producción, vault de secretos/env no
  commiteados, trusted proxies/hosts definidos, CORS configurado, las páginas de error no
  filtran stack traces.

CORRECCIÓN Y RENDIMIENTO
- N+1 en Doctrine: falta de fetch joins/eager fetch, asociaciones lazy en bucles; usa
  hidratación parcial/DTO; evita cargar repositorios enteros; batch y clear() en operaciones
  masivas.
- flush del EntityManager en bucles; falta de transacciones en escrituras multi-entidad;
  crecimiento de memoria del unit-of-work; caché de segundo nivel/consultas donde proceda.
- Trabajo pesado síncrono en vez de Messenger (transporte async); falta de manejo de
  retry/fallo; events/subscribers haciendo I/O bloqueante.
- HTTP cache/ESI y warmup de caché de producción considerados.

CALIDAD Y ARQUITECTURA
- Inyección de dependencias vía autowiring/constructor, no fetches del contenedor (sin abuso
  de service locator); servicios sin estado; controladores ligeros, lógica en
  services/handlers.
- Uso adecuado de DTOs, Form types y grupos del Serializer para evitar sobreexponer entidades.
- Migraciones de Doctrine reversibles; propiedades de entidad tipadas; tests vía
  WebTestCase/KernelTestCase.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
