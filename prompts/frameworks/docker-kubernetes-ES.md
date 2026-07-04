# Docker / Kubernetes — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Docker/Kubernetes:

DOCKER / IMÁGENES
- Se ejecuta como root (añade USER, UID no cero); imagen base sin fijar o inflada
  (prefiere slim/distroless, fija por digest); secretos horneados en capas o ARG/ENV;
  paquetes innecesarios.
- Falta de HEALTHCHECK; sin build multi-stage; contexto grande (falta .dockerignore);
  tag latest; binarios descargados sin verificar; sistema de ficheros raíz escribible.
- COPY de ficheros sensibles; caché de instalación de paquetes hecho de forma insegura;
  ADD desde URLs.

KUBERNETES / MANIFIESTOS
- securityContext: runAsNonRoot, readOnlyRootFilesystem, drop ALL capabilities,
  allowPrivilegeEscalation:false, sin privileged/hostPath/hostNetwork salvo justificado.
- requests/limits de recursos definidos (evita noisy-neighbor y OOM); probes
  liveness/readiness.
- Secretos en ConfigMaps/env en claro; usa Secret + gestor de secretos externo;
  imagePullPolicy.
- RBAC de mínimo privilegio (sin bindings cluster-admin); NetworkPolicies default-deny;
  automount del token de ServiceAccount desactivado cuando no se usa.
- PodDisruptionBudget/réplicas para disponibilidad; namespaces y labels; sin :latest.

SALIDA
- Asocia hallazgos a ítems del CIS Docker/Kubernetes Benchmark cuando aplique.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
