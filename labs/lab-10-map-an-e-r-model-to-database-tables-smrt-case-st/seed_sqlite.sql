-- Lab 10 — Map an E-R Model to Database Tables (SMRT Case Study): mock data
-- SQL Masterclass (C024) · v1 · Tertiary Infotech Academy Pte Ltd
-- Dialect: SQLite
-- Load: open this file in your SQL editor and execute the whole script.

PRAGMA foreign_keys = ON;

-- --------------------------------------------------------------------
-- Routes — 8 SMRT routes (6 MRT lines + 2 bus services) — the parent entity of the transport E-R model.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Routes;
CREATE TABLE Routes (
  route_id TEXT PRIMARY KEY,
  route_type TEXT,
  route_code TEXT,
  route_name TEXT,
  route_direction TEXT,
  remarks TEXT
);

INSERT INTO Routes (route_id, route_type, route_code, route_name, route_direction, remarks) VALUES
  ('R001', 'Train', 'NSL', 'North South Line', 'North', 'Jurong East ↔ Marina South Pier'),
  ('R002', 'Train', 'EWL', 'East West Line', 'East', 'Pasir Ris ↔ Tuas Link'),
  ('R003', 'Train', 'CCL', 'Circle Line', 'Loop', 'Dhoby Ghaut ↔ HarbourFront'),
  ('R004', 'Train', 'DTL', 'Downtown Line', 'West', 'Bukit Panjang ↔ Expo'),
  ('R005', 'Train', 'NEL', 'North East Line', 'North', 'HarbourFront ↔ Punggol'),
  ('R006', 'Train', 'TEL', 'Thomson-East Coast Line', 'East', 'Woodlands North ↔ Bayshore'),
  ('R007', 'Bus', '170', 'Bus Service 170', 'North', 'Queen St ↔ Larkin (JB)'),
  ('R008', 'Bus', '961', 'Bus Service 961', 'West', 'Woodlands ↔ Marina Centre');

