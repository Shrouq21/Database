
-- Select & Order by (DQL)
Use ITI

select * from Student  -- * -> all columns in Student's table

select * from Student
where St_Address ='Cairo'

select St_Fname,St_Lname from Student

select St_Fname,St_Lname from Student
where St_Age>20

select * from Student 
order by St_Age

select *from Student 
order by St_Age desc,Dept_Id asc

select *from Student 
order by St_Age desc,Dept_Id desc

select *from Student 
order by St_Age ,Dept_Id desc

select *from Student 
order by St_Age desc,Dept_Id asc

select St_Fname,St_Lname from Student 
order by St_Fname 

select St_Fname,St_Lname,St_Age from Student
order by St_Fname , St_Lname desc  -- it will base on fname first
-- then any contiagous fname will be sorted based on lname

select St_Fname+ ' ' +St_Lname
from Student

select St_Fname +' ' +St_Lname as fullname  --  full name is an alias
from Student


select St_Fname +' ' +St_Lname fullname 
from Student


select St_Fname +' ' +St_Lname [full_name] 
from Student


select St_Fname +' ' +St_Lname "full name"  -- it's better to put full name between "" or [] if you will put space or underscore
from Student

select * from Student 
where st_fname is Null

select *from Student
where st_fname is not Null

select *from Student 
where st_fname is not Null and St_Lname is not Null

select *from Student 
where st_fname is not Null or St_Lname is not Null

select * from Student 
where St_Address='Cairo' or St_Address='Alex'

select *from Student
where St_Address='Cairo' and St_Address='Alex' -- returns no rows


select *from Student
where St_Age =22 or St_Age =23 or St_Age =30
 --==
select *from Student
where St_Age in (22,23,30)

select *from Student
where St_Age not in (22,23)

select *from Student 
where  St_Age   between 20 and 22

select *from Student 
where St_Age not between 20 and 23

select *from Student
where St_Age>22 and St_Address='Alex' 

select *from Student
where St_Age>22 and St_Address='Alex' or st_address ='cairo'

select distinct Dept_Id --display Dept_Id only 
from Student 

select distinct St_Age ,St_Address --on both row
from Student         --ahmed 22
                     --ahmed 22    in this way they are similar will avoid them

select St_Fname +' '+St_Age  -- you can't concate differenct datatypes without converion
from Student

select [full_name]=St_Fname +' ' +convert (varchar(20),St_Age)
from Student

select St_Fname +space(4)+convert(varchar(10),Dept_Id)
from Student    --  This does not affect the stored data
