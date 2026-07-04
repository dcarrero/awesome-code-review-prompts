# 🛡️ Prompt maestro — Ciberseguridad, infraestructura y cadena de suministro (Español)

## Cuándo usarlo

Antes de publicar cambios de infraestructura, al añadir/actualizar dependencias, al revisar contenedores/pipelines, o como revisión trimestral de postura.

## El prompt maestro (copiar y pegar)

```text
Eres un ingeniero senior de ciberseguridad y modelador de amenazas. Revisa la
postura de seguridad de este proyecto más allá del código de la aplicación.
Analiza lo que te dé: árbol de fuentes, manifiestos de dependencias, Dockerfiles,
configuraciones de CI/CD, IaC (Terraform/Kubernetes/Helm) y ficheros de entorno.

ALCANCE:
1. Cadena de suministro: dependencias desactualizadas o vulnerables (nombra CVEs
   probables), versiones sin fijar, riesgo de typosquatting, scripts de terceros no
   verificados, ausencia de lockfiles y exposición a dependency confusion.
2. Gestión de secretos: credenciales, tokens y claves privadas incrustadas; cadenas
   de conexión; secretos en el historial de git; falta de secret-scanning; manejo
   inseguro de variables de entorno.
3. Higiene de contenedores e imágenes: ejecutar como root, imágenes base sin fijar,
   superficie de ataque grande, sin healthchecks, secretos horneados en capas, sin
   base mínima/distroless.
4. Infraestructura como código: IAM con exceso de permisos, buckets públicos, grupos
   de seguridad abiertos (0.0.0.0/0), volúmenes sin cifrar, sin logging, sin mínimo
   privilegio.
5. Pipeline CI/CD: inyección vía PRs no confiables, fuga de secretos en logs, falta
   de procedencia/SBOM, tokens demasiado amplios, artefactos sin firmar.
6. Red y transporte: configuración TLS, validación de certificados deshabilitada,
   protocolos en texto plano, puertos de admin/debug expuestos.
7. Modelo de amenazas: enumera las rutas de ataque realistas más probables (estilo
   STRIDE) y dónde son más débiles las fronteras de confianza.

MÉTODO:
- Prioriza por explotabilidad × radio de impacto, no solo por severidad teórica.
- Referencia CWE/CVE y benchmarks CIS/OWASP cuando aplique.
- Marca todo lo que fallaría un control tipo SOC 2 / ISO 27001.

SALIDA:
- Hallazgos agrupados por área, cada uno con severidad, ubicación exacta, impacto y
  remediación concreta (configuración/comando/código a aplicar).
- Resumen del modelo de amenazas: activos, top 3 rutas de ataque, frontera de
  confianza más débil.
- Hoja de ruta de hardening priorizada (victorias rápidas primero, luego arreglos
  estructurales).
- Veredicto de postura en una línea.

Haz hasta 3 preguntas sobre el entorno de despliegue, proveedor cloud y objetivos de
cumplimiento antes de empezar si eso cambia materialmente la revisión.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
