ALTER TABLE Courier ADD EmployeeID int;

UPDATE Courier 
SET EmployeeID = 1 
WHERE CourierID = 1;

UPDATE Courier 
SET EmployeeID = 2 
WHERE CourierID = 2;

UPDATE Courier 
SET EmployeeID = 3 
WHERE CourierID = 3;

UPDATE Courier 
SET EmployeeID = 1 
WHERE CourierID = 4;

UPDATE Courier 
SET EmployeeID = 2 
WHERE CourierID = 5;

UPDATE Courier 
SET EmployeeID = 3 
WHERE CourierID = 6;

UPDATE Courier 
SET EmployeeID = 1 
WHERE CourierID = 7;

UPDATE Courier 
SET EmployeeID = 2 
WHERE CourierID = 8;

UPDATE Courier 
SET EmployeeID = 3 
WHERE CourierID = 9;

UPDATE Courier 
SET EmployeeID = 1 
WHERE CourierID = 10;

SELECT EmployeeID, COUNT(*) AS TotalCouriers
FROM Courier
GROUP BY EmployeeID;

SELECT LocationID, SUM(Amount) AS TotalRevenue
FROM Payment
GROUP BY LocationID;

SELECT LocationID, COUNT(CourierID) AS TotalDeliveredCouriers
FROM Payment
WHERE CourierID IN (
    SELECT CourierID 
    FROM Courier 
    WHERE Status = 'Delivered'
)
GROUP BY LocationID;

SELECT TOP 1 CourierID, DATEDIFF(day, GETDATE(), DeliveryDate) AS DeliveryTimeDays
FROM Courier
ORDER BY DeliveryTimeDays DESC

SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID
HAVING SUM(Amount) < 1000;

SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID

SELECT CourierID, SUM(Amount) AS TotalPayment
FROM Payment
WHERE PaymentDate > '2024-01-01'
GROUP BY CourierID
HAVING SUM(Amount) > 1000;

SELECT LocationID, SUM(Amount) AS TotalAmount
FROM Payment
WHERE PaymentDate < '2025-03-25'
GROUP BY LocationID
HAVING SUM(Amount) > 800;
