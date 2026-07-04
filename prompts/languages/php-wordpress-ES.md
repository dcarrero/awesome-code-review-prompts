# PHP / WordPress — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de PHP/WordPress:

SEGURIDAD PHP
- Inyección SQL: consultas crudas frente a sentencias preparadas/PDO con parámetros.
- XSS: echo de entrada de usuario sin escapar; falta de htmlspecialchars/escape de salida.
- Inyección de comandos: system/exec/passthru/shell_exec con datos de usuario.
- Inclusión de ficheros (LFI/RFI) vía include/require con variables; subidas inseguras.
- unserialize sobre datos no confiables (object injection); type juggling en
  comparaciones (== vs ===), comprobaciones de auth laxas; extract() sobre datos de
  la petición.

SEGURIDAD Y CORRECCIÓN WORDPRESS
- Falta de verificación de nonce (wp_verify_nonce, check_admin_referer) en cambios de
  estado.
- Falta de comprobación de capacidades (current_user_can) antes de acciones privilegiadas.
- Entrada sin sanear: usa sanitize_text_field/sanitize_email/absint etc. en $_GET/$_POST.
- Salida sin escapar: usa esc_html/esc_attr/esc_url/wp_kses al mostrar.
- Acceso directo a BD en vez de $wpdb->prepare(); SQL en $wpdb sin prepare.
- Encolar assets correctamente (wp_enqueue_script/style) en vez de incrustarlos.
- Registrar settings/rutas REST con permission_callback; evitar exponer acciones
  admin-ajax sin auth; validar/escapar argumentos REST.
- Seguir los WordPress Coding Standards (naming, hooks, i18n con __()/esc_html__()).

RENDIMIENTO
- Consultas costosas sin cachear; falta de transients/object cache; consultas en
  bucles; get_posts con posts_per_page=-1; options autoload infladas; sin paginación.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
