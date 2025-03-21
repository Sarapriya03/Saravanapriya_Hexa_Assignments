CREATE DATABASE CMS
USE CMS

CREATE TABLE [User]
(UserID int PRIMARY KEY,
Name varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
ContactNumber varchar(20),
Address TEXT);

CREATE TABLE Courier
(CourierID int PRIMARY KEY,
SenderName varchar(255),
SenderAddress TEXT,
ReceiverName varchar(255),
ReceiverAddress TEXT,
Weight DECIMAL(5,2),
Status varchar(50),
TrackingNumber varchar(20) UNIQUE,
DeliveryDate DATE);

CREATE TABLE CourierServices (
ServiceID INT PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2)
);

CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2)
);

CREATE TABLE Location (
LocationID INT PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT
);

CREATE TABLE Payment (
PaymentID INT PRIMARY KEY,
CourierID INT,
LocationID INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

INSERT INTO [User] (UserID, Name, Email, Password, ContactNumber, Address)  
VALUES  
(1, 'John Doe', 'john@example.com', 'password123', '9876543210', '123 Main St, NY'),  
(2, 'Jane Smith', 'jane@example.com', 'pass456', '9123456789', '456 Elm St, LA'),  
(3, 'Michael Brown', 'michael@example.com', 'mike789', '8765432109', '789 Maple St, TX'),  
(4, 'Emily Davis', 'emily@example.com', 'emily123', '9345678123', '101 Pine St, SF'),  
(5, 'Chris Johnson', 'chris@example.com', 'chrispass', '8234567890', '202 Oak St, FL'),  
(6, 'Sarah Miller', 'sarah@example.com', 'sarahpass', '7890123456', '303 Birch St, AZ'),  
(7, 'David Wilson', 'david@example.com', 'davidpass', '6789012345', '404 Cedar St, WA'),  
(8, 'Emma Taylor', 'emma@example.com', 'emmapass', '5678901234', '505 Walnut St, CO'),  
(9, 'James Moore', 'james@example.com', 'jamespass', '4567890123', '606 Aspen St, OR'),  
(10, 'Sophia White', 'sophia@example.com', 'sophiapass', '3456789012', '707 Redwood St, NV');

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)  
VALUES  
(1, 'John Doe', '123 Main St, NY', 'Emma Taylor', '505 Walnut St, CO', 2.5, 'In Transit', 'TRK123456789', '2025-03-25'),  
(2, 'Jane Smith', '456 Elm St, LA', 'Michael Brown', '789 Maple St, TX', 3.2, 'Delivered', 'TRK234567890', '2025-03-20'),  
(3, 'Emily Davis', '101 Pine St, SF', 'Chris Johnson', '202 Oak St, FL', 1.8, 'Pending', 'TRK345678901', NULL),  
(4, 'Sarah Miller', '303 Birch St, AZ', 'James Moore', '606 Aspen St, OR', 4.5, 'In Transit', 'TRK456789012', '2025-03-27'),  
(5, 'David Wilson', '404 Cedar St, WA', 'Sophia White', '707 Redwood St, NV', 2.9, 'Delivered', 'TRK567890123', '2025-03-18'),  
(6, 'Emma Taylor', '505 Walnut St, CO', 'John Doe', '123 Main St, NY', 5.0, 'Pending', 'TRK678901234', NULL),  
(7, 'Michael Brown', '789 Maple St, TX', 'Emily Davis', '101 Pine St, SF', 3.7, 'Delivered', 'TRK789012345', '2025-03-15'),  
(8, 'Chris Johnson', '202 Oak St, FL', 'Sarah Miller', '303 Birch St, AZ', 1.4, 'In Transit', 'TRK890123456', '2025-03-26'),  
(9, 'James Moore', '606 Aspen St, OR', 'David Wilson', '404 Cedar St, WA', 4.0, 'Pending', 'TRK901234567', NULL),  
(10, 'Sophia White', '707 Redwood St, NV', 'Jane Smith', '456 Elm St, LA', 2.3, 'Delivered', 'TRK012345678', '2025-03-22');

INSERT INTO CourierServices (ServiceID, ServiceName, Cost)  
VALUES  
(1, 'Standard Delivery', 100.00),  
(2, 'Express Delivery', 250.00),  
(3, 'Same-Day Delivery', 500.00),  
(4, 'International Shipping', 1000.00),  
(5, 'Economy Delivery', 75.00),  
(6, 'Next-Day Delivery', 300.00),  
(7, 'Bulk Shipping', 800.00),  
(8, 'Fragile Item Shipping', 600.00),  
(9, 'Oversized Shipping', 1200.00),  
(10, 'Return Service', 150.00);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)  
VALUES  
(1, 'Alex Johnson', 'alex@courier.com', '9234567890', 'Manager', 50000.00),  
(2, 'Linda Brown', 'linda@courier.com', '9345678901', 'Delivery Agent', 25000.00),  
(3, 'Mark Wilson', 'mark@courier.com', '9456789012', 'Customer Support', 20000.00),  
(4, 'Susan Taylor', 'susan@courier.com', '9567890123', 'Accountant', 30000.00),  
(5, 'Brian Moore', 'brian@courier.com', '9678901234', 'Warehouse Manager', 40000.00);

INSERT INTO Location (LocationID, LocationName, Address)  
VALUES  
(1, 'New York Branch', '123 Main St, NY'),  
(2, 'Los Angeles Branch', '456 Elm St, LA'),  
(3, 'San Francisco Branch', '101 Pine St, SF'),  
(4, 'Houston Branch', '789 Maple St, TX'),  
(5, 'Seattle Branch', '404 Cedar St, WA');

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)  
VALUES  
(1, 1, 1, 250.00, '2025-03-18'),  
(2, 2, 2, 100.00, '2025-03-15'),  
(3, 4, 3, 500.00, '2025-03-20'),  
(4, 5, 4, 75.00, '2025-03-21'),  
(5, 6, 5, 300.00, '2025-03-22'),  
(6, 3, 1, 800.00, '2025-03-24'),  
(7, 7, 2, 600.00, '2025-03-25'),  
(8, 8, 3, 1000.00, '2025-03-26'),  
(9, 9, 4, 1200.00, '2025-03-27'),  
(10, 10, 5, 150.00, '2025-03-28');

