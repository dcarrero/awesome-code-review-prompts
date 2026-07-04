# PowerShell — Complemento de revisión (Español)

> Úsalo junto a un prompt maestro general. Añade comprobaciones específicas de PowerShell.
> Buen complemento de `prompts/frameworks/bash-ES.md` para revisar automatización multiplataforma.

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de PowerShell:

SEGURIDAD
- Inyección de código: Invoke-Expression (iex) o [ScriptBlock]::Create() sobre entrada no
  confiable; el operador de llamada (& / .) con un nombre de comando variable construido con
  datos de usuario.
- Inyección de comandos/argumentos: construir líneas de comando nativas por concatenación de
  cadenas; pasa los argumentos como array con el operador de llamada en vez de interpolar en
  cmd.exe.
- Credenciales/secretos: contraseñas en texto plano; ConvertTo-SecureString -AsPlainText -Force
  con un valor incrustado; secretos en scripts, logs o transcripts — usa el módulo
  SecretManagement y PSCredential; nunca loguees secretos.
- Confianza: ExecutionPolicy NO es una frontera de seguridad — no te apoyes en ella;
  -ExecutionPolicy Bypass en un lanzador es un olor; firma los scripts (Authenticode); el patrón
  descargar-y-ejecutar (iwr ... | iex) es peligroso.
- Web/remoto: Invoke-WebRequest/Invoke-RestMethod a URLs controladas por el usuario (SSRF);
  -SkipCertificateCheck desactivando la validación TLS; inyección en cadenas de filtro
  WMI/CIM/AD; path traversal — prefiere -LiteralPath.

CORRECCIÓN E IDIOMÁTICA
- Manejo de errores: define $ErrorActionPreference o usa -ErrorAction Stop con try/catch para
  errores terminantes; comprueba $LASTEXITCODE (no solo $?) tras comandos nativos.
- Higiene de pipeline: funciones que emiten objetos por accidente contaminan la pipeline —
  suprime con [void] o | Out-Null; Write-Output (capturable) vs Write-Host (no); usa un bloque
  process{} para entrada de pipeline (ValueFromPipeline).
- Trampas de comparación: -eq es insensible a mayúsculas por defecto (-ceq para sensible); -eq
  contra un array devuelve las coincidencias filtradas; pon $null a la izquierda ($null -eq $x);
  -match rellena $matches; activa Set-StrictMode -Version Latest.
- Parámetros: usa [CmdletBinding()], parámetros tipados, [ValidateSet]/[ValidateNotNullOrEmpty]
  y Mandatory; implementa SupportsShouldProcess (-WhatIf/-Confirm) para operaciones destructivas.

RENDIMIENTO
- Array += en un bucle es O(n^2) — usa [System.Collections.Generic.List[T]] o ArrayList; la
  sentencia foreach y los métodos .Where()/.ForEach() son más rápidos que los cmdlets
  Where-Object/ForEach-Object en conjuntos grandes.
- Filtra a la izquierda, formatea a la derecha: usa -Filter del proveedor en vez de canalizar a
  Where-Object; evita Format-* a mitad de pipeline (emite objetos de formato); selecciona solo
  las propiedades necesarias.

CALIDAD Y PORTABILIDAD
- PSScriptAnalyzer limpio; usa verbos aprobados (Get-Verb); ayuda basada en comentarios; entrega
  un manifiesto de módulo (.psd1) con #Requires.
- Multiversión/SO: diferencias entre Windows PowerShell 5.1 y PowerShell 7+; protege con
  $IsWindows; prefiere cmdlets CIM sobre WMI heredado; sin rutas incrustadas (usa Join-Path).
- Tests: tests de Pester para funciones y casos límite; mockea las llamadas externas.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
