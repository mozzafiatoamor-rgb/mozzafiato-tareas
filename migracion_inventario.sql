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
