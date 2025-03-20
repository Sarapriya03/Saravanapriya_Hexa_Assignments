SELECT c.customer_id, c.first_name, c.last_name,
a.balance
FROM Customers c, Accounts a
WHERE c.customer_id = a.customer_id 

SELECT top 10 account_id, balance
FROM Accounts
ORDER BY balance DESC

SELECT * FROM Transactions

SELECT customer_id, SUM(amount) AS total_deposits
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE t.transaction_type = 'deposit' 
  AND t.transaction_date = '2024-03-15'  
GROUP BY customer_id;

SELECT top 1 customer_id, first_name+' '+last_name AS Old_customer, DOB 
FROM Customers
ORDER BY DOB ASC
SELECT top 1 customer_id, first_name+' '+last_name AS New_customer, DOB 
FROM Customers
ORDER BY DOB DESC

SELECT 
    t.transaction_id,
    t.account_id,
    a.account_type,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id;

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    a.account_id,
    a.account_type,
    a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

SELECT 
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.account_id = 106;

SELECT 
    customer_id,
    first_name,
    last_name,
    COUNT(account_id) AS account_count
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_id) > 1;

SELECT 
    account_id,
    SUM(amount) AS balance_difference
FROM Transactions
GROUP BY account_id;

SELECT 
    a.account_id,
    AVG(a.balance) AS avg_daily_balance
FROM Transactions, Accounts a
WHERE transaction_date BETWEEN '2024-03-01' AND '2024-03-31'
GROUP BY a.account_id;

SELECT 
    account_type,
    SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;

SELECT 
    account_id,
    COUNT(transaction_id) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC;

SELECT 
    c.first_name,
    c.last_name,
    a.account_type,
    SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.first_name, c.last_name, a.account_type
HAVING SUM(a.balance) > 10000
ORDER BY total_balance DESC;

SELECT 
    account_id,
    transaction_date,
    amount,
    COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, transaction_date, amount
HAVING COUNT(*) > 1;






