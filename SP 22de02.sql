--		EJERCICIOS 22/02


--Crear un sp que permita insertar registros en la tabla customers'''

select * from Customers
go
create proc InsertarCliente
@CustomerID NVARCHAR(5),
@CompanyName NVARCHAR(40),
@ContactName NVARCHAR(30),
@Address NVARCHAR(60),
@City NVARCHAR(15)
as
begin
insert into Customers
(CustomerID, CompanyName, ContactName, Address, City)
values
(@CustomerID, @CompanyName, @ContactName, @Address, @City)
end
go


--Crear un sp que permita eliminar registros en la tabla customers, por customerId
create proc EliminarCliente
@CustomerID NVARCHAR(5)
as
begin
delete from Customers
where CustomerID = @CustomerID
end
go

--Crear un sp que permita eliminar un producto de una orden dada
create proc EliminarProductoDeOrden
@OrderID int,
@ProductID int
as
begin
delete from [Order Details]
where OrderID = @OrderID
and ProductID = @ProductID;
end

exec EliminarProductoDeOrden @OrderID = 10248, @ProductID = 11

--Crear un sp que permita eliminar un producto de una orden y modificar su stock (unitstock del producto)
	--(consultar la tabla order details con el producto que se va a eliminar y obtener su quantity
	-- 2-eliminar de la tabla order details el producto y 3- actualizar la tabla producto aumentandolos unitstock con la cantidad anterior)
go
CREATE PROC EliminarProductoDeOrdenActualizarStock
@OrderID INT,
@ProductID INT,
@cantidad INT
as
begin
-- Eliminar el producto de la orden
delete from [Order Details]
where OrderID = @OrderID AND ProductID = @ProductID
-- Actualizar la cantidad en stock del producto
UPDATE Products
set UnitsInStock = UnitsInStock + @cantidad
where ProductID = @ProductID
end
go