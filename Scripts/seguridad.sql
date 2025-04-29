create LOGIN jaime
with PASSWORD = 'pAco1.23'


create login rosa 
with PASSWORD = 'JAIME321.0'
create database empresagrande

use empresagrande

create user jaime
for login jaime 
GO

create user rosa 
for login rosa
GO

create role vendedor
GO

create role jefarecursoshumanos
go

create SCHEMA ventas
GO

create SCHEMA produccion
go

create SCHEMA recursoshumanos
go

create table ventas.venta(
    folio int not null primary key,
    fecha date,
    clienteid int not NULL
)

create table ventas.detalle_venta (
    folio int not null,
    productoid int not null,
    cantidad float,
    precio money
    primary key (folio, productoid)
)

create table recursoshumanos.empleado(
    empleadoid int not null primary key,
    nombre nvarchar(50) not null,
    apellidos NVARCHAR(50) not null,
    departamentoid int
)

create table recursoshumanos.departamento(
    departamento int not null primary key,
    nombre nvarchar(50),
    desccription nvarchar(250)
)
--darle permiso al rol de vendedor de ingresar a la tabla de ventas 
grant select , insert on ventas.venta to vendedor
grant select, insert on ventas.detalle_venta to vendedor

--alter role es para agregar un rol a un usuario
--en este caso estamos dandole el rol de vendedor a jaime
alter role vendedor add member jaime 

grant select, insert, update, delete on recursoshumanos.empleado to headhr
grant select, insert, update, delete on recursoshumanos.departamento to headhr