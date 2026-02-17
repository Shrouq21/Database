
-- SQL Subqueries
-- Inner query executes first
-- Outer query uses the result of the inner query
-- Aggregate functions cannot be used directly in WHERE


select *from student           --error (you can't use aggregate function with where)
where st_age<avg(st_age)

--correct way

select*from student
where st_age<(
select avg(st_age)
from Student)

select*,
count(st_id)   --you can't select columns without group by
from student


select *,
(select count(st_id) from student)
from student
 --select count will happen first returning 14 then select all students with this added column


 -- If the subquery returns multiple values,
-- you must use IN or NOT IN
-- You cannot use =, >, or < with multiple values


 select dept_name
 from Department
 where Dept_Id in (select distinct dept_id from student where Dept_Id is not null) --inner query will return array with the ids


 -- The SQL engine often converts subqueries to joins internally
-- Using JOIN is usually the better and faster solution

 select distinct dept_name
 from department inner join student
 on department.Dept_Id=student.Dept_Id



 select dept_name
 from Department
 where Dept_Id not in (select distinct dept_id from student where Dept_Id is not null)


 select * from student
 where st_age 
 in (select distinct st_age from student where st_address='cairo')

-- ANY: condition must be true for at least one value
-- ALL: condition must be true for all values
-- ANY must be used with a comparison operator (=, >, <, etc.)

 select*from student
 where st_age >
 all(select distinct st_age from student where st_address='cairo')

  select*from student
 where st_age >any(select distinct st_age from student where st_address='cairo') --  st_age > at least one student

 select*from student
 where st_address!='cairo' and st_age>any (select distinct st_age from student where st_address='cairo')



 --join +DML

 --subqueries+ DML


 delete from stud_course
 where st_id=2

 
 delete from stud_course
 where st_id in(select st_id 
 from student s inner join Department d
 on d.Dept_Id=s.Dept_Id and dept_name='SD')

