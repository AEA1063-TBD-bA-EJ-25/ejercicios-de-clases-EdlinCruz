use social
select * from Highschooler

--consulta para conocer el nombre del id1 
--y el de sus amigos  
select h1.name, H2.name
from Highschooler H1
join friend F on H1.id =F.ID1
join Highschooler H2 on H2.ID = F.ID2
where h1.name = 'Gabriel'

--for every student who likes someone 2 or more
--grades below their own grade, return that 
--student's name and grade, and the name and grade of the 
--student they like
select *
    from Highschooler h1
    join likes l on l.ID1 = h1.ID
    join Highschooler H2 on l.ID2 = h2.ID
    --para mostrar los que se gustan en el mismo grado
   --where h1.grade = h2.grade
    --para conocer a quien le gusta alguien
    --dos grados menor
   where h1.grade - 2 >= h2.grade

--mostrar la informacion de los estudiantes que se gustan mutuamente
select h1.name, h1.grade, h2.name, h2.grade --selecciona solo nombres y grados
from Likes l1 --de la tabla likes 1 (asi la llamamos)
join likes l2 on l1.ID2 = l2.ID1 --
join Highschooler h1 on h1.ID = l1.id1
join Highschooler h2 on h2.id = l2.id2
where l1.ID1 = l2.ID2
    and l1.ID1 < l1.ID2

--for every situation where student A likes studen B, but student B likes a 
--diferent student C, return the names and grades of A,B and C
select h1.name, h1.grade, h2.name, h2.grade
from likes l1
join likes l2 on l1.ID2 = l2.ID2 
join Highschooler h1 on h1.id = l1.ID1
--falta agregarle nombres y gradoossss
select h1.
from likes L1 
INNER join likes l2 on l1.id2 = l2.ID1
where l1.id1 <> l2.id2