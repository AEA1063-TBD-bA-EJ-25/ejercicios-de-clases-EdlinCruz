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

CREATE TABLE Docente (
    CURP CHAR (18) NOT NULL PRIMARY KEY,
    RFC CHAR(13) NOT NULL UNIQUE,
    Profesion NVARCHAR(30) NULL,
    FOREIGN KEY (CURP) REFERENCES Persona(CURP)
)

    CREATE TABLE Administrativo(
        CURP CHAR (18) NOT NULL
        PRIMARY KEY 
        FOREIGN KEY REFERENCES Persona(CURP)
    )

INSERT INTO Carrera (Clave, Nombre )
VALUES ('ITIC-2010-225', 'TICs')

select * from Carrera
INSERT INTO Carrera (Clave, Nombre)
VALUES('ISIC-2010-224', 'Ingenieria en Sistemas Computacionales'),
    ('IMTC-2010-224','Ingenieria en mecatranica' )

    INSERT INTO Persona (CURP, Nombre, Direccion, Nacimiento)
        VALUES('JS20FR', 'Jphane Sacrebleu', 'Por alla', '2033-04-05')

    INSERT INTO Alumnno(CURP, NumeroDeControl, CarreraClave)
        VALUES('JS20FR', '20170005', 'ITIC-2010-225')

        select NumeroDeControl, Nombre, CarreraClave from Persona
        join Alumno on Persona.CURP = Alumno.CURP