--practica#5
--tabla con campo calculado
CREATE DATABASE practica5
go
USE practica5
go

create table pruebaCalculo(
	id int not null identity(1,1),
	nombre varchar (50),
	precio decimal(10,2) not null,
	existencia int not null,
	importe as
	(precio * existencia)
	constraint pk_pruebaCalculo
	primary key (id)

)

select *from pruebaCalculo
insert into pruebaCalculo
values('chanclas', 200, 4)