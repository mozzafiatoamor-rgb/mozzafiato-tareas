-- =====================================================================
-- Mozzafiato · Cargar EQUIPO real (colaboradores)
-- Corre esto en Supabase -> SQL Editor -> New query -> Run (una vez)
-- =====================================================================

-- 1) Borra los usuarios de ejemplo
delete from colaboradores where id in ('u_barra','u_c1','u_c2','u_c3');

-- 2) Carga/actualiza a tu equipo (PIN temporal: cámbialo por los 4 dígitos de nómina)
insert into colaboradores (id,nombre,rol,area,pin) values ('u_admin','Gustavo','encargado',null,'1111')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_abigail','Abigail','encargado','barra','2001')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_julio','Julio','encargado','barra','2003')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_ulises','Ulises','colaborador','barra','2002')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_benjamin','Benjamin','encargado','piso','3003')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_ferneli','Ferneli','colaborador','piso','3001')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_yuliana','Yuliana','colaborador','piso','3002')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_abril','Abril','colaborador','piso','3004')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_fatima','Fatima','encargado','cocina','4001')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_eucebio','Eucebio','encargado','cocina','4004')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_eduardo','Eduardo','colaborador','cocina','4002')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_irvin','Irvin','colaborador','cocina','4003')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_joseluis','Jose Luis','colaborador','cocina','4005')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
insert into colaboradores (id,nombre,rol,area,pin) values ('emp_yessica','Yessica','colaborador','cocina','4006')
  on conflict (id) do update set nombre=excluded.nombre, rol=excluded.rol, area=excluded.area, pin=excluded.pin;
