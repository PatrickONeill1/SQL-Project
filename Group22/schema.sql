--
-- Database: 'student database'
--

-- --------------------------------------------------------

--
-- Table structure for table 'Address'
--
 
 
CREATE TABLE IF NOT EXISTS Address ( 
 eircode char(6) NOT NULL, 
 county varchar(20) default NULL, 
 city varchar(20) default NULL, 
 street varchar(65) default NULL, 
 PRIMARY KEY (eircode) 
);

--
-- Dumping data for table 'Address'
-- 

INSERT INTO Address (eircode, county, city, street) VALUES
 
('GR510K', 'Limerick', 'Annacotty', '28 The Range'),
('E8EVY0', 'Clare', 'Ennis', '12 The Square'),
('KZWAXN', 'Kerry', 'Tralee', '19 Holy Cross'),
('TEXD3T', 'Limerick', 'Dooradoyle', '91 The Brook'),
('NVX4SW', 'Cork', 'Mallow', '23 Ailsbury RD'),
('1CGRPQ', 'Kilkenny', 'Thomastown', '65 Grennan Avenue'),
('23DLOD', 'Limerick', 'Bruff', '8 Oakvale'),
('ZGBWLP', 'Tipperary', 'Cashel', '23 The Stables'),
('PS9O7B', 'Galway', 'Portumna', '17 Kemmy st'),
('O199ZD', 'Dublin', 'Skerries', '29 Csis drive'),
('CD0V0F', 'Sligo', 'Strandhill', '70 Aubery rd'),
('EM9X3C', 'Galway', 'Athenry', '65 Coolmean'),
('BTC5FZ', 'Cork', 'Kinsale', '48 Riverview'),
('K75P8H', 'Clare', 'Lahinch', '55 Semple ST'),
('T5Q0P5', 'Waterford', 'Ardkeen', '33 Nolan Park'),
('T7OAB7', 'Wexford', 'Taughmon', '29 Woodfield'),
('9GCBC5', 'Cork', 'Youghal', '81 Woodlawn'), 
('LCOH2X', 'Dublin', 'Ballymun', '46 Carrigown'),
('GKBR95', 'Kerry', 'Kilarney', '35 Grassyhill'),
('9DRBXT', 'Tipperary', 'Cashel', '73 Springfield'),
('UYFK32', 'Sligo', 'Strandhill', '87 Longfield'),
('8WSKQ5', 'Mayo', 'Westport', '62 Oceanview'),
('P28BLK', 'Longford', 'Ardagh', '43 Glenview'),
('PM030V', 'Laois', 'Portlaois', '12 Newpark'),
('1DAV75', 'Limerick', 'William st', '88 Upper'),
('BXY7DL', 'Limerick', 'Castletroy', '121 Castle Gardens');

-- --------------------------------------------------------

--
-- Table structure for table 'Subject'
--

CREATE TABLE IF NOT EXISTS Subject ( 
 subject_id char(6) NOT NULL, 
 subject_name varchar(32) DEFAULT NULL,  
 subject_fee int DEFAULT NULL,
 PRIMARY KEY (subject_id)
);

--
-- Dumping data for table 'Subject' 
-- 

INSERT INTO Subject (subject_id, subject_name, subject_fee) VALUES
('CS4012', 'Programming', 1300),
('CS4141', 'Operating systems', 1300),
('CS4221', 'Database systems', 1300),
('ET4011', 'Computer Science 1', 1300),
('MS4111', 'Discrete Mathematics', 1300),
('CS4043', 'Software Development', 1300),
('CS4222', 'Computer Maths 2', 1300),
('CS4182', 'Software Testing', 1300),
('ET4162', 'App Design', 1300),
('MA4402', 'Programming', 2500);

-- --------------------------------------------------------

--
-- Table structure for table 'Staff'
--

