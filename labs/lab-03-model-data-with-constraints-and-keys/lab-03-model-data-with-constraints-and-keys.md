# Lab 3 — Model Data with Constraints and Keys

**Topic 01 — Data Modeling** · SQL Masterclass (C024)

**Objective:** LO1 — apply data modeling for business processes with constraints, keys and relationships.

**Goal:** Build a Persons–PersonOrders mini-model: enforce data rules with NOT NULL, UNIQUE, DEFAULT and CHECK, link the tables with a PRIMARY KEY / FOREIGN KEY relationship, and speed up searches with an index.

**You'll build:** A two-table data model (Persons ← PersonOrders) with working constraints, a foreign-key relationship and an index.

**Tools:** SQLite Studio, SQL Editor, lab-03 dataset (Persons + PersonOrders)

![Lab 3 — SQL editor](../../figures/lab-03.png)

*Figure 3 — the SQL editor after running this lab's key statement.*

## Mock data for this lab

The data is in this same folder — CSV files you can open in Excel, plus a seed script that creates and fills the tables in one go.

| Table | Rows | What it holds |
|---|---:|---|
| [`Persons`](Persons.csv) | 8 | Small Persons table for constraint practice (NOT NULL, UNIQUE, CHECK Age >= 18, DEFAULT City). |
| [`PersonOrders`](PersonOrders.csv) | 8 | Child table for the Persons FK demo — some rows point at persons who exist, one is deliberately unmatched. |

**Quickest way to load it:** open [`seed_sqlite.sql`](seed_sqlite.sql) in the SQLite Studio SQL editor and execute the whole script. On MySQL or SQL Server use [`seed_mysql.sql`](seed_mysql.sql) instead. The complete course dataset — including an Excel workbook and a prebuilt `sgmart.db` — is in [`../_all/`](../_all/).

## Steps

1. In the sgmart_practice database's SQL editor, create a Persons table that enforces NOT NULL, UNIQUE, DEFAULT and CHECK rules. SG Mart only issues accounts to adults, so Age must be 18 or over.

   ```sql
   DROP TABLE IF EXISTS Persons;
   CREATE TABLE Persons (
     ID        INTEGER NOT NULL UNIQUE,
     LastName  TEXT NOT NULL,
     FirstName TEXT,
     Age       INTEGER CHECK (Age >= 18),
     City      TEXT DEFAULT 'Singapore',
     Email     TEXT,
     PRIMARY KEY (ID)
   );
   ```

2. Prove the constraints work: this insert succeeds and fills City with the default value.

   ```sql
   INSERT INTO Persons (ID, LastName, FirstName, Age)
   VALUES (1, 'Tan', 'Alice', 30);
   SELECT * FROM Persons;
   ```

3. Now try to break the rules — each of these statements must FAIL (duplicate ID, NULL LastName, under-age CHECK). Run them one at a time and read the error message.

   ```sql
   INSERT INTO Persons (ID, LastName, Age) VALUES (1, 'Lim', 25);
   INSERT INTO Persons (ID, Age) VALUES (2, 40);
   INSERT INTO Persons (ID, LastName, Age) VALUES (3, 'Lee', 15);
   ```

4. Load the rest of the mock people from this lab's dataset — run seed_sqlite.sql, or paste these rows. Note Divya Kumar and Priya Nair have no email on file (NULL).

   ```sql
   INSERT INTO Persons (ID, LastName, FirstName, Age, City, Email) VALUES
     (2, 'Lim', 'Bryan', 42, 'Singapore', 'bryan.lim@example.com'),
     (3, 'Kumar', 'Divya', 27, 'Singapore', NULL),
     (4, 'Wong', 'Cheryl', 35, 'Johor Bahru', 'cheryl.wong@example.com'),
     (5, 'Ibrahim', 'Hafiz', 24, 'Singapore', 'hafiz.ibrahim@example.com'),
     (6, 'Lee', 'Marcus', 51, 'Singapore', 'marcus.lee@example.com'),
     (7, 'Nair', 'Priya', 38, 'Singapore', NULL),
     (8, 'Goh', 'Wei Ming', 19, 'Singapore', 'weiming.goh@example.com');
   ```

5. Create the PersonOrders table whose PersonID column is a FOREIGN KEY referencing Persons — the child table pointing at the parent.

   ```sql
   DROP TABLE IF EXISTS PersonOrders;
   CREATE TABLE PersonOrders (
     OrderID     INTEGER NOT NULL,
     OrderNumber INTEGER NOT NULL,
     PersonID    INTEGER,
     OrderDate   TEXT,
     Amount      REAL,
     PRIMARY KEY (OrderID),
     FOREIGN KEY (PersonID) REFERENCES Persons(ID)
   );
   ```

6. Load the order rows. The last one has a NULL PersonID — an order taken before the customer registered.

   ```sql
   INSERT INTO PersonOrders VALUES
     (1, 77895, 3, '2025-02-11', 128.40),
     (2, 44678, 3, '2025-03-04',  56.90),
     (3, 22456, 1, '2025-03-22', 312.75),
     (4, 24562, 1, '2025-05-08',  89.20),
     (5, 34764, 6, '2025-06-15', 204.60),
     (6, 51230, 2, '2025-07-30',  47.85),
     (7, 66120, 7, '2025-08-19', 156.30),
     (8, 71984, NULL, '2025-09-02', 63.10);
   ```

7. Check the relationship holds — list each order beside the person who placed it.

   ```sql
   SELECT o.OrderNumber, p.FirstName, p.LastName, o.Amount
   FROM PersonOrders o
   INNER JOIN Persons p ON o.PersonID = p.ID
   ORDER BY o.Amount DESC;
   ```

8. Add a column to an existing table with ALTER TABLE.

   ```sql
   ALTER TABLE Persons ADD MemberTier TEXT DEFAULT 'Basic';
   ```

9. Create an index so searches on LastName are fast.

   ```sql
   CREATE INDEX idx_lastname ON Persons (LastName);
   ```


## Test it

The valid insert appears in Persons with City = 'Singapore'; the three rule-breaking inserts each raise a constraint error; the join returns 7 matched orders led by 312.75; PersonOrders shows a foreign key to Persons in its DDL; and idx_lastname is listed under Indexes.
