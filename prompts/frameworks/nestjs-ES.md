# NestJS — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/javascript-typescript-ES.md`.
> Añade comprobaciones específicas de NestJS (guards, pipes/DTOs, scope de DI, interceptors, ORM).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de NestJS:

SEGURIDAD
- Auth: aplica Guards (@UseGuards con AuthGuard/RolesGuard) en los controladores/handlers
  protegidos; verifica los JWT (secreto, exp, algoritmo); nunca confíes en los roles del cliente;
  comprueba la propiedad del registro para evitar IDOR.
- Validación y mass assignment: registra un ValidationPipe global con whitelist: true y
  forbidNonWhitelisted: true; usa DTOs de class-validator; valida params/query; no vincules
  cuerpos de petición en crudo a entidades.
- Fuga en la serialización: usa ClassSerializerInterceptor con @Exclude en los campos sensibles;
  nunca devuelvas entidades ORM con hashes de contraseña/secretos directamente.
- Inyección: consultas TypeORM/Prisma parametrizadas — nada de SQL concatenado; protege de
  inyección NoSQL; valida las subidas (límites/tipo de Multer).
- Hardening: app.enableCors no debe ser comodín-con-credenciales; añade helmet, rate limiting
  (@nestjs/throttler) y CSRF para auth por cookie; carga la config desde el entorno
  (ConfigModule) con validación de esquema, sin secretos en el código; protege del SSRF el HTTP
  saliente.

CORRECCIÓN Y RENDIMIENTO
- Scope de DI: los providers son singletons por defecto — los providers con scope REQUEST se
  propagan por toda la cadena y perjudican el rendimiento; vigila el estado mutable compartido en
  singletons.
- Async: marca las promesas sueltas (falta de await) y los rejections sin manejar; enruta los
  errores por exception filters; async consistente en guards/interceptors.
- Base de datos: N+1 por relaciones de TypeORM (usa relations/joins/query builder); envuelve las
  operaciones multi-escritura en transacciones (QueryRunner); dimensionado del pool; migraciones
  reversibles.
- Ciclo de vida: usa OnModuleInit/OnApplicationShutdown para setup/teardown de recursos y activa
  los shutdown hooks; ten en cuenta el coste de interceptors/pipes; cachea con CacheModule.

CALIDAD
- Arquitectura: límites de módulo claros; inyección por constructor en vez de service locators;
  evita dependencias circulares (un forwardRef es un olor); DTOs vs entidades en la frontera.
- Consistencia: exception filters y forma de respuesta centralizados; todo tipado, evita any;
  logging estructurado (Nest Logger/pino).
- Tests: Test.createTestingModule con providers mockeados para tests unitarios; e2e con
  supertest; sobrescribe guards/BD para verificar autorización y payloads.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
