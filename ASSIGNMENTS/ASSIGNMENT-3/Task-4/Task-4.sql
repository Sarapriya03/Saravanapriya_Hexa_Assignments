SELECT c.customer_id, c.first_name, c.last_name, a.account_id, a.balance  
FROM Customers c  
JOIN Accounts a ON c.customer_id = a.customer_id  
WHERE a.balance = (SELECT MAX(balance) FROM Accounts);

SELECT c.customer_id, c.first_name, c.last_name, AVG(a.balance) AS average_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE c.customer_id IN (
    SELECT customer_id 
    FROM Accounts 
    GROUP BY customer_id 
    HAVING COUNT(account_id) > 1
)
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT t.account_id, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Transactions t
WHERE t.amount > (
    SELECT AVG(amount) 
    FROM Transactions
);

SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
LEFT JOIN Accounts a ON c.customer_id = a.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

SELECT SUM(a.balance) AS total_balance_no_transactions
FROM Accounts a
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

SELECT t.transaction_id, t.account_id, t.transaction_type, t.amount, t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE a.balance = (SELECT MIN(balance) FROM Accounts);

SELECT customer_id, COUNT(DISTINCT account_type) AS account_types_count
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;

SELECT 
    account_type,
    COUNT(*) AS total_accounts,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage_of_total
FROM Accounts
GROUP BY account_type;

SELECT 
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE a.customer_id = 102;

SELECT 
    account_type,
    (SELECT SUM(balance) 
     FROM Accounts a2 
     WHERE a1.account_type = a2.account_type) AS total_balance
FROM Accounts a1
GROUP BY account_type;





