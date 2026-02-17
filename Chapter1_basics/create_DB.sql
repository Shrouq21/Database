create database ITI
on(
Name='ITI_mdf', --logical name that SQL Server uses inside the database.
filename='D:\ITI\ITI.mdf'  -- the physical file path on  disk.
)
log on(
Name='ITI_Log',
filename='D:\ITI\ITI.ldf'
)

backup database ITI
to disk='d:\db\ITI.bak'


drop database ITI  -- To drop the database

Use ITI

-- To create a table
create table dept(
did int Primary key,
dname varchar(20),
dsalary int 
)
create table emp(
eid int Primary key,
ename varchar(20) not null,
esalary int default 1000,
eadd varchar(30) default 'cairo',
hiredate date default getdate(), --Built-in function — returns the current system datetime
dept_id int foreign key references dept(did)
)


alter table emp add overtime int  -- 4 byte
alter table emp alter column overtime bigint
-- tinyint: 0 to 255
-- smallint: -32768 to 32767
-- int: 4 bytes
-- bigint: 8 bytes
alter table emp drop column overtime
drop table emp    -- data and matadata are deleted