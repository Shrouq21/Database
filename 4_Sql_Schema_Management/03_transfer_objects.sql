-- =============================================
-- Transfer Objects Between Schemas
-- =============================================

-- Move Student table to HR schema
ALTER SCHEMA HR TRANSFER dbo.Student;


-- Example: Move Instructor table to HR
-- ALTER SCHEMA HR TRANSFER dbo.Instructor;

-- Example: Move Department table to Sales
-- ALTER SCHEMA Sales TRANSFER dbo.Department;