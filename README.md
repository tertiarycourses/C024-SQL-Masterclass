# SQL Masterclass

A one-day, hands-on SQL course: model data, query and analyse it, transform it across multiple tables, and map it into a data warehouse — all in SQLite Studio against the SG Mart sample database.

| Course detail | Information |
|---|---|
| Course code | `C024` |
| Programme | Non-WSQ |
| Duration | 1 day · 7.5 instructional hours (9:30 am – 5:30 pm) |
| Registration | [View course details and register](https://www.tertiarycourses.com.sg/sql-masterclass.html) |
| Provider | Tertiary Infotech Academy Pte Ltd (UEN 201200696W) |

## About the course

SQL is the standard language for storing, manipulating and retrieving data in relational databases. This masterclass takes you from creating your first database to joining, grouping and summarising business data, and finishes with the data-warehouse concepts that sit behind analytics and reporting. Every lab works on one continuous business story — **SG Mart Pte Ltd**, a fictitious Singapore retail chain — so each query answers a real-looking business question.

## Learning outcomes

- **LO1** — Apply data modeling for business processes.
- **LO2** — Apply data processing and analysis using SQL.
- **LO3** — Apply data transformation from multiple data sources.
- **LO4** — Apply data mapping to data warehouse.

## Topics covered

1. **Data Modeling** — data sources, data modeling, SQL data types, creating and managing databases, constraints and keys.
2. **Data Processing and Analysis** — SELECT, DISTINCT, WHERE, operators, ORDER BY, LIMIT, aliases; INSERT, UPDATE and DELETE.
3. **Data Transformation** — aggregate functions, joins, UNION, GROUP BY and HAVING.
4. **Introduction to Data Warehouse** — warehouse concepts, OLAP, RDBMS, E-R mapping (SMRT case study) and stored procedures.

## Labs

- [Lab 1 — Set Up SQLite Studio & Import the SG Mart Database](labs/lab-01-set-up-sqlite-studio-import-the-sg-mart-database/lab-01-set-up-sqlite-studio-import-the-sg-mart-database.md)
- [Lab 2 — Create a Database and Tables](labs/lab-02-create-a-database-and-tables/lab-02-create-a-database-and-tables.md)
- [Lab 3 — Model Data with Constraints and Keys](labs/lab-03-model-data-with-constraints-and-keys/lab-03-model-data-with-constraints-and-keys.md)
- [Lab 4 — Query Data with SELECT](labs/lab-04-query-data-with-select/lab-04-query-data-with-select.md)
- [Lab 5 — Filter with SQL Operators](labs/lab-05-filter-with-sql-operators/lab-05-filter-with-sql-operators.md)
- [Lab 6 — Insert, Update and Delete Records](labs/lab-06-insert-update-and-delete-records/lab-06-insert-update-and-delete-records.md)
- [Lab 7 — Aggregate Data with COUNT, AVG and SUM](labs/lab-07-aggregate-data-with-count-avg-and-sum/lab-07-aggregate-data-with-count-avg-and-sum.md)
- [Lab 8 — Join Data from Multiple Tables](labs/lab-08-join-data-from-multiple-tables/lab-08-join-data-from-multiple-tables.md)
- [Lab 9 — Group Data with GROUP BY and HAVING](labs/lab-09-group-data-with-group-by-and-having/lab-09-group-data-with-group-by-and-having.md)
- [Lab 10 — Map an E-R Model to Database Tables (SMRT Case Study)](labs/lab-10-map-an-e-r-model-to-database-tables-smrt-case-st/lab-10-map-an-e-r-model-to-database-tables-smrt-case-st.md)
- [Lab 11 — Author Stored Procedures for SQL Server](labs/lab-11-author-stored-procedures-for-sql-server/lab-11-author-stored-procedures-for-sql-server.md)

Each lab is one self-contained folder: the step-by-step `.md`, the CSV data it needs and `seed_sqlite.sql` / `seed_mysql.sql`. The complete dataset (Excel workbook, prebuilt `sgmart.db`, every CSV) is in [labs/_all/](labs/_all/). See [labs/README.md](labs/README.md).

## Courseware in this repository

| Artifact | Files |
|---|---|
| Slide deck (119 slides) | [PPTX](courseware/SQL%20Masterclass-v1.pptx) · [PDF](courseware/SQL%20Masterclass-v1.pdf) |
| Lesson Plan | [DOCX](courseware/LP-SQL%20Masterclass.docx) · [PDF](courseware/LP-SQL%20Masterclass.pdf) |
| Learner Guide | [DOCX](courseware/LG-SQL%20Masterclass.docx) · [PDF](courseware/LG-SQL%20Masterclass.pdf) · [Markdown](LG-SQL%20Masterclass%20(C024).md) |
| Lab screenshots | [figures/](figures/) |

The slide deck is visual only — the detailed step-by-step procedures live in the Learner Guide and the lab files.

**Tools:** [SQLite Studio](https://sqlitestudio.pl) (free, cross-platform) or the browser-based [sqliteonline.com](https://sqliteonline.com), which also offers an MS SQL engine for Lab 11.

## Distribution

This repository holds the public learner courseware only. Superseded versions and trainer-only source material are kept out of the repository. All SG Mart and SMRT data is invented for training and identifies no real person or organisation.

---

© 2026 Tertiary Infotech Academy Pte Ltd · [www.tertiarycourses.com.sg](https://www.tertiarycourses.com.sg)
