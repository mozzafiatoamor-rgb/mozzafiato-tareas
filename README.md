# Mozzafiato · Gestor de Tareas y Bitácoras

App móvil (PWA) para que los **encargados** asignen tareas, los **colaboradores** las
completen, tomen **fotos de evidencia** y las manden por **WhatsApp**, y se generen
**reportes** (bitácora mensual en imagen UHD, PDF y desempeño por colaborador).

Digitaliza tus 3 bitácoras: **Barra**, **Piso** y **Cocina** (con sus frecuencias y turnos TM/TV).

---

## 📁 Archivos

| Archivo | Qué es |
|---|---|
| `index.html` | La app completa |
| `app.data.js` | El checklist precargado de las 3 bitácoras y los usuarios de ejemplo |
| `manifest.webmanifest` + `sw.js` + `icons/` | Para instalarla como app y que funcione sin internet |
| `schema.sql` | Estructura de la base de datos (para Supabase) |
| `seed.sql` | Datos iniciales para Supabase (opcional) |

---

## 🚀 Paso 1 — Probarla YA (modo demo)

Tal cual, la app funciona sola guardando los datos en el teléfono (modo demo).
Súbela a **GitHub Pages** como haces siempre:

1. Crea un repo (ej. `mozzafiato-tareas`) y sube estos archivos.
2. **Settings → Pages → Deploy from branch → main → /root.**
3. Abre la URL en el celular y agrégala a la pantalla de inicio (se instala como app).

**PINs de prueba:**
- Gustavo (encargado, todas las áreas): **1111**
- Encargado Barra: **2222**
- Colaborador 1 (Barra): **0001** · Colaborador 2 (Piso): **0002** · Colaborador 3 (Cocina): **0003**

> En modo demo cada teléfono tiene sus propios datos (no se comparten). Sirve para
> probar todo. Para que el encargado y los colaboradores compartan datos en vivo,
> conecta Supabase (Paso 2).

---

## ☁️ Paso 2 — Conectar la nube (Supabase · gratis)

Esto hace que cuando el encargado asigne una tarea, aparezca **al instante** en el
teléfono de los colaboradores, con todo respaldado.

1. Entra a **https://supabase.com** → crea cuenta → **New project** (plan Free).
2. Cuando esté listo: **SQL Editor → New query** → pega el contenido de **`schema.sql`** → **Run**.
   (Opcional: repite con **`seed.sql`** para cargar las bitácoras y usuarios de una vez.)
3. Ve a **Project Settings → API** y copia:
   - **Project URL**
   - **anon public** key
4. Abre `index.html`, busca arriba el bloque `CONFIG` y pégalas:
   ```js
   const CONFIG = {
     SUPABASE_URL: 'https://TUPROYECTO.supabase.co',
     SUPABASE_KEY: 'TU_ANON_KEY',
     NEGOCIO: 'Mozzafiato'
   };
   ```
5. Guarda, vuelve a subir a GitHub. Listo: ahora todos comparten los mismos datos.

**¿Cuesta?** El plan **Free** es $0 y alcanza de sobra para el restaurante. Solo
pagarías (~$25 USD/mes) si algún día creces mucho. Las fotos se guardan comprimidas
para no llenar el espacio.

---

## 📲 Cómo funciona

- **Hoy:** el checklist del día por área y turno (☀️ mañana / 🌙 tarde). Se toca ✓ para completar.
- **📷 Foto de evidencia:** toma la foto → la app le pone fecha, área, tarea y quién la hizo →
  abre WhatsApp para enviarla al grupo. La miniatura queda guardada para los reportes.
- **Tareas:** el encargado edita el checklist fijo (frecuencias) y asigna **tareas puntuales**.
- **Evidencias:** galería de todas las fotos con su información.
- **Reportes:** bitácora mensual como **imagen UHD**, **PDF**, y **desempeño** por colaborador.
- **Equipo:** el encargado da de alta colaboradores con su nombre, área, rol y PIN.

---

## 🔧 Personalizar

- **Agregar áreas** (ej. Casa Regina): en `app.data.js`, arreglo `areas`, y agrega sus
  actividades en `catalogo`. También puedes crear actividades desde la app (Tareas → Nueva).
- **Cambiar frecuencias:** desde la app (Tareas → tocar la actividad) o en `app.data.js`.

---

Hecho para Mozzafiato · Felipe Carrillo Puerto, Q. Roo.
