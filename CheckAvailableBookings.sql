-- Create SQL queries to check available bookings based on user input
-- ----------------------------------------
# Task 1
-- ----------------------------------------
-- INSERT INTO bookings (bookingdate, tablenumber, customerid) 
-- VALUES 
--     ("2022-10-10", 5, 1),
--     ("2022-11-12", 3, 3),
--     ("2022-10-11", 2, 2),
--     ("2022-10-13", 2, 1);

-- ----------------------------------------
# Task 2
-- ----------------------------------------
-- DELIMITER //
-- CREATE PROCEDURE CheckBooking(bookingDate DATE, tableNum INT)
-- BEGIN
--     DECLARE bookingCount INT;

--     -- Check if the table is already booked on the given date
--     SELECT COUNT(*) INTO bookingCount
--     FROM bookings
--     WHERE bookingdate = bookingDate AND tablenumber = tableNum;

--     IF bookingCount > 0 THEN
--         SELECT CONCAT("Table ", tableNum, " is already booked on ", bookingDate) AS 'Booking status';
--     ELSE
--         SELECT CONCAT("Table ", tableNum, " is available on ", bookingDate) AS 'Booking status';
--     END IF;
-- END //
-- DELIMITER ;


-- ----------------------------------------
# Task 3
-- ----------------------------------------
-- DELIMITER //
-- CREATE PROCEDURE AddValidBooking(bookingDate DATE, tableNum INT)
-- BEGIN
--     DECLARE bookingCount INT;
--     START TRANSACTION;

--     -- Check if the table is already booked on the given date
--     SELECT COUNT(*) INTO bookingCount
--     FROM bookings
--     WHERE bookingdate = bookingDate AND tablenumber = tableNum;

--     IF bookingCount = 0 THEN
--         -- If the table is available, insert the booking
--         INSERT INTO bookings(bookingdate, tablenumber)
--         VALUES (bookingDate, tableNum);
--         
--         COMMIT;
--         SELECT "Booking successful!" AS 'Booking status';
--     ELSE
--         ROLLBACK;
--         SELECT CONCAT("Table ", tableNum, " is already booked - booking cancelled") AS 'Booking status';
--     END IF;
-- END //
-- DELIMITER ;
