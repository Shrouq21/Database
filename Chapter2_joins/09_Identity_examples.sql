-- Identity column examples


create table myemp
(
id int primary key   identity (1,1),  --auto increament  identity(start from ,increment by)
ename varchar(20)
)


insert into myemp 
values ('ahmed') ,('Ramy') ,('Ramez') 

select *from myemp


delete from myemp
where ename='Ramez'  --id=3

insert into myemp
values('adel')    --id=4 start generate new one from the last one you have


create table mystaff
(
id int identity(1,2),
ssn int primary key,
ename varchar(20))

insert into mystaff values(1111,'ahmed'),(2222,'ali')

select * from mystaff

--problem 
--if we need to reset the identity  to avoid the gap whould happen between ids

set identity_insert myemp on --turn on putting id by myself 
--you should specify the coloums
insert into myemp values(17,'eman') --error
insert into myemp(id,ename) values(17,'eman') --greatest number is 17 when i set it off again will generate id after 17


select * from myemp


set identity_insert myemp off

insert into myemp values('alaa')


-- check last inserted identity

select @@Identity
--or
select scope_identity ()

select Ident_current ('myemp') --if i need a specific tablef

select Ident_incr('myemp')

--or

select ident_seed('myemp')  --increment seed

--Reset  identity
delete from myemp

dbcc checkident('myemp',reseed,0)  