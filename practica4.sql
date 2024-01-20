--Practica3
CREATE DATABASE practica3
go
USE practica3
go

CREATE TABLE categoria(
	categoriaId int not null,
	numero int not null,
	descripcion varchar (50) not null,
	constraint pk_categoria
	primary key (categoriaId, numero)
)

CREATE TABLE producto(
	productoId int not null,
	descripcion varchar (100) not null,
	precio decimal(10,2) not null,
	stock int not null,
	numerinventario int not null,
	constraint pk_producto
	primary key (productoId),
	constraint fk_producto_categoria
	foreign key (productoId,numerinventario)
	references categoria(categoriaId,numero)
)
