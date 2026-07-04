# Python — Review Add-on

> Use together with a general master prompt. Layers on Python-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Python-specific checks:

SECURITY
- eval/exec/compile on untrusted input; pickle/marshal/yaml.load (unsafe loader);
  subprocess with shell=True; os.system; command injection via string formatting.
- SQL built with f-strings/%/.format instead of parameterized queries.
- Insecure deserialization; path traversal in open()/os.path.join with user input.
- Flask/Django: debug=True in prod, SECRET_KEY in code, disabled CSRF, unsafe
  template rendering (|safe, mark_safe), missing ORM parameterization.
- requests without timeout/verify; hardcoded secrets.

CORRECTNESS & IDIOM
- Mutable default arguments; late-binding closures in loops; broad `except:`;
  swallowed exceptions; `==` vs `is` for None; missing context managers (with).
- Type hints present and honored; run mypy/pyright mentally; Optional handling.
- Generator vs list confusion; iterator exhaustion; f-string vs logging %-args.

PERFORMANCE
- N+1 ORM queries; loading full querysets; unnecessary list() materialization;
  repeated recompilation of regexes; GIL-bound CPU work that should be multiprocessing;
  string concatenation in loops; not using sets/dicts for membership.

QUALITY & PACKAGING
- Missing __all__/public API clarity; circular imports; requirements pinned;
  no bare `pip install` of untrusted; virtualenv/deps hygiene; logging vs print.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
