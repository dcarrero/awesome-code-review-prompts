# Rust — Review Add-on

> Use together with a general master prompt. Layers on Rust-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Rust-specific checks:

SAFETY & CORRECTNESS
- unsafe blocks: justify each one; check for UB, invalid transmutes, aliasing rules,
  uninitialized memory, and unchecked FFI boundaries.
- .unwrap()/.expect()/panic! on recoverable errors or user input; prefer Result and ?.
- Integer overflow assumptions; as-casts that silently truncate; array indexing panics.
- Incorrect Send/Sync assumptions; data races across threads; Mutex poisoning ignored.

ERROR HANDLING & IDIOM
- Proper error types (thiserror/anyhow), error context, no swallowing with let _ =.
- Lifetime and borrow issues worked around with unnecessary clone()/Rc/RefCell.
- Option/Result combinators vs. nested match; exhaustive matches; avoid unwrap in libs.

PERFORMANCE
- Needless allocations/clones; String vs &str; collecting when an iterator suffices;
  Box/dyn where generics would be zero-cost; blocking calls in async runtime.

SECURITY
- Dependencies audited (cargo audit); unsafe deserialization; secrets in code;
  panic-based DoS on untrusted input; command/path injection via std::process/std::fs.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
