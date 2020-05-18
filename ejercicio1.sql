create database ejercicio1;
use ejercicio1;

create table ciudad(
Ref_Ciudad int not null,
Espe_Ciudad varchar(50),
primary key (Ref_Ciudad) 
);

create table ClaseIden(
Num_Iden varchar(6) not null,
Espe_Iden varchar(50),
primary key (Num_Iden)
);

create table ciudadano(
Id_ciu varchar(15) not null,
PNombre_ciu varchar(25) not null,
SNombre_ciu varchar(25),
PApellido_ciu varchar(25) not null,
SApellido_ciu varchar(25),
Tel_ciu varchar(20),
fk_Ref_Ciudad int not null,
fk_Num_Iden varchar(6) not null
);
);

alter table ciudadano add foreign key (fk_Ref_Ciudad) references ciudad (Ref_Ciudad);
alter table ciudadano add foreign key (fk_Num_Iden) references ClaseIden (Num_Iden);
alter table ciudadano add primary key (fk_Ref_Ciudad, Id_ciu);