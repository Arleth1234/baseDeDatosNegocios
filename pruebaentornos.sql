create database pruebaentornos
use pruebaentornos

--Lenguaje SQL de manipulacion de datos (SQL - LMD) (insert, delete, update, select)

--seleccionar todos los datos de la tabla categoria

select * from categoria

--agregar una sola fils a una tabla (categoria)
insert into categoria
values (1, 'carnes frias')

insert into categoria
values (1, 'lacteos')

insert into categoria
values (1, 'vinos')

insert into categoria
values (1, 'ropa')

insert into categoria(idCategoria, Descripcion)
values ('linea blanca', 5)

--insertar varios registros a la vez
insert into Categoria
values (7,'carnes buenas'),
(8, 'dulces'),
(9, 'panaderia'),
(10, 'salchichoneria')

--insertar a partir de una consulta
select idcategoria, Descripcion from categoria

create categoriaCopia(
categoriaid int not null primary key,
nombre varchar(100) not null
)


--insertar datos a partir de una consulta
select * from categoriaCopia
insert into categoriaCopia(categoriaid, nombre)
select idCategoria, descripcion from Categoria

--actualizacion de datossql-lmd
select * from producto
 
insert into Producto
values(1, 'salchicha',600,12)

insert into Producto
values(1, 'paleta de pollo',22,56,8)

insert into Producto
values(3, 'refri',3000,22,5),
	(3, 'chilindrina',23,43,9),
	(3, 'Terrible mezcal',200,12,3),
	(3, 'leche de burra',2350,3,2)

	--cambiar los datos
update producto
set idproducto =1
where nombre = 'salchicha'

update producto
set idproducto =2
where nombre = 'paleta de pollo'

update producto
set idproducto =3
where nombre = 'refri'

update producto
set idproducto =4
where nombre = 'chilindrina'

update producto
set idproducto =5
where nombre = 'Terrible mezcal'

update producto
set idproducto =6
where nombre = 'leche de burra'

update producto
set nombre ='salchicha grande',
existencia=20
where idProducto =1

--eliminar registros

select * from producto
delete from producto
where idProducto=4

delete from producto
where nombre ='salchicha grande'

delete from producto
where precio >= and precio<=22


