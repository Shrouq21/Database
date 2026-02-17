-- string fun

select concat('Ahmed','Ramez','Eman')
select concat_ws('&' ,'Ahmed','Ali')

select concat_ws('& ' ,'ahmed','ali',quotename('khalid','"'),'eman')


select st_fname,st_lname
from student



--upper and lower case

select upper(st_fname),lower(st_fname)
from student


select len(st_fname),st_fname --length of string
from student


select*from student
select substring(st_fname,2,4)   --tart from the second char and get 4 chars
from student


select substring(st_fname,1,len(st_fname)-1)from student



select*from student
where len(st_fname)>5

select left('ahmed',2)

select right('shrouq',2)

select charindex('h','ahmedhassan') --search on a specific char return the indx of first h it will meet

select charIndex('A',st_fname) from student

select patIndex('%n','ahmedhassan')  --if you want to search about a pattern in this string (it will return the indx of the start of this pattern)




select replace ('ali/gmail.com','/','@') --if you have any mistake in you data and you want to replace it 

select stuff('ahmedhassan',2,4,'li')  --replace from index 2 to 4 and put li


select trim('   ahmed   ') --remove spaces from right and left

select LTRIM('  ahme   ')

select Rtrim('     ahmed   ')

select Reverse('ahmed')

select Replicate('ahmed',3)  --how many times you want to repeat ahmed



-- converting array to string
select st_fname   --return array 
from student

--Aggregate many strings into one string.

select string_agg(st_fname,',')   --convert array to one string
from student


select 'C#,MVC,HTML,JAVA'  --string


select *from string_split('C#,MVC,HTML,JAVA',',')  --return array 


create table mydata
(
eid int primary key,
ename varchar(20),
skills varchar(40)
)

select*from mydata

select eid,ename,value
from mydata cross apply string_split (skills,',') --multibly the column in each row

--convert to string

select str('12')