CREATE TABLE IF NOT EXISTS Staff ( 
 staff_id char(8) NOT NULL,
 eircode char(6) DEFAULT NULL, 
 first_name varchar(35) DEFAULT NULL, 
 last_name varchar(35) DEFAULT NULL, 
 position varchar(32) DEFAULT NULL, 
 PRIMARY KEY (staff_id), 
 FOREIGN KEY (eircode) 
	REFERENCES Address (eircode)
	  ON DELETE CASCADE 
    ON UPDATE CASCADE
);
 
--
-- Dumping data for table 'Staff'
-- 
 
INSERT INTO Staff (staff_id, eircode, first_name , last_name, position) VALUES
('34258325', 'GR510K',	'Brian', 'ODriscoll', 'Lecturer'),
('60395718', 'E8EVY0', 'Mick', 'Foley', 'Lecturer'),
('44889020', 'KZWAXN',	'Tadhg', 'Furlong', 'Lecturer'),
('25003812', 'TEXD3T', 'Cian',	'Kelly', 'Lecturer'),
('70127028', 'NVX4SW',	'Rory',	'Best',	'Lecturer'),
('87814399', '1CGRPQ',	'Elaine', 'Furlong', 'Lecturer'),
('56565622', '23DLOD',	'Annette', 'Ryan', 'Lecturer'),
('64595932', 'ZGBWLP',	'Jillian', 'ODwyer', 'Lecturer'),
('40763714', 'PS9O7B',	'Leanne', 'Power', 'Lecturer'),
('58625458', 'O199ZD',	'James', 'Ryan', 'Lecturer'),
('77353266', 'CD0V0F',	'Peter', 'OMahoney', 'Maintenance'),
('33252919', 'EM9X3C',	'Linda', 'Butler', 'Security'),
('16681633', 'BTC5FZ',	'Charlotte', 'Murphy', 'President'),
('77940683', 'K75P8H',	'Sarah', 'Byrne', 'Office Admin'),
('10378073', 'T5Q0P5',	'Josh',	'Kilcoyne',	'Office Admin'),
('15669968', 'T7OAB7',	'CJ', 'Stander', 'Security');

-- --------------------------------------------------------

--
-- Table structure for table 'Student'
--

