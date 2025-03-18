

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

CREATE TABLE Alumno(
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Personaa(CURP),
    NumeroDeControl CHAR (8) NOT NULL UNIQUE,
    ClaveCarrera CHAR(13) FOREIGN KEY REFERENCES Carreraa(Clave)
)
select * from Personaa;

CREATE TABLE Docente(
    CURP CHAR (18) NOT NULL PRIMARY KEY,
    RFC CHAR(13) NOT NULL UNIQUE,
    Profesion NVARCHAR(30) NULL,
    FOREIGN KEY (CURP) REFERENCES Personaa(CURP)
)

    CREATE TABLE Administrativo(
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


        create table empleado(
            idEmpleado int not null primary key,
            nombre NVARCHAR(50) not null,
            sueldo money DEFAULT 1500
        )
            
        

        INSERT INTO empleado(idEmpleado, nombre, sueldo)
        values(1, 'Felipe de jesus', 2000)

        insert into empleado(idEmpleado, nombre)
        values(2, 'Chuerk')

        SELECT * from empleado

        CREATE TABLE personita(
            idEmpleado int not null primary key,
            nombre NVARCHAR(50) not null,
            sueldo money DEFAULT 1500,
            telefono VARCHAR(20) check (telefono like '667[0-9][0-9][0-9]')
        )

        insert into personita values (1, 'Juana', null, '667123')

        ALTER table empleado
            add sexo char(1) null check(sexo in('H', 'M'))

        select * from empleado
        insert into empleado(idEmpleado, nombre, sexo) values (3, 'Alexis Jara Rodriguez', 'H')
         insert into empleado(idEmpleado, nombre, sexo) values (4, 'Matilde Sandoval', 'H')

         alter table empleado 
         drop CONSTRAINT CK_empleado_sexo_3F466844

         INSERT INTO empleado(idEmpleado, nombre, sexo) values(4, 'Matilde Sandoval', 'H')
         select * from empleado

         alter table empleado
            ADD CONSTRAINT sexonuevasopciones check (sexo in ('H', 'M','T','F'))

        insert into empleado (idEmpleado, nombre, sexo) values (5, 'refugio Saldivar', 'F')
        insert into empleado(idEmpleado, nombre, sexo) values (6, 'Delia Barrantes', 'R')



        alter table empleado
            add nacimiento date not null check(date <getDate())


            select * from Persona

            select SYSDATETIME()
            select SYSDATETIMEOFFSET()
            SELECT SYSUTCDATETIME()

            SELECT (DATENAME(MONTH, nacimiento)) from Persona

            select datediff(day, getDate(), nacimiento ) from Persona
            select datediff(year, nacimiento, getDate() )as Edad from Persona

            select dateadd(HOUR, 2, GETDATE())