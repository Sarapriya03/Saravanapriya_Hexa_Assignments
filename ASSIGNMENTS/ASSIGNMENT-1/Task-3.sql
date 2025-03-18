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

SELECT 
Orders.OrderID,
Orders.OrderDate,
Customers.FirstName,
Customers.LastName,
Customers.Email,
Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT 
Products.ProductName,
SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.Description LIKE '%electronic%'
GROUP BY Products.ProductName
ORDER BY TotalRevenue DESC;

SELECT TOP 1 
Products.ProductName,
SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.Description LIKE '%electronic%'
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

SELECT 
Customers.FirstName + ' ' + Customers.LastName AS CustomerName,
AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY AverageOrderValue DESC;

SELECT TOP 1 
Orders.OrderID,
Customers.FirstName + ' ' + Customers.LastName AS CustomerName,
Customers.Email,
Orders.TotalAmount AS TotalRevenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY Orders.TotalAmount DESC;

DECLARE @ProductName VARCHAR(50) = 'Laptop';  -- User input for product name
SELECT DISTINCT 
C.CustomerID,
C.FirstName + ' ' + C.LastName AS CustomerName,
C.Email,
C.Phone
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = @ProductName;


