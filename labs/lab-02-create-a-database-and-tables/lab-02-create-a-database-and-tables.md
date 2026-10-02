# Lab 2 — Create a Database and Tables

**Topic 01 — Data Modeling** · SQL Masterclass (C024)

**Objective:** LO1 — create and manage databases and tables with SQL DDL.

**Goal:** Create your own database named 'sgmart_practice' and build the Outlets, Categories, Suppliers and Products tables with CREATE TABLE, choosing an appropriate data type for every column.

**You'll build:** A new 'sgmart_practice' database containing four tables whose columns, data types and defaults model the SG Mart retail business.

**Tools:** SQLite Studio, SQL Editor, lab-02 dataset (CSV + seed script)

![Lab 2 — SQL editor](../../figures/lab-02.png)

*Figure 2 — the SQL editor after running this lab's key statement.*

## Mock data for this lab

The data is in this same folder — CSV files you can open in Excel, plus a seed script that creates and fills the tables in one go.

| Table | Rows | What it holds |
|---|---:|---|
| [`Outlets`](Outlets.csv) | 8 | The 8 SG Mart retail outlets — code, name, planning area, postal sector, opening date and floor area. |
| [`Categories`](Categories.csv) | 8 | 8 product categories grouped into Perishables, Packaged and Non-Food. |
| [`Suppliers`](Suppliers.csv) | 9 | 9 suppliers with contact details, country of origin and lead time in days. |
| [`Products`](Products.csv) | 25 | 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL). |

**Quickest way to load it:** open [`seed_sqlite.sql`](seed_sqlite.sql) in the SQLite Studio SQL editor and execute the whole script. On MySQL or SQL Server use [`seed_mysql.sql`](seed_mysql.sql) instead. The complete course dataset — including an Excel workbook and a prebuilt `sgmart.db` — is in [`../_all/`](../_all/).

## Steps

1. In SQLite Studio click Database → Add a database, then click the green '+' (plus) icon, name the new database file sgmart_practice and save it. Connect to it from the Databases panel.
2. Open the SQL editor: go to Tools → Open SQL editor. Make sure the active database (top of the editor) is sgmart_practice.
3. Create the Outlets table — the retail branches. Note the TEXT primary key and the REAL column for floor area.

   ```sql
   DROP TABLE IF EXISTS Outlets;
   CREATE TABLE Outlets (
     OutletCode   TEXT PRIMARY KEY,
     OutletName   TEXT NOT NULL DEFAULT '',
     District     TEXT NOT NULL DEFAULT '',
     PostalSector TEXT NOT NULL DEFAULT '',
     OpenedDate   TEXT,
     FloorAreaSqm REAL DEFAULT 0.0
   );
   ```

4. Create the Categories table — how SG Mart groups what it sells.

   ```sql
   DROP TABLE IF EXISTS Categories;
   CREATE TABLE Categories (
     CategoryCode  TEXT PRIMARY KEY,
     CategoryName  TEXT NOT NULL DEFAULT '',
     CategoryGroup TEXT NOT NULL DEFAULT 'Packaged'
   );
   ```

5. Create the Suppliers table, including a lead time in days used later for reorder planning.

   ```sql
   DROP TABLE IF EXISTS Suppliers;
   CREATE TABLE Suppliers (
     SupplierID   TEXT PRIMARY KEY,
     SupplierName TEXT NOT NULL DEFAULT '',
     Address      TEXT,
     Phone        TEXT,
     Country      TEXT NOT NULL DEFAULT 'Singapore',
     LeadTimeDays INTEGER DEFAULT 14
   );
   ```

6. Create the Products table — the item master. Cost and price are REAL, IsActive is a 0/1 flag.

   ```sql
   DROP TABLE IF EXISTS Products;
   CREATE TABLE Products (
     SKU           TEXT PRIMARY KEY,
     ProductName   TEXT NOT NULL DEFAULT '',
     CategoryCode  TEXT NOT NULL DEFAULT '',
     UnitOfMeasure TEXT NOT NULL DEFAULT 'each',
     UnitCost      REAL DEFAULT NULL,
     UnitPrice     REAL DEFAULT NULL,
     SupplierID    TEXT,
     ReorderLevel  INTEGER DEFAULT NULL,
     IsActive      INTEGER NOT NULL DEFAULT 1
   );
   ```

7. Load the mock data: open seed_sqlite.sql from this lab's dataset folder and execute the whole script. It fills all four tables. (Or use Tools → Import to load each CSV instead.)
8. Right-click the sgmart_practice database and choose Refresh — the four tables appear. Open each table's Structure tab to verify the columns and data types, then check the row counts.

   ```sql
   SELECT COUNT(*) AS Outlets FROM Outlets;
   SELECT COUNT(*) AS Categories FROM Categories;
   SELECT COUNT(*) AS Suppliers FROM Suppliers;
   SELECT COUNT(*) AS Products FROM Products;
   ```


## Test it

The sgmart_practice database lists Outlets, Categories, Suppliers and Products; each Structure tab shows the declared columns, data types, defaults and primary keys; and the counts return 8, 8, 9 and 25 rows.
