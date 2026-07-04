# Roadmap

Hacia dónde va **Awesome Code Review Prompts**. Las prioridades pueden cambiar con la
aportación de la comunidad — abre un
[issue](https://github.com/dcarrero/awesome-code-review-prompts/issues) o un PR para opinar.

🌍 English: [`ROADMAP.md`](./ROADMAP.md) · 🗒️ Changelog: [`CHANGELOG-ES.md`](./CHANGELOG-ES.md)

## Versionado

- **MAYOR** — cambio incompatible en la estructura del prompt, la organización de carpetas o la convención de nombres.
- **MENOR** — nuevos prompts (dimensiones, lenguajes, frameworks) o añadidos relevantes.
- **PARCHE** — pulido de redacción, enlaces y documentación que no cambia lo que pide un prompt.

## 0.2.0 — Más stacks + pipeline de contribución con control de calidad

**Objetivo:** cubrir los huecos de stack más habituales y automatizar las reglas que
mantienen coherente la colección (pares EN/ES, enlaces internos, estilo Markdown).

### Contenido (prompts nuevos)

- Lenguajes: **Ruby** ✅, **PowerShell** ✅.
- Frameworks: **Ruby on Rails** ✅, **Django** ✅, **Spring Boot** ✅, **Vue / Nuxt** ✅.
- Nueva dimensión general: **Revisión de tests y calidad de tests** ✅.

→ Creció la colección de 26 a 33 prompts maestros (8 generales, 14 lenguajes, 11 frameworks).
**Estado: contenido 0.2.0 completo — listo para etiquetar y publicar.**

### Herramientas y DX — ✅ hecho

- Puerta de calidad en CI (`.github/workflows/quality.yml`): pares EN/ES, enlaces internos, lint de Markdown.
- Script `scripts/check-structure.sh` sin dependencias.
- Plantilla de PR bilingüe, `.editorconfig` y estilo `.markdownlint.jsonc`.

### Definición de "hecho"

Cada prompt nuevo entra como par EN/ES, registrado en las tablas índice de ambos READMEs,
conserva el footer de autor, actualiza el changelog bajo `[Sin publicar]` y pasa el CI.

## Backlog (0.3.0+)

- **Lenguajes:** Elixir, Dart, Scala, R.
- **Frameworks / DevOps:** FastAPI, NestJS, Angular, SvelteKit, Flutter, Phoenix,
  ASP.NET Core, Ansible, Helm, GitHub Actions, Serverless / Cloudflare Workers, GraphQL, gRPC.
- **Dimensiones:** Observabilidad y logging, Privacidad de datos y GDPR, Seguridad de código
  IA/LLM (prompt injection), Seguridad de migraciones de BD, Revisión de documentación, i18n/l10n.
- **Meta:** combos "receta" de un solo pegado, metadata front-matter por prompt para tooling, y
  un pequeño ensamblador (script/Action) que una un prompt general + un complemento.

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
