# Mock Datasets — SQL Masterclass

**C024** · v1 · Tertiary Infotech Academy Pte Ltd

This folder holds the **complete** course dataset: every table as CSV, an Excel workbook and a prebuilt `sgmart.db`. Each individual lab also carries just the tables it needs, in that lab's own folder beside its instructions.

## The business story

**SG Mart Pte Ltd** is a fictitious Singapore retail chain with 8 outlets. You will model its outlets, staff, customers, suppliers, products, orders and order lines. Topic 4 switches to an **SMRT** public-transport model (routes, stations, timetables and service disruptions) for the data-warehouse case study.

> All data is invented for training. Names, phone numbers, emails and badge numbers do not identify any real person or organisation.

## Which lab uses which tables

| Lab | Title | Tables |
|---|---|---|
| 1 | [Set Up SQLite Studio & Import the SG Mart Database](../lab-01-set-up-sqlite-studio-import-the-sg-mart-database/) | `Outlets`, `Categories`, `Products` |
| 2 | [Create a Database and Tables](../lab-02-create-a-database-and-tables/) | `Outlets`, `Categories`, `Suppliers`, `Products` |
| 3 | [Model Data with Constraints and Keys](../lab-03-model-data-with-constraints-and-keys/) | `Persons`, `PersonOrders` |
| 4 | [Query Data with SELECT](../lab-04-query-data-with-select/) | `Outlets`, `Categories`, `Products` |
| 5 | [Filter with SQL Operators](../lab-05-filter-with-sql-operators/) | `Customers`, `Staff`, `Products` |
| 6 | [Insert, Update and Delete Records](../lab-06-insert-update-and-delete-records/) | `Customers`, `Products`, `Orders` |
| 7 | [Aggregate Data with COUNT, AVG and SUM](../lab-07-aggregate-data-with-count-avg-and-sum/) | `Products`, `Orders`, `OrderItems` |
| 8 | [Join Data from Multiple Tables](../lab-08-join-data-from-multiple-tables/) | `Outlets`, `Customers`, `Products`, `Orders`, `OrderItems`, `left_t`, `right_t` |
| 9 | [Group Data with GROUP BY and HAVING](../lab-09-group-data-with-group-by-and-having/) | `Outlets`, `Categories`, `Products`, `Orders`, `OrderItems` |
| 10 | [Map an E-R Model to Database Tables (SMRT Case Study)](../lab-10-map-an-e-r-model-to-database-tables-smrt-case-st/) | `Routes`, `Stations`, `Timetables`, `DisruptedRoutes` |
| 11 | [Author Stored Procedures for SQL Server](../lab-11-author-stored-procedures-for-sql-server/) | `Outlets`, `Customers`, `Orders` |

## Files in this folder

| File | What it is |
|---|---|
| `SG-Mart-Mock-Data.xlsx` | Excel workbook, one sheet per table (filters + frozen headers) |
| `sgmart.db` | Prebuilt SQLite database — add it in SQLite Studio and connect |
| `seed_sqlite.sql` | Every table as DROP/CREATE/INSERT for SQLite |
| `seed_mysql.sql` | The same for MySQL / SQL Server |
| `*.csv` | One CSV per table |

## Table reference

| Table | Rows | Description |
|---|---:|---|
| `Outlets` | 8 | The 8 SG Mart retail outlets — code, name, planning area, postal sector, opening date and floor area. |
| `Categories` | 8 | 8 product categories grouped into Perishables, Packaged and Non-Food. |
| `Suppliers` | 9 | 9 suppliers with contact details, country of origin and lead time in days. |
| `Customers` | 60 | 60 loyalty members — tier, join date, points, birth year (some NULL) and home district. |
| `Staff` | 42 | 42 employees across the 8 outlets — role, salary, hire date and contact details (some emails are NULL on purpose). |
| `Products` | 25 | 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL). |
| `Orders` | 180 | 180 sales orders across 2025 — outlet, member (NULL for walk-ins), cashier, channel, payment and status. |
| `OrderItems` | 685 | Order lines (the fact table) — quantity, unit price, discount and line total. Makes SUM/AVG/GROUP BY meaningful. |
| `Routes` | 8 | 8 SMRT routes (6 MRT lines + 2 bus services) — the parent entity of the transport E-R model. |
| `Stations` | 14 | 14 MRT stations with line position, interchange flag and opening date. |
| `Timetables` | 42 | 42 timetable rows — first/last trip and frequency per station for weekday, Saturday and Sunday/PH. |
| `DisruptedRoutes` | 6 | 6 service disruptions in 2025 — type, details, start time, duration and the alternative arrangements offered. |
| `Persons` | 8 | Small Persons table for constraint practice (NOT NULL, UNIQUE, CHECK Age >= 18, DEFAULT City). |
| `PersonOrders` | 8 | Child table for the Persons FK demo — some rows point at persons who exist, one is deliberately unmatched. |
| `left_t` | 4 | Practice table for the FULL OUTER JOIN emulation (ids 1-4). |
| `right_t` | 4 | Practice table for the FULL OUTER JOIN emulation (ids 3-6). |
