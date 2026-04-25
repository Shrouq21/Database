-- Aggregate Functions
-- Used for calculations and summarization
-- Examples: COUNT, MAX, MIN, AVG, SUM
-- Aggregate functions require parentheses ()
-- Aggregate functions ignore NULL values
-- Calculations may take more time in memory


select*from Employee
select SUM=sum (salary)           
from employee

-- COUNT(*) counts all rows
-- COUNT(column) counts only non-NULL values


select count (SSN)
from employee


select count(*)   
from employee

select count(Lname)   
from employee


select min(salary) ,max(salary)
from employee

select
min(salary) as MinSalary
,max(salary) as MaxSalary
,count(SSN) as EmployeeCount
from employee





select count(Salary)    --9 there is a null value 
from employee



-- AVG ignores NULL values
-- This may cause inaccurate results if NULLs exist

-- Solutions:
-- 1) Use SUM / COUNT(*)
-- 2) Use ISNULL to replace NULL values with 0

select avg(salary)  --sum/count 
from employee



select isnull(Dno,0)
from employee


select avg(salary)
from employee


select sum(salary)/count(*)
from employee

select avg (isnull(salary,0))
from employee


