# Vue / Nuxt — Review Add-on

> Use together with a general master prompt **and** `prompts/languages/javascript-typescript.md`.
> Layers on Vue 3 / Nuxt 3-specific checks (reactivity, SSR, composables, stores).

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Vue 3 / Nuxt 3-specific checks:

SECURITY
- XSS: v-html with untrusted data (sanitize with DOMPurify or avoid); dynamic :href/:src of
  javascript: URLs; user data interpolated into useHead()/meta.
- SSR secret leakage (Nuxt): private values must live in runtimeConfig (server-only), never in
  runtimeConfig.public or NUXT_PUBLIC_*; keep API keys/tokens in server routes (server/api),
  not shipped to the client.
- Auth: prefer httpOnly cookies over localStorage (XSS-exfiltratable); enforce auth on the
  server (route rules / server middleware), not only client navigation guards; CSRF for
  cookie-based auth.
- Server input: validate and type input in Nuxt server/api handlers; guard against SSRF in
  server-side $fetch to user URLs; never eval user input.
- Supply chain: run npm audit; pin dependencies; vet Nuxt modules that get full app access.

CORRECTNESS & IDIOM
- Reactivity: ref vs reactive; destructuring a reactive() drops reactivity (use toRefs/storeToRefs);
  computed must be pure (no side effects); watch vs watchEffect; add :key on v-for; don't mutate
  props (emit instead).
- SSR/hydration (Nuxt): guard client-only APIs (window/document) with import.meta.client or
  onMounted; hydration mismatches from Date.now()/Math.random() in templates; use useState (not
  module-level singletons) for SSR-safe shared state so it doesn't leak across requests.
- Data fetching: useAsyncData/useFetch with unique keys and proper error/pending handling;
  avoid duplicate requests; use navigateTo for redirects.
- Lifecycle/cleanup: remove listeners/timers in onUnmounted; composables ("useX") must be
  called in setup scope; type provide/inject.

PERFORMANCE
- Reactivity cost: large deep-reactive objects — use shallowRef/shallowReactive; v-memo/v-once
  for static-heavy renders; virtualize long lists; avoid heavy work in computed.
- Bundle/loading: lazy-load components (defineAsyncComponent) and routes; leverage Nuxt
  auto-imports and code-splitting; optimize images (@nuxt/image); keep server-only deps off the
  client bundle.
- Re-renders: stable keys; avoid passing fresh inline objects/arrays as props; debounce
  expensive watchers.

QUALITY
- TypeScript: typed defineProps<...>() / defineEmits<...>(); typed Pinia stores; avoid any.
- State: Pinia as the single source of truth over prop-drilling and ad-hoc buses.
- Tests: Vitest + Vue Test Utils asserting rendered behavior and emitted events, not internals.
- Accessibility: semantic markup and focus management on route change (pair with accessibility.md).

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
