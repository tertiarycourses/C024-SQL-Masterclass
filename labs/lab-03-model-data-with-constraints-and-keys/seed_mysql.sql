-- Lab 3 — Model Data with Constraints and Keys: mock data
-- SQL Masterclass (C024) · v1 · Tertiary Infotech Academy Pte Ltd
-- Dialect: MySQL / MS SQL
-- Load: open this file in your SQL editor and execute the whole script.

-- --------------------------------------------------------------------
-- Persons — Small Persons table for constraint practice (NOT NULL, UNIQUE, CHECK Age >= 18, DEFAULT City).
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Persons;
CREATE TABLE Persons (
  ID INT PRIMARY KEY,
  LastName VARCHAR(40),
  FirstName VARCHAR(40),
  Age INT,
  City VARCHAR(40),
  Email VARCHAR(80)
);

INSERT INTO Persons (ID, LastName, FirstName, Age, City, Email) VALUES
  (1, 'Tan', 'Alice', 30, 'Singapore', 'alice.tan@example.com'),
  (2, 'Lim', 'Bryan', 42, 'Singapore', 'bryan.lim@example.com'),
  (3, 'Kumar', 'Divya', 27, 'Singapore', NULL),
  (4, 'Wong', 'Cheryl', 35, 'Johor Bahru', 'cheryl.wong@example.com'),
  (5, 'Ibrahim', 'Hafiz', 24, 'Singapore', 'hafiz.ibrahim@example.com'),
  (6, 'Lee', 'Marcus', 51, 'Singapore', 'marcus.lee@example.com'),
  (7, 'Nair', 'Priya', 38, 'Singapore', NULL),
  (8, 'Goh', 'Wei Ming', 19, 'Singapore', 'weiming.goh@example.com');

-- --------------------------------------------------------------------
-- PersonOrders — Child table for the Persons FK demo — some rows point at persons who exist, one is deliberately unmatched.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS PersonOrders;
CREATE TABLE PersonOrders (
  OrderID INT PRIMARY KEY,
  OrderNumber INT,
  PersonID INT,
  OrderDate DATE,
  Amount DECIMAL(9,2),
  FOREIGN KEY (PersonID) REFERENCES Persons(ID)
);

INSERT INTO PersonOrders (OrderID, OrderNumber, PersonID, OrderDate, Amount) VALUES
  (1, 77895, 3, '2025-02-11', 128.4),
  (2, 44678, 3, '2025-03-04', 56.9),
  (3, 22456, 1, '2025-03-22', 312.75),
  (4, 24562, 1, '2025-05-08', 89.2),
  (5, 34764, 6, '2025-06-15', 204.6),
  (6, 51230, 2, '2025-07-30', 47.85),
  (7, 66120, 7, '2025-08-19', 156.3),
  (8, 71984, NULL, '2025-09-02', 63.1);
