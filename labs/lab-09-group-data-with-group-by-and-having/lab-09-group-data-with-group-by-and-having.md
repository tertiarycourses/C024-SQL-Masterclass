# Lab 9 — Group Data with GROUP BY and HAVING

**Topic 03 — Data Transformation** · SQL Masterclass (C024)

**Objective:** LO3 — transform data by grouping and filtering groups.

**Goal:** Aggregate per group: revenue by outlet and by category with GROUP BY, then keep only the groups that matter with HAVING — and see why HAVING exists where WHERE cannot go.

**You'll build:** Grouped sales summaries of the SG Mart data — per-outlet and per-category totals, filtered to the groups that matter.

**Tools:** SQLite Studio, sgmart database, lab-09 dataset

![Lab 9 — SQL editor](../../figures/lab-09.png)

*Figure 9 — the SQL editor after running this lab's key statement.*

## Mock data for this lab

The data is in this same folder — CSV files you can open in Excel, plus a seed script that creates and fills the tables in one go.

| Table | Rows | What it holds |
|---|---:|---|
| [`Orders`](Orders.csv) | 180 | 180 sales orders across 2025 — outlet, member (NULL for walk-ins), cashier, channel, payment and status. |
| [`OrderItems`](OrderItems.csv) | 685 | Order lines (the fact table) — quantity, unit price, discount and line total. Makes SUM/AVG/GROUP BY meaningful. |
| [`Products`](Products.csv) | 25 | 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL). |
| [`Categories`](Categories.csv) | 8 | 8 product categories grouped into Perishables, Packaged and Non-Food. |
| [`Outlets`](Outlets.csv) | 8 | The 8 SG Mart retail outlets — code, name, planning area, postal sector, opening date and floor area. |

**Quickest way to load it:** open [`seed_sqlite.sql`](seed_sqlite.sql) in the SQLite Studio SQL editor and execute the whole script. On MySQL or SQL Server use [`seed_mysql.sql`](seed_mysql.sql) instead. The complete course dataset — including an Excel workbook and a prebuilt `sgmart.db` — is in [`../_all/`](../_all/).

## Steps

1. Count the orders taken by each outlet — one row per group.

   ```sql
   SELECT OutletCode, COUNT(*) AS Orders
   FROM Orders
   GROUP BY OutletCode
   ORDER BY Orders DESC;
   ```

2. Group across a join — total revenue per outlet, with a readable name and alias.

   ```sql
   SELECT ot.OutletName,
          ROUND(SUM(oi.LineTotal), 2) AS Revenue
   FROM Orders o
   INNER JOIN Outlets    ot ON o.OutletCode = ot.OutletCode
   INNER JOIN OrderItems oi ON o.OrderID    = oi.OrderID
   GROUP BY ot.OutletName
   ORDER BY Revenue DESC;
   ```

3. Group by a different dimension — how customers prefer to pay.

   ```sql
   SELECT PaymentMethod, COUNT(*) AS Orders
   FROM Orders
   GROUP BY PaymentMethod
   ORDER BY Orders DESC;
   ```

4. Keep only the groups whose average line exceeds $13 — WHERE cannot filter aggregates, HAVING can.

   ```sql
   SELECT o.OutletCode,
          ROUND(AVG(oi.LineTotal), 2) AS AvgLine
   FROM Orders o
   INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID
   GROUP BY o.OutletCode
   HAVING AVG(oi.LineTotal) > 13
   ORDER BY AvgLine DESC;
   ```

5. Find your loyal customers — members who placed 4 or more orders.

   ```sql
   SELECT c.FirstName, c.LastName, c.MemberTier,
          COUNT(*) AS Orders
   FROM Orders o
   INNER JOIN Customers c ON o.CustomerID = c.CustomerID
   GROUP BY c.CustomerID, c.FirstName, c.LastName, c.MemberTier
   HAVING COUNT(*) >= 4
   ORDER BY Orders DESC;
   ```

6. Use all three clauses together — WHERE filters rows BEFORE grouping, HAVING filters groups AFTER. Revenue by category for completed orders only, keeping the categories above $1,000.

   ```sql
   SELECT cat.CategoryName,
          ROUND(SUM(oi.LineTotal), 2) AS Revenue,
          COUNT(*)                    AS Lines
   FROM Orders o
   INNER JOIN OrderItems oi ON o.OrderID     = oi.OrderID
   INNER JOIN Products   p  ON oi.SKU        = p.SKU
   INNER JOIN Categories cat ON p.CategoryCode = cat.CategoryCode
   WHERE o.Status = 'Completed'
   GROUP BY cat.CategoryName
   HAVING SUM(oi.LineTotal) > 1000
   ORDER BY Revenue DESC;
   ```


## Test it

The GROUP BY query returns one row per outlet (8 rows, led by OTL08 with 28 orders); revenue by outlet is led by SG Mart Serangoon NEX at 1496.82; the HAVING > 13 query returns the 5 qualifying outlets; and 18 members have 4 or more orders.
