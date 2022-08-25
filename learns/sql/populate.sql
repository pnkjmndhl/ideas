INSERT INTO MajorMinor VALUES (001, 'Electrical Engineering');
INSERT INTO MajorMinor VALUES (002, 'Computer Engineering');
INSERT INTO MajorMinor VALUES (003, 'Civil Engineering');
INSERT INTO MajorMinor VALUES (004, 'Structural Engineering');
INSERT INTO MajorMinor VALUES (005, 'Transportation Engineering');
INSERT INTO MajorMinor VALUES (006, 'Computer Science');

INSERT INTO HallAndFlat VALUES (00001, 99001, 5, 5665321499, 5000, 55001);
INSERT INTO HallAndFlat VALUES (00002, 99002, 6, 5365254992, 5500, 55002);
INSERT INTO HallAndFlat VALUES (00005, 99003, 7, 5652145429, 5600, 55003);
INSERT INTO HallAndFlat VALUES (00006, 99004, 8, 5465531549, 4600, 55004);

INSERT INTO Flat VALUES (00001,	00051);
INSERT INTO Flat VALUES (00002,	00053);
INSERT INTO Flat VALUES (00001,	00052);
INSERT INTO Flat VALUES (00002,	00054);

INSERT INTO Hall VALUES (00005, 'Knox Student Small Hall');
INSERT INTO Hall VALUES (00006, 'Knox Student Big Hall');

INSERT INTO Room VALUES(00200, 00005, '9842032448', 2000);
INSERT INTO Room VALUES(00203, 00006, '9851266561', 2500);
INSERT INTO Room VALUES(00100, 00001, '9849191623', 2000);
INSERT INTO Room VALUES(00101, 00001, '9852026048', 2000);


INSERT INTO Invoice VALUES(01001, 10001, 1, 2000, '9849191623', 00001, 00100, '2015-06-29' , 'Credit', '2015-07-29','2015-08-29' );
INSERT INTO Invoice VALUES(01002, 10002, 2, 2000, '9852026048', 00001, 00101, '2015-10-25' , 'Credit', NULL , NULL);
INSERT INTO Invoice VALUES(01003, 10003, 2, 2000, '9842032448', 00005, 00200, '2015-10-24' , 'Cash', NULL , NULL);
INSERT INTO Invoice VALUES(01004, 10004, 2, 2500, '9851266561', 00006, 00203, '2015-10-29' , 'Credit', NULL , NULL );
INSERT INTO Invoice VALUES(01005, 10005, 2, 2000, '9849191623', 00001, 00100, '2015-10-29' , 'Credit', '2015-11-29', NULL );
INSERT INTO Invoice VALUES(01005, 10005, 3, 2000, '9849191623', 00001, 00100, '2015-10-29' , 'Credit', NULL, NULL );

INSERT INTO Lease VALUES (00001, 1, '9849191623', 00001, 00100, '2015-06-29', '2016-10-28', 2000);
INSERT INTO Lease VALUES (00002, 1, '9852026048', 00001, 00101, '2015-10-25', '2016-02-25', 2000);
INSERT INTO Lease VALUES (00003, 1, '9842032448', 00005, 00200, '2015-10-24', '2016-02-24', 2000);
INSERT INTO Lease VALUES (00004, 1, '9851266561', 00006, 00203, '2015-10-29', '2016-02-29', 2500);
INSERT INTO Lease VALUES (00005, 2, '9849191623', 00001, 00100, '2015-10-29', '2016-02-29', 2000);
INSERT INTO Lease VALUES (00005, 3, '9849191623', 00001, 00100, '2016-02-29', '2016-06-29', 2000);


INSERT INTO Address VALUES(99001, '2156 Applepie Drive', 'Nashville', 37011);
INSERT INTO Address VALUES(99002, '1556 Yellowsun Drive', 'Dallas', 75001);
INSERT INTO Address VALUES(99003, '2955 Greentree Drive', 'Charlotte', 28105);
INSERT INTO Address VALUES(99004, '7216 Banana Drive', 'Miami', 33018);

