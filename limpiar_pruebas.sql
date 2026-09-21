-- =====================================================================
-- Mozzafiato · Limpiar DATOS DE PRUEBA
-- Borra lo operativo (marcas, fotos, conteos, incidentes) y CONSERVA
-- tu configuración (equipo, checklist, artículos, grupos, plantillas).
-- Corre en Supabase -> SQL Editor -> Run cuando quieras "empezar limpio".
-- =====================================================================
delete from completions;   -- tareas marcadas como hechas
delete from evidencias;    -- fotos de evidencia (galería)
delete from conteos;       -- conteos de inventario (recepción/entrega)
delete from roturas;       -- incidentes de rotura/pérdida
-- Opcional: descomenta para borrar también las tareas puntuales/recurrentes
-- delete from extras;
