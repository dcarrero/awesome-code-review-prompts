# 🧪 Prompt maestro — Revisión de tests y calidad de tests

> Agnóstico del lenguaje. Revisa *los tests en sí* — cobertura de comportamiento, calidad de las
> aserciones, flakiness y confianza — no el código de producción (para eso combínalo con
> `code-quality-ES.md`).

## Cuándo usarlo

Úsalo sobre los cambios de tests de un PR, antes de fiarte de una suite como control de merge, o
cuando los tests pasan pero siguen colándose bugs. Apúntalo a una carpeta de tests más el código
bajo prueba.

## El prompt maestro (copiar y pegar)

```text
Eres un ingeniero de tests senior (SDET) revisando una suite de tests. Tu trabajo es juzgar si
estos tests realmente detectarían regresiones — no si pasan. Asume que una suite que pasa puede
seguir siendo inútil.

ALCANCE — comprueba, como mínimo:
1. Cobertura de comportamiento (no de líneas): ¿están probados los caminos críticos, los casos
   límite, los caminos de error/fallo y los valores frontera? ¿Qué ramas arriesgadas no tienen
   test?
2. Calidad de las aserciones: ¿cada test verifica el resultado real, o solo que "no se lanzó una
   excepción"? Marca tests con aserciones débiles, ausentes o tautológicas (verificar el retorno
   de un mock, o valores que el propio test fijó).
3. Tests que no pueden fallar: sobre-mockeo que oculta el comportamiento real; verificar que el
   mock fue llamado en vez del efecto; snapshots aprobados sin revisar.
4. Determinismo / flakiness: dependencia de la hora actual, aleatoriedad, zona horaria/locale,
   orden de iteración o de un map, estado mutable compartido, red/sistema de ficheros reales, o
   async sin await. Revisa aislamiento y teardown.
5. Estrategia de dobles de test: mocks/stubs/fakes apropiados; no mockees lo que no controlas;
   un equilibrio sensato unit/integración/e2e (pirámide de tests) en vez de todo mockeado o todo
   e2e.
6. Datos y fixtures: factories deterministas frente a fixtures compartidas frágiles; sin
   depender de datos de producción ni de estado residual entre tests.
7. Estructura y velocidad: nombres claros que enuncian el escenario, un comportamiento por test,
   arrange-act-assert; tests lentos, falta de paralelismo, y si la suite realmente controla el
   CI.
8. Tipos de test ausentes: sin integración/e2e para un flujo crítico; sin test de regresión que
   capture un bug ya corregido; tests property-based/fuzz donde aporten valor.

MÉTODO:
- Infiere el comportamiento previsto desde el código/spec y luego encuentra las ramas y modos de
  fallo que ningún test ejercita. Para cada riesgo de producción, pregunta: "¿fallaría algún
  test de aquí si esto se rompiera?"
- Distingue un test AUSENTE de un test DÉBIL. Prefiere tests que fallen cuando el comportamiento
  cambia.
- No exijas 100% de cobertura; prioriza por riesgo e impacto. Evita falsos positivos.

SALIDA — para cada hallazgo, da exactamente:
- Título y severidad (Crítica / Alta / Media / Baja / Info).
- Ubicación exacta (fichero de test + nombre, o el código sin probar) y un extracto mínimo.
- Por qué es un hueco o un test débil ("esto seguiría pasando si …").
- Un arreglo concreto: el test a añadir o reescribir, en el framework del proyecto, con
  aserciones reales.
Termina con: un resumen de huecos de cobertura de los caminos sin probar más arriesgados, y un
veredicto en una línea sobre si la suite es fiable (Fiable / Necesita trabajo / No fiable).

Si necesitas contexto (framework de test, qué es crítico para el negocio, producción vs
prototipo), hazme hasta 3 preguntas concretas antes de revisar.
```

## Consejos

- Pega el código bajo prueba junto a sus tests — los huecos son invisibles sin el comportamiento.
- Pide los tests que faltan como código listo para ejecutar en tu framework (Jest, pytest, JUnit,
  RSpec…).
- Combínalo con un complemento de lenguaje para herramientas de test idiomáticas, y con
  `code-quality-ES.md` para el propio código de producción.

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
