-- Create optimized queries to manage and analyze data
-- ----------------------------------------
# Task 1
-- ----------------------------------------
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderedQuantity FROM orders;
END //
DELIMITER ;

-- To call the procedure:
-- CALL GetMaxQuantity();

-- ----------------------------------------
# Task 2
-- ----------------------------------------
PREPARE GetOrderDetail FROM 'SELECT OrdersID, Quantity, TotalCost FROM orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DEALLOCATE PREPARE GetOrderDetail;

-- ----------------------------------------
# Task 3
-- ----------------------------------------
DELIMITER //
CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM orders WHERE OrdersID = order_id;
    -- Use SELECT to return a confirmation message
    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END //
DELIMITER ;

-- To call the procedure and delete an order with a given ID (e.g., 5):
-- CALL CancelOrder(5);
