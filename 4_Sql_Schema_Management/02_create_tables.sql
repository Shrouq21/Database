-- =============================================
-- Create Tables
-- =============================================

-- Create table in default schema (dbo)
CREATE TABLE dbo.Student
(
    Id INT PRIMARY KEY,
    EName VARCHAR(20)
);

--CREATE TABLE Student
--(
    --Id INT PRIMARY KEY,
   -- EName VARCHAR(20)
--);


-- Create table directly inside Sales schema
CREATE TABLE Sales.Student
(
    Id INT PRIMARY KEY,
    EName VARCHAR(20)
);
