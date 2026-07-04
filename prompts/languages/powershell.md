# PowerShell — Review Add-on

> Use together with a general master prompt. Layers on PowerShell-specific checks.
> Good companion to `prompts/frameworks/bash.md` for cross-platform automation reviews.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these PowerShell-specific checks:

SECURITY
- Code injection: Invoke-Expression (iex) or [ScriptBlock]::Create() on untrusted input; the
  call operator (& / .) with a variable command name built from user data.
- Command/argument injection: building native command lines by string concatenation; pass
  arguments as an array with the call operator instead of interpolating into cmd.exe.
- Credentials/secrets: plaintext passwords; ConvertTo-SecureString -AsPlainText -Force with a
  hardcoded value; secrets in scripts, logs, or transcripts — use the SecretManagement module
  and PSCredential; never log secrets.
- Trust: ExecutionPolicy is NOT a security boundary — don't rely on it; -ExecutionPolicy Bypass
  in a launcher is a smell; sign scripts (Authenticode); the download-and-run pattern
  (iwr ... | iex) is dangerous.
- Web/remote: Invoke-WebRequest/Invoke-RestMethod to user-controlled URLs (SSRF);
  -SkipCertificateCheck disabling TLS validation; injection into WMI/CIM/AD filter strings;
  path traversal — prefer -LiteralPath.

CORRECTNESS & IDIOM
- Error handling: set $ErrorActionPreference or use -ErrorAction Stop with try/catch for
  terminating errors; check $LASTEXITCODE (not just $?) after native commands.
- Pipeline hygiene: functions accidentally emitting objects pollute the pipeline — suppress with
  [void] or | Out-Null; Write-Output (capturable) vs Write-Host (not); use a process{} block for
  pipeline input (ValueFromPipeline).
- Comparison traps: -eq is case-insensitive by default (-ceq for case-sensitive); -eq against an
  array returns filtered matches; put $null on the left ($null -eq $x); -match populates
  $matches; enable Set-StrictMode -Version Latest.
- Parameters: use [CmdletBinding()], typed params, [ValidateSet]/[ValidateNotNullOrEmpty],
  and Mandatory; implement SupportsShouldProcess (-WhatIf/-Confirm) for destructive operations.

PERFORMANCE
- Array += in a loop is O(n^2) — use [System.Collections.Generic.List[T]] or ArrayList; the
  foreach statement and .Where()/.ForEach() methods are faster than the Where-Object/
  ForEach-Object cmdlets for large sets.
- Filter left, format right: use provider-side -Filter instead of piping to Where-Object; avoid
  Format-* mid-pipeline (it emits format objects); select only needed properties.

QUALITY & PORTABILITY
- PSScriptAnalyzer clean; use approved verbs (Get-Verb); comment-based help; ship a module
  manifest (.psd1) with #Requires.
- Cross-version/OS: Windows PowerShell 5.1 vs PowerShell 7+ differences; guard with $IsWindows;
  prefer CIM cmdlets over legacy WMI; no hardcoded paths (use Join-Path).
- Tests: Pester tests for functions and edge cases; mock external calls.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
