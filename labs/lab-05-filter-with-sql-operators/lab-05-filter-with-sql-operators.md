# Lab 5 — Filter with SQL Operators

**Topic 02 — Data Processing and Analysis** · SQL Masterclass (C024)

**Objective:** LO2 — analyse data with operators, patterns and sorting.

**Goal:** Sharpen your WHERE clauses with AND/OR/NOT, IN, BETWEEN, LIKE wildcards, NULL tests and aliases to slice the SG Mart customer and staff data precisely.

**You'll build:** A query toolkit covering every SQL operator, answering pattern- and range-based questions on the SG Mart data.

**Tools:** SQLite Studio, sgmart database, lab-05 dataset

![Lab 5 — SQL editor](../../figures/lab-05.png)

*Figure 5 — the SQL editor after running this lab's key statement.*

## Mock data for this lab

The data is in this same folder — CSV files you can open in Excel, plus a seed script that creates and fills the tables in one go.

| Table | Rows | What it holds |
|---|---:|---|
| [`Customers`](Customers.csv) | 60 | 60 loyalty members — tier, join date, points, birth year (some NULL) and home district. |
| [`Products`](Products.csv) | 25 | 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL). |
| [`Staff`](Staff.csv) | 42 | 42 employees across the 8 outlets — role, salary, hire date and contact details (some emails are NULL on purpose). |

**Quickest way to load it:** open [`seed_sqlite.sql`](seed_sqlite.sql) in the SQLite Studio SQL editor and execute the whole script. On MySQL or SQL Server use [`seed_mysql.sql`](seed_mysql.sql) instead. The complete course dataset — including an Excel workbook and a prebuilt `sgmart.db` — is in [`../_all/`](../_all/).

## Steps

1. Combine conditions with AND — Store Managers earning more than $6,000 a month.

   ```sql
   SELECT FirstName, LastName, Role, MonthlySalary
   FROM Staff
   WHERE Role = 'Store Manager'
     AND MonthlySalary > 6000;
   ```

2. Use OR and NOT — everyone who is NOT a Cashier but works part-time.

   ```sql
   SELECT FirstName, LastName, Role, Employment
   FROM Staff
   WHERE NOT Role = 'Cashier'
     AND Employment = 'Part-Time';
   ```

3. Match a list of values with IN — members on the two premium tiers.

   ```sql
   SELECT FirstName, LastName, MemberTier, PointsBalance
   FROM Customers
   WHERE MemberTier IN ('Gold', 'Platinum')
   ORDER BY PointsBalance DESC;
   ```

4. Select a range with BETWEEN — everyday products priced between $3 and $6.

   ```sql
   SELECT ProductName, UnitPrice
   FROM Products
   WHERE UnitPrice BETWEEN 3.00 AND 6.00
   ORDER BY UnitPrice;
   ```

5. Find patterns with LIKE — every frozen line (the % wildcard matches any characters).

   ```sql
   SELECT ProductName, UnitPrice
   FROM Products
   WHERE ProductName LIKE 'Frozen%'
   ORDER BY ProductName;
   ```

6. LIKE also matches mid-string — anything sold in a bottle, whatever the size.

   ```sql
   SELECT ProductName, UnitOfMeasure
   FROM Products
   WHERE UnitOfMeasure LIKE '%bottle%';
   ```

7. Test for missing values with IS NULL — staff with no work email on file — and rename a column with an alias.

   ```sql
   SELECT FirstName || ' ' || LastName AS StaffName,
          Role AS JobTitle,
          Email
   FROM Staff
   WHERE Email IS NULL;
   ```

8. The opposite test — members who DID give a birth year, so marketing can run a birthday campaign.

   ```sql
   SELECT FirstName, LastName, BirthYear
   FROM Customers
   WHERE BirthYear IS NOT NULL
   ORDER BY BirthYear
   LIMIT 10;
   ```


## Test it

The IN query returns 16 Gold and Platinum members ordered by points; BETWEEN returns 11 products from $3.20 to $5.95; LIKE 'Frozen%' returns the 2 frozen lines; and IS NULL returns the 5 staff with no email, shown under the alias StaffName.
