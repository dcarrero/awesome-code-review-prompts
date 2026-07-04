# C# / .NET — Complemento de revisión (Español)

## Prompt complementario (pégalo tras un prompt general)

```text
Además, aplica estas comprobaciones específicas de C#/.NET:

SEGURIDAD
- Inyección SQL por comandos construidos con cadenas frente a SqlCommand/EF Core
  parametrizados.
- Deserialización insegura (BinaryFormatter — prohibido; TypeNameHandling inseguro en JSON.NET).
- Mass assignment / over-posting en modelos MVC; falta de [ValidateAntiForgeryToken].
- Path traversal; SSRF vía HttpClient sobre URLs de usuario; XXE en XmlReader (desactivar DTD).
- Secretos/cadenas de conexión incrustados; criptografía débil; RNGCryptoServiceProvider vs Random.
- ASP.NET Core: políticas de authz, CORS abierto de par en par, falta de redirección HTTPS/HSTS.

CORRECCIÓN Y ASYNC
- async void (salvo manejadores de eventos); .Result/.Wait() causando deadlocks; falta
  de ConfigureAwait en librerías; tareas fire-and-forget con excepciones no observadas.
- IDisposable sin liberar (falta using); nullable reference types respetados (#nullable);
  boxing; elección incorrecta struct/class; consistencia equals/GetHashCode.

RENDIMIENTO Y CALIDAD
- N+1 en EF Core, falta de AsNoTracking, evaluación en cliente, cargar tablas enteras.
- LINQ que reenumera; asignaciones en rutas calientes; concatenación de string vs
  StringBuilder; presión sobre el large object heap; falta de Span/Memory donde ayuda.

Reporta en el formato del prompt base, citando fichero:línea exacta.
```

---

<sub>📚 Parte de **Awesome Code Review Prompts** — por **David Carrero Fernández-Baillo** · [carrero.es](https://carrero.es) · [github.com/dcarrero](https://github.com/dcarrero) · Licencia MIT.</sub>
