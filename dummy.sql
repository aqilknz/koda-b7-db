-- 1. Insert Payment Methods 
INSERT INTO payment_methods (name) VALUES
('Bank Rakyat Indonesia'),
('DANA'),
('Bank Central Asia'),
('GoPay'),
('OVO');

-- 2. Insert Users
INSERT INTO users ( email, password, pin) VALUES
( 'ahmad@example.com', 'password123', '123456'),
('budi@example.com', 'budi1234', '654321'),
('siti@example.com', 'siti_pass', '112233'),
('andi@example.com', 'andi111', '332211'),
( 'rani@example.com', 'ranirani', '998877'),
( 'eko@example.com', 'ekopras', '778899'),
('dina@example.com', 'dinaduna', '555666'),
( 'reza@example.com', 'rezareza', '444333'),
('maya@example.com', 'mayasari', '222111'),
('fajar@example.com', 'fajarhid', '000000');

-- 3. Insert Profiles
INSERT INTO profiles (user_id, full_name, phone, photo) VALUES
(1, 'Ahmad Aqil Khairun Nadzar', '081234567890', 'https://example.com/photos/aqil.jpg'),
(2, 'Budi Santoso', '081234567891', 'https://example.com/photos/budi.jpg'),
(3, 'Siti Aminah', '081234567892', 'https://example.com/photos/siti.jpg'),
(4, 'Andi Wijaya', '081234567893', 'https://example.com/photos/andi.jpg'),
(5, 'Rani Mulyani', '081234567894', 'https://example.com/photos/rani.jpg'),
(6, 'Eko Prasetyo', '081234567895', 'https://example.com/photos/eko.jpg'),
(7, 'Dina Kurnia', '081234567896', 'https://example.com/photos/dina.jpg'),
(8, 'Reza Rahadian', '081234567897', 'https://example.com/photos/reza.jpg'),
(9, 'Maya Sari', '081234567898', 'https://example.com/photos/maya.jpg'),
(10, 'Fajar Hidayat', '081234567899', 'https://example.com/photos/fajar.jpg');

-- 4. Insert Wallets 
INSERT INTO wallets (user_id, balance) VALUES
(1, 470000),
(2, 230000), 
(3, 200000),
(4, 250000),
(5, 50000),  
(6, 100000), 
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- 5. Insert Topups (10 Data)
INSERT INTO topups (user_id, payment_method_id, amount, fee, status, notes) VALUES
(1, 3, 500000, 2500, 'success', 'Topup BCA'),
(2, 2, 200000, 0, 'success', 'Topup DANA'),
(3, 1, 300000, 2000, 'success', 'Topup BRI'),
(4, 4, 150000, 1000, 'success', 'Topup GoPay'),
(5, 5, 50000, 0, 'pending', 'Menunggu pembayaran OVO'),
(6, 3, 100000, 2500, 'failed', 'Timeout'),
(7, 2, 75000, 0, 'pending', 'Menunggu pembayaran DANA'),
(8, 1, 200000, 2000, 'failed', 'Dibatalkan user'),
(9, 4, 30000, 1000, 'pending', 'Menunggu pembayaran GoPay'),
(10, 5, 100000, 0, 'pending', 'Menunggu pembayaran OVO');

-- 6. Insert Transfers (10 Data)
INSERT INTO transfers (sender_id, receiver_id, amount, fee, status, notes) VALUES
(1, 2, 50000, 0, 'success', 'Bayar hutang makan'),
(3, 4, 100000, 0, 'success', 'Patungan langganan software'),
(2, 1, 20000, 0, 'success', 'Kembalian gorengan'),
(4, 5, 50000, 0, 'pending', 'Menunggu proses'),
(5, 6, 10000, 0, 'failed', 'Koneksi terputus'),
(6, 7, 25000, 0, 'pending', 'Menunggu proses'),
(7, 8, 150000, 0, 'failed', 'Saldo tidak cukup'),
(8, 9, 30000, 0, 'pending', 'Menunggu proses'),
(9, 10, 45000, 0, 'failed', 'Sistem sibuk'),
(10, 1, 100000, 0, 'pending', 'Menunggu proses');

-- 7. Insert Transactions (10 Data)
INSERT INTO transactions (user_id, transaction_type, flow_type, amount, reference_id, description) VALUES
-- Mutasi dari Topup (ID 1 - 4)
(1, 'topup', 'income', 500000, 1, 'Topup via Bank Central Asia'),
(2, 'topup', 'income', 200000, 2, 'Topup via DANA'),
(3, 'topup', 'income', 300000, 3, 'Topup via Bank Rakyat Indonesia'),
(4, 'topup', 'income', 150000, 4, 'Topup via GoPay'),
-- Mutasi dari Transfer ID 1 (User 1 kirim ke User 2)
(1, 'transfer', 'expense', 50000, 1, 'Transfer ke Budi Santoso (Bayar hutang makan)'),
(2, 'transfer', 'income', 50000, 1, 'Terima dari Ahmad Aqil (Bayar hutang makan)'),
-- Mutasi dari Transfer ID 2 (User 3 kirim ke User 4)
(3, 'transfer', 'expense', 100000, 2, 'Transfer ke Andi Wijaya (Patungan langganan software)'),
(4, 'transfer', 'income', 100000, 2, 'Terima dari Siti Aminah (Patungan langganan software)'),
-- Mutasi dari Transfer ID 3 (User 2 kirim ke User 1)
(2, 'transfer', 'expense', 20000, 3, 'Transfer ke Ahmad Aqil (Kembalian gorengan)'),
(1, 'transfer', 'income', 20000, 3, 'Terima dari Budi Santoso (Kembalian gorengan)');

table users;
table profiles;
table wallets;
table topups;
table transfers;
table payment_methods;
table transactions;