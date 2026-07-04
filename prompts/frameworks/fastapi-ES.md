# FastAPI (Python) — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/python-ES.md`.
> Añade comprobaciones específicas de FastAPI (dependencias/auth, Pydantic, async, serialización).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de FastAPI:

SEGURIDAD
- Auth: aplica la autorización con Depends() en cada ruta protegida; con OAuth2/JWT verifica
  firma, exp, aud y algoritmo (rechaza alg=none); aplica scopes; nunca confíes en claims
  suministrados por el cliente. Comprueba la propiedad en los path params (/items/{id}) para
  evitar IDOR.
- Fuga en la respuesta: define un response_model explícito (o un esquema Read dedicado) para que
  los objetos ORM no filtren campos como hashes de contraseña o flags internos; no devuelvas el
  modelo de BD directamente.
- Mass assignment: construye objetos con campos explícitos del esquema Pydantic, nunca vuelques
  un dict del cuerpo de la petición en un modelo ORM.
- Inyección: acceso a BD parametrizado (nada de text() con f-strings / SQL construido por
  cadenas); valida y limita los params de query/path; valida las subidas (tamaño, tipo).
- CORS/secretos: CORSMiddleware no debe combinar allow_origins=["*"] con allow_credentials=True;
  carga la config con pydantic BaseSettings desde el entorno, sin secretos en el código;
  considera desactivar o proteger /docs y /openapi.json en producción.
- Abuso: FastAPI no trae rate limiting integrado — añádelo (p. ej. slowapi); limita el tamaño
  del cuerpo; protege del SSRF las llamadas httpx/requests del servidor a URLs de usuario.

CORRECCIÓN Y RENDIMIENTO (async)
- Event loop: el trabajo bloqueante dentro de `async def` (drivers de BD síncronos, requests,
  time.sleep, CPU pesada) paraliza todo el loop — usa drivers async o run_in_executor; ten en
  cuenta que un endpoint `def` normal corre en un threadpool mientras `async def` corre en el loop.
- Sesiones de BD: entrega (yield) una sesión con scope de petición vía dependencia; prefiere
  SQLAlchemy async; vigila las consultas N+1 y el dimensionado del pool de conexiones.
- Trabajo en background: BackgroundTasks es para trabajo ligero post-respuesta — descarga los
  jobs pesados/largos a una cola real (Celery/arq); gestiona recursos con lifespan/startup-
  shutdown, no con globales de módulo.
- Serialización/deps: coste de serializar respuestas grandes; evita trabajo pesado en las
  dependencias por petición; usa caché de dependencias donde sea seguro; sé explícito con el
  comportamiento de Pydantic v1 vs v2.

CALIDAD
- Estructura: organiza con APIRouter y tags; inyecta colaboradores con Depends en vez de
  globales; mantén los endpoints ligeros.
- Esquemas: separa los modelos Pydantic Create/Read/Update de las entidades ORM (una frontera
  DTO clara); códigos de estado correctos y HTTPException/exception handlers.
- Tests: TestClient o httpx AsyncClient con pytest; sobrescribe las dependencias de auth/BD;
  verifica estado, forma del payload y autorización.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
