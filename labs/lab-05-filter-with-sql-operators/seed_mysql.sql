-- Lab 5 — Filter with SQL Operators: mock data
-- SQL Masterclass (C024) · v1 · Tertiary Infotech Academy Pte Ltd
-- Dialect: MySQL / MS SQL
-- Load: open this file in your SQL editor and execute the whole script.

-- --------------------------------------------------------------------
-- Customers — 60 loyalty members — tier, join date, points, birth year (some NULL) and home district.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(40),
  LastName VARCHAR(40),
  MemberTier VARCHAR(10),
  JoinDate DATE,
  PointsBalance INT,
  BirthYear INT,
  District VARCHAR(40),
  Phone VARCHAR(12),
  Email VARCHAR(80)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, MemberTier, JoinDate, PointsBalance, BirthYear, District, Phone, Email) VALUES
  (1001, 'Ethan', 'Chan', 'Basic', '2022-02-01', 66, 1972, 'Tampines', '9312 8829', 'ethan.chan1@example.com'),
  (1002, 'Hui Ling', 'Chan', 'Silver', '2023-04-11', 1485, 1975, 'Bedok', '8955 3598', 'hui.chan2@example.com'),
  (1003, 'Muhammad Faiz', 'Abdullah', 'Platinum', '2019-12-21', 14243, NULL, 'Clementi', '8459 2358', 'muhammad.abdullah3@example.com'),
  (1004, 'Yong Sheng', 'Chua', 'Silver', '2024-06-02', 2811, 1971, 'Clementi', '8862 2254', 'yong.chua4@example.com'),
  (1005, 'Marcus', 'Teo', 'Silver', '2021-07-12', 3734, 1999, 'Bedok', '9381 4823', NULL),
  (1006, 'Bryan', 'Lim', 'Gold', '2023-02-08', 10195, 1972, 'Punggol', '9684 2264', 'bryan.lim6@example.com'),
  (1007, 'Arif', 'Abdullah', 'Silver', '2023-03-26', 2039, 1994, 'Woodlands', '8318 8307', 'arif.abdullah7@example.com'),
  (1008, 'Prakash', 'Kumar', 'Gold', '2021-06-28', 8214, 1976, 'Jurong East', '8149 8307', 'prakash.kumar8@example.com'),
  (1009, 'Arif', 'Abdullah', 'Basic', '2021-08-17', 598, 2003, 'Orchard', '9813 1958', 'arif.abdullah9@example.com'),
  (1010, 'Kai Xuan', 'Tan', 'Silver', '2021-02-14', 2596, 1984, 'Serangoon', '9205 9772', 'kai.tan10@example.com'),
  (1011, 'Wei Ming', 'Lee', 'Basic', '2022-10-28', 883, 1959, 'Tampines', '9570 9933', 'wei.lee11@example.com'),
  (1012, 'Denise', 'Sim', 'Basic', '2023-01-13', 552, 1987, 'Jurong East', '9146 7256', 'denise.sim12@example.com'),
  (1013, 'Grace', 'Lee', 'Platinum', '2022-06-23', 24170, 2003, 'Punggol', '8749 4213', 'grace.lee13@example.com'),
  (1014, 'Marcus', 'Chan', 'Basic', '2020-09-27', 300, NULL, 'Bedok', '9896 6303', 'marcus.chan14@example.com'),
  (1015, 'Ethan', 'Ng', 'Basic', '2023-09-06', 484, 1968, 'Clementi', '8721 9846', 'ethan.ng15@example.com'),
  (1016, 'Rachel', 'Lee', 'Basic', '2020-12-05', 289, 1994, 'Bedok', '8446 4407', 'rachel.lee16@example.com'),
  (1017, 'Lakshmi', 'Pillai', 'Silver', '2020-11-02', 2460, 1972, 'Clementi', '9950 9008', 'lakshmi.pillai17@example.com'),
  (1018, 'Mei Ling', 'Chan', 'Platinum', '2023-02-18', 22741, 1968, 'Bedok', '8536 8499', NULL),
  (1019, 'Xin Yi', 'Koh', 'Basic', '2020-08-06', 39, 1994, 'Clementi', '8999 6538', 'xin.koh19@example.com'),
  (1020, 'Xin Yi', 'Chan', 'Basic', '2019-01-27', 103, 1970, 'Jurong East', '8604 6859', 'xin.chan20@example.com'),
  (1021, 'Hidayah', 'Abdullah', 'Silver', '2023-08-16', 1126, 1993, 'Orchard', '9366 3311', 'hidayah.abdullah21@example.com'),
  (1022, 'Kai Xuan', 'Ong', 'Silver', '2022-10-27', 3522, 1970, 'Woodlands', '9982 8054', 'kai.ong22@example.com'),
  (1023, 'Hui Ling', 'Ng', 'Gold', '2023-06-12', 6826, 1962, 'Orchard', '9932 7659', 'hui.ng23@example.com'),
  (1024, 'Cheryl', 'Sim', 'Basic', '2019-12-21', 348, 1968, 'Clementi', '8758 7478', 'cheryl.sim24@example.com'),
  (1025, 'Zhi Hao', 'Chua', 'Silver', '2023-09-29', 2829, NULL, 'Clementi', '8697 4387', 'zhi.chua25@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, MemberTier, JoinDate, PointsBalance, BirthYear, District, Phone, Email) VALUES
  (1026, 'Rajesh', 'Krishnan', 'Basic', '2024-07-17', 724, 1962, 'Jurong East', '9626 8777', 'rajesh.krishnan26@example.com'),
  (1027, 'Cheryl', 'Ng', 'Platinum', '2019-10-01', 20954, 1995, 'Woodlands', '8872 9291', 'cheryl.ng27@example.com'),
  (1028, 'Xin Yi', 'Chan', 'Gold', '2023-12-09', 7522, 1962, 'Tampines', '9677 3511', 'xin.chan28@example.com'),
  (1029, 'Hafiz', 'Abdullah', 'Silver', '2019-11-01', 3827, 1975, 'Orchard', '8230 8559', 'hafiz.abdullah29@example.com'),
  (1030, 'Ethan', 'Tan', 'Silver', '2020-06-10', 2120, 1994, 'Serangoon', '8615 4695', 'ethan.tan30@example.com'),
  (1031, 'Chloe', 'Ng', 'Gold', '2024-02-22', 10385, 1963, 'Clementi', '9889 6298', NULL),
  (1032, 'Grace', 'Lim', 'Silver', '2020-06-15', 3337, 1965, 'Tampines', '8190 3298', 'grace.lim32@example.com'),
  (1033, 'Bryan', 'Lee', 'Basic', '2023-07-29', 157, 1998, 'Serangoon', '8278 5222', 'bryan.lee33@example.com'),
  (1034, 'Jun Hao', 'Wong', 'Silver', '2022-04-25', 1300, 1964, 'Orchard', '8401 3102', 'jun.wong34@example.com'),
  (1035, 'Yong Sheng', 'Goh', 'Silver', '2019-11-30', 3594, 1988, 'Punggol', '8464 8896', 'yong.goh35@example.com'),
  (1036, 'Jia Hui', 'Wong', 'Gold', '2021-03-23', 8164, NULL, 'Orchard', '8160 7675', 'jia.wong36@example.com'),
  (1037, 'Wei Jie', 'Koh', 'Platinum', '2020-01-17', 14935, 1994, 'Woodlands', '8443 8831', 'wei.koh37@example.com'),
  (1038, 'Hui Ling', 'Ng', 'Platinum', '2019-09-25', 14875, 2004, 'Tampines', '9453 8530', 'hui.ng38@example.com'),
  (1039, 'Priya', 'Krishnan', 'Basic', '2020-07-19', 245, 1960, 'Tampines', '9857 8488', 'priya.krishnan39@example.com'),
  (1040, 'Zulkifli', 'Ibrahim', 'Silver', '2023-10-25', 3749, 1998, 'Tampines', '9707 2268', 'zulkifli.ibrahim40@example.com'),
  (1041, 'Rachel', 'Lim', 'Basic', '2020-08-02', 196, 1975, 'Tampines', '9789 3936', 'rachel.lim41@example.com'),
  (1042, 'Denise', 'Koh', 'Basic', '2024-06-08', 800, 1961, 'Clementi', '9325 6342', 'denise.koh42@example.com'),
  (1043, 'Zhi Hao', 'Teo', 'Basic', '2020-06-08', 62, 1978, 'Jurong East', '9899 7740', 'zhi.teo43@example.com'),
  (1044, 'Shu Fen', 'Chua', 'Basic', '2022-11-11', 305, 1992, 'Orchard', '8835 6113', NULL),
  (1045, 'Wei Ming', 'Teo', 'Gold', '2023-12-06', 10683, 1988, 'Orchard', '9325 7217', 'wei.teo45@example.com'),
  (1046, 'Chloe', 'Tan', 'Basic', '2020-07-22', 771, 1979, 'Tampines', '9367 7934', 'chloe.tan46@example.com'),
  (1047, 'Yong Sheng', 'Sim', 'Silver', '2021-12-23', 2827, NULL, 'Jurong East', '8210 1139', 'yong.sim47@example.com'),
  (1048, 'Bryan', 'Lee', 'Basic', '2020-05-02', 124, 1958, 'Bedok', '8983 8531', 'bryan.lee48@example.com'),
  (1049, 'Meena', 'Subramaniam', 'Silver', '2021-04-21', 2831, 2000, 'Orchard', '8355 7078', 'meena.subramaniam49@example.com'),
  (1050, 'Muhammad Danial', 'Osman', 'Platinum', '2019-11-21', 28127, 1965, 'Clementi', '9182 8601', 'muhammad.osman50@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, MemberTier, JoinDate, PointsBalance, BirthYear, District, Phone, Email) VALUES
  (1051, 'Shu Fen', 'Tan', 'Basic', '2019-05-12', 221, 1997, 'Tampines', '9377 6852', 'shu.tan51@example.com'),
  (1052, 'Suresh', 'Krishnan', 'Basic', '2019-04-05', 340, 1996, 'Woodlands', '9508 6281', 'suresh.krishnan52@example.com'),
  (1053, 'Jia Hui', 'Teo', 'Silver', '2020-07-13', 1280, 1985, 'Woodlands', '8523 4188', 'jia.teo53@example.com'),
  (1054, 'Meena', 'Nair', 'Silver', '2021-08-08', 959, 1984, 'Orchard', '9465 4607', 'meena.nair54@example.com'),
  (1055, 'Priya', 'Menon', 'Basic', '2019-06-18', 92, 1966, 'Tampines', '8909 5465', 'priya.menon55@example.com'),
  (1056, 'Zhi Hao', 'Ong', 'Basic', '2024-04-24', 22, 1964, 'Bedok', '9814 2071', 'zhi.ong56@example.com'),
  (1057, 'Muhammad Faiz', 'Abdullah', 'Basic', '2021-09-15', 635, 1994, 'Bedok', '9911 9745', NULL),
  (1058, 'Grace', 'Chua', 'Gold', '2022-04-06', 7337, NULL, 'Bedok', '8388 5781', 'grace.chua58@example.com'),
  (1059, 'Rachel', 'Wong', 'Basic', '2022-04-01', 562, 1961, 'Bedok', '8860 5175', 'rachel.wong59@example.com'),
  (1060, 'Chloe', 'Sim', 'Gold', '2022-11-07', 6759, 1970, 'Punggol', '9890 4281', 'chloe.sim60@example.com');

-- --------------------------------------------------------------------
-- Staff — 42 employees across the 8 outlets — role, salary, hire date and contact details (some emails are NULL on purpose).
-- --------------------------------------------------------------------
-- Note: this lab does not ship Outlets, so the foreign key(s) OutletCode -> Outlets(OutletCode)
-- are omitted here. The full model with every relationship is in _all/.
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  BadgeNo CHAR(8),
  FirstName VARCHAR(40),
  LastName VARCHAR(40),
  Role VARCHAR(30),
  OutletCode VARCHAR(5),
  HireDate DATE,
  MonthlySalary DECIMAL(9,2),
  Phone VARCHAR(12),
  Email VARCHAR(80),
  Employment VARCHAR(12)
);

INSERT INTO Staff (StaffID, BadgeNo, FirstName, LastName, Role, OutletCode, HireDate, MonthlySalary, Phone, Email, Employment) VALUES
  (1, 'S7000137', 'Jun Hao', 'Ng', 'Store Manager', 'OTL01', '2020-11-18', 6961.0, '9717 5176', 'jun.ng1@example.com', 'Full-Time'),
  (2, 'S7000274', 'Priya', 'Raj', 'Store Manager', 'OTL02', '2022-10-02', 6253.0, '8199 8613', 'priya.raj2@example.com', 'Full-Time'),
  (3, 'S7000411', 'Jun Hao', 'Goh', 'Store Manager', 'OTL03', '2017-10-05', 7391.0, '9752 1595', 'jun.goh3@example.com', 'Full-Time'),
  (4, 'S7000548', 'Jun Hao', 'Chua', 'Store Manager', 'OTL04', '2020-08-30', 6629.0, '9370 2648', NULL, 'Full-Time'),
  (5, 'S7000685', 'Natalie', 'Fernandez', 'Store Manager', 'OTL05', '2015-12-31', 6106.0, '8553 8585', 'natalie.fernandez5@example.com', 'Full-Time'),
  (6, 'S7000822', 'Jia Hui', 'Lim', 'Store Manager', 'OTL06', '2023-11-13', 5292.0, '8393 9030', 'jia.lim6@example.com', 'Full-Time'),
  (7, 'S7000959', 'Shu Fen', 'Ng', 'Store Manager', 'OTL07', '2024-07-06', 6016.0, '8426 7115', 'shu.ng7@example.com', 'Full-Time'),
  (8, 'S7001096', 'Li Ting', 'Sim', 'Store Manager', 'OTL08', '2021-12-27', 5913.0, '9495 3325', 'li.sim8@example.com', 'Full-Time'),
  (9, 'S7001233', 'Cheryl', 'Tan', 'Visual Merchandiser', 'OTL06', '2023-07-31', 3106.0, '8202 7623', 'cheryl.tan9@example.com', 'Part-Time'),
  (10, 'S7001370', 'Mei Ling', 'Teo', 'Assistant Manager', 'OTL04', '2021-10-03', 4395.0, '9847 5897', 'mei.teo10@example.com', 'Full-Time'),
  (11, 'S7001507', 'Li Ting', 'Tan', 'Supervisor', 'OTL06', '2021-05-08', 4103.0, '9584 3522', 'li.tan11@example.com', 'Full-Time'),
  (12, 'S7001644', 'Daniel', 'Koh', 'Supervisor', 'OTL05', '2014-10-18', 4105.0, '9998 4267', 'daniel.koh12@example.com', 'Full-Time'),
  (13, 'S7001781', 'Yong Sheng', 'Chua', 'Stock Associate', 'OTL08', '2016-08-11', 2920.0, '9503 4122', NULL, 'Part-Time'),
  (14, 'S7001918', 'Wei Ming', 'Ng', 'Visual Merchandiser', 'OTL07', '2024-03-31', 2918.0, '8738 1457', 'wei.ng14@example.com', 'Part-Time'),
  (15, 'S7002055', 'Arjun', 'Kumar', 'Visual Merchandiser', 'OTL05', '2019-01-03', 3566.0, '9586 7611', 'arjun.kumar15@example.com', 'Full-Time'),
  (16, 'S7002192', 'Wan Ting', 'Wong', 'Supervisor', 'OTL05', '2014-09-09', 3756.0, '8458 4112', 'wan.wong16@example.com', 'Part-Time'),
  (17, 'S7002329', 'Grace', 'Tan', 'Cashier', 'OTL05', '2023-09-20', 2599.0, '9202 7267', 'grace.tan17@example.com', 'Full-Time'),
  (18, 'S7002466', 'Marcus', 'Ng', 'Assistant Manager', 'OTL08', '2022-09-29', 5119.0, '9924 6448', 'marcus.ng18@example.com', 'Part-Time'),
  (19, 'S7002603', 'Yong Sheng', 'Chua', 'Cashier', 'OTL03', '2021-02-18', 2457.0, '9502 6899', 'yong.chua19@example.com', 'Full-Time'),
  (20, 'S7002740', 'Wei Ming', 'Goh', 'Supervisor', 'OTL03', '2019-04-24', 3431.0, '8567 9103', 'wei.goh20@example.com', 'Full-Time'),
  (21, 'S7002877', 'Xin Yi', 'Wong', 'Cashier', 'OTL02', '2023-12-27', 2344.0, '8667 9549', 'xin.wong21@example.com', 'Full-Time'),
  (22, 'S7003014', 'Wei Jie', 'Ng', 'Cashier', 'OTL07', '2019-12-18', 2363.0, '9340 9076', NULL, 'Full-Time'),
  (23, 'S7003151', 'Cheryl', 'Chan', 'Assistant Manager', 'OTL04', '2022-02-18', 4277.0, '8724 4488', 'cheryl.chan23@example.com', 'Part-Time'),
  (24, 'S7003288', 'Zhi Hao', 'Lee', 'Visual Merchandiser', 'OTL06', '2015-06-03', 3473.0, '9821 5028', 'zhi.lee24@example.com', 'Full-Time'),
  (25, 'S7003425', 'Yong Sheng', 'Chan', 'Senior Cashier', 'OTL01', '2023-08-20', 3206.0, '9388 5395', 'yong.chan25@example.com', 'Full-Time');
INSERT INTO Staff (StaffID, BadgeNo, FirstName, LastName, Role, OutletCode, HireDate, MonthlySalary, Phone, Email, Employment) VALUES
  (26, 'S7003562', 'Jia Hui', 'Tan', 'Senior Cashier', 'OTL05', '2018-07-15', 3207.0, '8181 7349', 'jia.tan26@example.com', 'Full-Time'),
  (27, 'S7003699', 'Arjun', 'Subramaniam', 'Assistant Manager', 'OTL04', '2018-08-11', 4890.0, '8407 3104', 'arjun.subramaniam27@example.com', 'Part-Time'),
  (28, 'S7003836', 'Cheryl', 'Ong', 'Cashier', 'OTL07', '2017-02-21', 2441.0, '9948 6771', 'cheryl.ong28@example.com', 'Part-Time'),
  (29, 'S7003973', 'Jun Hao', 'Koh', 'Assistant Manager', 'OTL08', '2017-05-09', 5067.0, '8849 8881', 'jun.koh29@example.com', 'Full-Time'),
  (30, 'S7004110', 'Shu Fen', 'Tan', 'Supervisor', 'OTL07', '2018-01-09', 4146.0, '8670 4551', 'shu.tan30@example.com', 'Full-Time'),
  (31, 'S7004247', 'Rajesh', 'Nair', 'Supervisor', 'OTL04', '2023-01-19', 3355.0, '9726 5767', NULL, 'Full-Time'),
  (32, 'S7004384', 'Syafiq', 'Ibrahim', 'Visual Merchandiser', 'OTL05', '2014-01-24', 3343.0, '8529 7504', 'syafiq.ibrahim32@example.com', 'Full-Time'),
  (33, 'S7004521', 'Dinesh', 'Menon', 'Senior Cashier', 'OTL02', '2024-09-17', 2803.0, '9286 6703', 'dinesh.menon33@example.com', 'Part-Time'),
  (34, 'S7004658', 'Denise', 'Lim', 'Stock Associate', 'OTL08', '2016-12-12', 2931.0, '9275 3867', 'denise.lim34@example.com', 'Full-Time'),
  (35, 'S7004795', 'Rachel', 'Chua', 'Senior Cashier', 'OTL02', '2019-11-14', 2871.0, '8257 9540', 'rachel.chua35@example.com', 'Full-Time'),
  (36, 'S7004932', 'Syafiq', 'Abdullah', 'Visual Merchandiser', 'OTL04', '2023-11-25', 3040.0, '9262 6357', 'syafiq.abdullah36@example.com', 'Full-Time'),
  (37, 'S7005069', 'Anitha', 'Krishnan', 'Senior Cashier', 'OTL05', '2024-08-23', 3058.0, '9212 7234', 'anitha.krishnan37@example.com', 'Full-Time'),
  (38, 'S7005206', 'Arif', 'Hassan', 'Stock Associate', 'OTL08', '2024-02-24', 2786.0, '9259 3545', 'arif.hassan38@example.com', 'Full-Time'),
  (39, 'S7005343', 'Anitha', 'Nair', 'Supervisor', 'OTL05', '2023-11-21', 3642.0, '8630 2834', 'anitha.nair39@example.com', 'Full-Time'),
  (40, 'S7005480', 'Syafiq', 'Osman', 'Supervisor', 'OTL03', '2020-06-03', 3791.0, '8785 5411', NULL, 'Full-Time'),
  (41, 'S7005617', 'Daniel', 'Lim', 'Senior Cashier', 'OTL08', '2019-01-25', 2756.0, '9784 5989', 'daniel.lim41@example.com', 'Part-Time'),
  (42, 'S7005754', 'Ethan', 'Chua', 'Cashier', 'OTL02', '2016-05-24', 2293.0, '8472 8139', 'ethan.chua42@example.com', 'Full-Time');

-- --------------------------------------------------------------------
-- Products — 25 SKUs with cost, retail price, category, supplier and reorder level (some NULL).
-- --------------------------------------------------------------------
-- Note: this lab does not ship Categories, Suppliers, so the foreign key(s) CategoryCode -> Categories(CategoryCode); SupplierID -> Suppliers(SupplierID)
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
  IsActive TINYINT
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
