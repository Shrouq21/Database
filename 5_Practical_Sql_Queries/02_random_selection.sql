-- 02_random_selection.sql
-- Demonstrates how to select rows in random order using NEWID()

-- Add a random unique identifier to each row
SELECT *, NEWID() AS RandomID FROM Students;

-- Order all rows randomly
SELECT *, NEWID() AS RandomID FROM Students
ORDER BY RandomID;

-- Select a single random row
SELECT TOP(1) *
FROM Students
ORDER BY NEWID();

-- create_user_table.sql
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