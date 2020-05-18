-- drop database app_tv;
create database app_tv;
use app_tv;

create table doc_us(
id_doc varchar(20) not null,
iniciales varchar(6) not null,
Nom_tipo_doc varchar(35) not null,
primary key(id_doc)
);

create table rol(
id_rol int(12) not null,
Nom_rol varchar(30) not null,
primary key(id_rol)
);

create table tipo_plan(
id_plan int(12) not null, 
Nom_plan varchar(30) not null,
precio_plan int(12) not null,
caract_plan text,
primary key(id_plan)
);

create table mod_pago(
id_pago int(12) not null,
Nom_tpago varchar(25) not null,
primary key(id_pago)
);

create table clase(
id_clase int(12) not null,
Nom_clase varchar(70) not null,
primary key(id_clase)
);

create table idioma(
id_idioma int(12) not null,
Nom_idioma varchar(15) not null,
primary key(id_idioma)
);

create table peliculas(
id_peli int(12) not null,
Nom_peli varchar(90) not null,
Tiempo_peli time not null,
año year(4) not null,
descripcion text,
estado tinyint(4) not null,
primary key(id_peli)
);


create table series(
id_serie int(12) not null,
Nom_serie varchar(90) not null,
cant_temps tinyint(4) not null,
año year(4) not null,
descripcion text not null,
calificacion float not null,
estado tinyint(4) not null,
primary key(id_serie)
);

create table error_ing(
id_error int(12) not null,
motivo_error varchar(180),
fecha_error datetime,
primary key(id_error)
);

create table servidor_correo(
id_servcorreo int(12)not null,
Nom_servcorreo varchar(50),
primary key(id_servcorreo)
);

create table cliente( 
id_Numdoc varchar(20) not null,
PNombre varchar(20) not null,
SNombre varchar(20),
PApellido varchar(20) not null,
SApellido varchar(20),
correo varchar(110) not null,
contraseña varchar(20) not null,
fk_id_doc varchar(20) not null,
fk_id_rol int(12) NOT NULL,
fk_id_plan int(12) NOT NULL,
primary key(id_Numdoc, fk_id_doc),
constraint c_id_doc foreign key(fk_id_doc) references doc_us(id_doc) on update cascade,
CONSTRAINT c_id_rol FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol) on update cascade,
CONSTRAINT c_id_plan FOREIGN KEY (fk_id_plan) REFERENCES tipo_plan(id_plan) on update cascade
);

create table perfil_us(
id_perfil int(12) not null,
Nom_perfil varchar(20) not null,
foto blob,
primary key(id_perfil),
fk_id_Numdoc varchar(20) not null,
fk_id_doc varchar(20) not null,
CONSTRAINT c_id_Numdoc FOREIGN KEY (fk_id_Numdoc, fk_id_doc) REFERENCES cliente(id_Numdoc, fk_id_doc) on update cascade
);

create table recibo_pago(
id_fact int(12) not null,
fecha date not null,
hora time not null,
fk_id_Numdoc varchar(20) not null,
fk_id_doc varchar(20) not null,
primary key(id_fact, fk_id_Numdoc, fk_id_doc),
fk_id_plan int(12) not null,
fk_id_pago int(12) not null,
CONSTRAINT c_recibo_pago_id_Numdoc foreign key(fk_id_Numdoc, fk_id_doc) references cliente(id_Numdoc, fk_id_doc) on update cascade,
CONSTRAINT c_recibo_pago_id_plan FOREIGN KEY(fk_id_plan) REFERENCES  tipo_plan(id_plan) on update cascade,
CONSTRAINT c_recibo_pago_id_pago FOREIGN KEY (fk_id_pago) REFERENCES mod_pago(id_pago)on update cascade
);
 
create table temporadas(
id_temp int(12) not null,
Num_temp tinyint(4) not null,
primary key(id_temp),
fk_id_serie int(12) not null,
CONSTRAINT c_id_serie FOREIGN KEY(fk_id_serie) REFERENCES series(id_serie) on update cascade
);

create table capitulos(
id_caps int(12) not null,
Nom_caps varchar(80) not null,
Num_caps tinyint(4) not null,
duracion time not null,
primary key(id_caps),
fk_id_temp int(12) not null,
CONSTRAINT c_id_temp FOREIGN KEY(fk_id_temp) REFERENCES temporadas(id_temp) on update cascade
);
 
create table perfil_us_peliculas(
fk_id_perfil int(12) not null,
fk_id_peli int(12) not null,
primary key(fk_id_perfil, fk_id_peli),
foreign key(fk_id_perfil) references perfil_us(id_perfil),
foreign key(fk_id_peli) references peliculas(id_peli)
);

create table peliculas_idioma(
fk_id_peli int(12) not null,
fk_id_idioma int(12) not null,
primary key(fk_id_peli, fk_id_idioma),
foreign key(fk_id_peli) references peliculas(id_peli),
foreign key(fk_id_idioma) references idioma(id_idioma)
);

create table clase_peliculas(
fk_id_peli int(12) not null,
fk_id_clase int(12) not null,
primary key(fk_id_peli, fk_id_clase),
foreign key(fk_id_peli) references clase(id_clase),
foreign key(fk_id_clase) references peliculas(id_peli)
);

create table capitulos_idioma(
fk_id_caps int(12) not null,
fk_id_idioma int(12) not null,
primary key(fk_id_caps, fk_id_idioma),
foreign key(fk_id_caps) references capitulos(id_caps),
foreign key(fk_id_idioma) references idioma(id_idioma)
);

create table clase_series(
fk_id_serie int(12) not null,
fk_id_clase int(12) not null,
primary key(fk_id_serie, fk_id_clase),
foreign key(fk_id_clase) references clase(id_clase),
foreign key(fk_id_serie) references series(id_serie)
);

create table series_perfil_us(
fk_id_perfil int(12) not null,
fk_id_serie int(12) not null,
primary key(fk_id_perfil, fk_id_serie),
foreign key(fk_id_perfil) references perfil_us(id_perfil),
foreign key(fk_id_serie) references series(id_serie)
);

-- fin de codigo