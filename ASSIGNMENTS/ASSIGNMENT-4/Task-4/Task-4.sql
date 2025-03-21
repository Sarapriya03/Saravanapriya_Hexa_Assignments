SELECT c.CourierID,
c.SenderName,
c.SenderAddress,
c.ReceiverName,
c.ReceiverAddress,
c.Weight,
c.Status,
c.TrackingNumber,
c.DeliveryDate,
p.Amount
FROM Courier c, Payment p
WHERE c.CourierID = p.CourierID

SELECT l.LocationID,
l.LocationName,
l.Address,
p.Amount
FROM Location l, Payment p
WHERE l.LocationID = p.LocationID

SELECT 
    PaymentID,
    CourierID,
    LocationID,
    Amount,
    PaymentDate,
    (SELECT SenderName FROM Courier WHERE Courier.CourierID = Payment.CourierID) AS Sender,
    (SELECT ReceiverName FROM Courier WHERE Courier.CourierID = Payment.CourierID) AS Receiver,
    (SELECT LocationName FROM Location WHERE Location.LocationID = Payment.LocationID) AS LocationName
FROM Payment;

SELECT c.CourierID,
c.SenderName,
c.SenderAddress,
c.ReceiverName,
c.ReceiverAddress,
c.Weight,
c.Status,
c.TrackingNumber,
c.DeliveryDate,
p.PaymentID,
p.LocationID,
p.Amount,
p.PaymentDate
FROM Courier c, Payment p
WHERE c.CourierID = p.CourierID

SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

SELECT PaymentID, CourierID, Amount, PaymentDate
FROM Payment
WHERE PaymentDate = '2024-03-25';

SELECT PaymentID,CourierID,Amount,PaymentDate
FROM Payment;

SELECT 
    l.LocationID, 
    l.LocationName, 
    l.Address,
    p.PaymentID,
    p.CourierID,
    p.Amount,
    p.PaymentDate
FROM Location l, Payment p
WHERE l.LocationID = p.LocationID;

SELECT 
    CourierID,
    SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

SELECT PaymentID, CourierID, Amount, PaymentDate
FROM Payment
WHERE PaymentDate BETWEEN '2024-03-01' AND '2024-03-15';

SELECT 
    u.UserID,
    u.Name AS UserName,
    u.Email,
    c.CourierID,
    c.SenderName,
    c.ReceiverName,
    c.Status
FROM [User] u
FULL OUTER JOIN Courier c 
    ON u.Name = c.SenderName;

SELECT 
    c.CourierID,
    c.SenderName,
    c.ReceiverName,
    c.Status,
    s.ServiceID,
    s.ServiceName,
    s.Cost
FROM Courier c
FULL OUTER JOIN CourierServices s 
    ON c.CourierID = s.ServiceID;

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    e.Email,
    e.Role,
    p.PaymentID,
    p.CourierID,
    p.Amount,
    p.PaymentDate
FROM Employee e
FULL OUTER JOIN Payment p 
    ON e.EmployeeID = p.CourierID;

SELECT 
    u.UserID,
    u.Name AS UserName,
    u.Email,
    s.ServiceID,
    s.ServiceName,
    s.Cost
FROM [User] u
CROSS JOIN CourierServices s;

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    e.Role,
    l.LocationID,
    l.LocationName,
    l.Address
FROM Employee e
CROSS JOIN Location l;

SELECT 
    c.CourierID,
    c.TrackingNumber,
    c.Status,
    c.SenderName,
    c.SenderAddress
FROM Courier c;

SELECT 
    c.CourierID,
    c.TrackingNumber,
    c.Status,
    c.ReceiverName,
    c.ReceiverAddress
FROM Courier c;

SELECT 
    c.CourierID,
    c.SenderName,
    c.ReceiverName,
    c.Status,
    s.ServiceID,
    s.ServiceName,
    s.Cost
FROM Courier c
LEFT JOIN CourierServices s 
    ON c.CourierID = s.ServiceID;

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    (
        SELECT COUNT(*) 
        FROM Courier c
        WHERE c.SenderName LIKE '%' + e.Name + '%'
    ) AS TotalCouriers
FROM Employee e;

SELECT 
    l.LocationID,
    l.LocationName,
    SUM(p.Amount) AS TotalPayments
FROM Location l
LEFT JOIN Payment p 
    ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

SELECT *
FROM Courier
WHERE SenderName = 'John Doe';

SELECT *
FROM Employee
WHERE Role IN (
    SELECT Role 
    FROM Employee 
    GROUP BY Role 
    HAVING COUNT(*) > 1
);

SELECT * FROM Location

SELECT *
FROM Payment p
WHERE p.CourierID IN (
    SELECT c.CourierID 
    FROM Courier c 
    WHERE CAST(c.SenderAddress AS VARCHAR(255)) = 'New York Branch'
);

SELECT *
FROM Courier
WHERE CAST(SenderAddress AS VARCHAR(255)) = 'New York';

SELECT Name AS EmployeeName, 0 AS TotalDeliveries  
FROM Employee;

SELECT p.CourierID, p.Amount AS PaymentAmount, cs.Cost AS ServiceCost
FROM Payment p
JOIN CourierServices cs ON p.CourierID = cs.ServiceID
WHERE p.Amount > cs.Cost;

SELECT *
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

SELECT Name  
FROM Employee  
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

SELECT *
FROM Courier
WHERE CourierID IN (SELECT CourierID FROM Payment);

SELECT LocationID, Amount  
FROM Payment  
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

SELECT *  
FROM Courier  
WHERE Weight > ALL (
    SELECT Weight  
    FROM Courier  
    WHERE SenderName = 'John Doe'
);

