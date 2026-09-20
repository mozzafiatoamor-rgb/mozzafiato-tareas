-- =====================================================================
-- Mozzafiato · Migración: tabla de GRUPOS de trabajo
-- Corre esto en Supabase -> SQL Editor -> New query -> Run
-- (solo una vez; agrega la función de grupos asignables)
-- =====================================================================

create table if not exists grupos (
  id text primary key,
  area text not null,
  nombre text not null,
  colaborador_id text,
  colaborador_nombre text,
  turno text not null default 'ambos',   -- 'ambos' | 'TM' | 'TV'
  items jsonb not null default '[]'       -- lista de ids de actividades del catálogo
);

alter table grupos enable row level security;
drop policy if exists p_all on grupos;
create policy p_all on grupos for all using (true) with check (true);

alter publication supabase_realtime add table grupos;
