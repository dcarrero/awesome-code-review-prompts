# 🧠 Awesome Code Review Prompts

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Prompts](https://img.shields.io/badge/prompts-39-blue)
![Stacks](https://img.shields.io/badge/stacks-30-orange)
![Languages](https://img.shields.io/badge/i18n-EN%20%7C%20ES-8A2BE2)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

> A curated, battle-tested collection of **master prompts** for asking an AI assistant
> (built for **Claude Fable 5** and other Claude models) to review your code across the
> dimensions that actually matter: **security, cybersecurity, performance, accessibility,
> usability/UX, testing, AI/LLM safety, and code quality**.
>
> Language-agnostic master prompts + **30 stack-specific add-ons** (14 languages, 16 frameworks) — every prompt in **English and Spanish**.

🌍 **Español:** [`README-ES.md`](./README-ES.md) — every prompt has a Spanish twin ending in `-ES.md`.
📖 **How to use it well:** [`docs/how-to-use.md`](./docs/how-to-use.md)
🗒️ **Changelog:** [`CHANGELOG.md`](./CHANGELOG.md) · 🧭 **Roadmap:** [`ROADMAP.md`](./ROADMAP.md)
✍️ **Author:** David Carrero Fernández-Baillo — [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero)
📦 **Repository:** <https://github.com/dcarrero/awesome-code-review-prompts>

<p align="center">
  <a href="https://systemadministration.net/code-and-infrastructure-review-with-and-without-ai-a-practical-guide-for-system-administrators-and-developers/">
    <img src="https://systemadministration.net/wp-content/uploads/2026/07/awesome-code-reviewe-prompts-min-1024x559.jpg" alt="Code and Infrastructure Review, With and Without AI" width="720">
  </a>
</p>

> 📝 **Featured guide:** [Code and Infrastructure Review, With and Without AI: A Practical Guide for System Administrators and Developers](https://systemadministration.net/code-and-infrastructure-review-with-and-without-ai-a-practical-guide-for-system-administrators-and-developers/) — the companion article that explains the why and how behind this collection.

---

## Why this exists

AI reviewers are only as good as the prompt you give them. "Review my code" produces
vague, shallow feedback. A well-structured prompt that assigns a role, defines scope,
sets a method, and fixes the output format turns the same model into a focused senior
reviewer that finds real issues and hands you copy-ready fixes.

This repo gives you those prompts, ready to paste, for any project and any language.

## How to use

1. **Pick a dimension** from `prompts/general/` (e.g., security, performance).
2. **Paste the master prompt** into your Claude conversation.
3. **Add your code**: paste a `git diff` for a fast PR gate, or a file/folder for a deep audit.
4. *(Optional)* **Stack it**: append the matching add-on from `prompts/languages/` or
   `prompts/frameworks/` to get language-specific checks on top of the general review.
5. **Ship with confidence** using the prioritized fix list the prompt produces.

👉 For patterns, examples, and workflows (PR gate, CI, learning), read
[`docs/how-to-use.md`](./docs/how-to-use.md).

> 💡 Every master prompt ends by asking the model to request up to 3 clarifying questions
> before reviewing — so it gathers context instead of guessing.

## Language convention

Every file is **English by default** (`name.md`) with a Spanish counterpart
(`name-ES.md`). E.g. [`security.md`](./prompts/general/security.md) ·
[`security-ES.md`](./prompts/general/security-ES.md).

## 📑 Index — general master prompts

| Dimension | English | Español | What it catches |
|---|---|---|---|
| 🔒 Application Security | [security.md](./prompts/general/security.md) | [security-ES.md](./prompts/general/security-ES.md) | Injection, XSS, broken auth/access control, crypto, OWASP Top 10, CWE |
| 🛡️ Cybersecurity & Infra | [cybersecurity.md](./prompts/general/cybersecurity.md) | [cybersecurity-ES.md](./prompts/general/cybersecurity-ES.md) | Secrets, dependency CVEs, containers, IaC, CI/CD, supply chain, threat model |
| ⚡ Performance | [performance.md](./prompts/general/performance.md) | [performance-ES.md](./prompts/general/performance-ES.md) | Complexity, N+1, concurrency, memory, caching, payloads, scalability |
| ♿ Accessibility | [accessibility.md](./prompts/general/accessibility.md) | [accessibility-ES.md](./prompts/general/accessibility-ES.md) | WCAG 2.2 AA: semantics, keyboard, ARIA, contrast, forms, motion |
| 🎯 Usability / UX | [usability-ux.md](./prompts/general/usability-ux.md) | [usability-ux-ES.md](./prompts/general/usability-ux-ES.md) | Clarity, flows, feedback/state, error recovery, microcopy, consistency |
| 🧹 Code Quality | [code-quality.md](./prompts/general/code-quality.md) | [code-quality-ES.md](./prompts/general/code-quality-ES.md) | Correctness, design, tests, readability, maintainability |
| 🧪 Testing & Test Quality | [testing.md](./prompts/general/testing.md) | [testing-ES.md](./prompts/general/testing-ES.md) | Behavior coverage, assertion strength, flakiness, over-mocking, missing regression tests |
| 🤖 AI / LLM Code Safety | [ai-llm-safety.md](./prompts/general/ai-llm-safety.md) | [ai-llm-safety-ES.md](./prompts/general/ai-llm-safety-ES.md) | Prompt injection, insecure output handling, excessive agency, RAG access control, data leakage (OWASP LLM Top 10) |
| 🧭 All-in-One | [all-in-one.md](./prompts/general/all-in-one.md) | [all-in-one-ES.md](./prompts/general/all-in-one-ES.md) | Runs every dimension and produces a single scored release report |

## 📑 Index — language add-ons

Append one of these **after** a general master prompt for deeper, idiomatic checks.

| Language | English | Español |
|---|---|---|
| JavaScript / TypeScript | [javascript-typescript.md](./prompts/languages/javascript-typescript.md) | [·-ES.md](./prompts/languages/javascript-typescript-ES.md) |
| Python | [python.md](./prompts/languages/python.md) | [·-ES.md](./prompts/languages/python-ES.md) |
| Ruby | [ruby.md](./prompts/languages/ruby.md) | [·-ES.md](./prompts/languages/ruby-ES.md) |
| PHP (modern, framework-agnostic) | [php-modern.md](./prompts/languages/php-modern.md) | [·-ES.md](./prompts/languages/php-modern-ES.md) |
| PHP / WordPress | [php-wordpress.md](./prompts/languages/php-wordpress.md) | [·-ES.md](./prompts/languages/php-wordpress-ES.md) |
| Java | [java.md](./prompts/languages/java.md) | [·-ES.md](./prompts/languages/java-ES.md) |
| Go | [go.md](./prompts/languages/go.md) | [·-ES.md](./prompts/languages/go-ES.md) |
| C# / .NET | [csharp-dotnet.md](./prompts/languages/csharp-dotnet.md) | [·-ES.md](./prompts/languages/csharp-dotnet-ES.md) |
| Swift / iOS | [swift-ios.md](./prompts/languages/swift-ios.md) | [·-ES.md](./prompts/languages/swift-ios-ES.md) |
| Kotlin / Android | [kotlin-android.md](./prompts/languages/kotlin-android.md) | [·-ES.md](./prompts/languages/kotlin-android-ES.md) |
| Rust | [rust.md](./prompts/languages/rust.md) | [·-ES.md](./prompts/languages/rust-ES.md) |
| C / C++ | [c-cpp.md](./prompts/languages/c-cpp.md) | [·-ES.md](./prompts/languages/c-cpp-ES.md) |
| PowerShell | [powershell.md](./prompts/languages/powershell.md) | [·-ES.md](./prompts/languages/powershell-ES.md) |
| SQL / Databases | [sql.md](./prompts/languages/sql.md) | [·-ES.md](./prompts/languages/sql-ES.md) |

## 📑 Index — framework & DevOps add-ons

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

## Recommended combos

- **Web app PR gate** → `all-in-one` + `react-nextjs` (+ `nodejs` for the backend).
- **API/backend hardening** → `security` + `cybersecurity` + your language file.
- **Laravel / Symfony app** → `all-in-one` + `php-modern` + `laravel` (or `symfony`).
- **Infra change** → `cybersecurity` + `docker-kubernetes` / `terraform`.
- **Public UI release** → `accessibility` + `usability-ux` + `react-nextjs`.
- **Legacy cleanup** → `code-quality` + `performance` + your language file.

## What makes these prompts effective

Every prompt follows the same proven structure:

- **Role** — casts the model as a senior specialist, raising the quality bar.
- **Scope** — an explicit checklist so nothing important is skipped.
- **Method** — how to reason (trace sources→sinks, prioritize by impact, avoid false positives).
- **Output contract** — a fixed format (severity, exact location, impact, copy-ready fix, verdict).
- **Clarifying questions** — the model asks for missing context before judging.

## Contributing

New languages, frameworks, and dimension improvements are welcome. See
[`CONTRIBUTING.md`](./CONTRIBUTING.md). Please ship every prompt as a pair:
`name.md` (English) **and** `name-ES.md` (Spanish).

## License & author

[MIT](./LICENSE) — use, adapt, and share freely.

Created and maintained by **David Carrero Fernández-Baillo**
🌐 [carrero.es](https://carrero.es) · 🐙 [github.com/dcarrero](https://github.com/dcarrero)

© 2026 David Carrero Fernández-Baillo. If you find this useful, a ⭐ on the
[repository](https://github.com/dcarrero/awesome-code-review-prompts) is appreciated.
