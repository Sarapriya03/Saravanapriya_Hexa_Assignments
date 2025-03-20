INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address)
VALUES
(1, 'John', 'Doe', '1990-01-15', 'john.doe@example.com', '1234567890', '123 Maple St'),
(2, 'Jane', 'Smith', '1985-03-22', 'jane.smith@example.com', '2345678901', '456 Oak St'),
(3, 'Michael', 'Brown', '1992-07-10', 'michael.brown@example.com', '3456789012', '789 Pine St'),
(4, 'Emily', 'Johnson', '1998-04-03', 'emily.j@example.com', '4567890123', '101 Cedar St'),
(5, 'Chris', 'Evans', '1995-11-05', 'chris.evans@example.com', '5678901234', '202 Birch St'),
(6, 'Olivia', 'Taylor', '1993-08-19', 'olivia.t@example.com', '6789012345', '303 Elm St'),
(7, 'David', 'Wilson', '1990-12-25', 'david.w@example.com', '7890123456', '404 Aspen St'),
(8, 'Sophia', 'Martinez', '1994-06-13', 'sophia.m@example.com', '8901234567', '505 Walnut St'),
(9, 'James', 'Anderson', '1987-02-09', 'james.a@example.com', '9012345678', '606 Chestnut St'),
(10, 'Ava', 'Thomas', '1999-05-20', 'ava.t@example.com', '1234509876', '707 Redwood St');

SELECT * FROM Customers

INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
(101, 1, 'savings', 5000),
(102, 2, 'current', 12000),
(103, 3, 'savings', 8000),
(104, 4, 'zero_balance', 0),
(105, 5, 'savings', 3000),
(106, 6, 'current', 15000),
(107, 7, 'savings', 7000),
(108, 8, 'current', 20000),
(109, 9, 'zero_balance', 0),
(110, 10, 'savings', 4500);

SELECT * FROM Accounts

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(201, 101, 'deposit', 2000, '2024-03-10 10:00:00'),
(202, 102, 'withdrawal', 3000, '2024-03-11 11:15:00'),
(203, 103, 'deposit', 1500, '2024-03-12 09:30:00'),
(204, 104, 'deposit', 500, '2024-03-13 14:45:00'),
(205, 105, 'withdrawal', 1000, '2024-03-14 16:20:00'),
(206, 106, 'deposit', 2500, '2024-03-15 12:10:00'),
(207, 107, 'transfer', 2000, '2024-03-16 13:40:00'),
(208, 108, 'deposit', 3000, '2024-03-17 15:00:00'),
(209, 109, 'withdrawal', 500, '2024-03-18 10:35:00'),
(210, 110, 'transfer', 1000, '2024-03-19 09:50:00');

SELECT * FROM Transactions

SELECT c.first_name+' '+c.last_name AS customer_name,
a.account_type, c.email
FROM Customers c, Accounts a
WHERE c.customer_id = a.customer_id

SELECT 
    c.first_name,
    c.last_name,
    a.account_id,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
ORDER BY t.transaction_date DESC;

UPDATE Accounts
SET balance = balance + 500
WHERE account_id = 101

SELECT * FROM Accounts

SELECT first_name+' '+last_name AS full_name FROM Customers

DELETE FROM Accounts
WHERE balance = 0
AND account_type = 'savings'

SELECT first_name, last_name, email, phone_number, address
FROM Customers
WHERE address LIKE '%123 Maple St%'; 

SELECT balance 
FROM Accounts 
WHERE account_id = 106

SELECT account_id, balance
FROM Accounts 
WHERE balance > 8000

SELECT transaction_id, transaction_type, amount, transaction_date
FROM Transactions
WHERE account_id = 101; 

SELECT 
    account_id,
    customer_id,
    balance,
    balance * 0.04 AS interest_accrued
FROM Accounts
WHERE account_type = 'savings';

SELECT account_id, customer_id, account_type, balance
FROM Accounts
WHERE balance < 8000; 

SELECT first_name, last_name, email, phone_number, address
FROM Customers
WHERE address NOT LIKE '%123 Maple St%'; 
