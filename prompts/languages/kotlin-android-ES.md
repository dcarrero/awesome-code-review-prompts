# Kotlin / Android — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Kotlin/Android:

SEGURIDAD Y PRIVACIDAD
- Secretos/claves de API en el código, gradle o strings.xml; usa EncryptedSharedPreferences/
  Keystore, no SharedPreferences en claro, para datos sensibles.
- Componentes exportados (activities/services/receivers/providers) sin permisos; intents
  implícitos que filtran datos; falta de validación de intents; mutabilidad de PendingIntent.
- WebView: exposición de JavaScriptInterface, acceso a ficheros, cargar URLs no confiables,
  contenido mixto. Inyección SQL en SQLite/Room crudo. Red insegura (cleartext, cert
  pinning desactivado donde se requiere). PII en logs; falta de ProGuard/R8.

CORRECCIÓN Y CICLO DE VIDA
- Riesgos de NPE; operador !! inseguro; nulos de tipos de plataforma desde Java; mal uso
  de lateinit.
- Fugas de corrutinas: scope incorrecto (GlobalScope), no atado a lifecycle/viewModelScope,
  falta de cancelación, bloqueo de Dispatchers.Main; violaciones de concurrencia estructurada.
- Fugas de memoria: Context/Activity retenidos por objetos de larga vida, fugas por
  estáticos/singletons, listeners sin desregistrar; pérdida de datos en cambios de
  configuración.

RENDIMIENTO Y CALIDAD
- Trabajo en el hilo principal (riesgo ANR); operaciones pesadas en onBind/onDraw; listas
  sin límite sin paging; mal uso de RecyclerView; memoria de bitmaps; recomposición
  excesiva en Compose.
- Kotlin idiomático: data classes, sealed classes para estado, null-safety, inmutabilidad.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
