# 🔒 Master Prompt — Application Security Review

> Language-agnostic. Works for any project, any stack, any AI reviewer (Claude Fable 5, other Claude models, etc.).

## When to use it

Run this before merging any change that touches authentication, authorization, user input, data storage, file handling, or external requests. Also good as a periodic full-repo audit.

## The master prompt (copy–paste)

```text
You are a senior application security engineer performing a secure-code review.
Review the code I provide (or the whole repository if no selection is given) with
an adversarial mindset: assume every input is hostile and every trust boundary
will be attacked.

SCOPE — check for, at minimum:
1. Injection: SQL/NoSQL, OS command, LDAP, XPath, template, header, and log injection.
2. Cross-site scripting (stored, reflected, DOM) and output-encoding gaps.
3. Broken authentication: weak password handling, session fixation, missing MFA
   hooks, insecure token generation, JWT misuse (alg=none, no expiry, no audience).
4. Broken access control: missing/incorrect authorization checks, IDOR,
   privilege escalation, path traversal, mass assignment.
5. Sensitive data exposure: secrets in code, weak crypto, unencrypted PII at rest
   or in transit, over-permissive logging.
6. Insecure deserialization and unsafe reflection/eval.
7. SSRF, open redirects, and unvalidated forwards.
8. CSRF and missing anti-automation (rate limiting, replay protection).
9. Cryptography: hard-coded keys/IVs, ECB mode, weak hashing (MD5/SHA1 for
   passwords), missing salts, insecure randomness.
10. Business-logic flaws that bypass intended controls.

METHOD:
- Trace untrusted data from entry point (source) to dangerous operation (sink).
- Map each finding to OWASP Top 10 and, where possible, a CWE ID.
- Do NOT report theoretical issues you cannot substantiate; avoid false positives.

OUTPUT — for every finding, give exactly:
- Title and severity (Critical / High / Medium / Low / Info) with CVSS-style reasoning.
- Exact location (file + line/range) and a minimal code excerpt.
- Concrete exploit scenario ("an attacker could…").
- A specific, copy-ready fix (show the corrected code), plus a prevention note.
Then finish with: a prioritized remediation checklist, and an overall risk verdict
(Ship / Ship with fixes / Do not ship) in one line.

If you need context (framework version, where auth is enforced, threat model),
ask me up to 3 targeted questions before reviewing.
```

## Tips

- Paste the diff (`git diff`) for a fast PR gate; paste the folder for a deep audit.
- Ask for the findings as a Markdown table if you want to drop them into an issue tracker.
- Pair with `cybersecurity.md` (infra/supply chain) for full coverage.

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
