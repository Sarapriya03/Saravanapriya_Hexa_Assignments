SELECT * FROM [User]

SELECT * FROM Courier WHERE SenderName = 'Sarah Miller'

SELECT * FROM Courier

SELECT * FROM Courier WHERE CourierID = 2

SELECT * FROM Courier WHERE TrackingNumber = 'TRK123456789'

SELECT * FROM Courier WHERE Status != 'Delivered' 

SELECT *
FROM Courier
WHERE DeliveryDate = CAST(GETDATE() AS DATE);

SELECT * FROM Courier WHERE Status = 'Delivered'

SELECT SenderName, COUNT(*) AS TotalPackages
FROM Courier
GROUP BY SenderName

SELECT 
    TrackingNumber,
    AVG(DATEDIFF(day, PaymentDate, DeliveryDate)) AS AvgDeliveryTime_Days
FROM Courier C
JOIN Payment P ON C.CourierID = P.CourierID
WHERE Status = 'Delivered'
GROUP BY TrackingNumber;

SELECT *
FROM Courier
WHERE Weight BETWEEN 2.5 AND 5.0;  

SELECT * FROM Employee WHERE Name like '%John%'

SELECT *
FROM Courier
WHERE CourierID IN (
    SELECT CourierID 
    FROM Payment 
    WHERE Amount > 50
);

