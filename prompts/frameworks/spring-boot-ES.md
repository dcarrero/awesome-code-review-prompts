# Spring Boot (Java) — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/java-ES.md`.
> Añade comprobaciones específicas de Spring Boot (Security, JPA, DTOs, transacciones, Actuator, config).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Spring Boot:

SEGURIDAD
- Spring Security: reglas explícitas en authorizeHttpRequests; seguridad a nivel de método
  (@PreAuthorize) en métodos de servicio sensibles; permitAll() solo donde sea intencionado; un
  CSRF desactivado globalmente o un permitAll() amplio es señal de alarma salvo API stateless
  con tokens.
- Autorización / IDOR: verifica la propiedad antes de devolver o mutar una entidad; no expongas
  IDs internos sin comprobación de acceso; @PreAuthorize con SpEL o guardas explícitas.
- Inyección SQL/JPA: JPQL o consultas nativas concatenadas — usa parámetros vinculados
  (:name / ?1); valida y haz whitelist de los campos de Pageable/Sort (el sort controlado por
  el usuario es inyección y vector de DoS).
- Deserialización/SpEL: tipado polimórfico inseguro de Jackson (activateDefaultTyping /
  @JsonTypeInfo sobre entrada no confiable) es riesgo de RCE; ObjectInputStream y SnakeYAML
  load() sobre datos no confiables; SpEL construido con entrada de usuario.
- Mass assignment/validación: vincula las peticiones a DTOs, no a entidades; @Valid + Bean
  Validation en los DTOs; restringe campos con allowlists de @InitBinder.
- Actuator/config: asegura /actuator (management.endpoints.web.exposure), nunca expongas env,
  heapdump o beans públicamente; sin secretos en application.properties/yml — usa
  entorno/Vault/config server; CORS sin comodín con credenciales; activa HTTPS y cabeceras
  de seguridad.
- SSRF: llamadas de RestTemplate/WebClient a URLs suministradas por el usuario.

CORRECCIÓN Y RENDIMIENTO
- N+1 en JPA: asociaciones LAZY accedidas en bucles — usa JOIN FETCH o @EntityGraph; evita
  FetchType.EAGER por defecto; usa proyecciones DTO; pagina siempre las lecturas grandes;
  mantén open-session-in-view desactivado.
- Transacciones: límites correctos de @Transactional; la auto-invocación evita el proxy (no se
  aplica transacción/retry); readOnly=true para lecturas; propagación/aislamiento sensatos.
- Concurrencia/pools: dimensionado del pool HikariCP; en WebFlux nunca bloquees el event loop
  (nada de JDBC/RestTemplate bloqueante en cadenas reactivas); configura executors @Async
  explícitamente.
- Caché: @Cacheable con claves y eviction correctas; evita cachear datos por usuario de forma
  global.
- Manejo de errores: @ControllerAdvice / @ExceptionHandler centralizado; nunca filtres stack
  traces ni mensajes internos a los clientes.

CALIDAD
- Capas: controller → service → repository; DTOs vs entidades en la frontera; inyección por
  constructor en vez de @Autowired en campos; sin lógica de negocio en controladores.
- Config: profiles (application-prod.yml); @ConfigurationProperties tipado en vez de @Value
  disperso; fail-fast ante config requerida ausente.
- Tests: usa slices (@WebMvcTest, @DataJpaTest) y MockMvc en vez de @SpringBootTest siempre;
  Testcontainers para comportamiento real de BD; verifica estado, payload y autorización.
- Observabilidad: health/metrics de Actuator vía Micrometer; logging estructurado con IDs de
  correlación.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
