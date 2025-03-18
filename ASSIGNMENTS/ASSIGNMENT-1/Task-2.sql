SELECT FirstName, LastName, Email from Customers

ALTER TABLE Customers
ALTER COLUMN Phone bigint NULL;

INSERT INTO Customers(FirstName, LastName, Email, Address)
VALUES
('Saravanapriya', 'Thirumalaikumar', 'priya@example.com', '93 Florence garden'); 

SELECT * FROM Customers

UPDATE Products SET Price = Price * 1.10 where Description = 'electronic';
SELECT * FROM Products

DELETE FROM OrderDetails where OrderId = 4
SELECT * FROM OrderDetails

DELETE FROM Orders where OrderId = 4
SELECT * FROM Orders

INSERT INTO Orders(CustomerID, OrderDate, TotalAmount)
VALUES
(4, '2025-03-04', 500);
SELECT * FROM Orders

UPDATE Customers SET Email = 'sara@example.com', Address = '94 Star City' where CustomerID = 12;
SELECT * FROM Customers

INSERT INTO Products(ProductName, Description, Price)
VALUES
('kettle', 'electronic', 1200);
SELECT * FROM Products

ALTER TABLE Orders
ADD Status varchar(20);

UPDATE Orders  
SET Status = 'Pending'  
WHERE OrderID IN (1, 2, 3, 5, 6, 8, 9);

UPDATE Orders  
SET Status = 'Shipped'  
WHERE OrderID IN (4, 7, 10);

SELECT * FROM Orders

UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 1

ALTER TABLE Customers  
ADD OrderCount INT DEFAULT 0;

UPDATE Customers
SET OrderCount = 10
WHERE CustomerID IN (1,3,5,7);

UPDATE Customers
SET OrderCount = 5
WHERE CustomerID NOT IN (1,3,5,7);

SELECT * FROM Customers

SELECT 
Orders.OrderID,
Orders.OrderDate,
Customers.FirstName,
Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

UPDATE Orders
SET TotalAmount = (
SELECT SUM(od.Quantity * p.Price)
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = Orders.OrderID
)

SELECT * FROM Orders
SELECT * FROM OrderDetails

DECLARE @CustomerID INT = 4;
DELETE FROM OrderDetails
WHERE OrderID IN (
SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID
);
DELETE FROM Orders
WHERE CustomerID = @CustomerID;

UPDATE Customers
SET OrderCount = (
SELECT COUNT(*)
FROM Orders
WHERE Orders.CustomerID = Customers.CustomerID
);




