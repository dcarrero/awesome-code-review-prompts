# Terraform / IaC — Review Add-on

> Use together with `cybersecurity.md`. Layers on infrastructure-as-code checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these Terraform/IaC-specific checks:

SECURITY
- Public exposure: security groups/firewalls open to 0.0.0.0/0, public S3/GCS buckets,
  public DB endpoints, unrestricted ingress on sensitive ports (22/3389/DB).
- IAM: wildcard actions/resources (*), overly broad roles, missing least privilege,
  long-lived keys instead of roles/OIDC.
- Encryption: unencrypted volumes/buckets/DBs, TLS not enforced, no KMS/CMK; secrets in
  plaintext variables or committed state; state stored without encryption/locking.
- Logging/audit disabled (CloudTrail/flow logs); no MFA/delete protection on critical resources.

CORRECTNESS & OPERATIONS
- Hardcoded values that should be variables; missing input validation and defaults;
  provider/module versions unpinned; count/for_each footguns; implicit dependencies.
- Remote state backend with locking; no secrets in state; drift risks; missing
  lifecycle rules (prevent_destroy on stateful resources); non-idempotent provisioners.

QUALITY
- Module boundaries and reuse; naming/tagging consistency (cost, ownership, env);
  outputs not leaking secrets; plan reviewed for destructive changes.
- Map findings to tools like tfsec/checkov/CIS benchmarks where applicable.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
