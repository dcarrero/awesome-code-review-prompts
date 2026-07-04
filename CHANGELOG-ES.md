# Changelog

Todos los cambios relevantes de **Awesome Code Review Prompts** se documentan en este fichero.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es/1.1.0/),
y este proyecto sigue [Versionado Semántico](https://semver.org/lang/es/).

> **Política de versionado para una colección de prompts**
>
> - **MAYOR** — cambio incompatible en la estructura del prompt, la organización de carpetas o la convención de nombres de fichero.
> - **MENOR** — nuevos prompts (dimensiones, lenguajes, frameworks) o añadidos relevantes a los existentes.
> - **PARCHE** — correcciones de redacción, erratas, arreglos de enlaces/tablas y pulido de documentación que no cambian lo que pide un prompt.

🌍 English: [`CHANGELOG.md`](./CHANGELOG.md) · 🧭 Roadmap: [`ROADMAP-ES.md`](./ROADMAP-ES.md)

## [Sin publicar]

Base para la **0.2.0** — consulta [`ROADMAP-ES.md`](./ROADMAP-ES.md).

### Añadido

- **Nueva dimensión general** — Revisión de tests y calidad de tests (`prompts/general/testing.md`), integrada además en la revisión todo-en-uno como 7ª dimensión puntuada.
- **Complementos de lenguaje** — Ruby y PowerShell (EN/ES).
- **Complementos de framework** — Ruby on Rails, Django, Spring Boot y Vue / Nuxt (EN/ES).
- **Puerta de calidad en CI** (`.github/workflows/quality.yml`): valida el emparejamiento EN/ES, los enlaces internos `.md` y el estilo Markdown en cada push y pull request.
- **`scripts/check-structure.sh`** — comprobaciones estructurales sin dependencias (ficheros gemelos, footer de autor, bloque `text`, enlaces internos).
- **Estilo `.markdownlint.jsonc`** y una **plantilla de pull request bilingüe**.
- **`.editorconfig`** para formato consistente entre colaboradores.
- **`ROADMAP.md` / `ROADMAP-ES.md`** documentando el plan y el backlog de la 0.2.0.

### Cambiado

- Normalizado el espaciado Markdown (líneas en blanco alrededor de headings y listas) y envueltas las URLs sueltas en toda la documentación — solo formato, sin cambios de redacción.

## [0.1.0] — 2026-07-04

Primera versión pública: una colección curada y bilingüe (EN/ES) de prompts maestros para revisión de código asistida por IA, pensada para Claude Fable 5 y otros modelos Claude.

### Añadido

- **7 prompts maestros generales** (`prompts/general/`): seguridad de aplicación, ciberseguridad e infraestructura, rendimiento, accesibilidad (WCAG 2.2 AA), usabilidad/UX, calidad de código y una revisión todo en uno con puntuación de release.
- **12 complementos por lenguaje** (`prompts/languages/`): JavaScript/TypeScript, Python, PHP (moderno), PHP/WordPress, Java, Go, C#/.NET, Swift/iOS, Kotlin/Android, Rust, C/C++ y SQL/bases de datos.
- **7 complementos de framework y DevOps** (`prompts/frameworks/`): React/Next.js, Laravel, Symfony, Node.js/Express, Docker/Kubernetes, Terraform/IaC y Bash/Shell.
- **Cobertura bilingüe completa**: cada prompt se entrega como fichero en inglés por defecto (`nombre.md`) más su gemelo en español (`nombre-ES.md`) — 52 ficheros de prompt en 26 parejas.
- **Estructura de prompt consistente** en todos los ficheros: Rol → Alcance → Método → Contrato de salida → Preguntas de clarificación.
- **Documentación**: `README.md` / `README-ES.md`, una guía de uso (`docs/how-to-use.md` / `docs/how-to-use-ES.md`) y `CONTRIBUTING.md` con la convención de dos ficheros por prompt y las reglas de estilo.
- **Andamiaje del proyecto**: `LICENSE` MIT, `.gitignore` y una plantilla de issue de GitHub para proponer nuevos complementos de stack.

[Sin publicar]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/dcarrero/awesome-code-review-prompts/releases/tag/v0.1.0

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
