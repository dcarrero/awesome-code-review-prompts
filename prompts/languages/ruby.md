# Ruby — Review Add-on

> Use together with a general master prompt. Layers on Ruby-specific checks.
> For Rails apps, also append `prompts/frameworks/rails.md`.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Ruby-specific checks:

SECURITY
- Command injection: system/exec/`backticks`/%x/Open3 with interpolated user input;
  Kernel#open or IO.read with a "|command" string; prefer the array form system(cmd, *args).
- Code execution: eval/instance_eval/class_eval, send/public_send, const_get, define_method
  driven by untrusted input; Marshal.load on untrusted data; YAML.load (use YAML.safe_load);
  JSON.parse(..., create_additions: true) on hostile input.
- Regex safety: ReDoS from catastrophic backtracking; use \A and \z anchors, not ^ and $
  (which match line boundaries and enable bypasses); be wary of Regexp.union of user input.
- SSRF / files: open-uri or Net::HTTP against user-controlled URLs; path traversal via
  File.read/File.join/Dir.glob with user input.
- Transport/secrets: Net::HTTP with OpenSSL::SSL::VERIFY_NONE; hardcoded credentials/keys;
  secrets read from source instead of ENV/secret store.

CORRECTNESS & IDIOM
- nil handling: NoMethodError on nil — use safe navigation (&.), Hash#dig, and fetch with
  defaults instead of []; guard clauses over deep nesting.
- Exceptions: rescue => e that swallows errors; rescuing Exception (catches SystemExit and
  Interrupt) instead of StandardError; missing ensure for resource cleanup.
- Mutation: mutating shared constants, frozen strings, or mutable default arguments; know
  dup/clone are shallow; add # frozen_string_literal: true.
- Equality & collections: == vs eql? vs equal?; symbol vs string keys; each (returns
  receiver) vs map (returns results); use each_with_object for accumulation.
- Concurrency: shared mutable state across threads without a Mutex; non-thread-safe class
  variables/memoized singletons; the GVL means CPU-bound work won't parallelize.

PERFORMANCE
- Loading whole collections into memory instead of streaming (find_each, each_slice, lazy).
- O(n) Array#include? inside loops — use a Set; repeated Regexp compilation; string building
  with += in loops instead of << or StringIO.
- Memoization bugs: ||= caching a legitimately nil/false result; N+1 patterns (see rails.md).
- Missing timeouts on Net/HTTP and external calls; unbounded object allocation.

QUALITY & PACKAGING
- Gemfile.lock committed and dependencies pinned; run bundler-audit for known CVEs; require
  only what is used.
- RuboCop/Standard adherence; frozen_string_literal magic comment; consistent naming.
- Metaprogramming clarity: pair method_missing with respond_to_missing?.
- Tests via RSpec/Minitest that assert behavior (not implementation); factories/fixtures kept
  minimal and deterministic.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
