# Swift / iOS — Review Add-on

> Use together with a general master prompt. Layers on Swift & iOS-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Swift/iOS-specific checks:

SECURITY & PRIVACY
- Secrets/API keys hardcoded in source or Info.plist; use Keychain, not UserDefaults,
  for sensitive data.
- App Transport Security exceptions (arbitrary loads); disabled cert validation.
- SQL injection in raw SQLite; insecure WKWebView (JS bridges, file access, user URLs).
- Missing data-protection classes; PII in logs; pasteboard leakage; jailbreak-naive
  trust; privacy manifest / permission usage strings present and justified.

CORRECTNESS & MEMORY
- Retain cycles: strong self in closures/delegates (use [weak self]); missing weak on
  delegates; leaks in Combine/async tasks not cancelled.
- Force unwraps (!)/force try/force cast on values that can be nil; array out-of-range.
- Main-thread violations: UIKit/SwiftUI updates off the main actor; @MainActor usage.
- Optional handling; error propagation with throws vs. swallowed do/catch.

CONCURRENCY & PERFORMANCE
- Swift Concurrency: actor isolation, data races, unstructured Task leaks, Sendable
  conformance; GCD misuse/deadlocks.
- Heavy work on main thread (blocking scroll); large images not downsampled; table/
  collection cell reuse and diffable data source correctness; SwiftUI over-rendering.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
