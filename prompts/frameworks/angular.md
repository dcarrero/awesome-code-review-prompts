# Angular — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/javascript-typescript.md`.
> Layers on Angular-specific checks (templates/XSS, RxJS, change detection, DI).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Angular-specific checks:

SECURITY
- XSS: Angular auto-sanitizes bindings — flag bypassSecurityTrustHtml/Url/Script/ResourceUrl
  misuse and [innerHTML] with untrusted data; direct DOM writes via ElementRef.nativeElement or
  Renderer2 that inject user content; javascript: in [href]/[src].
- Auth: route guards (CanActivate) MUST be backed by server-side checks; token storage (httpOnly
  cookies vs XSS-exfiltratable localStorage); attach tokens via an HttpInterceptor; configure
  Angular's built-in XSRF-TOKEN handling for cookie auth.
- Secrets: nothing in environment.ts / the client bundle is secret — it ships to the browser;
  keep API keys and credentials server-side; run npm audit and pin dependencies.

CORRECTNESS & IDIOM
- Change detection: use OnPush with immutable @Inputs; avoid method/function calls and impure
  pipes in templates (they run every CD cycle); prefer the async pipe over manual subscribe.
- RxJS: unsubscribed subscriptions leak — use the async pipe, takeUntilDestroyed, or takeUntil;
  don't nest subscribes (compose with switchMap/mergeMap/concatMap per the intended semantics);
  handle stream errors; avoid shared mutable Subject state.
- Lifecycle: clean up in ngOnDestroy; fix ExpressionChangedAfterItHasBeenChecked causes;
  standalone components vs NgModules consistency; correct signals usage (Angular 16+).
- Forms: use typed reactive forms with real validators over template-driven where state matters.

PERFORMANCE
- CD cost: OnPush + trackBy on *ngFor; no heavy getters/functions in templates; CDK virtual
  scroll for long lists; debounce user input streams.
- Bundle: lazy-load routes/feature modules; standalone components and @defer (deferrable views);
  avoid large eager imports; NgOptimizedImage; consider zoneless/signals to cut Zone.js overhead.

QUALITY
- Architecture: smart/presentational component split; business logic in services
  (providedIn: 'root'); DI over globals.
- TypeScript strict; typed HttpClient responses and reactive forms; avoid any.
- Tests: TestBed component/service specs; HttpTestingController for HTTP; assert behavior, not
  brittle DOM structure.
- Accessibility & i18n: semantic markup, focus management on navigation (pair with
  accessibility.md), and Angular i18n/translations for user-facing text.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
