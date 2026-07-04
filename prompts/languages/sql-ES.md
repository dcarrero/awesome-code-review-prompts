# SQL / Bases de datos — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de SQL/bases de datos:

SEGURIDAD
- Superficie de inyección: cualquier consulta construida por concatenación; exige
  parametrización.
- Mínimo privilegio: cuenta de app con grants excesivos (DDL, superusuario); permisos
  del esquema public.
- Datos sensibles sin cifrar en reposo; PII sin enmascarar; secretos en ficheros de
  migración.
- SQL dinámico/procedimientos almacenados que ejecutan entrada no confiable; vistas
  demasiado permisivas.

CORRECCIÓN
- Restricciones ausentes/incorrectas: PK, FK, UNIQUE, NOT NULL, CHECK; riesgo de filas
  huérfanas.
- Fronteras de transacción y nivel de aislamiento; condiciones de carrera (lost updates,
  phantom reads); falta de SELECT ... FOR UPDATE donde se necesita; migraciones no
  idempotentes.
- Bugs de lógica NULL (= NULL, NOT IN con NULLs); casts de tipo implícitos; manejo de
  zonas horarias.

RENDIMIENTO
- Índices ausentes en columnas de JOIN/WHERE/ORDER BY; índices sin usar o redundantes.
- SELECT *; patrones N+1; predicados no-sargables (funciones sobre columnas indexadas);
  full table scans; falta de paginación; listas IN grandes; joins cartesianos.
- Lee el plan de consulta mentalmente; sugiere comprobaciones EXPLAIN/ANALYZE; indica el
  índice que lo arregla.

ESQUEMA Y MANTENIBILIDAD
- Normalización frente a desnormalización justificada; tipos de datos demasiado
  amplios/estrechos; consistencia de nombres; falta de created_at/updated_at;
  migraciones seguras y reversibles minimizando bloqueos en tablas grandes.

Reporta en el formato del prompt base, citando objeto/línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
