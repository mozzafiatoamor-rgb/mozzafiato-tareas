-- =====================================================================
-- Mozzafiato · Migración: gestión SEMANAL
-- Corre esto en Supabase -> SQL Editor -> New query -> Run (una vez)
-- Agrega: tareas recurrentes por día + plantillas (roles)
-- =====================================================================

-- Tareas recurrentes: días de la semana en que se repite una tarea puntual
alter table extras add column if not exists dias jsonb not null default '[]';

-- Plantillas de asignación (roles): guardan el reparto de grupos por persona
create table if not exists plantillas (
  id text primary key,
  nombre text not null,
  mapa jsonb not null default '{}'
);
alter table plantillas enable row level security;
drop policy if exists p_all on plantillas;
create policy p_all on plantillas for all using (true) with check (true);
alter publication supabase_realtime add table plantillas;