INSERT INTO Address VALUES(99011, '7716 Gleason Drive', 'Knoxville', 37655);
INSERT INTO Address VALUES(99012, '8236 Sandbox Drive', 'Knoxville', 37645);
INSERT INTO Address VALUES(99013, '7418 Waffle Drive', 'Knoxville', 37455);

INSERT INTO Address VALUES(99014, '2916 Henly Drive', 'Maryville', 37655);
INSERT INTO Address VALUES(99015, '3716 Greenbrier Ridge Way', 'Knoxville', 37675);
INSERT INTO Address VALUES(99016, '2718 Painter Ave', 'Knoxville', 37658);

INSERT INTO Address VALUES(99020, '2289 Henly Drive', 'Las Vegas', 69565);
INSERT INTO Address VALUES(99021, '7456 Greenbrier Ridge Way', 'Richmond', 53025);

INSERT INTO Address VALUES(99031, '2156 Applepie Drive', 'Knoxville', 37011);
INSERT INTO Address VALUES(99032, '1556 Yellowsun Drive', 'Knoxville', 37001);
INSERT INTO Address VALUES(99033, '2955 Greentree Drive', 'Knoxville', 37105);
INSERT INTO Address VALUES(99034, '7216 Banana Drive', 'Knoxville', 37018);


INSERT INTO Student VALUES('9849191623', 'Pankaj', 'Dahal', 99001, '9849191623', 'fu.pankja@gmail.com', '1995-02-03', 'M', 'Sophomore', 'Nepali', NULL, NULL, 'Placed', 00001, 33003, 33006);
INSERT INTO Student VALUES('9852026048', 'Ghanashyam', 'Prasad', 99002, '9852026048', 'prasad44@gmail.com','1997-05-03', 'M', 'Junior', 'Chinese', NULL , NULL, 'Placed', 00002, 33006, 33004);
INSERT INTO Student VALUES('9842032448', 'Kamala', 'Neupane', 99003, '9842032448', 'neupanekk@gmail.com', '1992-12-13', 'F', 'Senior', 'Japanese',NULL ,NULL , 'Placed', 00002, 33005, 33006);
INSERT INTO Student VALUES('9851266561', 'Mangal', 'Prasad', 99004, '9851266561', 'mangalmangal@gmail.com', '1992-12-13', 'M', 'Senior', 'Japanese',NULL ,NULL , 'Placed', 00003, 33005, 33006);

INSERT INTO Advisor VALUES (00001, 'Kshekci', 'Dekeko', 'Faculty', 'Civil and Environment Engineering', '8665555655', 'kshekcidekeko@gmail.com',  99011);
INSERT INTO Advisor VALUES (00002, 'Biskok', 'Sigel', 'Faculty', 'Haslam', '8658486655', 'biskoksigel@gmail.com',  99012);
INSERT INTO Advisor VALUES (00003, 'Kaddas', 'Dedado', 'Faculty', 'Statistics', '8655745655', 'kaddasdedado@gmail.com',  99013);

INSERT INTO Staff  VALUES (55001, 'Rajesh' , 'Kothrapali', 'rkop@gmail.com', 99014, '1986-04-11', 'M', 'Hall Manager' , '8655912365' );
INSERT INTO Staff VALUES (55002, 'Howard' , 'Walowitz', 'hwalo@gmail.com', 99015, '1976-01-11', 'M', 'Hall Manager', '8655965656' );
INSERT INTO Staff VALUES (55003, 'Amy' , 'Farah', 'afar@gmail.com', 99016, '1989-12-11', 'F', 'Administrative Assistant', '5465898989' );
INSERT INTO Staff VALUES (55004, 'Sheldon' , 'Cooper', 'scooper@gmail.com', 99016, '1941-12-11', 'M', 'Administrative Assistant', '5465898989' );

INSERT INTO Inspection VALUES (55001, '2015-10-21', 'Bad', 'Bad, however the same person continued to use the room');

INSERT INTO NextOfKin VALUES ('9849191623', 'Raj', 'Budha', 'Uncle', 00005, '8655953698');
INSERT INTO NextOfKin VALUES ('9852026048', 'Lee', 'Xiaobing', 'Brother', 00003, '8655455121');
