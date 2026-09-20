/* =============================================================
   Mozzafiato · Gestor de Tareas y Bitácoras
   Datos precargados desde las bitácoras (Barra, Piso, Cocina).
   FR (frecuencia): 1=diario · 2=cada 2 días · 3=cada 3 días · 7=domingos
   ============================================================= */
window.SEED = {
  areas: [
    { id: 'barra',  nombre: 'Barra',  emoji: '☕' },
    { id: 'piso',   nombre: 'Piso',   emoji: '🍽️' },
    { id: 'cocina', nombre: 'Cocina', emoji: '👨‍🍳' }
  ],

  /* Colaboradores de ejemplo (edítalos en la pestaña Equipo).
     rol: 'encargado' o 'colaborador' · pin de 4 dígitos */
  colaboradores: [
    { id: 'u_admin', nombre: 'Gustavo',  rol: 'encargado',   area: null,     pin: '1111' },
    { id: 'u_barra', nombre: 'Encargado Barra', rol: 'encargado', area: 'barra', pin: '2222' },
    { id: 'u_c1',    nombre: 'Colaborador 1', rol: 'colaborador', area: 'barra', pin: '0001' },
    { id: 'u_c2',    nombre: 'Colaborador 2', rol: 'colaborador', area: 'piso',  pin: '0002' },
    { id: 'u_c3',    nombre: 'Colaborador 3', rol: 'colaborador', area: 'cocina',pin: '0003' }
  ],

  /* Catálogo de actividades = las bitácoras digitalizadas */
  catalogo: [
    /* ---------------- BARRA ---------------- */
    { area:'barra', seccion:'Lavar y desinfectar', nombre:'Refrigerador', fr:3 },
    { area:'barra', seccion:'Lavar y desinfectar', nombre:'Licuadora 1', fr:2 },
    { area:'barra', seccion:'Lavar y desinfectar', nombre:'Licuadora 2', fr:2 },
    { area:'barra', seccion:'Lavar y desinfectar', nombre:'Tetera de agua caliente', fr:3 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Tazas para café (chicas, medianas y grandes)', fr:1 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Popotes y cucharas', fr:1 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Jarras para cremar leche', fr:1 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Botellas', fr:2 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Contenedores plásticos y de cristal', fr:2 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Cubiertos', fr:1 },
    { area:'barra', seccion:'Desempolvar y pulir cristalería, losa y cubiertos', nombre:'Copas', fr:1 },
    { area:'barra', seccion:'Limpiar y desinfectar', nombre:'Barra, paredes de la base interior y exterior', fr:1 },
    { area:'barra', seccion:'Limpiar y desinfectar', nombre:'Alacena y sus puertas (interior y exterior)', fr:2 },
    { area:'barra', seccion:'Limpiar y desinfectar', nombre:'Mueble cajonero (interior y exterior)', fr:2 },
    { area:'barra', seccion:'Limpiar y desinfectar', nombre:'Caja registradora', fr:2 },
    { area:'barra', seccion:'Equipo especial', nombre:'Mantenimiento Cafetera San Remo', fr:7 },
    { area:'barra', seccion:'Equipo especial', nombre:'Mantenimiento cafetera Breville mediana', fr:1 },
    { area:'barra', seccion:'Equipo especial', nombre:'Limpiar debajo de la cafetera profesional', fr:3 },
    { area:'barra', seccion:'Lavar, desempolvar y desinfectar', nombre:'Anaqueles', fr:2 },
    { area:'barra', seccion:'Lavar, desempolvar y desinfectar', nombre:'Repisas', fr:2 },
    { area:'barra', seccion:'Lavar, desempolvar y desinfectar', nombre:'Paredes', fr:2 },
    { area:'barra', seccion:'Lavar, desempolvar y desinfectar', nombre:'Pisos', fr:1 },
    { area:'barra', seccion:'Lavar, desempolvar y desinfectar', nombre:'Techo', fr:2 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Bote de basura', fr:1 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Trapos', fr:1 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Bote del trapeador', fr:3 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Trapeador', fr:1 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Tapete del piso', fr:2 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Escurridor de trastes', fr:1 },
    { area:'barra', seccion:'Artículos de limpieza y accesorios', nombre:'Tarja completa', fr:1 },

    /* ---------------- PISO ---------------- */
    { area:'piso', seccion:'Parte de afuera', nombre:'Barrer', fr:1 },
    { area:'piso', seccion:'Parte de afuera', nombre:'Lavar el piso', fr:3 },
    { area:'piso', seccion:'Parte de afuera', nombre:'Sacudir puertas de madera plegable', fr:2 },
    { area:'piso', seccion:'Parte de afuera', nombre:'Aplicar abrillantador a las puertas de madera plegable', fr:7 },
    { area:'piso', seccion:'Parte de afuera', nombre:'Sacudir fachada', fr:3 },
    { area:'piso', seccion:'Parte de afuera', nombre:'Desempolvar techo y pilares', fr:3 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Barrer', fr:1 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Trapear', fr:1 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar puertas de cristal', fr:1 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Desempolvar paredes deck', fr:3 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Desempolvar muros, techos y vigas', fr:3 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Aplicar líquido especial a paredes deck, puertas y mesas', fr:7 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar patas de las mesas', fr:1 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Lijar paredes de pecera', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar filtros de pecera', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Cambiar agua de la pecera', fr:7 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar focos y lámparas de tronco de madera', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar lámpara de rueda de carreta', fr:3 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar filtros y condensador de aire acondicionado', fr:7 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar repisas de vasos', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar libros y sus repisas', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar sillas', fr:1 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar vitrina', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Limpiar tapete sanitizante', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Lavar trapo de sanitizante', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Lavar trapos para limpiar mesas', fr:2 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Pulir cubiertos', fr:1 },
    { area:'piso', seccion:'Parte de adentro', nombre:'Pulir vasos de la repisa', fr:1 },

    /* ---------------- COCINA ---------------- */
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo frío', nombre:'Congelador blanco', fr:2 },
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo frío', nombre:'Refrigerador 1', fr:2 },
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo frío', nombre:'Refrigerador 2', fr:2 },
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo frío', nombre:'Refrigerador 3', fr:2 },
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo frío', nombre:'Refrigerador 4', fr:2 },
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo caliente', nombre:'Estufa', fr:1 },
    { area:'cocina', seccion:'Lavar y desinfectar · Equipo caliente', nombre:'Plancha', fr:1 },
    { area:'cocina', seccion:'Equipo eléctrico caliente', nombre:'Crepera', fr:1 },
    { area:'cocina', seccion:'Equipo eléctrico caliente', nombre:'Wafflera', fr:1 },
    { area:'cocina', seccion:'Equipo eléctrico caliente', nombre:'Paninera', fr:1 },
    { area:'cocina', seccion:'Equipo eléctrico caliente', nombre:'Horno de microondas', fr:2 },
    { area:'cocina', seccion:'Equipo eléctrico frío', nombre:'Batidora', fr:2 },
    { area:'cocina', seccion:'Equipo eléctrico frío', nombre:'Licuadora', fr:1 },
    { area:'cocina', seccion:'Equipo eléctrico frío', nombre:'Ventilador de pared', fr:3 },
    { area:'cocina', seccion:'Lavar, desengrasar y desinfectar', nombre:'Anaqueles', fr:2 },
    { area:'cocina', seccion:'Lavar, desengrasar y desinfectar', nombre:'Repisas', fr:2 },
    { area:'cocina', seccion:'Lavar, desengrasar y desinfectar', nombre:'Paredes', fr:2 },
    { area:'cocina', seccion:'Lavar, desengrasar y desinfectar', nombre:'Pisos', fr:1 },
    { area:'cocina', seccion:'Lavar, desengrasar y desinfectar', nombre:'Techo', fr:3 },
    { area:'cocina', seccion:'Lavar, desengrasar y desinfectar', nombre:'Campana', fr:2 }
  ]
};
