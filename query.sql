-- Active: 1778319885998@@127.0.0.1@5050@db_ewallet
-- register
WITH register AS (
    INSERT INTO users (email, password) 
    VALUES ('aqil@email.com', 'pass1234')
    RETURNING id
),
create_wallet AS (
    INSERT INTO wallets (user_id)
    SELECT id FROM register
)
INSERT INTO profiles (user_id)
SELECT id FROM register;

-- login
SELECT id, email, password
FROM users
WHERE email = 'aqil@mail.com' AND password = 'admin123';

-- Get login Information
SELECT p.full_name, u.email, p.photo
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE u.id =1;

-- cek pin
SELECT email, pin FROM users WHERE id = 1;

-- get transaction history
SELECT t.sender_id, t.receiver_id,t.total_amount, tc.name as category_name, pm.name as payment_method_name
FROM transactions t
JOIN transaction_categories tc ON t.category_id = tc.id
JOIN payment_methods pm ON t.payment_method_id = pm.id
WHERE t.sender_id = 1 OR t.receiver_id = 1
ORDER BY t.created_at DESC;

-- get user history with  option (income/expense, date range)
SELECT sender_id, receiver_id, total_amount, transaction_type, created_at
FROM transactions 
WHERE (sender_id = 1 OR receiver_id = 1)
AND transaction_type = 'expense' 
AND created_at BETWEEN '2026-05-01 00:00:00' AND '2026-05-31 23:59:59'
ORDER BY created_at DESC;

-- get user account information (balance, income, expense)
SELECT 
    w.balance,
    (SELECT SUM(total_amount)
    FROM transactions 
    WHERE ((sender_id = w.user_id AND transaction_type = 'income') OR receiver_id = w.user_id) 
    AND status = 'success') as total_income,
    (SELECT SUM(total_amount) 
    FROM transactions 
    WHERE sender_id = w.user_id AND transaction_type = 'expense' 
    AND status = 'success') as total_expense
FROM wallets w
WHERE w.user_id = 1;

-- find receiver with pagination
SELECT DISTINCT
    u.id AS user_id, 
    p.full_name, 
    p.phone, 
    p.photo
FROM users u
JOIN profiles p ON u.id = p.user_id
JOIN transactions t ON t.receiver_id = u.id
WHERE u.id != 1 AND LOWER(p.full_name) LIKE LOWER('%S%')
  AND p.phone LIKE '%0812%'
  AND t.status = 'success'
LIMIT 10 OFFSET 0;

-- Create transaction Topup dan Transfer
INSERT INTO transactions (sender_id, receiver_id, category_id, payment_method_id, subtotal, tax_amount, total_amount, transaction_type, status, notes) 
VALUES (1, NULL, 1, 3, 1000000, 0, 1000000, 'income', 'success', 'Top up via BCA');
UPDATE wallets SET balance = balance + 1000000 WHERE user_id = 1;

INSERT INTO transactions (sender_id, receiver_id, category_id, payment_method_id, subtotal, tax_amount, total_amount, transaction_type, status, notes) 
VALUES (1, 2, 2, 3, 250000, 0 , 250000, 'expense', 'success', 'Transfer ke Siti');

UPDATE wallets SET balance = balance - 250000 WHERE user_id = 1;
UPDATE wallets SET balance = balance + 250000 WHERE user_id = 2;


-- get user profile
SELECT  p.full_name, p.photo, p.phone, u.email 
FROM profiles p 
JOIN users u ON p.user_id = u.id 
WHERE u.id = 5;

-- change password
UPDATE users SET password = 'node123' WHERE id = 2;
SELECT * FROM users where id=2;

-- change pin
UPDATE users 
SET pin = '1239' 
WHERE id = 6 AND updated_at = now();
SELECT * FROM users where id=6;

-- change user profile
UPDATE profiles 
SET full_name = 'Nina Sari', phone = 080606053, photo = 'https://cchangeprofile.com' 
WHERE user_id = 10;
SELECT * FROM profiles WHERE id= 10;

table users;
table profiles;
table wallets;
table transaction_categories;
table payment_methods;
table transactions;