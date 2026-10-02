-- Lab 1 — Set Up SQLite Studio & Import the SG Mart Database: mock data
-- SQL Masterclass (C024) · v1 · Tertiary Infotech Academy Pte Ltd
-- Dialect: MySQL / MS SQL
-- Load: open this file in your SQL editor and execute the whole script.

-- --------------------------------------------------------------------
-- Outlets — The 8 SG Mart retail outlets — code, name, planning area, postal sector, opening date and floor area.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Outlets;
CREATE TABLE Outlets (
  OutletCode VARCHAR(5) PRIMARY KEY,
  OutletName VARCHAR(60),
  District VARCHAR(40),
  PostalSector VARCHAR(3),
  OpenedDate DATE,
  FloorAreaSqm DECIMAL(8,1)
);

INSERT INTO Outlets (OutletCode, OutletName, District, PostalSector, OpenedDate, FloorAreaSqm) VALUES
  ('OTL01', 'SG Mart Orchard', 'Orchard', '238', '2015-03-02', 1250.0),
  ('OTL02', 'SG Mart Tampines Hub', 'Tampines', '529', '2017-08-18', 1680.5),
  ('OTL03', 'SG Mart Jurong East', 'Jurong East', '609', '2016-01-25', 1420.0),
  ('OTL04', 'SG Mart Woodlands', 'Woodlands', '738', '2018-11-09', 1105.0),
  ('OTL05', 'SG Mart Bedok Mall', 'Bedok', '469', '2019-05-14', 980.0),
  ('OTL06', 'SG Mart Punggol Waterway', 'Punggol', '828', '2021-02-26', 1310.0),
  ('OTL07', 'SG Mart Clementi', 'Clementi', '129', '2014-07-01', 875.5),
  ('OTL08', 'SG Mart Serangoon NEX', 'Serangoon', '556', '2020-09-30', 1540.0);

-- --------------------------------------------------------------------
-- Categories — 8 product categories grouped into Perishables, Packaged and Non-Food.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories (
  CategoryCode VARCHAR(5) PRIMARY KEY,
  CategoryName VARCHAR(40),
  CategoryGroup VARCHAR(20)
);

INSERT INTO Categories (CategoryCode, CategoryName, CategoryGroup) VALUES
  ('CAT01', 'Fresh Produce', 'Perishables'),
  ('CAT02', 'Dairy & Chilled', 'Perishables'),
  ('CAT03', 'Bakery', 'Perishables'),
  ('CAT04', 'Beverages', 'Packaged'),
  ('CAT05', 'Snacks', 'Packaged'),
  ('CAT06', 'Household', 'Non-Food'),
  ('CAT07', 'Personal Care', 'Non-Food'),
  ('CAT08', 'Frozen', 'Perishables');

-- --------------------------------------------------------------------
-- Products — 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL).
-- --------------------------------------------------------------------
-- Note: this lab does not ship Suppliers, so the foreign key(s) SupplierID -> Suppliers(SupplierID)
-- are omitted here. The full model with every relationship is in _all/.
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  SKU VARCHAR(8) PRIMARY KEY,
  ProductName VARCHAR(60),
  CategoryCode VARCHAR(5),
  UnitOfMeasure VARCHAR(10),
  UnitCost DECIMAL(8,2),
  UnitPrice DECIMAL(8,2),
  SupplierID VARCHAR(5),
  ReorderLevel INT,
  IsActive TINYINT,
  FOREIGN KEY (CategoryCode) REFERENCES Categories(CategoryCode)
);

INSERT INTO Products (SKU, ProductName, CategoryCode, UnitOfMeasure, UnitCost, UnitPrice, SupplierID, ReorderLevel, IsActive) VALUES
  ('SKU1001', 'Cameron Highlands Tomatoes 500g', 'CAT01', 'pack', 1.8, 3.2, 'SUP01', 48, 1),
  ('SKU1002', 'Baby Spinach 200g', 'CAT01', 'pack', 1.55, 2.9, 'SUP01', 48, 1),
  ('SKU1003', 'Australian Navel Orange 1kg', 'CAT01', 'kg', 3.4, 5.95, 'SUP02', 24, 1),
  ('SKU1004', 'Golden Banana 1kg', 'CAT01', 'kg', 1.95, 3.5, 'SUP02', 36, 1),
  ('SKU1005', 'Fresh Milk 1L', 'CAT02', 'bottle', 2.35, 3.85, 'SUP03', NULL, 1),
  ('SKU1006', 'Greek Yoghurt 500g', 'CAT02', 'tub', 3.1, 5.4, 'SUP03', 36, 1),
  ('SKU1007', 'Cheddar Slices 250g', 'CAT02', 'pack', 3.75, 6.2, 'SUP03', 24, 1),
  ('SKU1008', 'Wholemeal Loaf 400g', 'CAT03', 'loaf', 1.6, 2.8, 'SUP04', 36, 1),
  ('SKU1009', 'Kaya Bun 4s', 'CAT03', 'pack', 1.9, 3.4, 'SUP04', 12, 0),
  ('SKU1010', 'Kopi-O Ground Coffee 500g', 'CAT04', 'pack', 5.2, 8.9, 'SUP05', 12, 1),
  ('SKU1011', 'Teh Tarik Mix 20s', 'CAT04', 'box', 4.1, 6.95, 'SUP05', 12, 1),
  ('SKU1012', 'Sparkling Water 1.5L', 'CAT04', 'bottle', 1.25, 2.35, 'SUP05', 12, 1),
  ('SKU1013', 'Isotonic Drink 500ml', 'CAT04', 'bottle', 1.1, 2.1, 'SUP05', 12, 1),
  ('SKU1014', 'Prawn Crackers 150g', 'CAT05', 'pack', 1.85, 3.3, 'SUP06', 36, 1),
  ('SKU1015', 'Seaweed Snack 12s', 'CAT05', 'box', 3.2, 5.6, 'SUP06', 24, 1),
  ('SKU1016', 'Pineapple Tarts 300g', 'CAT05', 'tub', 6.4, 11.9, 'SUP06', 12, 0),
  ('SKU1017', 'Laundry Detergent 2L', 'CAT06', 'bottle', 6.8, 11.5, 'SUP07', 12, 1),
  ('SKU1018', 'Dishwashing Liquid 900ml', 'CAT06', 'bottle', 2.45, 4.3, 'SUP07', NULL, 1),
  ('SKU1019', 'Kitchen Towel 4 rolls', 'CAT06', 'pack', 3.6, 6.1, 'SUP07', 12, 1),
  ('SKU1020', 'Hand Soap Refill 1L', 'CAT07', 'pouch', 3.15, 5.5, 'SUP08', 12, 1),
  ('SKU1021', 'Toothpaste 150g', 'CAT07', 'tube', 2.7, 4.8, 'SUP08', 48, 1),
  ('SKU1022', 'Shampoo 400ml', 'CAT07', 'bottle', 5.4, 9.2, 'SUP08', 36, 1),
  ('SKU1023', 'Frozen Prawn Dumpling 400g', 'CAT08', 'pack', 4.9, 8.4, 'SUP09', 36, 1),
  ('SKU1024', 'Frozen Roti Prata 20s', 'CAT08', 'pack', 4.2, 7.3, 'SUP09', 48, 0),
  ('SKU1025', 'Vanilla Ice Cream 1L', 'CAT08', 'tub', 5.6, 9.8, 'SUP09', 24, 1);
