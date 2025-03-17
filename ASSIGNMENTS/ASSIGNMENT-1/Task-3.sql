SELECT FirstName, LastName, Email, Address, Phone FROM Customers WHERE OrderCount >= 1

SELECT ProductName, Description  AS Category FROM Products WHERE Description = 'electronic'

ALTER TABLE Products
ADD No_Of_Times_Ordered int;

UPDATE Products
SET No_Of_Times_Ordered = 4
WHERE ProductID IN (1,2,4,6,8)

UPDATE Products
SET No_Of_Times_Ordered = 6
WHERE ProductID IN (3,5,7,9)

UPDATE Products
SET No_Of_Times_Ordered = 4
WHERE ProductID IN (10,11)

SELECT * FROM Products

SELECT ProductName, No_Of_Times_Ordered FROM Products WHERE Description = 'electronic'

SELECT * FROM Orders
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders WHERE OrderDate BETWEEN '2025-03-01' AND '2025-03-07'

