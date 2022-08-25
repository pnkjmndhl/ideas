-- -- #a.
-- SELECT s.firstName, s.lastName, s.phoneNo
-- FROM Staff s, HallAndFlat hf, Hall h
-- WHERE hf.staffNo = s.staffNo AND hf.placeNo = h.placeNo;
--
-- -- #b.
-- SELECT s.bannerNo, s.firstName, s.lastName, l.*
-- FROM Student s, Lease l
-- WHERE s.bannerNo = l.bannerNo; #AND l.placeNo = r.placeNo AND hf.placeNo = r.placeNo AND hf.addressID = a.addressID ;
--
-- -- #c.
-- SELECT s.bannerNo, s.firstName, s.lastName, l.*
-- FROM Student s, Lease l
-- WHERE s.bannerNo = l.bannerNo AND l.leaseDuration = 3 ;
--
-- -- #d.
-- SELECT s.firstName, s.lastName, i.placeNo, SUM(r.monthlyRent) AS totalrent
-- FROM Student s, Invoice i, Room r
-- WHERE s.firstName = 'Pankaj' AND s.lastName = 'Dahal' AND s.bannerNo = i.bannerNo AND i.roomNo = r.roomNo
-- GROUP BY i.placeNo;
-- --
-- -- #e.
-- SELECT s.firstName, s.lastName,i.datePaid, i.paymentDue
-- FROM Student s, Invoice i
-- WHERE (i.datePaid > '2016-02-01' OR i.datePaid is null) AND i.bannerNo = s.bannerNo;
--
-- -- #f.
-- SELECT * FROM Inspection
-- WHERE result = 'Bad';
-- --
-- -- #g.
-- SELECT s.firstName, s.lastName, s.bannerNo, r.placeNo, r.roomNo
-- FROM Student s, Hall h, Room r, Lease l
-- WHERE h.placeNo = r.placeNo AND r.placeNo = l.placeNo AND l.bannerNo = s.bannerNo AND h.placeNo = 5;
-- --
-- -- #h.
-- SELECT * FROM Student
-- WHERE status = 'Waiting';
-- --
-- -- #i.
-- SELECT category, count(category) AS NumCategory FROM Student
-- GROUP BY category;
-- --
-- -- #j.
-- SELECT s.firstName, s.lastName, s.bannerNo
-- FROM Student s LEFT JOIN NextOfKin n ON s.bannerNo = n.bannerNo
-- WHERE n.firstName IS NULL;
-- --
-- -- #k.
-- SELECT a.firstName, a.lastName, a.phoneNo
-- FROM Advisor a, Student s
-- WHERE s.advisorID = a.advisorID AND s.firstName = 'Pankaj' AND s.lastName = 'Dahal';
-- --
-- -- #l.
-- SELECT r.placeNo, MIN(r.monthlyRent) AS minrent, MAX(r.monthlyRent) AS maxrent, AVG(r.monthlyRent) AS avgrent
-- FROM Room r, Hall h
-- WHERE h.placeNo = r.placeNo
-- GROUP BY r.placeNo;
-- --
-- -- #m.
-- SELECT h.name as Name, COUNT(r.placeNo) as RoomsInHall
-- FROM Hall h, Room r
-- WHERE h.placeNo = r.placeNo
-- GROUP BY h.name;
-- --
-- -- #n.
-- SELECT s.staffNo, s.firstName, s.lastName, a.street, a.city, a.postCode, floor(datediff(curdate(),dateOfBirth)/365) as age
-- FROM Staff s, Address a
-- WHERE s.addressID = a.addressID AND CURDATE() > DATE_ADD(dateOfBirth, INTERVAL 60 YEAR);
-- --
--  #additional query:
-- SELECT s.firstName, s.lastName, hf.placeNo, r.roomNo, a.street
-- FROM Student s, Room r, HallAndFlat hf, Address a
-- WHERE r.bannerNo = s.bannerNo AND r.placeNo = hf.placeNo AND hf.addressID = a.addressID AND a.street = '2156 Applepie Drive';
