CREATE DATABASE TechShop

CREATE TABLE Customers
(CustomerID int PRIMARY KEY IDENTITY,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Email varchar(max) not null,
Phone bigint not null,
Address varchar(50) not null)

CREATE TABLE Products
(ProductID int PRIMARY KEY IDENTITY,
ProductName varchar(50) not null,
Description varchar(50) not null,
Price int not null)

CREATE TABLE Orders
(OrderID int PRIMARY KEY IDENTITY,
CustomerID int not null,
CONSTRAINT fk_orders_customers FOREIGN KEY(CustomerID) references Customers(CustomerID),
OrderDate Date,
TotalAmount int)

CREATE TABLE OrderDetails
(OrderDeatailID int PRIMARY KEY IDENTITY,
OrderID int not null,
CONSTRAINT fk_orderdetails_orders FOREIGN KEY(OrderID) references Orders(OrderID),
ProductId int not null,
CONSTRAINT fk_orderdetails_products FOREIGN KEY(ProductID) references Products(ProductID),
Quantity int not null)

CREATE TABLE Inventory
(InventoryID int PRIMARY KEY IDENTITY,
ProductID int not null,
CONSTRAINT fk_inventory_products FOREIGN KEY(ProductID) references Products(ProductID),
QuantityInStock int not null CHECK(QuantityInStock >= 0),
LastStockUpdate DateTime)

INSERT INTO Customers(FirstName, LastName, Email, Phone, Address)
VALUES
 ('John', 'Doe', 'john.doe@example.com', 9876543210, '123 Elm St'),
 ('Jane', 'Smith', 'jane.smith@example.com', 9876543211, '456 Oak St'),
 ('Robert', 'Brown', 'robert.brown@example.com', 9876543212, '789 Pine St'),
 ('Emily', 'Clark', 'emily.clark@example.com', 9876543213, '321 Maple Ave'),
 ('Michael', 'Johnson', 'michael.johnson@example.com', 9876543214, '654 Cedar Rd'),
 ('Sarah', 'Williams', 'sarah.williams@example.com', 9876543215, '987 Birch Ln'),
 ('David', 'Miller', 'david.miller@example.com', 9876543216, '246 Spruce Ct'),
 ('Emma', 'Taylor', 'emma.taylor@example.com', 9876543217, '135 Walnut Dr'),
 ('James', 'Anderson', 'james.anderson@example.com', 9876543218, '864 Cherry Blvd'),
 ('Olivia', 'Martinez', 'olivia.martinez@example.com', 9876543219, '579 Willow St');

 SELECT * FROM Customers

INSERT INTO Products (ProductName, Description, Price)
VALUES 
('Laptop', 'High-performance laptop', 800),
('Smartphone', 'Latest model smartphone', 600),
('Tablet', 'Portable touchscreen tablet', 400),
('Headphones', 'Wireless noise-canceling', 150),
('Smartwatch', 'Fitness tracking smartwatch', 200),
('Gaming Console', 'Next-gen gaming console', 500),
('Monitor', '4K ultra-wide monitor', 300),
('Keyboard', 'Mechanical RGB keyboard', 100),
('Mouse', 'Ergonomic wireless mouse', 50),
('Speaker', 'Bluetooth portable speaker', 120);

SELECT * FROM Products

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2025-03-01', 1200),
(2, '2025-03-02', 850),
(3, '2025-03-03', 430),
(4, '2025-03-04', 1500),
(5, '2025-03-05', 200),
(6, '2025-03-06', 980),
(7, '2025-03-07', 310),
(8, '2025-03-08', 720),
(9, '2025-03-09', 450),
(10, '2025-03-10', 1320);

SELECT * FROM Orders

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1, 1, 2),
(1, 3, 1),
(2, 2, 4),
(2, 5, 1),
(3, 4, 3),
(4, 6, 2),
(5, 7, 1),
(6, 8, 5),
(7, 9, 2),
(8, 10, 3);

SELECT * FROM OrderDetails

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES 
(1, 50, '2025-03-01 10:00:00'),
(2, 30, '2025-03-02 11:15:00'),
(3, 75, '2025-03-03 09:45:00'),
(4, 20, '2025-03-04 14:30:00'),
(5, 100, '2025-03-05 13:00:00'),
(6, 45, '2025-03-06 16:45:00'),
(7, 60, '2025-03-07 08:30:00'),
(8, 15, '2025-03-08 17:20:00'),
(9, 80, '2025-03-09 12:00:00'),
(10, 25, '2025-03-10 15:10:00');

SELECT * FROM Inventory

EXEC sp_rename 'OrderDetails.OrderDeatailID', 'OrderDetailID', 'COLUMN';

