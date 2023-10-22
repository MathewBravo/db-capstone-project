-- Create a virtual table to summarize data
-- ----------------------------------------
# Task 1
-- ----------------------------------------
CREATE VIEW OrdersView AS
SELECT OrdersID, Quantity, TotalCost AS Cost
FROM Orders
WHERE Quantity > 2;

-- ----------------------------------------
# Task 2
-- ----------------------------------------
SELECT 
    CD.CustomerID,
    CD.Name AS FullName,
    O.OrdersID,
    O.TotalCost AS Cost,
    M.MenuName,
    MI.CourseName,
    MI.StarterName
FROM customerdetails CD
JOIN orders O ON CD.CustomerID = O.CustomerID
JOIN menu M ON O.MenuID = M.MenuID
JOIN menuitems MI ON M.MenuID = MI.MenuItemID
WHERE O.TotalCost > 150
ORDER BY O.TotalCost ASC;


-- ----------------------------------------
# Task 3
-- ----------------------------------------
SELECT M.MenuName 
FROM menu M
WHERE M.MenuID = ANY (
    SELECT O.MenuID 
    FROM orders O 
    WHERE O.Quantity > 2
)
GROUP BY M.MenuName;