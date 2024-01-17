--Practica #1
CREATE DATABASE practica1

CREATE TABLE tblContacto(
	idContacto int not null,
	nombre varchar(100) not null,
	constraint pk_idContacto
	primary key(idContacto),
	constraint unique_nombre
	unique (nombre)
)

CREATE TABLE tblTelefono(
	idTelefono int not null,
	numeroTel varchar (20) not null,

)