CREATE TABLE IF NOT EXISTS Student ( 
 student_id char(8) NOT NULL, 
 eircode char(6) default NULL,
 first_name varchar(35) default NULL, 
 last_name varchar(35) default NULL, 
 fees_paid double default NULL, 
 DOB date default NULL, 
 PRIMARY KEY (student_id), 
 FOREIGN KEY (eircode)
	REFERENCES Address(eircode) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
 
-- 
-- Dumping data for table 'Student'
-- 
 
INSERT INTO Student (student_id, eircode, first_name, last_name, fees_paid, DOB) VALUES
('12345678', 'GKBR95', 'Patrick', 'ONeill', 6500,	'1991-07-02'),
('11223344', 'LCOH2X', 'John', 'Maher', 3250, '1990-03-10'),
('55667788', 'GKBR95', 'Amy', 'Power', 1625,	'1969-08-09'),
('12244384', '9DRBXT', 'Michael', 'Kelly', 6500, '2000-07-31'),
('16273548', 'UYFK32', 'Molly', 'Malone', 812, '1993-12-11'),
('11111111', '8WSKQ5', 'Dan', 'Leavy', 3250, '1975-07-26'),
('99999999', 'P28BLK', 'Trevor', 'Brennan', 812, '2001-01-27'),
('73378516', 'PM030V', 'Michelle', 'Freeman', 1625, '1976-04-18'),
('12886119', '1DAV75', 'Amy', 'Kelly', 6500,	'1979-03-21'),
('12886120', '8WSKQ5', 'Michelle', 'Hourihan Watanabe', 6500,	'1980-01-21'),
('12886121', '1DAV75', 'Laszlo', 'Szlatki', 6500,	'1982-01-22'),
('12886122', 'P28BLK', 'Patrick', 'ONeill', 6500,	'1991-07-02'),
('12886123', 'BXY7DL', 'Richard', 'OBrian', 6500,	'1988-05-09'),
('94313375', 'BXY7DL', 'Mark', 'Massey', 1625, '1987-04-24');

-- --------------------------------------------------------

--
-- Table structure for table 'past_Students'
--

CREATE TABLE IF NOT EXISTS past_Student( 
 student_id char(8) NOT NULL, 
 eircode char(6) default NULL,
 first_name varchar(35) default NULL, 
 last_name varchar(35) default NULL, 
 fees_paid double default NULL, 
 DOB date default NULL, 
 FOREIGN KEY (eircode)
	REFERENCES Address(eircode) 
    ON DELETE SET NULL
    ON UPDATE CASCADE
 );



--
-- Table structure for table 'Exam_Results'
--

CREATE TABLE IF NOT EXISTS Exam_Results (
 student_id char(8) NOT NULL, 
 subject_id char(6) NOT NULL, 
 score int default NULL, 
 PRIMARY KEY (student_id, subject_id), 
 FOREIGN KEY (subject_id)
	REFERENCES Subject(subject_id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
 FOREIGN KEY (student_id)
	REFERENCES Student(student_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
 );

--
-- Dumping data for table 'Exam_Results'
-- 

INSERT INTO Exam_Results (student_id, subject_id, score) VALUES
('12345678', 'CS4012', '40'),
('11223344', 'CS4141', '20'),
('55667788', 'CS4221', '70'),
('12244384', 'ET4011', '77'),
('16273548', 'MS4111', '62'),
('11111111', 'CS4043', '82'),
('99999999', 'CS4222', '70'),
('73378516', 'CS4182', '60'),
('12886119', 'ET4162', '40'),
('94313375', 'MA4402', '45'),
('12886120', 'CS4141', '80'),
('12886120', 'CS4221', '80'),
('12886121', 'ET4011', '77'),
('12886121', 'MS4111', '82'),
('12886122', 'CS4043', '82'),
('12886122', 'CS4222', '70'),
('12886123', 'CS4182', '80'),
('12886123', 'ET4162', '99');

-- --------------------------------------------------------

--
-- Table structure for table 'Enrollment'
--
 

CREATE TABLE IF NOT EXISTS Enrollment (
  subject_id char(6) NOT NULL,
  student_id char(8) NOT NULL,
  PRIMARY KEY (subject_id, student_id),
  FOREIGN KEY (subject_id)
	REFERENCES Subject(subject_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  FOREIGN KEY (student_id)
	REFERENCES Student(student_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

--
-- Dumping data for table 'Enrollment'
-- 
 
INSERT INTO Enrollment (subject_id, student_id) VALUES
('CS4012', '12345678'),
('CS4141', '11223344'),
('CS4221', '55667788'),
('ET4011', '12244384'),
('MS4111', '16273548'),
('CS4043', '11111111'),
('CS4222', '99999999'),
('CS4182', '73378516'),
('ET4162', '12886119'),
('MA4402', '94313375'),
('MA4402', '12345678'),
('ET4162', '11223344'),
('CS4182', '55667788'),
('CS4222', '12244384'),
('CS4043', '16273548'),
('MS4111', '11111111');

-- --------------------------------------------------------


--
-- Table structure for table 'Subject_Allocation'
--
 

CREATE TABLE IF NOT EXISTS Subject_Allocation (
  subject_id char(6) NOT NULL,
  staff_id char(8) NOT NULL,
  PRIMARY KEY (subject_id, staff_id),
  FOREIGN KEY (subject_id)
	REFERENCES Subject(subject_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  FOREIGN KEY (staff_id)
	REFERENCES Staff(staff_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

--
-- Dumping data for table 'Subject_Allocation'
-- 
 
INSERT INTO Subject_Allocation (subject_id, staff_id) VALUES
('CS4012', '34258325'),
('CS4141', '60395718'),
('CS4221', '44889020'),
('ET4011', '25003812'),
('MS4111', '70127028'),
('CS4043', '87814399'),
('CS4222', '25003812'),
('CS4182', '87814399'),
('ET4162', '56565622'),
('MA4402', '70127028');