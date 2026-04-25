--drop ,delete ,truncate

drop table student --ddl data&metadata
delete from student --dml data only          

truncate table student -- deleted all data, faster than delete, reesets identity

--truncate is faster than delete


insert into myemp values('ramy')
insert into myemp values('hany')
truncate table myemp  --reset identity again

--We consider truncate from ddl query because it affects the structure of our table
