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

_Nada por ahora. Propón añadidos mediante un pull request — consulta [`CONTRIBUTING.md`](./CONTRIBUTING.md)._

## [0.4.1] — 2026-07-16

### Cambiado

- Citar **OpenAI GPT-5.6** de forma explícita junto a la familia GPT-5.x en la sección de compatibilidad de modelos, los subtítulos y las guías de uso (EN/ES) — solo redacción.

## [0.4.0] — 2026-07-16

Amplía el posicionamiento de la colección. Son prompts de texto plano y agnósticos del modelo, y la documentación ahora lo deja explícito: están ajustados para **Claude Fable 5** y son compatibles con cualquier otro modelo frontera.

### Añadido

- **Sección "Compatibilidad de modelos"** en `README.md` / `README-ES.md`, documentando que los prompts funcionan con **Claude Fable 5** (recomendado por defecto), **Claude Opus 4.x / Sonnet**, **OpenAI GPT-5.x**, **Google Gemini**, **xAI Grok**, **DeepSeek** y otros modelos frontera.
- **Badge `models`** en ambos READMEs.

### Cambiado

- Reformulado el subtítulo de README / README-ES y el inicio rápido de la guía de uso: de "pensado para Claude" a "pensado para **Claude Fable 5** y compatible con cualquier modelo frontera" — sin cambios en lo que pide ningún prompt.

## [0.3.0] — 2026-07-04

Cinco stacks nuevos y una nueva dimensión. Crece la colección hasta 39 prompts maestros (9 generales, 14 lenguajes, 16 frameworks).

### Añadido

- **Nueva dimensión general** — Seguridad de código IA/LLM (`prompts/general/ai-llm-safety.md`), mapeada al OWASP Top 10 para aplicaciones LLM; integrada además en la revisión todo-en-uno como 8ª dimensión puntuada.
- **Complementos de framework** — FlightPHP, FastAPI, NestJS, Angular y Cloudflare Workers (EN/ES).

## [0.2.0] — 2026-07-04

Mayor cobertura de stacks más un pipeline de contribución con control de calidad. Crece la colección hasta 33 prompts maestros (8 generales, 14 lenguajes, 11 frameworks).

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

[Sin publicar]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.4.1...HEAD
[0.4.1]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/dcarrero/awesome-code-review-prompts/releases/tag/v0.1.0

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
