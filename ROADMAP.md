# Roadmap

Where **Awesome Code Review Prompts** is headed. Priorities can shift with community
input — open an [issue](https://github.com/dcarrero/awesome-code-review-prompts/issues)
or a PR to weigh in.

🌍 Español: [`ROADMAP-ES.md`](./ROADMAP-ES.md) · 🗒️ Changelog: [`CHANGELOG.md`](./CHANGELOG.md)

## Versioning

- **MAJOR** — breaking change to prompt structure, folder layout, or the naming convention.
- **MINOR** — new prompts (dimensions, languages, frameworks) or meaningful additions.
- **PATCH** — wording, links, and docs polish that don't change what a prompt asks for.

## 0.2.0 — Wider stacks + a quality-checked contribution pipeline

**Goal:** fill the most common stack gaps and automate the rules that keep the collection
consistent (EN/ES pairing, internal links, Markdown style).

### Content (new prompts)

- Languages: **Ruby**, **PowerShell**.
- Frameworks: **Ruby on Rails**, **Django**, **Spring Boot**, **Vue / Nuxt**.
- New general dimension: **Testing & test-quality review**.

→ Grows the collection from 26 to 33 master prompts (8 general, 14 languages, 11 frameworks).

### Tooling & DX — ✅ landed

- CI quality gate (`.github/workflows/quality.yml`): EN/ES pairing, internal links, Markdown lint.
- Dependency-free `scripts/check-structure.sh`.
- Bilingual pull-request template, `.editorconfig`, and `.markdownlint.jsonc` house style.

### Definition of done

Every new prompt ships as an EN/ES pair, is registered in both README index tables, keeps
the author footer, updates the changelog under `[Unreleased]`, and passes CI.

## Backlog (0.3.0+)

- **Languages:** Elixir, Dart, Scala, R.
- **Frameworks / DevOps:** FastAPI, NestJS, Angular, SvelteKit, Flutter, Phoenix,
  ASP.NET Core, Ansible, Helm, GitHub Actions, Serverless / Cloudflare Workers, GraphQL, gRPC.
- **Dimensions:** Observability & logging, Data privacy & GDPR, AI/LLM code safety
  (prompt injection), DB migration safety, Documentation review, i18n/l10n.
- **Meta:** one-paste "recipe" combos, per-prompt front-matter metadata for tooling, and a
  small assembler (script/Action) that stitches a general prompt + an add-on.

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
