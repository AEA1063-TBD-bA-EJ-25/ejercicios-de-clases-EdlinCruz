use northwind

select *
from employees
select *
from Suppliers



--CREAR UN DIRECTORIO PARA TODAS LAS PERSONAS QUE TIENEN CONTACTO CON LA EMPRESA
--usando el conjunto de union
Select FirstName+' ' +LastName as 'Name', HomePhone , 'Northwind' as 'Company Name', 'Empleado' as Tipe from Employees
union --une las dos tablas de consulta
select ContactName, Phone, CompanyName, 'Cliente' as Tipe from Customers
union 
select ContactName, Phone, CompanyName, 'Proveedor' as Tipe from Suppliers

--Nombre de los Clientes que han comprado en julio y agosto
select CustomerID
from Orders
where year (OrderDate) = 1997 and month(OrderDate)=7
INTERSECT
select customerID from orders
where year (OrderDate) = 1997 and month(OrderDate)=8

--Nombre de los Clientes que han comprado en julio 
select CustomerID
from Orders
where year (OrderDate) = 1997 and month(OrderDate)=7
EXCEPT
select customerID from orders
where year (OrderDate) = 1997 and month(OrderDate)=8

