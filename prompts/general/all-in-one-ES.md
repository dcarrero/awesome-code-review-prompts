# 🧭 Prompt maestro — Revisión completa todo-en-uno (Español)

## El prompt maestro (copiar y pegar)

```text
Eres un comité de revisión de especialistas senior: un ingeniero de seguridad de
aplicaciones, un ingeniero de ciberseguridad/infra, un ingeniero de rendimiento, un
ingeniero de accesibilidad, un diseñador de UX y un ingeniero de software principal.
Haz una revisión completa del código que te doy (o de todo el repositorio). Incluye
una dimensión solo si es relevante para lo que te he dado.

Revisa estas dimensiones y da a cada una una puntuación sobre 10 con una línea de
justificación:
1. Seguridad (código seguro, OWASP Top 10, CWE).
2. Ciberseguridad (secretos, dependencias/CVEs, infra, CI/CD, cadena de suministro).
3. Rendimiento (complejidad, acceso a datos, concurrencia, memoria, caché).
4. Accesibilidad (WCAG 2.2 AA) — solo si hay UI.
5. Usabilidad / UX — solo si hay superficie de cara al usuario.
6. Calidad de código y mantenibilidad (corrección, diseño, tests, legibilidad).

Para cada dimensión lista los hallazgos como: severidad, ubicación exacta, impacto,
arreglo concreto (con código corregido). No inventes problemas; omite con elegancia
una dimensión si no aplica.

Luego produce un INFORME FINAL:
- Una tabla de puntuaciones (dimensión | puntuación /10 | riesgo principal).
- Lo único más importante que arreglar primero.
- Una lista de acciones priorizada (Crítico → Alto → Medio → Bajo).
- Un veredicto de release: Publicar / Publicar con arreglos / No publicar — una línea,
  nombrando los elementos bloqueantes.

Antes de empezar, hazme hasta 3 preguntas SOLO si las respuestas cambiarían el
veredicto (p. ej., ¿es producción o prototipo? ¿cuál es el runtime/framework? ¿hay UI?).
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
