USE NORTHWND

--seleccionar todos los paises de los clientes (distinct)
select country from Customers --normal
select distinct country from Customers --no se repitan los paises


-- selecciona el numero de paises de donde son mis clientes (count)
select count(*) from Customers --todos
select count(country) from Customers
select count(distinct country) from Customers --quitar los repetidos


--seleccionar el cliente que tenga un id Anton
select * from Customers --normal

select * from Customers
where CustomerID = 'ANTON' --filtrar a uno

--seleccionar todos los clientes de mexico
select * from Customers
where Country = 'Mexico'

--seleccionar todos los registros de los clientes de berlin
select CompanyName, city, country from Customers
where City = 'Berlin'

--order by
--seleccionar todos los productos ordenados por precio
select * from Products
order by UnitPrice

--seleccionar todos los productos ordenados por el precio de mayor a menor
select * from Products
order by UnitPrice DESC

--seleccionar todos los productos alfabeticamente
select * from Products
order by ProductName 

select * from Products
order by ProductName DESC

--seleccionar todos los clientes por pais y dentro por nombre de forma ascendente
select  Country, CompanyName, city from Customers
order by Country, CompanyName

--operador and
--seleccionar todos los clientes de spain y que su nombre comience con g
select * from Customers
where Country = 'spain' and CompanyName Like 'G%'

--seleccionar todos los clientes de  berlin alemania con un codigo postal mayor a 1200
select * from Customers
where country = 'germany' and City = 'berlin' and PostalCode >1200

--seleccionar todos los clientes de españa y que su nombre comience con g o r
select * from Customers
where Country = 'Spain' and (CompanyName Like 'G%' or  CompanyName like 'R%')


--Clausula or
--seleccionar todos los clientes de alemania o españa
select *from Customers
where Country = 'Germany' or Country = 'Spain'

-- seleccionar todos los clientes de berlin o de noruega o que comience nu nombre con g
select * from Customers
where City = 'Berlin' or Country = 'Norway' or CompanyName like 'G%'

--seleccionar solo los clientes que no son de españa
select * from Customers
where not Country = 'spain'

--seleccionar todos los productos que no tengan un precio entre 
--18 y 20 dls
select * from Products
--where not UnitPrice =18 and not UnitPrice =19 and not UnitPrice =20
where not (UnitPrice>=10 and UnitPrice<=20)

select * from Products
where UnitPrice not  between 18 and 20

--seleccionar todos los clientes que no son de paris o de londres 
select *from Customers
where not (City = 'London' or City = 'Paris')

--seleccionar todos los productos que no tienen preccios mayores a 30
select *from Products
where not (UnitPrice >30)

--seleccionar todos los productos que no tienen preccios menores a 30
select *from Products
where not (UnitPrice <30)

-- seleccionar todos los clientes que comienzan con la letra a
select * from Customers
where CompanyName like 'A'

--seleccionar todos los clientes que finalizan con la palabra es
select * from Customers
where CompanyName like '%es'

--seleccionar todos los clientes que tengan la palabra mer
select * from Customers
where CompanyName like '%mer%'

--seleccionar todos los clientes con una ciudad que comience con cualquier caracter
--seguido de la palabra ondon
select * from Customers
where City like '_ondon'