-- --------------------------------------------------------------------
-- Stations — 14 MRT stations with line position, interchange flag and opening date.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Stations;
CREATE TABLE Stations (
  station_code TEXT PRIMARY KEY,
  station_name TEXT,
  route_id TEXT,
  line_position INTEGER,
  is_interchange INTEGER,
  opened_date TEXT,
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

INSERT INTO Stations (station_code, station_name, route_id, line_position, is_interchange, opened_date) VALUES
  ('NS01', 'Jurong East', 'R001', 1, 1, '1990-11-10'),
  ('NS17', 'Bishan', 'R001', 17, 1, '1987-11-07'),
  ('NS24', 'Dhoby Ghaut', 'R001', 24, 1, '1987-12-12'),
  ('NS28', 'Marina South Pier', 'R001', 28, 0, '2014-11-23'),
  ('EW01', 'Pasir Ris', 'R002', 1, 0, '1989-11-04'),
  ('EW13', 'City Hall', 'R002', 13, 1, '1987-12-12'),
  ('EW24', 'Jurong East', 'R002', 24, 1, '1988-11-05'),
  ('CC01', 'Dhoby Ghaut', 'R003', 1, 1, '2010-04-17'),
  ('CC15', 'Bishan', 'R003', 15, 1, '2009-05-28'),
  ('DT14', 'Bugis', 'R004', 14, 1, '2013-12-22'),
  ('NE06', 'Dhoby Ghaut', 'R005', 6, 1, '2003-06-20'),
  ('NE17', 'Punggol', 'R005', 17, 1, '2003-06-20'),
  ('TE09', 'Springleaf', 'R006', 9, 0, '2021-08-28'),
  ('TE14', 'Orchard', 'R006', 14, 1, '2021-08-28');

-- --------------------------------------------------------------------
-- Timetables — 42 timetable rows — first/last trip and frequency per station for weekday, Saturday and Sunday/PH.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS Timetables;
CREATE TABLE Timetables (
  timetable_id INTEGER PRIMARY KEY,
  route_id TEXT,
  station_code TEXT,
  frequency TEXT,
  days_operation TEXT,
  stop_no INTEGER,
  first_trip TEXT,
  last_trip TEXT,
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

INSERT INTO Timetables (timetable_id, route_id, station_code, frequency, days_operation, stop_no, first_trip, last_trip) VALUES
  (1, 'R001', 'NS01', '3 min', 'Mon-Fri', 1, '05:30', '23:45'),
  (2, 'R001', 'NS01', '4 min', 'Sat', 1, '05:30', '23:55'),
  (3, 'R001', 'NS01', '6 min', 'Sun-PH', 1, '06:00', '23:30'),
  (4, 'R001', 'NS17', '3 min', 'Mon-Fri', 17, '05:30', '23:45'),
  (5, 'R001', 'NS17', '4 min', 'Sat', 17, '05:30', '23:55'),
  (6, 'R001', 'NS17', '6 min', 'Sun-PH', 17, '06:00', '23:30'),
  (7, 'R001', 'NS24', '3 min', 'Mon-Fri', 24, '05:30', '23:45'),
  (8, 'R001', 'NS24', '4 min', 'Sat', 24, '05:30', '23:55'),
  (9, 'R001', 'NS24', '6 min', 'Sun-PH', 24, '06:00', '23:30'),
  (10, 'R001', 'NS28', '3 min', 'Mon-Fri', 28, '05:30', '23:45'),
  (11, 'R001', 'NS28', '4 min', 'Sat', 28, '05:30', '23:55'),
  (12, 'R001', 'NS28', '6 min', 'Sun-PH', 28, '06:00', '23:30'),
  (13, 'R002', 'EW01', '3 min', 'Mon-Fri', 1, '05:30', '23:45'),
  (14, 'R002', 'EW01', '4 min', 'Sat', 1, '05:30', '23:55'),
  (15, 'R002', 'EW01', '6 min', 'Sun-PH', 1, '06:00', '23:30'),
  (16, 'R002', 'EW13', '3 min', 'Mon-Fri', 13, '05:30', '23:45'),
  (17, 'R002', 'EW13', '4 min', 'Sat', 13, '05:30', '23:55'),
  (18, 'R002', 'EW13', '6 min', 'Sun-PH', 13, '06:00', '23:30'),
  (19, 'R002', 'EW24', '3 min', 'Mon-Fri', 24, '05:30', '23:45'),
  (20, 'R002', 'EW24', '4 min', 'Sat', 24, '05:30', '23:55'),
  (21, 'R002', 'EW24', '6 min', 'Sun-PH', 24, '06:00', '23:30'),
  (22, 'R003', 'CC01', '3 min', 'Mon-Fri', 1, '05:30', '23:45'),
  (23, 'R003', 'CC01', '4 min', 'Sat', 1, '05:30', '23:55'),
  (24, 'R003', 'CC01', '6 min', 'Sun-PH', 1, '06:00', '23:30'),
  (25, 'R003', 'CC15', '3 min', 'Mon-Fri', 15, '05:30', '23:45');
INSERT INTO Timetables (timetable_id, route_id, station_code, frequency, days_operation, stop_no, first_trip, last_trip) VALUES
  (26, 'R003', 'CC15', '4 min', 'Sat', 15, '05:30', '23:55'),
  (27, 'R003', 'CC15', '6 min', 'Sun-PH', 15, '06:00', '23:30'),
  (28, 'R004', 'DT14', '3 min', 'Mon-Fri', 14, '05:30', '23:45'),
  (29, 'R004', 'DT14', '4 min', 'Sat', 14, '05:30', '23:55'),
  (30, 'R004', 'DT14', '6 min', 'Sun-PH', 14, '06:00', '23:30'),
  (31, 'R005', 'NE06', '3 min', 'Mon-Fri', 6, '05:30', '23:45'),
  (32, 'R005', 'NE06', '4 min', 'Sat', 6, '05:30', '23:55'),
  (33, 'R005', 'NE06', '6 min', 'Sun-PH', 6, '06:00', '23:30'),
  (34, 'R005', 'NE17', '3 min', 'Mon-Fri', 17, '05:30', '23:45'),
  (35, 'R005', 'NE17', '4 min', 'Sat', 17, '05:30', '23:55'),
  (36, 'R005', 'NE17', '6 min', 'Sun-PH', 17, '06:00', '23:30'),
  (37, 'R006', 'TE09', '3 min', 'Mon-Fri', 9, '05:30', '23:45'),
  (38, 'R006', 'TE09', '4 min', 'Sat', 9, '05:30', '23:55'),
  (39, 'R006', 'TE09', '6 min', 'Sun-PH', 9, '06:00', '23:30'),
  (40, 'R006', 'TE14', '3 min', 'Mon-Fri', 14, '05:30', '23:45'),
  (41, 'R006', 'TE14', '4 min', 'Sat', 14, '05:30', '23:55'),
  (42, 'R006', 'TE14', '6 min', 'Sun-PH', 14, '06:00', '23:30');

-- --------------------------------------------------------------------
-- DisruptedRoutes — 6 service disruptions in 2025 — type, details, start time, duration and the alternative arrangements offered.
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS DisruptedRoutes;
CREATE TABLE DisruptedRoutes (
  disrupt_no INTEGER PRIMARY KEY,
  disrupt_date TEXT,
  disrupt_type TEXT,
  disrupt_name TEXT,
  disrupt_details TEXT,
  start_datetime TEXT,
  duration TEXT,
  timetable_id INTEGER,
  alternatives TEXT,
  FOREIGN KEY (timetable_id) REFERENCES Timetables(timetable_id)
);

INSERT INTO DisruptedRoutes (disrupt_no, disrupt_date, disrupt_type, disrupt_name, disrupt_details, start_datetime, duration, timetable_id, alternatives) VALUES
  (1, '2025-03-14', 'Signalling', 'Signal fault at Bishan', 'Signalling fault caused train bunching between Bishan and Dhoby Ghaut.', '202503140812', '45 min', 4, 'Free bridging bus between Bishan and Dhoby Ghaut'),
  (2, '2025-04-02', 'Track', 'Track point failure', 'Faulty track point detected at Jurong East platform B.', '202504020705', '1 hr 20 min', 1, 'Free regular bus services along NSL corridor'),
  (3, '2025-05-19', 'Power', 'Traction power trip', 'Traction power trip affecting eastbound services on the East West Line.', '202505191830', '35 min', 13, 'Shuttle service Pasir Ris to Tampines'),
  (4, '2025-06-08', 'Weather', 'Flash flood at entrance', 'Heavy rain caused flooding at Station Exit C; entrance closed temporarily.', '202506081545', '2 hr', 25, 'Alternative entrances A and B remain open'),
  (5, '2025-07-21', 'Train Fault', 'Faulty train withdrawn', 'A train was withdrawn at Punggol for maintenance, extending wait times.', '202507210920', '25 min', 34, 'Additional trains deployed from Sengkang depot'),
  (6, '2025-09-03', 'Signalling', 'Communication loss', 'Temporary loss of communication between train and trackside equipment.', '202509031705', '50 min', 40, 'Free bridging bus along Thomson-East Coast corridor');
