# Vue / Nuxt — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general **y** a `prompts/languages/javascript-typescript-ES.md`.
> Añade comprobaciones específicas de Vue 3 / Nuxt 3 (reactividad, SSR, composables, stores).

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Vue 3 / Nuxt 3:

SEGURIDAD
- XSS: v-html con datos no confiables (sanea con DOMPurify o evítalo); :href/:src dinámicos con
  URLs javascript:; datos de usuario interpolados en useHead()/meta.
- Fuga de secretos en SSR (Nuxt): los valores privados deben vivir en runtimeConfig (solo
  servidor), nunca en runtimeConfig.public ni NUXT_PUBLIC_*; mantén claves/tokens de API en
  rutas de servidor (server/api), sin enviarlos al cliente.
- Auth: prefiere cookies httpOnly frente a localStorage (exfiltrable por XSS); aplica la
  autorización en el servidor (route rules / server middleware), no solo con guardas de
  navegación del cliente; CSRF para auth basada en cookies.
- Entrada de servidor: valida y tipa la entrada en los handlers de Nuxt server/api; protégete
  de SSRF en $fetch del servidor a URLs de usuario; nunca hagas eval de entrada de usuario.
- Cadena de suministro: ejecuta npm audit; fija dependencias; revisa los módulos de Nuxt que
  obtienen acceso total a la app.

CORRECCIÓN E IDIOMÁTICA
- Reactividad: ref vs reactive; desestructurar un reactive() pierde reactividad (usa
  toRefs/storeToRefs); computed debe ser puro (sin efectos secundarios); watch vs watchEffect;
  añade :key en v-for; no mutes props (emite en su lugar).
- SSR/hidratación (Nuxt): protege las APIs solo-cliente (window/document) con
  import.meta.client u onMounted; desajustes de hidratación por Date.now()/Math.random() en
  plantillas; usa useState (no singletons a nivel de módulo) para estado compartido seguro en
  SSR y que no se filtre entre peticiones.
- Data fetching: useAsyncData/useFetch con claves únicas y manejo de error/pending correcto;
  evita peticiones duplicadas; usa navigateTo para redirecciones.
- Ciclo de vida/limpieza: elimina listeners/timers en onUnmounted; los composables ("useX")
  deben llamarse en el scope de setup; tipa provide/inject.

RENDIMIENTO
- Coste de reactividad: objetos grandes profundamente reactivos — usa shallowRef/shallowReactive;
  v-memo/v-once para renders con mucho contenido estático; virtualiza listas largas; evita
  trabajo pesado en computed.
- Bundle/carga: carga diferida de componentes (defineAsyncComponent) y rutas; aprovecha los
  auto-imports y el code-splitting de Nuxt; optimiza imágenes (@nuxt/image); mantén las
  dependencias solo-servidor fuera del bundle del cliente.
- Re-renders: claves estables; evita pasar objetos/arrays inline nuevos como props; aplica
  debounce a watchers costosos.

CALIDAD
- TypeScript: defineProps<...>() / defineEmits<...>() tipados; stores de Pinia tipadas; evita any.
- Estado: Pinia como única fuente de verdad frente al prop-drilling y buses ad-hoc.
- Tests: Vitest + Vue Test Utils verificando comportamiento renderizado y eventos emitidos, no
  internos.
- Accesibilidad: marcado semántico y gestión del foco al cambiar de ruta (combina con
  accessibility-ES.md).

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
