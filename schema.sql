-- =====================================================================
-- Mozzafiato · Esquema de base de datos para Supabase
-- Pega esto en:  Supabase  ->  SQL Editor  ->  New query  ->  Run
-- =====================================================================

-- Colaboradores (encargados y colaboradores)
create table if not exists colaboradores (
  id text primary key,
  nombre text not null,
  rol text not null default 'colaborador',   -- 'encargado' | 'colaborador'
  area text,                                  -- 'barra' | 'piso' | 'cocina' | null
  pin text not null
);

-- Catálogo de actividades fijas (las bitácoras)
create table if not exists catalogo (
  id text primary key,
  area text not null,
  seccion text,
  nombre text not null,
  fr int not null default 1                   -- 1 diario · 2 c/2 días · 3 c/3 días · 7 domingos
);

-- Tareas puntuales asignadas por el encargado
create table if not exists extras (
  id text primary key,
  area text not null,
  nombre text not null,
  asignado_id text,
  asignado_nombre text,
  fecha date not null,
  turno text not null default 'TM',           -- 'TM' | 'TV'
  fr int default 0,
  creado_por text
);

-- Marcas de tareas completadas (una por tarea/día/turno)
create table if not exists completions (
  key text primary key,                       -- tipo:ref:fecha:turno
  tipo text not null,                         -- 'cat' | 'extra'
  ref text not null,
  area text,
  fecha date not null,
  turno text not null,
  colaborador_id text,
  colaborador_nombre text,
  nombre text,
  evid boolean default false,
  ts bigint
);

-- Evidencias fotográficas (miniatura + metadatos)
create table if not exists evidencias (
  id text primary key,
  tipo text,
  ref text,
  area text,
  tarea text,
  seccion text,
  fecha date,
  turno text,
  colaborador_id text,
  colaborador_nombre text,
  img text,                                   -- miniatura (data URL). Para full-res usar Storage.
  caption text,
  ts bigint
);

-- =====================================================================
-- SEGURIDAD (RLS)
-- Para arrancar rápido y simple con la "anon key", dejamos acceso abierto.
-- La app ya controla el acceso por PIN. Si más adelante quieres seguridad
-- por usuario real, activa Supabase Auth y ajusta estas políticas.
-- =====================================================================
alter table colaboradores enable row level security;
alter table catalogo      enable row level security;
alter table extras        enable row level security;
alter table completions   enable row level security;
alter table evidencias    enable row level security;

do $$
declare t text;
begin
  foreach t in array array['colaboradores','catalogo','extras','completions','evidencias'] loop
    execute format('drop policy if exists p_all on %I;', t);
    execute format('create policy p_all on %I for all using (true) with check (true);', t);
  end loop;
end $$;

-- =====================================================================
-- Realtime (para que las tareas aparezcan al instante en otros teléfonos)
-- =====================================================================
alter publication supabase_realtime add table completions;
alter publication supabase_realtime add table extras;
alter publication supabase_realtime add table evidencias;

-- Listo. Ahora carga los datos iniciales corriendo seed.sql (opcional).

-- =====================================================================
-- Grupos de trabajo (asignaciones de actividades a colaboradores)
-- =====================================================================
create table if not exists grupos (
  id text primary key,
  area text not null,
  nombre text not null,
  colaborador_id text,
  colaborador_nombre text,
  turno text not null default 'ambos',
  items jsonb not null default '[]'
);
alter table grupos enable row level security;
drop policy if exists p_all on grupos;
create policy p_all on grupos for all using (true) with check (true);
alter publication supabase_realtime add table grupos;
