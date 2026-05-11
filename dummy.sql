-- 1. Users
INSERT INTO users (email, password, pin) VALUES
('budi@mail.com', 'pass123', '1234'),
('siti@mail.com', 'pass123', '2345'),
('andi@mail.com', 'pass123', '3456'),
('dewi@mail.com', 'pass123', '4567'),
('rudi@mail.com', 'pass123', '5678'),
('maya@mail.com', 'pass123', '6789'),
('eko@mail.com', 'pass123', '7890'),
('lisa@mail.com', 'pass123', '8901'),
('tono@mail.com', 'pass123', '9012'),
('nina@mail.com', 'pass123', '0123');


-- 2. Profiles
INSERT INTO profiles (user_id, full_name, phone, photo) VALUES
(1, 'Budi Santoso', '081234567801', 'https://i.pravatar.cc/150?img=1'),
(2, 'Siti Aminah', '081234567802', 'https://i.pravatar.cc/150?img=2'),
(3, 'Andi Wijaya', '081234567803', 'https://i.pravatar.cc/150?img=3'),
(4, 'Dewi Lestari', '081234567804', 'https://i.pravatar.cc/150?img=4'),
(5, 'Rudi Hartono', '081234567805', 'https://i.pravatar.cc/150?img=5'),
(6, 'Maya Putri', '081234567806', 'https://i.pravatar.cc/150?img=6'),
(7, 'Eko Prasetyo', '081234567807', 'https://i.pravatar.cc/150?img=7'),
(8, 'Lisa Maharani', '081234567808', 'https://i.pravatar.cc/150?img=8'),
(9, 'Tono Susanto', '081234567809', 'https://i.pravatar.cc/150?img=9'),
(10, 'Nina Sari', '081234567810', 'https://i.pravatar.cc/150?img=10');

TRUNCATE TABLE 
    transactions
RESTART IDENTITY CASCADE;

-- Wallets
INSERT INTO wallets (user_id, balance) VALUES
(1, 5000000),
(2, 3200000),
(3, 1500000),
(4, 7800000),
(5, 2000000),
(6, 4500000),
(7, 1200000),
(8, 6000000),
(9, 980000),
(10, 3500000);

-- Transactions
INSERT INTO transactions 
(sender_id, receiver_id, category_id, payment_method_id, subtotal, tax_amount, total_amount, transaction_type, status, notes, created_at) 
VALUES
(1, NULL, 1, 3, 1000000, 0, 1000000, 'income', 'success', 'Top up via BCA', '2026-05-01 08:15:00'),
(2, NULL, 1, 2, 500000, 0, 500000, 'income', 'success', 'Top up via DANA', '2026-05-02 09:30:00'),
(5, NULL, 1, 1, 2000000, 0, 2000000, 'income', 'success', 'Top up via BRI', '2026-05-03 14:20:00'),
(8, NULL, 1, 4, 750000, 0, 750000, 'income', 'success', 'Top up via GoPay', '2026-05-04 11:05:00'),
(10, NULL, 1, 5, 300000, 0, 300000, 'income', 'pending', 'Top up via OVO', '2026-05-05 16:45:00'),

(1, 2, 2, 3, 250000, 0, 250000, 'expense', 'success', 'Transfer ke Siti', '2026-05-06 10:10:00'),
(3, 4, 2, 3, 100000, 0, 100000, 'expense', 'success', 'Transfer ke Dewi', '2026-05-06 13:25:00'),
(4, 6, 2, 2, 150000, 0, 150000, 'expense', 'success', 'Transfer ke Maya', '2026-05-07 09:00:00'),
(6, 7, 2, 4, 200000, 0, 200000, 'expense', 'success', 'Transfer ke Eko', '2026-05-07 20:15:00'),
(7, 9, 2, 1, 50000, 0, 50000, 'expense', 'failed', 'Transfer gagal', '2026-05-08 08:40:00'),
(9, 10, 2, 5, 120000, 0, 120000, 'expense', 'success', 'Transfer ke Nina', '2026-05-08 17:30:00'),
(2, 5, 2, 2, 300000, 0, 300000, 'expense', 'success', 'Transfer ke Rudi', '2026-05-09 12:00:00'),
(8, 1, 2, 4, 400000, 0, 400000, 'expense', 'success', 'Transfer ke Budi', '2026-05-09 18:50:00'),
(10, 3, 2, 5, 75000, 0, 75000, 'expense', 'success', 'Transfer ke Andi', '2026-05-10 07:20:00'),
(5, 8, 2, 1, 600000, 0, 600000, 'expense', 'success', 'Transfer ke Lisa', '2026-05-10 21:10:00');

-- 4. Transaction Categories
INSERT INTO transaction_categories (name) VALUES
('topup'),
('transfer');

-- 5. Payment Methods
INSERT INTO payment_methods (name) VALUES
('Bank Rakyat Indonesia'),
('DANA'),
('Bank Central Asia'),
('GoPay'),
('OVO');
