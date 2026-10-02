# Lab 8 — Join Data from Multiple Tables

**Topic 03 — Data Transformation** · SQL Masterclass (C024)

**Objective:** LO3 — transform data from multiple sources with joins and unions.

**Goal:** Combine tables: INNER JOIN orders to outlets and products, see how LEFT JOIN keeps the walk-in orders that have no member, chain three joins together, and emulate a FULL OUTER JOIN in SQLite using LEFT JOIN + UNION.

**You'll build:** Joined result-sets linking orders, outlets, customers and products, plus a full-outer-join of two practice tables showing matched and unmatched rows.

**Tools:** SQLite Studio, sgmart database, lab-08 dataset

![Lab 8 — SQL editor](../../figures/lab-08.png)

*Figure 8 — the SQL editor after running this lab's key statement.*

## Mock data for this lab

The data is in this same folder — CSV files you can open in Excel, plus a seed script that creates and fills the tables in one go.

| Table | Rows | What it holds |
|---|---:|---|
| [`Orders`](Orders.csv) | 180 | 180 sales orders across 2025 — outlet, member (NULL for walk-ins), cashier, channel, payment and status. |
| [`OrderItems`](OrderItems.csv) | 685 | Order lines (the fact table) — quantity, unit price, discount and line total. Makes SUM/AVG/GROUP BY meaningful. |
| [`Customers`](Customers.csv) | 60 | 60 loyalty members — tier, join date, points, birth year (some NULL) and home district. |
| [`Outlets`](Outlets.csv) | 8 | The 8 SG Mart retail outlets — code, name, planning area, postal sector, opening date and floor area. |
| [`Products`](Products.csv) | 25 | 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL). |
| [`left_t`](left_t.csv) | 4 | Practice table for the FULL OUTER JOIN emulation (ids 1-4). |
| [`right_t`](right_t.csv) | 4 | Practice table for the FULL OUTER JOIN emulation (ids 3-6). |

**Quickest way to load it:** open [`seed_sqlite.sql`](seed_sqlite.sql) in the SQLite Studio SQL editor and execute the whole script. On MySQL or SQL Server use [`seed_mysql.sql`](seed_mysql.sql) instead. The complete course dataset — including an Excel workbook and a prebuilt `sgmart.db` — is in [`../_all/`](../_all/).

## Steps

1. Inner join Orders and Outlets on the outlet code — each order with the branch that took it.

   ```sql
   SELECT o.OrderID, o.OrderDate, ot.OutletName, ot.District
   FROM Orders o
   INNER JOIN Outlets ot
     ON o.OutletCode = ot.OutletCode
   LIMIT 20;
   ```

2. Join the fact table to the item master — what was actually sold, line by line.

   ```sql
   SELECT oi.OrderID,
          p.ProductName,
          oi.Quantity,
          oi.LineTotal
   FROM OrderItems oi
   INNER JOIN Products p
     ON oi.SKU = p.SKU
   ORDER BY oi.LineTotal DESC
   LIMIT 15;
   ```

3. LEFT JOIN keeps every row of the left table even without a match — every order, with the member's name where there is one. Walk-ins show NULL.

   ```sql
   SELECT o.OrderID, o.OrderDate,
          c.FirstName, c.LastName
   FROM Orders o
   LEFT JOIN Customers c
     ON o.CustomerID = c.CustomerID
   ORDER BY o.OrderID
   LIMIT 25;
   ```

4. Isolate the unmatched rows — this is the standard 'find the orphans' pattern.

   ```sql
   SELECT COUNT(*) AS WalkInOrders
   FROM Orders o
   LEFT JOIN Customers c
     ON o.CustomerID = c.CustomerID
   WHERE c.CustomerID IS NULL;
   ```

5. Chain three joins to answer a real question: which outlet sold which product, and for how much?

   ```sql
   SELECT ot.OutletName,
          p.ProductName,
          ROUND(SUM(oi.LineTotal), 2) AS Revenue
   FROM Orders o
   INNER JOIN Outlets    ot ON o.OutletCode = ot.OutletCode
   INNER JOIN OrderItems oi ON o.OrderID    = oi.OrderID
   INNER JOIN Products   p  ON oi.SKU       = p.SKU
   GROUP BY ot.OutletName, p.ProductName
   ORDER BY Revenue DESC
   LIMIT 10;
   ```

6. Create two small practice tables to demonstrate a full outer join.

   ```sql
   DROP TABLE IF EXISTS left_t;
   DROP TABLE IF EXISTS right_t;
   CREATE TABLE left_t  ( id INTEGER, description TEXT );
   CREATE TABLE right_t ( id INTEGER, description TEXT );
   INSERT INTO left_t  VALUES (1,'left 01'),(2,'left 02'),(3,'left 03'),(4,'left 04');
   INSERT INTO right_t VALUES (3,'right 03'),(4,'right 04'),(5,'right 05'),(6,'right 06');
   ```

7. Older SQLite builds have no FULL OUTER JOIN keyword — emulate it with a LEFT JOIN in each direction combined by UNION. Alias every output column: after a UNION, ORDER BY can only refer to the result-set column names, so 'ORDER BY id' fails unless you name the column id.

   ```sql
   SELECT l.id AS id,
          l.description AS left_desc,
          r.description AS right_desc
   FROM left_t l LEFT JOIN right_t r ON l.id = r.id
   UNION
   SELECT r.id AS id,
          l.description AS left_desc,
          r.description AS right_desc
   FROM right_t r LEFT JOIN left_t l ON l.id = r.id
   ORDER BY id;
   ```


## Test it

The inner joins return only matched rows; the LEFT JOIN lists every order with NULL names for walk-ins and the orphan count returns 17; the three-way join is led by SG Mart outlets selling Pineapple Tarts; and the full-join emulation returns ids 1–6 with NULLs on the sides that have no match.
