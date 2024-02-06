use NORTHWND
-- cunsultas agregado
--caracteristicas principales es que devuelven un solo registro

--top y percent
--selecciona las primeras 10 ordenes de compra
select top 10* from Orders
--los ultimos 10 registros
select top 10* from Orders
order by OrderID desc

select top 10 CustomerID as 'numero de cliente', 
OrderDate as 'fecha de orden',ShipCountry as 'pais de entrega' 
from Orders
order by OrderID desc

-- el 50% de los registros
select top 50 percent * from Orders
-- el 25% de los registros
select top 25 percent * from Orders

-- seleccionar los primeros 3 clientes de alemania
select top 3 * from Customers
where Country = 'germany'

--seleccionar el producto con el precio mayor
select * from Products
order by UnitPrice desc

-- muestra el precio mas alto de los productos 
select top 1 * from Products
order by UnitPrice desc
-- muestra el precio mas alto de los productos (max)
select max(unitprice)as 'precio maximo'from Products

--mostrar el precio minimo de los productos
select min(unitprice)as 'precio min'from Products

--seleccionar todas las ordenes de compra
select * from Orders

--seleccionar el numero total de ordenes (count)
select count(*) as 'total de ordenes' from Orders
--con un campo
select count(ShipRegion) as 'total de ordenes' from Orders

--seleccionar todas aquellas ordenes donde la region de envio no sea null
select * from Orders
where not ShipRegion = 'null'

select count(*) from Orders
where ShipRegion is not null

--seleccionar de forma ascendente los productos por precio
select * from Products
order by UnitPrice 

-- seleccionar el numero de precios de los productos 
select count (distinct UnitPrice) from Products

--contar todos los diferentes paises de los 
select count (distinct Country) from Customers

--seleccionar la suma total de las cantidades de las ordenes de compra
select sum(quantity) from [Order Details]

-- seleccionar todos los registros de order details calculando su importe (campo calculado)
select *, (UnitPrice*Quantity)as 'importe'from [Order Details]

--seleccionar el total en dinero que ha vendido la empresa
select sum(UnitPrice*Quantity)as 'total' from [Order Details]

--seleccionar el total de venta del producto chang
select sum(UnitPrice*Quantity)as total from [Order Details]
where ProductID=2

--seleccionar el promedio de los precios de los productos(avg)
select avg(UnitPrice) as promedio from Products

--seleccionar el promedio y  el total de venta de los productos 41 60 31
select sum (UnitPrice*Quantity)as total, avg(UnitPrice*Quantity) from [Order Details]
where ProductID in (41,60,31)

--seleccionar el numero de ordenes realis¿zadas entre 1996 y 1997
select count(*)from Orders
where OrderDate between '1996-01-01' and '1997-12-32'

select year(OrderDate)from Orders

select count(*) from Orders
where year(OrderDate)between '1996' and '1997'

--instruccion group by
select country, count (*)
from Customers
group by Country
order by 1 desc

--seleccionar el numero de ordenes enviadas por el shippervia
select ShipVia, count(*) as 'numero de ordenes'
from Orders
group by ShipVia

select s.CompanyName as 'nombre compañia', count(*) as 'total'
from Orders as o
inner join Shippers as s
on o.ShipVia=s.ShipperID
group by s.CompanyName




