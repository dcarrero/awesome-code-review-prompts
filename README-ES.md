# 🧠 Awesome Code Review Prompts

![Licencia: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Prompts](https://img.shields.io/badge/prompts-39-blue)
![Stacks](https://img.shields.io/badge/stacks-30-orange)
![Idiomas](https://img.shields.io/badge/i18n-EN%20%7C%20ES-8A2BE2)
![Modelos](https://img.shields.io/badge/models-Claude%20Fable%205%20%2B%20frontier-blueviolet)
![PRs bienvenidos](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

> Una colección curada y probada de **prompts maestros** para pedirle a un asistente de IA
> (pensado para **Claude Fable 5** y compatible con cualquier modelo frontera — GPT-5.x,
> Gemini, Grok y más) que revise tu código en las
> dimensiones que de verdad importan: **seguridad, ciberseguridad, rendimiento,
> accesibilidad, usabilidad/UX, testing, seguridad IA/LLM y calidad de código**.
>
> Prompts maestros agnósticos del lenguaje + **30 complementos específicos de stack**
> (14 lenguajes, 16 frameworks) — cada prompt en **inglés y español**.

🌍 **English:** [`README.md`](./README.md) — cada prompt tiene su gemelo en español que acaba en `-ES.md`.
📖 **Cómo sacarle partido:** [`docs/how-to-use-ES.md`](./docs/how-to-use-ES.md)
🗒️ **Changelog:** [`CHANGELOG-ES.md`](./CHANGELOG-ES.md) · 🧭 **Roadmap:** [`ROADMAP-ES.md`](./ROADMAP-ES.md)
✍️ **Autor:** David Carrero Fernández-Baillo — [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero)
📦 **Repositorio:** <https://github.com/dcarrero/awesome-code-review-prompts>

<p align="center">
  <a href="https://administraciondesistemas.com/revision-de-codigo-e-infraestructura-con-ia-y-sin-ella-guia-practica-para-administradores-de-sistemas-y-desarrolladores/">
    <img src="https://administraciondesistemas.com/wp-content/uploads/2026/07/geniales-prompts-revision-codigo-min-1024x559.jpg" alt="Revisión de código e infraestructura, con IA y sin ella" width="720">
  </a>
</p>

> 📝 **Guía recomendada:** [Revisión de código e infraestructura, con IA y sin ella: guía práctica para administradores de sistemas y desarrolladores](https://administraciondesistemas.com/revision-de-codigo-e-infraestructura-con-ia-y-sin-ella-guia-practica-para-administradores-de-sistemas-y-desarrolladores/) — el artículo complementario que explica el porqué y el cómo de esta colección.

---

## Por qué existe

Un revisor de IA es tan bueno como el prompt que le des. "Revisa mi código" produce
feedback vago y superficial. Un prompt bien estructurado que asigna un rol, define el
alcance, fija un método y establece el formato de salida convierte al mismo modelo en un
revisor senior enfocado que encuentra problemas reales y te entrega arreglos listos para
pegar.

Este repo te da esos prompts, listos para pegar, para cualquier proyecto y lenguaje.

## Cómo usarlo

1. **Elige una dimensión** en `prompts/general/` (p. ej., seguridad, rendimiento).
2. **Pega el prompt maestro** en tu conversación con Claude.
3. **Añade tu código**: pega un `git diff` para un chequeo rápido de PR, o un fichero/carpeta
   para una auditoría profunda.
4. *(Opcional)* **Combínalo**: añade al final el complemento correspondiente de
   `prompts/languages/` o `prompts/frameworks/` para comprobaciones específicas del lenguaje.
5. **Publica con confianza** usando la lista de arreglos priorizada que produce el prompt.

👉 Para patrones, ejemplos y flujos de trabajo (control de PR, CI, aprendizaje), lee
[`docs/how-to-use-ES.md`](./docs/how-to-use-ES.md).

> 💡 Cada prompt maestro termina pidiendo al modelo que haga hasta 3 preguntas de
> clarificación antes de revisar — así reúne contexto en vez de adivinar.

## 🤖 Compatibilidad de modelos

Todos los prompts son **texto plano** — nada está atado a un proveedor concreto. La colección
está escrita y ajustada para **Claude Fable 5** (el modelo recomendado por defecto), y los
mismos prompts funcionan con cualquier otro modelo frontera capaz de seguir un conjunto de
instrucciones estructurado.

| Modelo | Cómo usarlo |
|---|---|
| **Claude Fable 5** — *recomendado* | El modelo para el que están ajustados. Pega el bloque `text` y luego tu diff. |
| Claude Opus 4.x / Sonnet | Misma familia Claude; intercambiable. |
| OpenAI GPT-5.x | Intercambiable; pega el mismo bloque `text`. |
| Google Gemini | Intercambiable; da alcance explícito en diffs grandes. |
| xAI Grok · DeepSeek · otros modelos frontera | Funcionan con los mismos prompts; conserva el paso de preguntas de clarificación. |

> 💡 Los prompts no dependen de ninguna función específica de un modelo. Si el modelo respeta
> el **Contrato de salida** y hace las **preguntas de clarificación**, obtendrás resultados
> comparables.

## Convención de idioma

Cada fichero está **en inglés por defecto** (`nombre.md`) con su equivalente en español
(`nombre-ES.md`). P. ej. [`security.md`](./prompts/general/security.md) ·
[`security-ES.md`](./prompts/general/security-ES.md).

## 📑 Índice — prompts maestros generales

| Dimensión | English | Español | Qué detecta |
|---|---|---|---|
| 🔒 Seguridad de aplicación | [security.md](./prompts/general/security.md) | [security-ES.md](./prompts/general/security-ES.md) | Inyección, XSS, auth/control de acceso rotos, criptografía, OWASP Top 10, CWE |
| 🛡️ Ciberseguridad e infra | [cybersecurity.md](./prompts/general/cybersecurity.md) | [cybersecurity-ES.md](./prompts/general/cybersecurity-ES.md) | Secretos, CVEs de dependencias, contenedores, IaC, CI/CD, cadena de suministro, modelo de amenazas |
| ⚡ Rendimiento | [performance.md](./prompts/general/performance.md) | [performance-ES.md](./prompts/general/performance-ES.md) | Complejidad, N+1, concurrencia, memoria, caché, payloads, escalabilidad |
| ♿ Accesibilidad | [accessibility.md](./prompts/general/accessibility.md) | [accessibility-ES.md](./prompts/general/accessibility-ES.md) | WCAG 2.2 AA: semántica, teclado, ARIA, contraste, formularios, movimiento |
| 🎯 Usabilidad / UX | [usability-ux.md](./prompts/general/usability-ux.md) | [usability-ux-ES.md](./prompts/general/usability-ux-ES.md) | Claridad, flujos, feedback/estado, recuperación de errores, microcopy, consistencia |
| 🧹 Calidad de código | [code-quality.md](./prompts/general/code-quality.md) | [code-quality-ES.md](./prompts/general/code-quality-ES.md) | Corrección, diseño, tests, legibilidad, mantenibilidad |
| 🧪 Tests y calidad de tests | [testing.md](./prompts/general/testing.md) | [testing-ES.md](./prompts/general/testing-ES.md) | Cobertura de comportamiento, fuerza de las aserciones, flakiness, sobre-mockeo, tests de regresión ausentes |
| 🤖 Seguridad de código IA/LLM | [ai-llm-safety.md](./prompts/general/ai-llm-safety.md) | [ai-llm-safety-ES.md](./prompts/general/ai-llm-safety-ES.md) | Prompt injection, manejo inseguro de la salida, agencia excesiva, control de acceso en RAG, fuga de datos (OWASP LLM Top 10) |
| 🧭 Todo en uno | [all-in-one.md](./prompts/general/all-in-one.md) | [all-in-one-ES.md](./prompts/general/all-in-one-ES.md) | Ejecuta todas las dimensiones y produce un único informe con puntuación |

## 📑 Índice — complementos por lenguaje

Añádelos **después** de un prompt maestro general para comprobaciones más profundas e idiomáticas.

| Lenguaje | English | Español |
|---|---|---|
| JavaScript / TypeScript | [javascript-typescript.md](./prompts/languages/javascript-typescript.md) | [·-ES.md](./prompts/languages/javascript-typescript-ES.md) |
| Python | [python.md](./prompts/languages/python.md) | [·-ES.md](./prompts/languages/python-ES.md) |
| Ruby | [ruby.md](./prompts/languages/ruby.md) | [·-ES.md](./prompts/languages/ruby-ES.md) |
| PHP (moderno, agnóstico de framework) | [php-modern.md](./prompts/languages/php-modern.md) | [·-ES.md](./prompts/languages/php-modern-ES.md) |
| PHP / WordPress | [php-wordpress.md](./prompts/languages/php-wordpress.md) | [·-ES.md](./prompts/languages/php-wordpress-ES.md) |
| Java | [java.md](./prompts/languages/java.md) | [·-ES.md](./prompts/languages/java-ES.md) |
| Go | [go.md](./prompts/languages/go.md) | [·-ES.md](./prompts/languages/go-ES.md) |
| C# / .NET | [csharp-dotnet.md](./prompts/languages/csharp-dotnet.md) | [·-ES.md](./prompts/languages/csharp-dotnet-ES.md) |
| Swift / iOS | [swift-ios.md](./prompts/languages/swift-ios.md) | [·-ES.md](./prompts/languages/swift-ios-ES.md) |
| Kotlin / Android | [kotlin-android.md](./prompts/languages/kotlin-android.md) | [·-ES.md](./prompts/languages/kotlin-android-ES.md) |
| Rust | [rust.md](./prompts/languages/rust.md) | [·-ES.md](./prompts/languages/rust-ES.md) |
| C / C++ | [c-cpp.md](./prompts/languages/c-cpp.md) | [·-ES.md](./prompts/languages/c-cpp-ES.md) |
| PowerShell | [powershell.md](./prompts/languages/powershell.md) | [·-ES.md](./prompts/languages/powershell-ES.md) |
| SQL / Bases de datos | [sql.md](./prompts/languages/sql.md) | [·-ES.md](./prompts/languages/sql-ES.md) |

## 📑 Índice — complementos de framework y DevOps

| Stack | English | Español |
|---|---|---|
| React / Next.js | [react-nextjs.md](./prompts/frameworks/react-nextjs.md) | [·-ES.md](./prompts/frameworks/react-nextjs-ES.md) |
| Vue / Nuxt | [vue-nuxt.md](./prompts/frameworks/vue-nuxt.md) | [·-ES.md](./prompts/frameworks/vue-nuxt-ES.md) |
| Angular | [angular.md](./prompts/frameworks/angular.md) | [·-ES.md](./prompts/frameworks/angular-ES.md) |
| Laravel (PHP) | [laravel.md](./prompts/frameworks/laravel.md) | [·-ES.md](./prompts/frameworks/laravel-ES.md) |
| Symfony (PHP) | [symfony.md](./prompts/frameworks/symfony.md) | [·-ES.md](./prompts/frameworks/symfony-ES.md) |
| FlightPHP (PHP micro) | [flightphp.md](./prompts/frameworks/flightphp.md) | [·-ES.md](./prompts/frameworks/flightphp-ES.md) |
| Ruby on Rails | [rails.md](./prompts/frameworks/rails.md) | [·-ES.md](./prompts/frameworks/rails-ES.md) |
| Django (Python) | [django.md](./prompts/frameworks/django.md) | [·-ES.md](./prompts/frameworks/django-ES.md) |
| FastAPI (Python) | [fastapi.md](./prompts/frameworks/fastapi.md) | [·-ES.md](./prompts/frameworks/fastapi-ES.md) |
| Spring Boot (Java) | [spring-boot.md](./prompts/frameworks/spring-boot.md) | [·-ES.md](./prompts/frameworks/spring-boot-ES.md) |
| Node.js / Express | [nodejs.md](./prompts/frameworks/nodejs.md) | [·-ES.md](./prompts/frameworks/nodejs-ES.md) |
| NestJS | [nestjs.md](./prompts/frameworks/nestjs.md) | [·-ES.md](./prompts/frameworks/nestjs-ES.md) |
| Cloudflare Workers | [cloudflare-workers.md](./prompts/frameworks/cloudflare-workers.md) | [·-ES.md](./prompts/frameworks/cloudflare-workers-ES.md) |
| Docker / Kubernetes | [docker-kubernetes.md](./prompts/frameworks/docker-kubernetes.md) | [·-ES.md](./prompts/frameworks/docker-kubernetes-ES.md) |
| Terraform / IaC | [terraform.md](./prompts/frameworks/terraform.md) | [·-ES.md](./prompts/frameworks/terraform-ES.md) |
| Bash / Shell | [bash.md](./prompts/frameworks/bash.md) | [·-ES.md](./prompts/frameworks/bash-ES.md) |

## Combinaciones recomendadas

- **Chequeo de PR de app web** → `all-in-one` + `react-nextjs` (+ `nodejs` para el backend).
- **Hardening de API/backend** → `security` + `cybersecurity` + tu fichero de lenguaje.
- **App Laravel / Symfony** → `all-in-one` + `php-modern` + `laravel` (o `symfony`).
- **Cambio de infra** → `cybersecurity` + `docker-kubernetes` / `terraform`.
- **Release de UI pública** → `accessibility` + `usability-ux` + `react-nextjs`.
- **Limpieza de legacy** → `code-quality` + `performance` + tu fichero de lenguaje.

## Por qué estos prompts funcionan

Todos los prompts siguen la misma estructura probada:

- **Rol** — sitúa al modelo como especialista senior, elevando el listón de calidad.
- **Alcance** — un checklist explícito para no saltarse nada importante.
- **Método** — cómo razonar (rastrear source→sink, priorizar por impacto, evitar falsos positivos).
- **Contrato de salida** — un formato fijo (severidad, ubicación exacta, impacto, arreglo listo para pegar, veredicto).
- **Preguntas de clarificación** — el modelo pide el contexto que falta antes de juzgar.

## Contribuir

Se aceptan nuevos lenguajes, frameworks y mejoras de dimensiones. Consulta
[`CONTRIBUTING.md`](./CONTRIBUTING.md). Por favor, entrega cada prompt como pareja:
`nombre.md` (inglés) **y** `nombre-ES.md` (español).

## Licencia y autor

[MIT](./LICENSE) — úsalo, adáptalo y compártelo libremente.

Creado y mantenido por **David Carrero Fernández-Baillo**
🌐 [carrero.es](https://carrero.es) · 🐙 [github.com/dcarrero](https://github.com/dcarrero)

© 2026 David Carrero Fernández-Baillo. Si te resulta útil, se agradece una ⭐ en el
[repositorio](https://github.com/dcarrero/awesome-code-review-prompts).
