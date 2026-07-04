# C / C++ — Review Add-on

> Use together with a general master prompt. Layers on C/C++-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these C/C++-specific checks:

MEMORY SAFETY (highest priority)
- Buffer overflows/underflows; off-by-one; unbounded strcpy/strcat/sprintf/gets;
  missing bounds checks on array/pointer arithmetic.
- Use-after-free, double-free, dangling pointers, uninitialized memory reads.
- Memory leaks; ownership unclear; missing RAII; new/delete vs smart pointers (C++);
  mismatched malloc/free vs new/delete.
- Integer overflow/underflow feeding allocations or indexing; signed/unsigned mixups.
- Null-pointer dereference; unchecked return values from malloc/realloc/system calls.

SECURITY
- Format-string vulnerabilities (printf(user)); command injection via system/popen;
  path traversal; TOCTOU race conditions; unsafe use of environment/args.
- Insecure randomness; hardcoded secrets; unsafe casts weakening type safety.

CONCURRENCY & CORRECTNESS
- Data races, missing synchronization, non-atomic access; deadlocks; volatile misuse.
- Undefined behavior: signed overflow, strict-aliasing violations, sequence-point
  issues, use of uninitialized values.

C++ IDIOM & PERFORMANCE
- Prefer std::string/std::vector/std::array over raw buffers; use unique_ptr/shared_ptr;
  Rule of Zero/Three/Five; unnecessary copies (pass by const&/move); exception safety.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
