
#add checks
ALTER TABLE Invoice ADD CHECK (semester IN ('Fall', 'Spring', 'Summer'));
ALTER TABLE Invoice ADD CHECK (paymentMethod IN ('ADD CHECK', 'Cash', 'Visa', 'Others'));
ALTER TABLE Student ADD CHECK (gender IN ('M', 'F'));
ALTER TABLE Student ADD CHECK (status IN ('Placed', 'Waiting'));
ALTER TABLE Lease ADD CHECK (leaseDuration IN (1, 2, 3));
ALTER TABLE Inspection ADD CHECK (result IN ('Good', 'Bad'));
ALTER TABLE Staff ADD CHECK (staffposition IN('Hall Manager', 'Administrative Assistant', 'Cleaner'));

#add PK & FK constraints
ALTER TABLE MajorMinor ADD CONSTRAINT pk_MID PRIMARY KEY (MID);

ALTER TABLE Flat ADD CONSTRAINT pk_Flat PRIMARY KEY (placeNo);
ALTER TABLE Flat ADD CONSTRAINT fk_Flat_placeNo FOREIGN KEY (placeNo) REFERENCES HallAndFlat(placeNo);

ALTER TABLE Invoice ADD CONSTRAINT pk_Invoice PRIMARY KEY (invoiceNo);
ALTER TABLE Invoice ADD CONSTRAINT fk_Invoice_bannerNo FOREIGN KEY bannerNo REFERENCES Student(bannerNo);
ALTER TABLE Invoice ADD CONSTRAINT fk_Invoice_placeNo FOREIGN KEY placeNo REFERENCES HallAndFlat(placeNo);
ALTER TABLE Invoice ADD CONSTRAINT fk_Invoice_placeNo_roomNo FOREIGN KEY (placeNo, roomNo) REFERENCES Room(placeNo, roomeNo);
ALTER TABLE Invoice ADD CONSTRAINT fk_Invoice_leaseNo FOREIGN KEY leaseNo REFERENCES Lease(leaseNo);

ALTER TABLE Room ADD CONSTRAINT pk_Room_roomNo PRIMARY KEY roomNo;
ALTER TABLE Room ADD CONSTRAINT fk_Room_bannerNoo FOREIGN KEY bannerNo REFERENCES Student (bannerNo);
ALTER TABLE Room ADD CONSTRAINT fk_Invoice_placeNo FOREIGN KEY placeNo REFERENCES HallAndFlat(placeNo);

ALTER TABLE HallAndFlat ADD CONSTRAINT pk_HAF PRIMARY KEY placeNo;
ALTER TABLE HallAndFlat ADD CONSTRAINT fk_HAF_managerStaffNo FOREIGN KEY managerStaffNo, references Staff(staffNo);
ALTER TABLE HallAndFlat ADD CONSTRAINT fk_HAF_placeNo FOREIGN KEY placeNo, references Hall(placeNo);
ALTER TABLE HallAndFlat ADD CONSTRAINT fk_HAF_address FOREIGN KEY addressID references Address(addressID);

ALTER TABLE Address ADD CONSTRAINT pk_Address PRIMARY KEY roomNo;
ALTER TABLE Address ADD CONSTRAINT fk_Address_Student FOREIGN KEY bannerNo references Student (bannerNo);
ALTER TABLE Address ADD CONSTRAINT fk_Address_HallAndFlat	FOREIGN KEY placeNo references HallAndFlat (placeNo);

ALTER TABLE Address ADD CONSTRAINT pk_Address PRIMARY KEY bannerNo;
ALTER TABLE Address ADD CONSTRAINT fk_Address_addressID FOREIGN KEY addressID references Address(addressID);
ALTER TABLE Address ADD CONSTRAINT fk_Address_majorID FOREIGN KEY majorID references MajorMinor(ID);
ALTER TABLE Address ADD CONSTRAINT fk_Address_minorID FOREIGN KEY minorID references MajorMinor(ID);

ALTER TABLE Advisor ADD CONSTRAINT pk_Advisor PRIMARY KEY advisorID;
ALTER TABLE Advisor ADD CONSTRAINT pk_Advisor FOREIGN KEY roomNo references Room(roomNo);

ALTER TABLE Lease ADD CONSTRAINT pk_Lease PRIMARY KEY leaseNo;
ALTER TABLE Lease ADD CONSTRAINT fk_Lease_Student FOREIGN KEY bannerNo references Student(bannerNo);
ALTER TABLE Lease ADD CONSTRAINT fk_Lease_Hall FOREIGN KEY placeNo references Hall(placeNo);

ALTER TABLE Inspection ADD CONSTRAINT pk_Inspection PRIMARY KEY (StaffNo, inspectionDate);
ALTER TABLE Inspection ADD CONSTRAINT fk_Inspection FOREIGN KEY staffNo references Staff(staffNo);

ALTER TABLE Hall ADD CONSTRAINT pk_Hall PRIMARY KEY PlaceNo;
ALTER TABLE Hall ADD CONSTRAINT fk_Hall FOREIGN KEY PlaceNo references HallAndFlat(placeNo);

ALTER TABLE NextOfKin ADD CONSTRAINT pk_NextOfKin	PRIMARY KEY bannerNo;
ALTER TABLE NextOfKin ADD CONSTRAINT fk_NextOfKin	FOREIGN KEY bannerNo references Student(bannerNo);
ALTER TABLE NextOfKin ADD CONSTRAINT fk_NextOfKin	FOREIGN KEY addressID references Address(addressID);

ALTER TABLE Staff ADD CONSTRAINT pk_Staff PRIMARY KEY staffNo;
ALTER TABLE Staff ADD CONSTRAINT fk_Staff	FOREIGN KEY departmentID references Department(ID);
ALTER TABLE Staff ADD CONSTRAINT fk_Staff FOREIGN KEY addressID references Address (ID);

#other constraints
