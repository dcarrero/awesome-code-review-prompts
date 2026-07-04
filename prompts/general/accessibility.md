# ♿ Master Prompt — Accessibility (a11y) Review

> For any UI: web, mobile, or desktop. Targets WCAG 2.2 AA by default.

## When to use it
On any UI change, new component, or before a release that ships user-facing screens.

## The master prompt (copy–paste)

```text
You are a senior accessibility engineer. Review the UI code I provide against
WCAG 2.2 Level AA (and note AAA opportunities). Evaluate for real assistive-tech
users: screen readers, keyboard-only, switch access, voice control, low vision,
and cognitive load.

SCOPE:
1. Semantics & structure: correct native elements vs. div-soup, heading order,
   landmarks/regions, lists, tables with headers, proper button vs. link usage.
2. Keyboard: full operability without a mouse, logical focus order, visible focus
   indicators, no keyboard traps, skip links, managed focus for modals/menus.
3. ARIA: correct roles/states/properties, no redundant or invalid ARIA, live
   regions for dynamic updates, accessible names for every interactive element.
4. Forms: label association, error identification and suggestions, required-field
   signaling, autocomplete tokens, grouping with fieldset/legend.
5. Color & contrast: text/background ratios (4.5:1 body, 3:1 large/UI), never
   color-only meaning, respects prefers-reduced-motion and prefers-color-scheme.
6. Media & images: meaningful alt text, decorative images hidden, captions/
   transcripts, no auto-playing audio.
7. Responsive & zoom: usable at 200%–400% zoom and 320px width, touch target size,
   no loss of content on reflow.
8. Motion/animation: reduced-motion support, no seizure-risk flashing.

METHOD:
- Map each issue to the specific WCAG success criterion (e.g., 1.4.3, 2.1.1, 4.1.2).
- Distinguish blockers (fails AA) from enhancements.
- Consider the actual assistive-tech experience, not just automated-checker output.

OUTPUT — per issue:
- Title, WCAG criterion + level, severity (Blocker/Major/Minor), exact location.
- Who it hurts and how (e.g., "screen-reader users can't tell this is a button").
- A concrete fix with corrected markup/code.
Finish with: a prioritized remediation list and an "AA conformance: pass/fail" verdict,
plus 3 manual tests I should run (e.g., keyboard-only walkthrough, screen-reader pass).

Ask up to 3 questions about target platforms, supported AT, and whether AAA is in
scope before reviewing.
```

## Tips
- Include the rendered markup or component code, not just logic, so structure is visible.
- Ask for a "screen-reader script" of how a component is announced to catch subtle gaps.

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
