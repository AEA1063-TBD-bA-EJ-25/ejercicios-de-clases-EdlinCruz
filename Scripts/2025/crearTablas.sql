create database escuelita;

go

use escuelita
create TABLE Persona(
    CURP CHAR(18) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Direccion NVARCHAR (100),
    Nacimiento DATE NOT NULL,
)

CREATE TABLE Carrera(
    Clave CHAR(13) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL

)

CREATE TABLE Alumno (
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    NumeroDeControl CHAR (8) NOT NULL UNIQUE,
    ClaveCarrera CHAR(13) FOREIGN KEY REFERENCES Carrera(Clave)
)
select * from persona;