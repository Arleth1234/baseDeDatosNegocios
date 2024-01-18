--Practica2
CREATE DATABASE practica2
go
USE practica2
go

CREATE TABLE tblCliente(
	IdCliente int not null,
	nombre varchar(100) not null,
	direccion varchar(100) not null,
	telefono varchar (20),
	constraint pk_IdCliente
	primary key(IdCliente),
	constraint unique_nombre
	unique (nombre)
)

CREATE TABLE tblEmpleado(
	IdEmpleado int not null,
	nombre varchar (50) not null,
	apellidos varchar (50) not null,
	sexo char(1) not null,
	salario decimal(10,2) not null,

	constraint pk_IdEmpleado
	primary key(IdEmpleado),

	constraint unique_IdEmpleado
	unique (IdEmpleado),

	constraint chk_sexo
	check (sexo='h' or sexo ='m'),

	constraint chk_salario
	check (salario>=400 and salario<=50000)
)

CREATE TABLE tblVenta(
	IdVenta int not null,
	fecha date not null,

	IdCliente int not null,
	IdEmpleado int not null,

	constraint pk_tblVenta
	primary key(IdVenta),

	constraint fk_tblVenta_tblCliente
	foreign key (IdCliente)
	references tblCliente (IdCliente),

	constraint fk_tblVenta_tblEmpleado
	foreign key (IdEmpleado)
	references tblEmpleado (IdEmpleado)
)

CREATE TABLE Producto(
	IdProducto int not null,
	descripcion varchar (50) not null,
	existencia int not null,
	precioUnitario decimal (10,2) not null,

	constraint chk_precioUnitario
	check (precioUnitario>=1 and precioUnitario<=50000),

	constraint pk_Producto
	primary key(IdProducto),

	constraint unico_descripcion
	unique (descripcion)

)

CREATE TABLE detalleVenta(
	cantidad int not null,
	precio decimal(10,2) not null,
	
	IdProducto int not null,
	IdVenta int not null,

	
)


