

create database escuelita;

go

use escuelita
create TABLE Personaa(
    CURP CHAR(18) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Direccion NVARCHAR (100),
    Nacimiento DATE NOT NULL,
)

CREATE TABLE Carreraa(
    Clave CHAR(13) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL

)

CREATE TABLE Alumnoo (
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Personaa(CURP),
    NumeroDeControl CHAR (8) NOT NULL UNIQUE,
    ClaveCarrera CHAR(13) FOREIGN KEY REFERENCES Carreraa(Clave)
)
select * from Personaa;

CREATE TABLE Docentee (
    CURP CHAR (18) NOT NULL PRIMARY KEY,
    RFC CHAR(13) NOT NULL UNIQUE,
    Profesion NVARCHAR(30) NULL,
    FOREIGN KEY (CURP) REFERENCES Personaa(CURP)
)

    CREATE TABLE Administrativoo(
        CURP CHAR (18) NOT NULL
        PRIMARY KEY 
        FOREIGN KEY REFERENCES Personaa(CURP)
    )

    INSERT INTO Carrera (Clave, Nombre )
        VALUES ('ITIC-2010-225', 'TICs')

select * from Carreraa

    INSERT INTO Carrera (Clave, Nombre)
        VALUES('ISIC-2010-224', 'Ingenieria en Sistemas Computacionales'),
            ('IMTC-2010-224','Ingenieria en mecatranica' )

    INSERT INTO Personaa (CURP, Nombre, Direccion, Nacimiento)
        VALUES('JS20FR', 'Jphane Sacrebleu', 'Por alla', '2033-04-05')

    INSERT INTO Alumnoo(CURP, NumeroDeControl, ClaveCarrera)
        VALUES('JS20FR', '20170005', 'ITIC-2010-225')

    /*select * from Alumno*/
        select NumeroDeControl, Nombre, ClaveCarrera from Personaa
        join Alumno on Personaa.CURP = Alumno.CURP