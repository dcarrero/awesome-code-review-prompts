# C / C++ — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de C/C++:

SEGURIDAD DE MEMORIA (máxima prioridad)
- Desbordamientos de buffer (over/underflow); off-by-one; strcpy/strcat/sprintf/gets
  sin límite; falta de comprobación de límites en aritmética de arrays/punteros.
- Use-after-free, double-free, punteros colgantes, lecturas de memoria sin inicializar.
- Fugas de memoria; propiedad poco clara; falta de RAII; new/delete vs smart pointers
  (C++); malloc/free vs new/delete descasados.
- Overflow/underflow de enteros que alimentan asignaciones o indexado; mezclas
  signed/unsigned.
- Desreferencia de puntero nulo; valores de retorno sin comprobar de malloc/realloc/syscalls.

SEGURIDAD
- Vulnerabilidades de format-string (printf(user)); inyección de comandos vía
  system/popen; path traversal; condiciones de carrera TOCTOU; uso inseguro de entorno/args.
- Aleatoriedad insegura; secretos incrustados; casts inseguros que debilitan la seguridad
  de tipos.

CONCURRENCIA Y CORRECCIÓN
- Data races, falta de sincronización, acceso no atómico; deadlocks; mal uso de volatile.
- Comportamiento indefinido: overflow con signo, violaciones de strict-aliasing,
  problemas de sequence-point, uso de valores sin inicializar.

IDIOMÁTICA Y RENDIMIENTO C++
- Prefiere std::string/std::vector/std::array a buffers crudos; usa unique_ptr/shared_ptr;
  Regla de Cero/Tres/Cinco; copias innecesarias (pasa por const&/move); seguridad ante
  excepciones.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
