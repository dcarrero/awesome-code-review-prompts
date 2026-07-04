# 📖 Cómo usar estos prompts

Ideas, patrones y flujos de trabajo para sacar el máximo partido a **Awesome Code Review Prompts**.
🌍 English: [`how-to-use.md`](./how-to-use.md)

---

## La versión en 30 segundos

1. Abre un prompt general (p. ej. [`security-ES.md`](../prompts/general/security-ES.md)) y copia el bloque dentro de ```` ```text ````.
2. Pégalo en Claude.
3. Debajo, pega tu código — un `git diff`, un fichero o varios.
4. *(Opcional)* Pega también un complemento de lenguaje/framework (p. ej. `laravel-ES.md`) para profundidad idiomática.
5. Responde las hasta 3 preguntas de clarificación y lee los hallazgos priorizados.

## Flujos de trabajo principales

### 1. Control previo al merge (PR gate)
Pega `git diff origin/main...HEAD` junto a [`all-in-one-ES.md`](../prompts/general/all-in-one-ES.md).
Pide solo la tabla de puntuaciones + elementos bloqueantes. Regla práctica: **bloquea ante
cualquier Crítico o Alto**.

```
[pega el prompt de all-in-one-ES.md]

Aquí está el diff de este PR:
<git diff …>

Devuelve solo: la tabla de puntuaciones, el arreglo más importante y el veredicto de release.
```

### 2. Auditoría profunda de una sola dimensión
Apunta una dimensión a toda una carpeta antes de una release o revisión de seguridad. Ideal
para `security` + `cybersecurity` en un backend, o `accessibility` en un paquete de UI.

### 3. Revisión apilada (general + stack)
La combinación de mayor señal. El prompt general da amplitud; el complemento da profundidad idiomática.

```
[pega el prompt de performance-ES.md]
[pega el complemento python-ES.md]

Código:
<pega el código>
```

### 4. Aprendizaje / mentoría
Pide al modelo que explique el *porqué* de cada hallazgo y enlace al estándar (OWASP, CWE,
WCAG). Los juniors se llevan el razonamiento, no solo el parche.

### 5. Bucle de corrección
Tras la revisión, pide: *"Aplica los arreglos Críticos y Altos y muéstrame el diff."* Luego
vuelve a lanzar el mismo prompt sobre el nuevo diff para confirmar que los problemas desaparecieron.

## Cómo obtener mejores resultados

- **Da contexto por adelantado.** Producción vs. prototipo, versión del framework, usuarios
  objetivo, volúmenes de datos ("esta tabla tiene ~5M filas"). Cambia la severidad y las prioridades.
- **Acota el alcance.** Revisar un volcado de 50 ficheros diluye la atención. Prefiere un diff o una carpeta.
- **Pide un formato de salida concreto.** Una tabla Markdown se pega limpia en issues; comentarios
  inline se pegan en una review; una tabla de puntuaciones es lo mejor para hacer de gate.
- **No te saltes las preguntas de clarificación.** Responderlas es donde está la mayor ganancia
  de calidad — el modelo deja de adivinar.
- **Confía pero verifica.** Trata los hallazgos como pistas de experto, no como dogma. Confirma
  los exploits y ejecuta los benchmarks/tests sugeridos antes de cambios de alto impacto.

## Combinaciones recomendadas

| Escenario | Prompts a apilar |
|---|---|
| Chequeo de PR de app web | `all-in-one` + `react-nextjs` (+ `nodejs`) |
| Hardening de API / backend | `security` + `cybersecurity` + tu lenguaje |
| App Laravel / Symfony | `all-in-one` + `php-modern` + `laravel` / `symfony` |
| Cambio de infra | `cybersecurity` + `docker-kubernetes` / `terraform` |
| Release de UI pública | `accessibility` + `usability-ux` + `react-nextjs` |
| Limpieza de legacy | `code-quality` + `performance` + tu lenguaje |

## Uso en automatización (avanzado)

Los mismos prompts pueden alimentar un paso de revisión automatizada (bot de CI, hook de
pre-commit, o un agente que comenta en los PRs). Pasa el diff como entrada, captura la salida
Markdown del modelo y haz fallar el job cuando el veredicto sea "No publicar" o haya algún
Crítico. Empieza en manual, mide la relación señal/ruido, y luego automatiza las combinaciones
que ayudan de forma consistente.

## Consejos por dimensión

- **Seguridad / Ciberseguridad** — pega los manifiestos de dependencias (`package.json`,
  `requirements.txt`, `go.mod`) junto al código para que marque deps vulnerables y secretos.
- **Rendimiento** — incluye volúmenes de datos representativos y el runtime; pregunta qué perfilar.
- **Accesibilidad** — pega el marcado/componentes renderizados, no solo la lógica; pide un
  recorrido de "cómo lo anuncia un lector de pantalla".
- **Usabilidad/UX** — indica la meta real del usuario ("está reembolsando un pedido"); pide que
  reescriba el microcopy inline.
- **Calidad de código** — indica el listón de madurez (prototipo desechable vs. servicio de
  facturación crítico).

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
