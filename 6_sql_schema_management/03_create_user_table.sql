-- 03_create_user_table.sql
-- Create a users table with unique ID and insert sample data

CREATE TABLE Users
(
    UserID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    UserName VARCHAR(50),
    Password VARCHAR(50)
);

-- Insert a sample user
INSERT INTO Users (UserName, Password)
VALUES ('SampleUser', 'Password123');

-- Display all users
SELECT * FROM Users;