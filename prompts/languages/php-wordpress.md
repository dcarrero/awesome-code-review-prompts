# PHP / WordPress — Review Add-on

> Use together with a general master prompt. Layers on PHP & WordPress-specific checks.

## Add-on prompt (copy after a general prompt)

```text
Additionally, apply these PHP/WordPress-specific checks:

PHP SECURITY
- SQL injection: raw queries vs prepared statements/PDO bound params.
- XSS: unescaped echo of user input; missing htmlspecialchars/output escaping.
- Command injection: system/exec/passthru/shell_exec with user data.
- File inclusion (LFI/RFI) via include/require with variables; unsafe file uploads.
- Unserialize on untrusted data (object injection); type juggling in comparisons
  (== vs ===), loose auth checks; extract() on request data.

WORDPRESS SECURITY & CORRECTNESS
- Missing nonce verification (wp_verify_nonce, check_admin_referer) on state changes.
- Missing capability checks (current_user_can) before privileged actions.
- Unsanitized input: use sanitize_text_field/sanitize_email/absint etc. on $_GET/$_POST.
- Unescaped output: use esc_html/esc_attr/esc_url/wp_kses on display.
- Direct DB access instead of $wpdb->prepare(); SQL in $wpdb without prepare.
- Enqueue assets properly (wp_enqueue_script/style) instead of hardcoding.
- Register settings/REST routes with permission_callback; avoid exposing admin-ajax
  actions without auth; validate/escape REST args.
- Following WordPress Coding Standards (naming, hooks, i18n with __()/esc_html__()).

PERFORMANCE
- Uncached expensive queries; missing transients/object cache; queries in loops;
  get_posts with posts_per_page=-1; autoloaded bloated options; no pagination.

Report in the base prompt's format, citing exact file:line.
```

---

<sub>📚 Part of **Awesome Code Review Prompts** — by **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · MIT License.</sub>
