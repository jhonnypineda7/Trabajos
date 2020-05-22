use app_tv;

-- punto 1
select PNombre, PApellido, SApellido, correo from app_tv.cliente where PNombre like "D%" or PNombre like "A%" or PNombre like "C%";

-- punto 2
select año, Nom_peli from app_tv.peliculas where (año >= 2000) and (año <= 2020);

-- punto 3
select Nom_serie, año from app_tv.series where Nom_serie not like "L%";

-- punto 4
select Nom_peli, año from app_tv.peliculas where Nom_peli like "A%" or Nom_peli like "T%";

-- punto 5
select Nom_plan, precio_plan, caract_plan from app_tv.tipo_plan where precio_plan = (select min(precio_plan)from tipo_plan);

-- punto 6
select Nom_plan, precio_plan, caract_plan from app_tv.tipo_plan where precio_plan = (select max(precio_plan)from tipo_plan);

-- punto 7
select count(PNombre) from app_tv.cliente;

-- punto 8
select PNombre, SNombre, PApellido, SApellido, fk_id_plan from app_tv.cliente where fk_id_plan = 03;

-- punto 9
select PNombre, SNombre, PApellido, SApellido, fk_id_plan from app_tv.cliente where fk_id_plan = 01;

-- punto 10
select Nom_serie, calificacion from app_tv.series where calificacion > 8.0;

-- punto 11
select Nom_serie, calificacion from app_tv.series where calificacion < 8.0;

-- punto 12
select año, Nom_serie from app_tv.series where (año >= 2010) and (año <= 2020);

-- punto 13
select Nom_serie, año from app_tv.series;

-- punto 14
select Nom_serie, año from app_tv.series order by año ; 

-- punto 15
select count(Nom_serie) from app_tv.series;

-- punto 16
select Nom_serie, año from app_tv.series where año not like(2018);

-- punto 17
select id_Numdoc as 'Numero de documento', PApellido as 'Primer apellido', PNombre as 'Primer nombre', SNombre as 'Segundo nombre' from app_tv.cliente order by PApellido asc;

-- punto 18
select id_Numdoc as 'Numero de documento', PApellido as 'Primer apellido', PNombre as 'Primer nombre', SNombre as 'Segundo nombre' from app_tv.cliente order by PApellido desc;

-- punto 19
select Nom_serie as 'Nombre de serie', calificacion as 'calificación' from app_tv.series order by calificacion;

-- punto 20
select Nom_serie as 'Nombre de serie', calificacion as 'calificación' from app_tv.series order by calificacion desc;




