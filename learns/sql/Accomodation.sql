DROP TABLE IF EXISTS MajorMinor;
DROP TABLE IF EXISTS Flat;
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS HallAndFlat;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Advisor;
DROP TABLE IF EXISTS Lease;
DROP TABLE IF EXISTS Inspection;
DROP TABLE IF EXISTS Hall;
DROP TABLE IF EXISTS NextOfKin;
DROP TABLE IF EXISTS Staff;  #13 statements


CREATE TABLE MajorMinor (
	MID INT(4),
	name VARCHAR(30)
);

CREATE TABLE Flat (
	placeNo INT(5) NOT NULL,
	flatNo INT(5)
);


CREATE TABLE Invoice (
	invoiceNo INT(5),
	leaseNo INT(5),
	semester VARCHAR(7),
	paymentDue INT(4),
	bannerNo VARCHAR(11),
	placeNo INT(5),
	roomNo INT(5),
	datePaid DATE,
	paymentMethod VARCHAR (6),
	dateOfFirstReminder DATE,
	dateOfSecondReminder DATE
);

CREATE TABLE Room (
	roomNo INT(5),
	placeNo INT(5),
	bannerNo VARCHAR(11),
	monthlyRent INT(5)
);

CREATE TABLE HallAndFlat (
	placeNo INT(5) NOT NULL,
	addressID INT(5),
	noOfRooms INT(3),
	phoneNo VARCHAR(10),
	monthlyRent INT(5),
	staffNo INT(5)
);

CREATE TABLE Address (
	addressID INT(5),
	street VARCHAR(30),
	city VARCHAR(10),
	postCode VARCHAR(6)
);

CREATE TABLE Student (
	bannerNo VARCHAR(11),
	firstName VARCHAR(10),
	lastName VARCHAR(10),
	addressID INT(5),
	mobileNumber VARCHAR(10),
	email VARCHAR(30),
	dateOfBirth DATE,
	gender CHAR(1),
	category VARCHAR(10),
	nationality VARCHAR(20),
	specialNeeds VARCHAR(20),
	comments VARCHAR(50),
	status VARCHAR(7),
	advisorID INT(5),
	majorID INT(4),
	minorID INT(4)
);

CREATE TABLE Advisor (
	advisorID INT(5),
	firstName VARCHAR(10),
	lastName VARCHAR(10),
	advisorPosition VARCHAR(30),
	department VARCHAR(40),
	phoneNo VARCHAR(10),
	email VARCHAR(30),
	roomNo INT(5)
);

CREATE TABLE Lease (
	leaseNo INT(5),
	leaseDuration INT(1),
	bannerNo VARCHAR(11),
	placeNo INT(5),
	roomNo INT(5),
	dateEntry DATE,
	dateExit DATE,
	rent INT(6)
);

CREATE TABLE Inspection (
	staffNo INT(5),
	inspectionDate DATE,
	result VARCHAR(8),
	comments VARCHAR(80)
);

CREATE TABLE Hall (
	placeNo INT(5),
	name VARCHAR(30)
);

CREATE TABLE NextOfKin (
	bannerNo VARCHAR(11),
	firstName VARCHAR(10),
	lastName VARCHAR(10),
	relationship VARCHAR(10),
	addressID INT(5),
	phoneNo VARCHAR(11)
);

CREATE TABLE Staff (
	staffNo INT(5),
	firstName VARCHAR(10),
	lastName VARCHAR(10),
	email VARCHAR(30),
	addressID INT(5),
	dateOfBirth DATE,
	gender CHAR(1),
	staffPosition VARCHAR(25),
	phoneNo VARCHAR(11)
);
