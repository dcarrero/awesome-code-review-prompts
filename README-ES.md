# 🧠 Awesome Code Review Prompts

> Una colección curada y probada de **prompts maestros** para pedirle a un asistente de IA
> (pensado para **Claude Fable 5** y otros modelos Claude) que revise tu código en las
> dimensiones que de verdad importan: **seguridad, ciberseguridad, rendimiento,
> accesibilidad, usabilidad/UX y calidad de código**.
>
> Prompts maestros agnósticos del lenguaje + complementos específicos para más de 18
> lenguajes y frameworks.

🌍 **English:** [`README.md`](./README.md) — cada prompt tiene su gemelo en español que acaba en `-ES.md`.
📖 **Cómo sacarle partido:** [`docs/how-to-use-ES.md`](./docs/how-to-use-ES.md)
✍️ **Autor:** David Carrero Fernández-Baillo — [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero)
📦 **Repositorio:** https://github.com/dcarrero/awesome-code-review-prompts

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
| 🧭 Todo en uno | [all-in-one.md](./prompts/general/all-in-one.md) | [all-in-one-ES.md](./prompts/general/all-in-one-ES.md) | Ejecuta todas las dimensiones y produce un único informe con puntuación |

## 📑 Índice — complementos por lenguaje

Añádelos **después** de un prompt maestro general para comprobaciones más profundas e idiomáticas.

| Lenguaje | English | Español |
|---|---|---|
| JavaScript / TypeScript | [.md](./prompts/languages/javascript-typescript.md) | [·-ES.md](./prompts/languages/javascript-typescript-ES.md) |
| Python | [.md](./prompts/languages/python.md) | [·-ES.md](./prompts/languages/python-ES.md) |
| PHP (moderno, agnóstico de framework) | [.md](./prompts/languages/php-modern.md) | [·-ES.md](./prompts/languages/php-modern-ES.md) |
| PHP / WordPress | [.md](./prompts/languages/php-wordpress.md) | [·-ES.md](./prompts/languages/php-wordpress-ES.md) |
| Java | [.md](./prompts/languages/java.md) | [·-ES.md](./prompts/languages/java-ES.md) |
| Go | [.md](./prompts/languages/go.md) | [·-ES.md](./prompts/languages/go-ES.md) |
| C# / .NET | [.md](./prompts/languages/csharp-dotnet.md) | [·-ES.md](./prompts/languages/csharp-dotnet-ES.md) |
| Swift / iOS | [.md](./prompts/languages/swift-ios.md) | [·-ES.md](./prompts/languages/swift-ios-ES.md) |
| Kotlin / Android | [.md](./prompts/languages/kotlin-android.md) | [·-ES.md](./prompts/languages/kotlin-android-ES.md) |
| Rust | [.md](./prompts/languages/rust.md) | [·-ES.md](./prompts/languages/rust-ES.md) |
| C / C++ | [.md](./prompts/languages/c-cpp.md) | [·-ES.md](./prompts/languages/c-cpp-ES.md) |
| SQL / Bases de datos | [.md](./prompts/languages/sql.md) | [·-ES.md](./prompts/languages/sql-ES.md) |

## 📑 Índice — complementos de framework y DevOps

| Stack | English | Español |
|---|---|---|
| React / Next.js | [.md](./prompts/frameworks/react-nextjs.md) | [·-ES.md](./prompts/frameworks/react-nextjs-ES.md) |
| Laravel (PHP) | [.md](./prompts/frameworks/laravel.md) | [·-ES.md](./prompts/frameworks/laravel-ES.md) |
| Symfony (PHP) | [.md](./prompts/frameworks/symfony.md) | [·-ES.md](./prompts/frameworks/symfony-ES.md) |
| Node.js / Express | [.md](./prompts/frameworks/nodejs.md) | [·-ES.md](./prompts/frameworks/nodejs-ES.md) |
| Docker / Kubernetes | [.md](./prompts/frameworks/docker-kubernetes.md) | [·-ES.md](./prompts/frameworks/docker-kubernetes-ES.md) |
| Terraform / IaC | [.md](./prompts/frameworks/terraform.md) | [·-ES.md](./prompts/frameworks/terraform-ES.md) |
| Bash / Shell | [.md](./prompts/frameworks/bash.md) | [·-ES.md](./prompts/frameworks/bash-ES.md) |

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
