-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database db_Journey;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on db_Journey.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use db_Journey;

-- Put your DDL
CREATE TABLE CityExplorer (
UserId PRIMARY KEY
UserName varchar(50)
UserType varchar(50)
Age integer NOT NULL,
location varchar(100) NOT NULL,
password varchar (50) NOT NULL,
);

CREATE TABLE Hotel (
location varchar(100) NOT NULL,
HotelName  PRIMARY KEY NOT NULL,
Price INTEGER
);

CREATE TABLE Manager (
ManagerId primary key INTEGER,
ManagerName NOT NULL,
employeeId NOT NULL INTEGER,
num_employees UNIQUE,
payroll NOT NULL,
);

CREATE TABLE Department (
DeptId PRIMARY KEY INT,
DeptType NOT NULL,
);

CREATE TABLE Project (
projectId primary key INT,
projectCategory NOT NULL,
);

CREATE TABLE Employee (
employeeType NOT NULL
employeeId PRIMARY, INT
CustomerId NOT NULL FOREIGN KEY,
employeeName NOT NULL
deptId NOT NULL
);

CREATE TABLE Place (
placeId PRIMARY KEY INT,
Hours NOT NULL,
place_description varchar (400)

);
CREATE TABLE Location (
address PRIMARY KEY  NOT NULL,
latitude NOT NULL
longitude NOT NULL
);
CREATE TABLE Review (
reviewId PRIMARY KEY
projectId FOREIGN KEY
commentdate INT
);

CREATE TABLE Transportation (
Destination PRIMARY KEY NOT NULL,
Bus_route NOT NULL,
Train_route NOT NULL,
Traffic NOT NULL
Schedule NOT NULL INT
);

CREATE TABLE Feedback (
Msg varchar(300),
Email NOT NULL
CustomerName NOT NULL
);

CREATE TABLE Safety (
Crime_rates INT
Location NOT NULL
Police_presence NOT NULL
);

-- Add sample data. 
INSERT INTO CityExplorer
  (UserId, UserName, UserType, Age, location, password)
VALUES
  ('abc123', 'skye', 'student', '21', 'back bay', 'shbfjsdfbh'),
  ('husb', 'cole', 'senior', '80', 'fenway', 'sjnfasib20'),
  ('sdbuj', 'judy', 'working professional', '57', 'south end', 'sifausbfu');

INSERT INTO Hotel
  (location, HotelName, Price)
VALUES
  ('fenway', ‘hotel east’, ‘500000’),
  ('brookline', ‘fish hotel’, ‘450000’),
  ('beacon hill', ‘northshore hotel’, ‘505060’);

INSERT INTO Manager
  (ManagerId, ManagerName, employeeId, num_employees, payroll)
VALUES
  (‘122’, 'suzy', '212, 234, 289', '3', '2000'),
  ('123', 'baby', '80', '1', '1000'),
  ('124', 'kiki', '90, 22', '2', '3000');

INSERT INTO Department
  (ManagerId, ManagerName, employeeId, num_employees, payroll)
VALUES
  (‘122’, 'suzy', '212, 234, 289', '3', '2000'),
  ('123', 'baby', '80', '1', '1000'),
  ('124', 'kiki', '90, 22', '2', '3000'),

INSERT INTO Project
  (projectId, projectCategory)
VALUES
  ('1', ‘restaurant and cafe’),
  ('2', 'natural walk'),
  ('3', 'historical spots');

INSERT INTO Employee
  (employeeType, employeeId, CustomerId, employeeName, deptId)

VALUES
  ('Rachel Reese', Software Engineer ‘137899’, ‘ds3678’, ‘dept_3211’),
  ('Cristian Monteiro', ‘Web developer’, '658901', 'ds6789', ‘dept_8354’),
  ('Laura Hu', 'UX designer', '094200', 'ds5571', ‘dept_1509’);

INSERT INTO Place
  (placeId, Hours, place_description)
VALUES
  ('place_007', ‘11am-10pm’, ‘beautiful’),
  ('place_600', '9am-8pm', ‘incredible’),
  ('place_567', '11am-12pm', 'fabulous');

INSERT INTO Place
  (placeId, Hours, place_description)
VALUES
  ('place_007', ‘10am-5pm’, ‘At Rowes Wharf, you can board the Odyssey to cruise through Boston Harbor,
  from Castle Island to George's Island, then east to the Boston Light on Little Brewster Island,
  and back north to Charlestown Naval Yard before returning to the wharf.’),
  ('place_600', '9am-8pm', ‘north end is a Boston Italian place.’),
  ('place_567', '11am-5pm', 'Overlooking the waterfront,
  the New England Aquarium features more than 20,000 fish and aquatic animals representing over 550 species.
  A man-made Caribbean coral reef houses a large variety of tropical fish and underwater life including sharks,
  turtles, and moray eels.);

INSERT INTO Location
  (address, latitude, longitude)
VALUES
  ('655 CENTRE ST, JAMAICA PLAIN, MA, 02130-9998', '116.3998528', '39.8653333'),
  ('209 HEATH ST JAMAICA PLAIN MA 02130-1154 USA', '-27.3201981', '-56.3320773'),
  ('33 ARCH ST BOSTON MA 02110-1424 USA', '30.2047151', '151.2092955');

INSERT INTO Review
  (reviewId, projectId, commentdate)
VALUES
  ('147332', ‘proj_246’, ‘5-11-21’),
  ('576825', 'proj_425’, ‘6-18-22'),
  ('147302', 'proj_178’, ‘4-23-22');

INSERT INTO Transportation
  (Destination, Bus_route, Train_route, Traffic, Schedule)
VALUES
  ('Mission Hill', ‘32’, ‘green’, ‘light’, ‘noon’),
  ('Roxbury', '15', 'orange', 'heavy', 'fenway', 'morning'),
  ('North end', '10', 'purple', 'medium', 'south end', 'evening');

INSERT INTO Feedback
  (Msg, Email, CustomerName)
VALUES
  ('I recommend this app to everyone.', ‘niceuser345@gmail.com’, ‘Sally Salad’),
  ('I hate this app. No further comments to discuss. ', 'meanman33@gmail.com', 'Frank Mean'),
  ('I think this is the greatest app of all time!', ‘xyzbiz@gmail.com’, 'Freddy Pike');

INSERT INTO Safety
  (Crime_rates, Location, Police_presence)
VALUES
  ('.50', ‘Dorchestor’, ‘yes’),
  ('.65', 'Allston', 'no'),
  ('.42', 'Jamaica Plain', 'yes');



