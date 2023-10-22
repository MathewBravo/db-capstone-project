-- Create SQL queries to add and update bookings
-- ----------------------------------------
# Task 1
-- ----------------------------------------
-- DELIMITER //
-- CREATE PROCEDURE AddBooking(bookingID INT, customerID INT, bookingDate DATE, tableNum INT)
-- BEGIN
--     INSERT INTO bookings(BookingID, CustomerID, BookingDate, TableNumber)
--     VALUES (bookingID, customerID, bookingDate, tableNum);

--     SELECT 'New Booking Added' AS 'Confirmation';
-- END //
-- DELIMITER ;

-- ----------------------------------------
# Task 2
-- ----------------------------------------
-- DELIMITER //
-- CREATE PROCEDURE UpdateBooking(bookingID INT, newBookingDate DATE)
-- BEGIN
--     UPDATE bookings
--     SET BookingDate = newBookingDate
--     WHERE BookingID = bookingID;

--     SELECT CONCAT('Booking ', bookingID, ' updated') AS 'Confirmation';
-- END //
-- DELIMITER ;



-- ----------------------------------------
# Task 3
-- ----------------------------------------
-- DELIMITER //
-- CREATE PROCEDURE CancelBooking(bookingID INT)
-- BEGIN 
--     DELETE FROM bookings WHERE BookingID = bookingID;
--     SELECT CONCAT('Booking ', bookingID, ' cancelled') AS 'Confirmation';
-- END //
-- DELIMITER ;
