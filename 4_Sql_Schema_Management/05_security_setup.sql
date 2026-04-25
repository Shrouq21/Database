-- =============================================
-- Create Synonym (Shortcut for Objects)
-- =============================================

-- Create synonym for Sales.Department
CREATE SYNONYM Dept
FOR Sales.Department;


-- Usage
SELECT * FROM Dept;