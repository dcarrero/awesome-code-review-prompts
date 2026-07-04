# C# / .NET — Review Add-on

> Use together with a general master prompt. Layers on C#/.NET-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these C#/.NET-specific checks:

SECURITY
- SQL injection via string-built commands vs. parameterized SqlCommand/EF Core.
- Insecure deserialization (BinaryFormatter — banned; unsafe JSON.NET TypeNameHandling).
- Mass assignment / over-posting in MVC models; missing [ValidateAntiForgeryToken].
- Path traversal; SSRF via HttpClient on user URLs; XXE in XmlReader (disable DTD).
- Hardcoded secrets/connection strings; weak crypto; RNGCryptoServiceProvider vs Random.
- ASP.NET Core: authz policies, CORS wide-open, missing HTTPS redirection/HSTS.

CORRECTNESS & ASYNC
- async void (except event handlers); .Result/.Wait() causing deadlocks; missing
  ConfigureAwait in libraries; fire-and-forget tasks with unobserved exceptions.
- IDisposable not disposed (missing using); nullable reference types honored (#nullable);
  boxing; incorrect struct/class choice; equals/GetHashCode consistency.

PERFORMANCE & QUALITY
- EF Core N+1, missing AsNoTracking, client-side evaluation, loading whole tables.
- LINQ that re-enumerates; allocations in hot paths; string concat vs StringBuilder;
  large object heap pressure; missing Span/Memory where it helps.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
