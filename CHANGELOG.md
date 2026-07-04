# Changelog

All notable changes to **Awesome Code Review Prompts** are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> **Versioning policy for a prompt collection**
>
> - **MAJOR** — a breaking change to the prompt structure, the folder layout, or the file-naming convention.
> - **MINOR** — new prompts (dimensions, languages, frameworks) or meaningful additions to existing ones.
> - **PATCH** — wording fixes, typos, link/table corrections, and docs polish that don't change what a prompt asks for.

🌍 Español: [`CHANGELOG-ES.md`](./CHANGELOG-ES.md) · 🧭 Roadmap: [`ROADMAP.md`](./ROADMAP.md)

## [Unreleased]

Groundwork for **0.2.0** — see [`ROADMAP.md`](./ROADMAP.md).

### Added

- **Ruby** language add-on and **Ruby on Rails** framework add-on (EN/ES) — first content of the 0.2.0 milestone.
- **CI quality gate** (`.github/workflows/quality.yml`): validates EN/ES pairing, internal `.md` links, and Markdown style on every push and pull request.
- **`scripts/check-structure.sh`** — dependency-free structural checks (twin files, author footer, fenced `text` block, internal links).
- **`.markdownlint.jsonc`** house style and a **bilingual pull-request template**.
- **`.editorconfig`** for consistent formatting across contributors.
- **`ROADMAP.md` / `ROADMAP-ES.md`** documenting the 0.2.0 plan and backlog.

### Changed

- Normalized Markdown spacing (blank lines around headings and lists) and wrapped bare URLs across all docs — formatting only, no wording changes.

## [0.1.0] — 2026-07-04

First public release: a curated, bilingual (EN/ES) collection of master prompts for AI-assisted code review, built for Claude Fable 5 and other Claude models.

### Added

- **7 general master prompts** (`prompts/general/`): application security, cybersecurity & infra, performance, accessibility (WCAG 2.2 AA), usability/UX, code quality, and an all-in-one scored release review.
- **12 language add-ons** (`prompts/languages/`): JavaScript/TypeScript, Python, PHP (modern), PHP/WordPress, Java, Go, C#/.NET, Swift/iOS, Kotlin/Android, Rust, C/C++, and SQL/databases.
- **7 framework & DevOps add-ons** (`prompts/frameworks/`): React/Next.js, Laravel, Symfony, Node.js/Express, Docker/Kubernetes, Terraform/IaC, and Bash/Shell.
- **Full bilingual coverage**: every prompt ships as an English default (`name.md`) plus a Spanish twin (`name-ES.md`) — 52 prompt files across 26 pairs.
- **Consistent prompt structure** across all files: Role → Scope → Method → Output contract → Clarifying questions.
- **Documentation**: `README.md` / `README-ES.md`, a usage guide (`docs/how-to-use.md` / `docs/how-to-use-ES.md`), and `CONTRIBUTING.md` with the two-files-per-prompt convention and style rules.
- **Project scaffolding**: MIT `LICENSE`, `.gitignore`, and a GitHub issue template for proposing new stack add-ons.

[Unreleased]: https://github.com/dcarrero/awesome-code-review-prompts/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/dcarrero/awesome-code-review-prompts/releases/tag/v0.1.0

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
