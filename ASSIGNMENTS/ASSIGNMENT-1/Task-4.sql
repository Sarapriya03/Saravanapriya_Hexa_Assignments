select * from Orders

select c.CustomerID,c.FirstName 
from Customers c
where CustomerID NOT IN (select o.CustomerID from Orders o)

SELECT COUNT(*) AS TotalProducts
FROM Products;

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

SELECT AVG(OrderDetails.Quantity) AS AverageQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName='Smartphone'

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = 7

select SUM(o.TotalAmount) AS TOTAL_REVENUE,c.FirstName
from Orders o JOIN Customers c ON o.CustomerID=c.CustomerID
where c.CustomerID = 7
GROUP BY c.FirstName

select  top 1 CONCAT(FirstName,SPACE(1),LastName) AS CustomerName,
CustomerID,OrderCount from Customers
order by OrderCount desc

SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

SELECT TOP 1 Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalSpending DESC;

SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName






