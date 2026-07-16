# 📖 How to use these prompts

Ideas, patterns, and workflows to get the most out of **Awesome Code Review Prompts**.
🌍 Español: [`how-to-use-ES.md`](./how-to-use-ES.md)

---

## The 30-second version

1. Open a general prompt (e.g. [`security.md`](../prompts/general/security.md)) and copy the block inside ```` ```text ````.
2. Paste it into Claude — or any frontier model (**Claude Fable 5** recommended; also GPT-5.x, Gemini, Grok, DeepSeek).
3. Under it, paste your code — a `git diff`, a file, or several files.
4. *(Optional)* Paste a language/framework add-on too (e.g. `laravel.md`) for idiomatic depth.
5. Answer the up-to-3 clarifying questions, then read the prioritized findings.

## Core workflows

### 1. Pre-merge PR gate

Paste `git diff origin/main...HEAD` plus [`all-in-one.md`](../prompts/general/all-in-one.md).
Ask only for the scorecard + blocking items. Rule of thumb: **block on any Critical or High**.

```
[paste all-in-one.md prompt]

Here is the diff for this PR:
<git diff …>

Return only: the scorecard table, the single top fix, and the release verdict.
```

### 2. Deep single-dimension audit

Point one dimension at a whole folder before a release or a security review. Great for
`security` + `cybersecurity` on a backend, or `accessibility` on a UI package.

### 3. Stacked review (general + stack)

The highest-signal combo. The general prompt gives breadth; the add-on gives idiomatic depth.

```
[paste performance.md prompt]
[paste python.md add-on]

Codebase:
<paste code>
```

### 4. Learning / mentoring

Ask the model to explain the *why* behind each finding and link to the standard (OWASP,
CWE, WCAG). Juniors get the reasoning, not just the patch.

### 5. Fix-forward loop

After the review, ask: *"Apply the Critical and High fixes and show me the diff."* Then
re-run the same prompt on the new diff to confirm the issues are gone.

## Getting better results

- **Give context up front.** Production vs. prototype, framework version, target users,
  data volumes ("this table has ~5M rows"). It changes severity and priorities.
- **Scope it.** Reviewing a 50-file dump dilutes attention. Prefer a diff or one folder.
- **Ask for a specific output shape.** A Markdown table pastes cleanly into issues; inline
  PR comments paste into a review; a scorecard is best for gating.
- **Don't skip the clarifying questions.** Answering them is where most of the quality gain
  is — the model stops guessing.
- **Trust but verify.** Treat findings as expert leads, not gospel. Confirm exploits and
  run the suggested benchmarks/tests before acting on high-impact changes.

## Recommended combos

| Scenario | Prompts to stack |
|---|---|
| Web app PR gate | `all-in-one` + `react-nextjs` (+ `nodejs`) |
| API / backend hardening | `security` + `cybersecurity` + your language |
| Laravel / Symfony app | `all-in-one` + `php-modern` + `laravel` / `symfony` |
| Infra change | `cybersecurity` + `docker-kubernetes` / `terraform` |
| Public UI release | `accessibility` + `usability-ux` + `react-nextjs` |
| Legacy cleanup | `code-quality` + `performance` + your language |

## Using it in automation (advanced)

The same prompts can drive an automated review step (CI bot, pre-commit hook, or an agent
that comments on PRs). Feed the diff as input, capture the model's Markdown output, and
fail the job when the verdict is "Do not ship" or any Critical is present. Start manual,
measure signal-to-noise, then automate the combos that consistently help.

## Tips per dimension

- **Security / Cybersecurity** — paste dependency manifests (`package.json`, `requirements.txt`,
  `go.mod`) alongside code so it can flag vulnerable deps and secrets.
- **Performance** — include representative data volumes and the runtime; ask what to profile.
- **Accessibility** — paste rendered markup/components, not just logic; ask for a
  "screen-reader announcement" walkthrough of a component.
- **Usability/UX** — state the user's actual goal ("they're refunding an order"); ask it to
  rewrite microcopy inline.
- **Code quality** — state the maturity bar (throwaway prototype vs. core billing service).

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
