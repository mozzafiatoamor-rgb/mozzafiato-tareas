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

-- =====================================================================
-- Gestión semanal: recurrencia + plantillas (roles)
-- =====================================================================
alter table extras add column if not exists dias jsonb not null default '[]';
create table if not exists plantillas (
  id text primary key,
  nombre text not null,
  mapa jsonb not null default '{}'
);
alter table plantillas enable row level security;
drop policy if exists p_all on plantillas;
create policy p_all on plantillas for all using (true) with check (true);
alter publication supabase_realtime add table plantillas;
-- =====================================================================
-- Mozzafiato · Migración: INVENTARIO (recepción/entrega + roturas)
-- Corre esto en Supabase -> SQL Editor -> New query -> Run (una vez)
-- =====================================================================

-- Artículos contables (con foto de referencia)
create table if not exists inventario (
  id text primary key,
  area text not null,
  nombre text not null,
  foto text,                              -- foto de referencia (data URL)
  unidad text,
  fr text not null default 'turno',       -- 'turno' | 'diario' | 'semanal'
  par int                                 -- cantidad estándar (opcional)
);

-- Conteos de recepción y entrega
create table if not exists conteos (
  key text primary key,                   -- area:fecha:turno:tipo:articuloId
  area text not null,
  fecha date not null,
  turno text not null,
  tipo text not null,                     -- 'recepcion' | 'entrega'
  articulo_id text,
  articulo_nombre text,
  cantidad int,
  encargado_id text,
  encargado_nombre text,
  ts bigint
);

-- Roturas / pérdidas (incidentes con responsable)
create table if not exists roturas (
  id text primary key,
  area text not null,
  articulo_id text,
  nombre text not null,
  cantidad int not null default 1,
  motivo text,                            -- roto | perdido | prestado | otro
  empleado_id text,
  empleado_nombre text,
  reportado_por text,
  fecha date,
  turno text,
  foto text,                              -- foto sellada (compromiso)
  nota text,
  ts bigint
);

alter table inventario enable row level security;
alter table conteos    enable row level security;
alter table roturas    enable row level security;

do $$
declare t text;
begin
  foreach t in array array['inventario','conteos','roturas'] loop
    execute format('drop policy if exists p_all on %I;', t);
    execute format('create policy p_all on %I for all using (true) with check (true);', t);
  end loop;
end $$;

alter publication supabase_realtime add table inventario;
alter publication supabase_realtime add table conteos;
alter publication supabase_realtime add table roturas;
