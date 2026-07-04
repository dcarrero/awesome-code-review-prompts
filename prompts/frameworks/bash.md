# Bash / Shell — Review Add-on

> Use together with a general master prompt. Layers on shell-scripting-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Bash/shell-specific checks:

SECURITY
- Command injection via unquoted/interpolated variables into commands or eval.
- Word splitting and glob expansion on unquoted "$var"/"$@"; use quotes everywhere.
- Unsafe use of curl|bash; downloading and executing without verification; secrets in
  args (visible in ps) or committed; predictable temp files (use mktemp).
- Path issues: relying on PATH, running with elevated privileges unnecessarily.

CORRECTNESS & ROBUSTNESS
- Missing 'set -euo pipefail'; unchecked command exit codes; ignoring failures in pipes.
- Unquoted variables; [ vs [[ ; arithmetic vs string comparison; parsing ls output;
  reading lines with for instead of while read -r; missing IFS handling.
- No cleanup trap on exit; non-idempotent operations; assuming GNU vs BSD tool flags.

QUALITY
- ShellCheck would flag it — call out those classes explicitly.
- Portability (bash vs sh/POSIX) stated and consistent; functions over copy-paste;
  usage/help and argument validation; meaningful exit codes; logging to stderr.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
