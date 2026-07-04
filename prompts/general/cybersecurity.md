# 🛡️ Master Prompt — Cybersecurity, Infrastructure & Supply-Chain Review

> Language-agnostic. Complements `security.md` by covering everything *around* the code:
> dependencies, secrets, infra-as-code, CI/CD, and threat modeling.

## When to use it
Before shipping infrastructure changes, when adding/upgrading dependencies, when reviewing containers/pipelines, or as a quarterly posture review.

## The master prompt (copy–paste)

```text
You are a senior cybersecurity engineer and threat modeler. Review this project's
security posture beyond the application code itself. Analyze whatever I provide:
source tree, dependency manifests, Dockerfiles, CI/CD configs, IaC (Terraform/
Kubernetes/Helm), and environment/config files.

SCOPE:
1. Supply chain: outdated or vulnerable dependencies (name likely CVEs), unpinned
   versions, typosquatting risk, unverified third-party scripts, missing lockfiles,
   and dependency-confusion exposure.
2. Secrets management: hard-coded credentials, tokens, private keys, connection
   strings; secrets committed to history; missing secret-scanning; unsafe env handling.
3. Container & image hygiene: running as root, unpinned base images, large attack
   surface, missing healthchecks, secrets baked into layers, no minimal/distroless base.
4. Infrastructure as Code: over-permissive IAM, public buckets, open security groups
   (0.0.0.0/0), unencrypted volumes, missing logging, no least-privilege.
5. CI/CD pipeline: injection via untrusted PRs, secret leakage in logs, missing
   provenance/SBOM, overly broad tokens, unsigned artifacts.
6. Network & transport: TLS config, cert validation disabled, plaintext protocols,
   exposed admin/debug ports.
7. Threat model: enumerate the top realistic attack paths (STRIDE-style) and where
   trust boundaries are weakest.

METHOD:
- Prioritize by exploitability × blast radius, not just theoretical severity.
- Reference CWE/CVE and CIS/OWASP benchmarks where relevant.
- Flag anything that would fail a SOC 2 / ISO 27001 style control.

OUTPUT:
- Findings grouped by area, each with severity, exact location, impact, and a
  concrete remediation (config/command/code to apply).
- A short threat-model summary: assets, top 3 attack paths, weakest trust boundary.
- A prioritized hardening roadmap (quick wins first, then structural fixes).
- One-line posture verdict.

Ask up to 3 clarifying questions about deployment environment, cloud provider, and
compliance targets before starting if that materially changes the review.
```

## Tips
- Feed it `package.json` / `requirements.txt` / `go.mod` for a fast dependency triage.
- Combine with `security.md` for a complete "code + infra" security pass.

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
