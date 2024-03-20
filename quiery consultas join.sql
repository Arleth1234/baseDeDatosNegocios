--consultaas con joins
--inner join
use NORTHWND
--seleccionar el numero de orden, el nombre del cliente y la fecha de la orden
select OrderID, CompanyName, OrderDate from Orders as o
inner join Customers as c
on c.CustomerID=o.CustomerID

--mostrar el numero de ordenes de cada cliente mostrando el nombre de la compañia
select CompanyName, count(*) as 'total de pedidos'
from Orders as o
inner join Customers as c
on c.CustomerID=o.CustomerID
group by CompanyName


select CompanyName, count(*) as 'total de pedidos'
from Orders as o
inner join Customers as c
on c.CustomerID=o.CustomerID
group by CompanyName
order by 2 desc

--seleccionar el numero de producto el nombre del producto y el nombre de la categoria
--ordenados de forma ascendente con respecto al nombre de la categoria
select ProductID, ProductName, c.CategoryID 
from Products as p
inner join Categories as c
on c.CategoryID=p.CategoryID

--seleccionar todas las ordenes de compra mostrando
--las fechas de ordenes de compra nombre del shipper y el nombre al
--cliente al que se le vendio (inner join - a tres tablas)
select c.CompanyName as 'cliente', 
o.OrderDate as 'fecha de orden', 
s.CompanyName as 'nombre flete'
from Customers as c
inner join Orders as o
on c.CustomerID=o.CustomerID
inner join Shippers as s
on o.ShipVia= s.ShipperID

--seleccionar el nombre del producto y su categoria
select c.CategoryName, p.ProductID 
from Categories as c
inner join Products as p
on c.CategoryID =p.CategoryID

--listar el nombre del cliente, la fecha de la orden,
--y los nombres de los productos que fueron vendidos
select c.CompanyName, o.OrderDate from
Customers as c
inner join Orders as o
on c.CustomerID=o.CustomerID
inner join [Order Details] as od
on o.OrderID= od.OrderID
inner join Products as p
on od.ProductID= p.ProductID

--seleccionar los nombres completos  de los empleados,
--los nombres  de los productos  que  vendio y la cantidad 
--de ellos y csalcular el importe
select concat(e.FirstName,'',e.LastName) as 'nombre completo',
p.ProductName as 'descripcion',
(od.Quantity* od.UnitPrice) as 'importe'
from Employees as e
inner join Orders as o
on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od
on od.OrderID=o.OrderID
inner join Products as p
on p.ProductID=od.ProductID


--seleccionar los nombres completos  de los empleados,
--los nombres  de los productos  que  vendio y la cantidad 
--de ellos y csalcular el importe
--pero solo los enviados a suiza, alemania y francia
select concat(e.FirstName,'',e.LastName) as 'nombre completo',
p.ProductName as 'descripcion',
(od.Quantity* od.UnitPrice) as 'importe'
from Employees as e
inner join Orders as o
on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od
on od.OrderID=o.OrderID
inner join Products as p
on p.ProductID=od.ProductID
where o.ShipCountry in ('France','Germany', 'switzeland')






-- Seleccionar los nombres completos de los empleados,
-- los nombres de los productos que vendio y la cantidad
-- de ellos y calcular el importe,
-- pero solos enviados a suiza, alemania y francia
-- Agrupados por la cantidad total de ordenes hechas por los
-- empleados
-- Seleccionar el numero de ordenes enviadas a alemania,
-- suiza y francia, agrupadas por el empleado y el pais de envio
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1

-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)







--seleccionar el total de dinero que se le han vendido
--a cada uno de los clientes de 1996
select CompanyName as 'cliente',
sum(UnitPrice*Quantity) as 'Total de ventas'
from 
[Order Details] as od
inner join 
Orders as o
on od.OrderID=o.OrderID
inner join Customers as c
on o.CustomerId= c.CustomerID
where year(o.OrderDate)= '1996'
group by CompanyName
order by 2 desc


--seleccionar el total de dinero que se le han vendido
--a cada uno de los clientes por cada año
select CompanyName as 'cliente',
year(o.OrderDate) as 'año',
sum(UnitPrice*Quantity) as 'Total de ventas'
from 
[Order Details] as od
inner join 
Orders as o
on od.OrderID=o.OrderID
inner join Customers as c
on o.CustomerId= c.CustomerID
group by c.CompanyName, year(o.OrderDate)
order by 2 desc

--seleccionar el importe total que se ha vendido por categoria de producto
select c.CategoryName,
sum(od.Quantity*od.UnitPrice) as 'total'
from Categories as c
inner join Products as p
on p.CategoryID=c.CategoryID
inner join [Order Details] as od
on od.ProductID=p.ProductID
group by c.CategoryName
order by 2 desc

--seleccionar el importe total que se ha vendido por categoria de producto, que permita
--visualizar el producto más vendido





--seleccionar el numero de producto, el nombre del producto y el nombre
--de categoria, ordenados de forma ascendente con respecto al nombre de categoria
select p.ProductID, p.ProductName, c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID= c.CategoryID
order by c.CategoryName asc


--left join
select c.CompanyName, o.OrderId Customers as c
left outer join
orders as o
on c.CustomerID = o.CustomerID
where 















