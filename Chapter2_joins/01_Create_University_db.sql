create database Uni
on(
name='Uni.data',
filename='D:\DataBase\Uni.mdf'
)
log on(
name='Uni.log',
filename='D:\DataBase\Uni.ldf')

-- create tables
create table Dept
(
Did int primary key,
Dname nvarchar(20),
)


create table student(
sid int primary key,
sname nvarchar(20) ,
did int foreign key references Dept(did)
)

create table employee(
eid int primary key,
ename nvarchar(20),
superid int foreign key references employee(eid)  -- self_referencing FK
)
