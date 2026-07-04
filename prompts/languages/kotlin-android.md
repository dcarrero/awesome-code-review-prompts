# Kotlin / Android — Review Add-on

> Use together with a general master prompt. Layers on Kotlin & Android-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Kotlin/Android-specific checks:

SECURITY & PRIVACY
- Secrets/API keys in source, gradle, or strings.xml; use EncryptedSharedPreferences/
  Keystore, not plain SharedPreferences, for sensitive data.
- Exported components (activities/services/receivers/providers) without permissions;
  implicit intents leaking data; missing intent validation; PendingIntent mutability.
- WebView: JavaScriptInterface exposure, file access, loading untrusted URLs, mixed
  content. SQL injection in raw SQLite/Room raw queries. Insecure networking (cleartext,
  disabled cert pinning where required). PII in logs; missing ProGuard/R8.

CORRECTNESS & LIFECYCLE
- NPE risks; unsafe !! operator; platform-type nulls from Java; lateinit misuse.
- Coroutine leaks: wrong scope (GlobalScope), not tied to lifecycle/viewModelScope,
  missing cancellation, blocking Dispatchers.Main; structured concurrency violations.
- Memory leaks: Context/Activity held by long-lived objects, static/singleton leaks,
  unregistered listeners; configuration-change data loss.

PERFORMANCE & QUALITY
- Work on main thread (ANR risk); heavy operations in onBind/onDraw; unbounded lists
  without paging; RecyclerView misuse; bitmap memory; over-recomposition in Compose.
- Idiomatic Kotlin: data classes, sealed classes for state, null-safety, immutability.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
