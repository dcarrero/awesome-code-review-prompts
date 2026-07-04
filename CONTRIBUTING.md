# Contributing / Cómo contribuir

Thanks for helping improve **Awesome Code Review Prompts**! · ¡Gracias por mejorar este repo!

> Project by **David Carrero Fernández-Baillo** — [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.

## Principles / Principios

1. **Two files per prompt.** English is the default (`name.md`); the Spanish translation
   lives in a sibling file ending in `-ES.md` (`name-ES.md`). Keep both in sync. ·
   **Dos ficheros por prompt.** El inglés es el predeterminado (`name.md`); la traducción al
   español va en un fichero hermano que acaba en `-ES.md` (`name-ES.md`). Mantén ambos sincronizados.
2. **Keep the prompt structure.** Role → Scope → Method → Output contract → Clarifying
   questions. · **Mantén la estructura del prompt.** Rol → Alcance → Método → Contrato de
   salida → Preguntas de clarificación.
3. **Add-ons layer on generals.** Language/framework files are *complements* to a general
   master prompt, not replacements. · Los ficheros de lenguaje/framework son *complementos*
   de un prompt general, no sustitutos.
4. **No fluff.** Prompts should be copy-ready and specific. Avoid vague advice. · Sin
   relleno. Los prompts deben ser específicos y listos para pegar.

## How to add a new language or framework / Añadir un lenguaje o framework

1. Copy an existing add-on pair (e.g., `prompts/languages/go.md` + `go-ES.md`) as a template. ·
   Copia una pareja de complementos existente como plantilla.
2. Replace the checks with the security, correctness, performance, and quality pitfalls
   specific to that stack. · Sustituye las comprobaciones por los fallos específicos del stack.
3. Provide both files: `name.md` (English) and `name-ES.md` (Spanish). · Aporta ambos
   ficheros: `name.md` (inglés) y `name-ES.md` (español).
4. Register it in the index tables of both `README.md` and `README-ES.md`. · Regístralo en las
   tablas índice de `README.md` y `README-ES.md`.
5. Keep the author footer (`<sub>…</sub>`) at the bottom of each file. · Mantén el pie de autor
   (`<sub>…</sub>`) al final de cada fichero.
6. Open a pull request describing what you added. · Abre un pull request describiendo qué añadiste.

## Style / Estilo

- Use fenced ```text blocks for the copy-paste prompt body. · Usa bloques ```text para el
  cuerpo del prompt.
- Prefer concrete, testable checks over generic statements. · Prefiere comprobaciones
  concretas y verificables.
- Reference recognized standards where useful (OWASP, CWE, WCAG, CIS). · Referencia
  estándares reconocidos cuando ayude.
