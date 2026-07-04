# React / Next.js — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de React/Next.js:

SEGURIDAD
- XSS vía dangerouslySetInnerHTML sin sanear; inyectar HTML/URLs de usuario (hrefs
  javascript:); datos no confiables en <script>/estilos inline.
- Next.js: secretos filtrados al cliente (mal uso de NEXT_PUBLIC_); código/claves de
  servidor importados en componentes de cliente; entradas sin validar en API routes /
  server actions; falta de comprobaciones de auth en route handlers/middleware; SSRF en
  fetch de servidor; redirecciones abiertas.
- Variables de entorno expuestas; falta de CSRF/rate limiting en mutaciones.

CORRECCIÓN (HOOKS Y ESTADO)
- Arrays de dependencias de useEffect incorrectos/ausentes; effects que deberían ser
  estado derivado; cleanup ausente (suscripciones/timers); closures obsoletos; setState
  en render.
- Keys usando índice de array causando bugs de reconciliación; mutar el estado
  directamente; condiciones de carrera en effects async (sin abort); mal uso de la
  frontera Server/Client Component.

RENDIMIENTO
- Re-renders innecesarios: falta de memo/useMemo/useCallback donde se ha perfilado;
  context causando re-renders amplios; listas grandes sin virtualización; props/objetos
  inestables creados en render.
- Next.js: no usar Server Components/streaming donde conviene; imágenes sin optimizar
  (usa next/image); waterfalls frente a fetch en paralelo; falta de estrategia de
  caché/revalidación; bundles de cliente sobredimensionados (dynamic import, tree-shaking).

ACCESIBILIDAD Y CALIDAD
- Elementos semánticos sobre div/span; asociación de labels; gestión de foco en cambios
  de ruta y modales; corrección de ARIA. Claridad de la API de componentes; tipado de props.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
