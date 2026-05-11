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
WHERE email = 'aqil@email.com' AND password = 'pass1234';

-- Get login Information
SELECT p.full_name, u.email, p.photo
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE u.id =1;

-- cek pin
SELECT email, pin FROM users WHERE id = 1;

-- get transaction history
SELECT id, transaction_type, flow_type, amount, description, created_at 
FROM transactions 
WHERE user_id = 1 
ORDER BY created_at DESC;

-- get user history with  option (income/expense, date range)
-- Contoh untuk mengambil histori 'income' (Pemasukan) bulan ini
SELECT id, transaction_type, flow_type, amount, description, created_at 
FROM transactions 
WHERE user_id = 1 
  AND flow_type = 'income' 
  AND created_at BETWEEN '2026-05-01 00:00:00' AND '2026-05-31 23:59:59'
ORDER BY created_at DESC;

-- get user account information (balance, income, expense)
SELECT 
    w.balance,
    (SELECT SUM(amount) FROM transactions WHERE user_id = 1 AND flow_type = 'income') AS total_income,
    (SELECT SUM(amount) FROM transactions WHERE user_id = 1 AND flow_type = 'expense') AS total_expense
FROM wallets w
WHERE w.user_id = 1;

-- find receiver with pagination
SELECT u.id, p.full_name, p.phone, p.photo 
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE (u.email LIKE '%budi%' OR p.phone LIKE '%0812%')
  AND u.id != 1 
ORDER BY p.full_name ASC
LIMIT 10 OFFSET 0;

-- Create transaction Topup dan Transfer
-- Topup
BEGIN;
INSERT INTO topups (user_id, payment_method_id, amount, fee, status, notes)
VALUES (1, 3, 250000, 0, 'success', 'Topup via BCA')
RETURNING id; 
UPDATE wallets 
SET balance = balance + 250000, 
    updated_at = NOW() 
WHERE user_id = 1;
INSERT INTO transactions (user_id, transaction_type, flow_type, amount, reference_id, description)
VALUES (1, 'topup', 'income', 250000, 101, 'Topup saldo via Bank Central Asia');
COMMIT;

-- Transfer
BEGIN;
-- Langkah 1: Catat detail transfer di tabel utama
INSERT INTO transfers (sender_id, receiver_id, amount, fee, status, notes)
VALUES (1, 2, 50000, 0, 'success', 'Bayar uang makan siang')
RETURNING id;
-- Langkah 2: Kurangi saldo pengirim (User ID: 1)
UPDATE wallets 
SET balance = balance - 50000, 
    updated_at = NOW() 
WHERE user_id = 1;
-- Langkah 3: Tambahkan saldo penerima (User ID: 2)
UPDATE wallets 
SET balance = balance + 50000, 
    updated_at = NOW() 
WHERE user_id = 2;
INSERT INTO transactions (user_id, transaction_type, flow_type, amount, reference_id, description)
VALUES (1, 'transfer', 'expense', 50000, 202, 'Transfer ke Budi Santoso (Bayar uang makan siang)');
INSERT INTO transactions (user_id, transaction_type, flow_type, amount, reference_id, description)
VALUES (2, 'transfer', 'income', 50000, 202, 'Terima transfer dari Ahmad Aqil (Bayar uang makan siang)');
COMMIT;


-- get user profile
SELECT p.photo, p.full_name, p.phone, u.email 
FROM profiles p
JOIN users u ON p.user_id = u.id
WHERE u.id = 1;

-- change password
UPDATE users 
SET password = 'new_hashed_password', updated_at = NOW() 
WHERE id = 1;

-- change pin
UPDATE users 
SET pin = '654321', updated_at = NOW() 
WHERE id = 1;

-- change user profile
UPDATE profiles 
SET full_name = 'Ahmad Aqil', 
    phone = '081999888777', 
    photo = 'https://i.pravatar.cc/150?img=12',
    updated_at = NOW() 
WHERE user_id = 1;

table users;
table profiles;
table wallets;
table transaction_categories;
table payment_methods;
table transactions;