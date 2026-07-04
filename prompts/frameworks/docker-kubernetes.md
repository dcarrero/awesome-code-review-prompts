# Docker / Kubernetes — Review Add-on

> Use together with `cybersecurity.md`. Layers on container & orchestration checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Docker/Kubernetes-specific checks:

DOCKER / IMAGES
- Runs as root (add USER, non-zero UID); base image unpinned or bloated (prefer slim/
  distroless, pin by digest); secrets baked into layers or ARG/ENV; unnecessary packages.
- Missing HEALTHCHECK; no multi-stage build; large context (missing .dockerignore);
  latest tag; unverified downloaded binaries; writable root filesystem.
- COPY of sensitive files; caching of package installs done insecurely; ADD from URLs.

KUBERNETES / MANIFESTS
- securityContext: runAsNonRoot, readOnlyRootFilesystem, drop ALL capabilities,
  allowPrivilegeEscalation:false, no privileged/hostPath/hostNetwork unless justified.
- Resource requests/limits set (avoid noisy-neighbor and OOM); liveness/readiness probes.
- Secrets in plain ConfigMaps/env; use Secret + external secret manager; imagePullPolicy.
- RBAC least privilege (no cluster-admin bindings); NetworkPolicies default-deny;
  ServiceAccount token automount disabled when unused.
- PodDisruptionBudget/replicas for availability; namespaces and labels; no :latest.

OUTPUT
- Map findings to CIS Docker/Kubernetes Benchmark items where applicable.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
