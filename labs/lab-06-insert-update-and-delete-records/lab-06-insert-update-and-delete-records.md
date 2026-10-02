# Lab 6 — Insert, Update and Delete Records

**Topic 02 — Data Processing and Analysis** · SQL Masterclass (C024)

**Objective:** LO2 — process data by inserting, updating and deleting records.

**Goal:** Change data safely: INSERT a new product line, UPDATE prices with a WHERE clause, DELETE a discontinued record, and reload the dataset from the provided seed script.

**You'll build:** A modified Products table proving you can add, change and remove records — plus a cleanly reloaded database.

**Tools:** SQLite Studio, sgmart database, lab-06 seed script

![Lab 6 — SQL editor](../../figures/lab-06.png)

*Figure 6 — the SQL editor after running this lab's key statement.*

## Mock data for this lab

The data is in this same folder — CSV files you can open in Excel, plus a seed script that creates and fills the tables in one go.

| Table | Rows | What it holds |
|---|---:|---|
| [`Products`](Products.csv) | 25 | 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL). |
| [`Customers`](Customers.csv) | 60 | 60 loyalty members — tier, join date, points, birth year (some NULL) and home district. |
| [`Orders`](Orders.csv) | 180 | 180 sales orders across 2025 — outlet, member (NULL for walk-ins), cashier, channel, payment and status. |

**Quickest way to load it:** open [`seed_sqlite.sql`](seed_sqlite.sql) in the SQLite Studio SQL editor and execute the whole script. On MySQL or SQL Server use [`seed_mysql.sql`](seed_mysql.sql) instead. The complete course dataset — including an Excel workbook and a prebuilt `sgmart.db` — is in [`../_all/`](../_all/).

## Steps

1. SG Mart is adding a new bakery line. Insert it, supplying just the columns you know — the rest take their defaults.

   ```sql
   INSERT INTO Products (SKU, ProductName, CategoryCode, UnitOfMeasure, UnitCost, UnitPrice, SupplierID)
   VALUES ('SKU1026', 'Pandan Chiffon Cake 450g', 'CAT03', 'each', 4.50, 8.20, 'SUP04');
   ```

2. Verify the insert — find your new row.

   ```sql
   SELECT * FROM Products WHERE SKU = 'SKU1026';
   ```

3. Insert several rows in one statement — three new members joining at the Punggol launch.

   ```sql
   INSERT INTO Customers (CustomerID, FirstName, LastName, MemberTier, JoinDate, PointsBalance, BirthYear, District, Phone, Email)
   VALUES
     (1061, 'Wei Jie', 'Tan',  'Basic',  '2025-11-02', 0,    1996, 'Punggol', '9123 4567', 'weijie.tan@example.com'),
     (1062, 'Nur Syahirah', 'Osman', 'Basic', '2025-11-02', 50, 1990, 'Punggol', '8234 5678', NULL),
     (1063, 'Divya', 'Menon', 'Silver', '2025-11-03', 1200, 1988, 'Sengkang', '9345 6789', 'divya.menon@example.com');
   ```

4. Update records with a WHERE clause — a 10% price rise on every Beverages line. Always SELECT first to see what you are about to change.

   ```sql
   SELECT ProductName, UnitPrice FROM Products WHERE CategoryCode = 'CAT04';
   
   UPDATE Products
   SET UnitPrice = ROUND(UnitPrice * 1.10, 2)
   WHERE CategoryCode = 'CAT04';
   
   SELECT ProductName, UnitPrice FROM Products WHERE CategoryCode = 'CAT04';
   ```

5. Update more than one column at once — promote a member and credit bonus points.

   ```sql
   UPDATE Customers
   SET MemberTier = 'Gold',
       PointsBalance = PointsBalance + 500
   WHERE CustomerID = 1063;
   ```

6. Delete one specific record by its primary key. (Never run DELETE without WHERE — it removes every row.)

   ```sql
   DELETE FROM Products WHERE SKU = 'SKU1026';
   ```

7. Delete a set of rows with a condition — clear out the cancelled orders.

   ```sql
   SELECT COUNT(*) FROM Orders WHERE Status = 'Cancelled';
   DELETE FROM Orders WHERE Status = 'Cancelled';
   ```

8. Restore the database to its original state: open seed_sqlite.sql from this lab's dataset folder and execute it. The script drops and recreates every table, so your practice changes are undone.
9. Confirm the reload with row counts.

   ```sql
   SELECT COUNT(*) AS Products FROM Products;
   SELECT COUNT(*) AS Customers FROM Customers;
   SELECT COUNT(*) AS Orders FROM Orders;
   ```


## Test it

The SKU1026 row appears after the INSERT and is gone after the DELETE; the three new members are added; Beverages prices rise by 10% (Sparkling Water 1.5L goes from 2.35 to 2.59); and after reloading, the counts return 25 products, 60 customers and 180 orders.
