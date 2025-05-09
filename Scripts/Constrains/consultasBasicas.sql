use Northwind
GO

select * from Employees;
select * from Products;
select * from Suppliers;
select * from orders;

SELECT * from [Order Details]


select employeeid, lastname, FirstName
    from Employees 

select productname, UnitPrice
    from Products

select productname, UnitPrice
    from Products
    where ProductID = 4

select productname, unitprice, CategoryID
    from Products
    where UnitPrice = 30

select productname, unitprice, CategoryID
    from Products
    where UnitPrice >= 30

select productname, unitprice, CategoryID
    from Products
    where UnitPrice Between 30 AND 40

    
select productname, unitprice, CategoryID
    from Products
    where productid in ( 8 )

select productid, productname, unitprice, CategoryID
    from Products
    where productname like '%c%'

select productid, productname, unitprice, CategoryID
    from Products
    where productname like '%s'

select productid, productname, unitprice, CategoryID
    from Products
    where productname like '__a%'

select productid, productname, unitprice, CategoryID
    from Products
    where productname like '[a-c]%'

select productid, productname, unitprice, CategoryID
    from Products
    where productname like '[a,c]%'

select * from Employees
    where Region is null 

select productid, productname, unitprice, CategoryID
    from Products
    where productname like 'a%'
        or 
        UnitPrice = 30

select productid, productname, unitprice, CategoryID
    from Products
    where productname like 'U%'
        or 
        UnitPrice = 30

select productid, productname, unitprice, CategoryID
    from Products
    where UnitPrice Between 30 and 40
        and CategoryID = 2

SELECT * from Products, Categories

sELECT * from Products
join Categories on Products.CategoryID = Categories.CategoryID

SELECT ProductID, ProductName, UnitPrice, CategoryName from Products
join Categories on Products.CategoryID = Categories.CategoryID

SELECT * FROM Orders
    JOIN Customers on Customers.CustomerID = Orders.CustomerID

SELECT orderid, lastname from Orders
    join Employees on Employees.EmployeeID = Employees.EmployeeID

SELECT orderid, lastname, Companyname from Orders
    join Employees on Employees.EmployeeID = Employees.EmployeeID
    join Customers on Customers.CustomerID = Customers.CustomerID

SELECT orderid, lastname, Companyname, orderdate from Orders
join Employees on Employees.EmployeeID = Employees.EmployeeID
join Customers on Customers.CustomerID = Customers.CustomerID
where orderid = 10252

SELECT orderid, lastname, Companyname, RequiredDate, ShippedDate, DATEDIFF() from Orders
    join Employees on Employees.EmployeeID = Employees.EmployeeID
    join Customers on Customers.CustomerID = Customers.CustomerID

SELECT COUNT(*) from Products;
SELECT MAX(unitprice) from Products;
SELECT min(unitprice) from Products;
SELECT AVG(unitprice) from Products;
SELECT Sum(unitprice) from Products;

SELECT categoryid, AVG(unitprice) from Products
group by CategoryID
order by AVG(UnitPrice) DESC

SELECT categoryid, AVG(UnitPrice) as PrecioPromedio from Products
group by CategoryID
order by PrecioPromedio DESC

SELECT CategoryID, COUNT(*) as cantidad from Products
group by categoryid
order by cantidad

select unitprice * 1.10 as NuevoPrecio from Products

select * from Products

SELECT COUNT(*) from Products
WHERe Discontinued = 1

select * from Orders

SELECT * from [Order Details]

SELECT COUNT(*) from [Order Details]
    where orderid = 10250

SELECT sum(unitprice) from [Order Details]
    where OrderID = 10250

SELECT unitprice, Quantity, unitprice * Quantity from [Order Details]
WHERE OrderID = 10250

SELECT sum(unitprice * Quantity - Discount * UnitPrice * Quantity) from [Order Details]
WHERE OrderID = 10250

SELECT * from [Order Details] od
join Products P on P.Productid = od.productid
WHERE CategoryID = 1

select * FROM Categories

SELECT * from [Order Details] od
join Products P on P.Productid = od.productid
join Categories c on c.CategoryID = P.CategoryID
WHERE CategoryName like 'Beverages'

SELECT * from [Order Details] od
join Products P on P.Productid = od.productid
join Categories c on c.CategoryID = P.CategoryID
join orders o on o.OrderID = od.OrderID
WHERE c.CategoryName = 'Beverages'
and year(OrderDate ) = 1997

--Tarea: Cuánto se vendió en 1997 por cada categoría, y por el mes de ese anio
SELECT datename( month, o.OrderDate ), c.CategoryName, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSales
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
join Customers s on s.CompanyName = s.CompanyName
WHERE YEAR(OrderDate) = 1997
GROUP BY s.CompanyName, datepart( month, o.OrderDate ), datename( month, o.OrderDate ), c.CategoryName
ORDER BY c.CategoryName, datepart( month, o.OrderDate ), TotalSales DESC;

--USALA PARA CONSULTAR EL NOMBRE DE LAS TABLASS
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
select * from [Order Details]

--Ordenes que han sido menores a 500 dlls
Select orderid,
        sum(od.UnitPrice * Quantity - (Discount * od.UnitPrice * Quantity)) as importe from [Order Details] od
        group BY orderid
          having  sum(od.UnitPrice * Quantity - (Discount * od.UnitPrice * Quantity)) < 500
        order by importe

--clase de lunes 31 de marzo
--conocer el precio maximo y el nombre del producto
--en esta forma se declara la variable
declare @maximo money
select @maximo = max (UnitPrice) from products


--consuta para conocer el nombre y el precio mas alto de un producto utilizando subconsultas
select ProductName, UnitPrice FROM Products
where UnitPrice = (select max(UnitPrice)from products)
--lo que esta en parentesis es una subconsulta

--mostrar los clientes que nos han comprado despues del 01/01/95 usando join
select companyname
from Customers
JOIN orders 
on orders.CustomerID = Customers.CustomerID
where OrderDate > '1/1/1995'

--mostrar usando exists y subconsultas
select companyname, contactname
from Customers C
where exists (select * from orders o 
            where c.CustomerID = o.CustomerID 
            and OrderDate >'6/1/1998')