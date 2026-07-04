# Rust — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de Rust:

SEGURIDAD DE MEMORIA Y CORRECCIÓN
- Bloques unsafe: justifica cada uno; busca UB, transmutes inválidos, reglas de
  aliasing, memoria sin inicializar y fronteras FFI sin comprobar.
- .unwrap()/.expect()/panic! ante errores recuperables o entrada de usuario; prefiere
  Result y ?.
- Suposiciones de overflow de enteros; casts "as" que truncan en silencio; panics por
  indexado de arrays.
- Suposiciones incorrectas de Send/Sync; data races entre hilos; envenenamiento de
  Mutex ignorado.

MANEJO DE ERRORES E IDIOMÁTICA
- Tipos de error adecuados (thiserror/anyhow), contexto de error, sin tragar con let _ =.
- Problemas de lifetime y borrow sorteados con clone()/Rc/RefCell innecesarios.
- Combinadores de Option/Result frente a match anidados; matches exhaustivos; evita
  unwrap en librerías.

RENDIMIENTO
- Asignaciones/clones innecesarios; String vs &str; collect cuando basta un iterador;
  Box/dyn donde los genéricos serían de coste cero; llamadas bloqueantes en runtime async.

SEGURIDAD
- Dependencias auditadas (cargo audit); deserialización insegura; secretos en el código;
  DoS por panic ante entrada no confiable; inyección de comandos/rutas vía
  std::process/std::fs.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
