
-- Rule:
-- If you use an aggregate function with a column,
-- you must include that column in the GROUP BY clause


select count(SSN) as EmployeeCount
,Address
from employee
group by Address


-- Filtering order:
-- 1) FROM
-- 2) WHERE
-- 3) GROUP BY
-- 4) any aggregates
-- 5) HAVING
-- 6) SELECT
-- 7) ORDER BY
-- WHERE filters rows before grouping


select*from student
select count(st_Id),st_Address
from Student
where st_Age in(24,25,26) --it will delete any row doesn't contain 24,25,26
group by st_Address



select*from student
select count(st_Id),st_Address
from Student
where st_Age betweeen 24 and 25 and 26 --it will delete any row doesn't contain 24,25,26
group by st_Address

select
count(St_Id) as studentCount
, Dept_Id
from student
where St_Age>24
group by Dept_Id


-- HAVING is used with aggregate functions
-- HAVING filters groups after GROUP BY

-- GROUP BY without HAVING is allowed
-- HAVING without GROUP BY treats the table as one group
-- Having works on aggreates or Group by

select
count(St_Id) as StudentCount
, Dept_Id
from student
group by Dept_Id
having min(St_Age)>24




select St_Fname ,count(st_Id) ,Dept_Id -- count(st_ID) is aggregated
from student
where St_Fname like 'A%'
group by Dept_Id,St_Fname
having min(St_Age)>21



-- Types of calculations


select
sum(st_Age) 
from student 

select
min(st_Age),
max(st_Age)
from student

select count(*),
count(st_super),
count(Dept_Id)
from student

select avg(st_Age) --ignore null value
from student

select avg(isnull(st_age,0)) -- happen through running time only  --high perfomance
from student

select sum(st_age)/count(*)   --low performance(two aggregate function)
from Student


select*from student
select count(St_Fname) as name, Dept_Id, St_super   --with the aggregate functions there are two columns you should use group with these colums
from student
where St_Fname like 'a%'
group by Dept_Id,St_super


select count(St_Fname) as name, Dept_Id, St_super
from student
where St_Fname like 'a%'
group by Dept_Id,St_super
having min(St_Age)>21

select*from student
select count(St_Fname) 
from student 
having count(St_Id)>=1


select*from student
select count(St_Fname) 
from student 
group by Dept_Id  --you group depending on Dept_Id 
having count(St_Id)>=1


select count(St_fname) --there is null value
from student

--group by without having
--having wihtout group

select*from student
select count(St_Fname)
from student                --you treat the table as one group
having min(St_Age)>19


select*from student
select count(St_Fname)
from student
having min(St_Age)>20                  --you treat the table as one group but you have one value ==20 so the group had been excluded

