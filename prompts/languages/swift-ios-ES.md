# Swift / iOS — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Swift/iOS:

SEGURIDAD Y PRIVACIDAD
- Secretos/claves de API incrustados en el código o Info.plist; usa Keychain, no
  UserDefaults, para datos sensibles.
- Excepciones de App Transport Security (arbitrary loads); validación de certificados
  desactivada.
- Inyección SQL en SQLite crudo; WKWebView inseguro (puentes JS, acceso a ficheros,
  URLs de usuario).
- Falta de clases de protección de datos; PII en logs; fuga por pasteboard; confianza
  ingenua ante jailbreak; manifiesto de privacidad / textos de uso de permisos presentes
  y justificados.

CORRECCIÓN Y MEMORIA
- Ciclos de retención: self fuerte en closures/delegates (usa [weak self]); falta de
  weak en delegates; fugas en tareas Combine/async no canceladas.
- Force unwraps (!)/force try/force cast sobre valores que pueden ser nil; array fuera
  de rango.
- Violaciones del hilo principal: actualizaciones UIKit/SwiftUI fuera del main actor;
  uso de @MainActor.
- Manejo de Optional; propagación de errores con throws frente a do/catch que traga.

CONCURRENCIA Y RENDIMIENTO
- Swift Concurrency: aislamiento de actores, data races, fugas de Task no estructuradas,
  conformidad Sendable; mal uso de GCD/deadlocks.
- Trabajo pesado en el hilo principal (scroll bloqueado); imágenes grandes sin
  downsampling; reutilización de celdas y corrección de diffable data source; re-render
  excesivo en SwiftUI.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
