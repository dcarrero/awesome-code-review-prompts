# Terraform / IaC — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Terraform/IaC:

SEGURIDAD
- Exposición pública: security groups/firewalls abiertos a 0.0.0.0/0, buckets S3/GCS
  públicos, endpoints de BD públicos, ingress sin restringir en puertos sensibles
  (22/3389/BD).
- IAM: acciones/recursos con comodín (*), roles demasiado amplios, falta de mínimo
  privilegio, claves de larga vida en vez de roles/OIDC.
- Cifrado: volúmenes/buckets/BD sin cifrar, TLS no forzado, sin KMS/CMK; secretos en
  variables en texto plano o en el state commiteado; state sin cifrado/locking.
- Logging/auditoría desactivados (CloudTrail/flow logs); sin MFA/protección de borrado en
  recursos críticos.

CORRECCIÓN Y OPERACIÓN
- Valores incrustados que deberían ser variables; falta de validación de entrada y
  defaults; versiones de provider/módulo sin fijar; foot-guns de count/for_each;
  dependencias implícitas.
- Backend de state remoto con locking; sin secretos en el state; riesgos de drift; falta
  de reglas de lifecycle (prevent_destroy en recursos con estado); provisioners no
  idempotentes.

CALIDAD
- Límites y reutilización de módulos; consistencia de naming/tagging (coste, propiedad,
  entorno); outputs que no filtran secretos; plan revisado en busca de cambios destructivos.
- Asocia hallazgos a herramientas como tfsec/checkov/benchmarks CIS cuando aplique.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
