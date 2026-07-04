# Angular — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/javascript-typescript-ES.md`.
> Añade comprobaciones específicas de Angular (plantillas/XSS, RxJS, detección de cambios, DI).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Angular:

SEGURIDAD
- XSS: Angular autosanea los bindings — marca el mal uso de
  bypassSecurityTrustHtml/Url/Script/ResourceUrl y [innerHTML] con datos no confiables;
  escrituras directas al DOM vía ElementRef.nativeElement o Renderer2 que inyecten contenido de
  usuario; javascript: en [href]/[src].
- Auth: los guards de ruta (CanActivate) DEBEN estar respaldados por comprobaciones en el
  servidor; almacenamiento de tokens (cookies httpOnly vs localStorage exfiltrable por XSS);
  adjunta tokens con un HttpInterceptor; configura el manejo XSRF-TOKEN integrado de Angular para
  auth por cookie.
- Secretos: nada en environment.ts / el bundle del cliente es secreto — se envía al navegador;
  mantén claves de API y credenciales en el servidor; ejecuta npm audit y fija dependencias.

CORRECCIÓN E IDIOMÁTICA
- Detección de cambios: usa OnPush con @Inputs inmutables; evita llamadas a métodos/funciones y
  pipes impuros en plantillas (se ejecutan en cada ciclo de CD); prefiere el async pipe frente a
  subscribe manual.
- RxJS: las suscripciones sin cancelar tienen fugas — usa el async pipe, takeUntilDestroyed o
  takeUntil; no anides subscribes (compón con switchMap/mergeMap/concatMap según la semántica
  buscada); maneja errores del stream; evita estado mutable compartido en Subjects.
- Ciclo de vida: limpia en ngOnDestroy; corrige las causas de
  ExpressionChangedAfterItHasBeenChecked; consistencia entre componentes standalone y NgModules;
  uso correcto de signals (Angular 16+).
- Formularios: usa reactive forms tipados con validadores reales frente a template-driven cuando
  el estado importa.

RENDIMIENTO
- Coste de CD: OnPush + trackBy en *ngFor; sin getters/funciones pesados en plantillas; virtual
  scroll de CDK para listas largas; debounce a los streams de entrada del usuario.
- Bundle: carga diferida de rutas/módulos de feature; componentes standalone y @defer (vistas
  diferibles); evita imports grandes eager; NgOptimizedImage; considera zoneless/signals para
  reducir el overhead de Zone.js.

CALIDAD
- Arquitectura: separación de componentes smart/presentational; lógica de negocio en servicios
  (providedIn: 'root'); DI en vez de globales.
- TypeScript strict; respuestas de HttpClient y reactive forms tipados; evita any.
- Tests: specs de componente/servicio con TestBed; HttpTestingController para HTTP; verifica
  comportamiento, no estructura frágil del DOM.
- Accesibilidad e i18n: marcado semántico, gestión del foco al navegar (combina con
  accessibility-ES.md), y el i18n/traducciones de Angular para el texto de cara al usuario.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
