-- 04_system_functions_and_joins.sql
-- Demonstrates system functions and combining tables

-- Show current user
SELECT SUSER_NAME();

-- Select all departments from two tables
SELECT * FROM Departments;
SELECT * FROM DepartmentsBackup;

-- Combine department names from both tables using UNION ALL
SELECT DepartmentName FROM Departments
UNION ALL
SELECT DepartmentName FROM DepartmentsBackup;