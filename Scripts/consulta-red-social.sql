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