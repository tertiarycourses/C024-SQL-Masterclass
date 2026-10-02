# SQL Masterclass — Hands-On Labs

**Course Code:** C024 · **Version v1** · Tertiary Infotech Academy Pte Ltd

Full step-by-step for every lab is also in the Learner Guide (LG). Labs run in SQLite Studio (https://sqlitestudio.pl) or https://sqliteonline.com.

## How the labs are organised

**Each lab is one folder holding everything that lab needs** — the instructions, the mock data as CSV, and the SQL seed scripts side by side:

```
lab-07-aggregate-data-with-count-avg-and-sum/
├── lab-07-aggregate-data-with-count-avg-and-sum.md   the step-by-step
├── Orders.csv  OrderItems.csv  Products.csv          the data (opens in Excel)
├── seed_sqlite.sql                                   create + fill, SQLite
└── seed_mysql.sql                                    the same for MySQL / SQL Server
```

Open the folder for the lab you are on, run `seed_sqlite.sql` in the SQL editor, and follow the `.md`.

The running example is **SG Mart Pte Ltd**, a fictitious Singapore retail chain (8 outlets, 42 staff, 60 members, 25 products, 180 orders, 685 order lines). Topic 4 switches to an **SMRT** transport model for the data-warehouse case study. All data is invented for training and identifies no real person or company.

The complete dataset — every table as CSV, an Excel workbook and a prebuilt `sgmart.db` — is in [`_all/`](_all/). The original sample databases from earlier versions of this course (`world.db`, `album.db`, `test.db` and their .sql scripts) are kept in [`legacy-datasets/`](legacy-datasets/).

## Topic 01 — Data Modeling

- [Lab 1: Set Up SQLite Studio & Import the SG Mart Database](lab-01-set-up-sqlite-studio-import-the-sg-mart-database/lab-01-set-up-sqlite-studio-import-the-sg-mart-database.md) — `Outlets`, `Products`, `Categories`
- [Lab 2: Create a Database and Tables](lab-02-create-a-database-and-tables/lab-02-create-a-database-and-tables.md) — `Outlets`, `Categories`, `Suppliers`, `Products`
- [Lab 3: Model Data with Constraints and Keys](lab-03-model-data-with-constraints-and-keys/lab-03-model-data-with-constraints-and-keys.md) — `Persons`, `PersonOrders`

## Topic 02 — Data Processing and Analysis

- [Lab 4: Query Data with SELECT](lab-04-query-data-with-select/lab-04-query-data-with-select.md) — `Products`, `Categories`, `Outlets`
- [Lab 5: Filter with SQL Operators](lab-05-filter-with-sql-operators/lab-05-filter-with-sql-operators.md) — `Customers`, `Products`, `Staff`
- [Lab 6: Insert, Update and Delete Records](lab-06-insert-update-and-delete-records/lab-06-insert-update-and-delete-records.md) — `Products`, `Customers`, `Orders`

## Topic 03 — Data Transformation

- [Lab 7: Aggregate Data with COUNT, AVG and SUM](lab-07-aggregate-data-with-count-avg-and-sum/lab-07-aggregate-data-with-count-avg-and-sum.md) — `Orders`, `OrderItems`, `Products`
- [Lab 8: Join Data from Multiple Tables](lab-08-join-data-from-multiple-tables/lab-08-join-data-from-multiple-tables.md) — `Orders`, `OrderItems`, `Customers`, `Outlets`, `Products`, `left_t`, `right_t`
- [Lab 9: Group Data with GROUP BY and HAVING](lab-09-group-data-with-group-by-and-having/lab-09-group-data-with-group-by-and-having.md) — `Orders`, `OrderItems`, `Products`, `Categories`, `Outlets`

## Topic 04 — Introduction to Data Warehouse

- [Lab 10: Map an E-R Model to Database Tables (SMRT Case Study)](lab-10-map-an-e-r-model-to-database-tables-smrt-case-st/lab-10-map-an-e-r-model-to-database-tables-smrt-case-st.md) — `Routes`, `Stations`, `Timetables`, `DisruptedRoutes`
- [Lab 11: Author Stored Procedures for SQL Server](lab-11-author-stored-procedures-for-sql-server/lab-11-author-stored-procedures-for-sql-server.md) — `Customers`, `Orders`, `Outlets`
