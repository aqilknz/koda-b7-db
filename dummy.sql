INSERT INTO users (username, email, password, pin) VALUES
('budi_santoso', 'budi@example.com', 'password123', '123456'),
('siti_aminah', 'siti@example.com', 'siti12345', '654321'),
('andi_wijaya', 'andi@example.com', 'andi_pass', '112233'),
('rani_mulyani', 'rani@example.com', 'ranirani', '332211'),
('eko_prasetyo', 'eko@example.com', 'ekopassword', '998877'),
('dina_kurnia', 'dina@example.com', 'dinadun', '778899'),
('reza_rahadian', 'reza@example.com', 'rezareza', '555666'),
('maya_sari', 'maya@example.com', 'mayasari99', '444333'),
('fajar_hidayat', 'fajar@example.com', 'fajarhid', '222111'),
('linda_kusuma', 'linda@example.com', 'lindakus', '000000');
INSERT INTO payment_methods (name) VALUES
('Bank Rakyat Indonesia'),
('DANA'),
('Bank Central Asia'),
('GoPay'),
('OVO');

INSERT INTO profiles (user_id, full_name, phone) VALUES
(1, 'Budi Santoso', '081234567890'),
(2, 'Siti Aminah', '081234567891'),
(3, 'Andi Wijaya', '081234567892'),
(4, 'Rani Mulyani', '081234567893'),
(5, 'Eko Prasetyo', '081234567894'),
(6, 'Dina Kurnia', '081234567895'),
(7, 'Reza Rahadian', '081234567896'),
(8, 'Maya Sari', '081234567897'),
(9, 'Fajar Hidayat', '081234567898'),
(10, 'Linda Kusuma', '081234567899');


INSERT INTO wallets (user_id, balance) VALUES
(1, 500000),
(2, 250000),
(3, 100000),
(4, 750000),
(5, 50000),
(6, 300000),
(7, 150000),
(8, 800000),
(9, 450000),
(10, 600000);

INSERT INTO topups (user_id, payment_method_id, amount, fee, status, notes) VALUES
(1, 1, 100000, 2000, 'success', 'Topup via BRI'),
(2, 2, 50000, 0, 'success', 'Topup via DANA'),
(3, 3, 200000, 2500, 'pending', 'Menunggu pembayaran BCA'),
(4, 4, 150000, 1000, 'success', 'Topup via GoPay'),
(5, 5, 75000, 0, 'failed', 'Timeout via OVO'),
(6, 1, 300000, 2000, 'success', 'Topup via BRI'),
(7, 2, 100000, 0, 'success', 'Topup via DANA'),
(8, 3, 500000, 2500, 'success', 'Topup via BCA'),
(9, 4, 250000, 1000, 'pending', 'Menunggu pembayaran GoPay'),
(10, 5, 50000, 0, 'success', 'Topup via OVO');

INSERT INTO transfers (sender_id, receiver_id, amount, fee, status, notes) VALUES
(1, 2, 50000, 0, 'success', 'Bayar hutang makan'),
(3, 4, 25000, 0, 'success', 'Patungan Netflix'),
(5, 6, 100000, 0, 'pending', 'Menunggu validasi'),
(7, 8, 75000, 0, 'success', 'Beli tiket nonton'),
(9, 10, 200000, 0, 'failed', 'Koneksi error'),
(2, 1, 10000, 0, 'success', 'Kembalian gorengan'),
(4, 3, 50000, 0, 'success', 'Kado ulang tahun'),
(6, 5, 150000, 0, 'success', 'Pinjam uang'),
(8, 7, 30000, 0, 'pending', 'Traktir kopi'),
(10, 9, 80000, 0, 'success', 'Bayar pulsa');


INSERT INTO transactions (user_id, transaction_type, flow_type, amount, reference_id, description) VALUES
-- Dari Topup (Reference ke ID Topups)
(1, 'topup', 'income', 100000, 1, 'Topup via Bank Rakyat Indonesia'),
(2, 'topup', 'income', 50000, 2, 'Topup via DANA'),
(4, 'topup', 'income', 150000, 4, 'Topup via GoPay'),
(6, 'topup', 'income', 300000, 6, 'Topup via Bank Rakyat Indonesia'),

-- Dari Transfer #1 (ID 1: Budi [1] ke Siti [2])
(1, 'transfer', 'expense', 50000, 1, 'Transfer ke Siti Aminah (Bayar hutang makan)'),
(2, 'transfer', 'income', 50000, 1, 'Terima dari Budi Santoso (Bayar hutang makan)'),

-- Dari Transfer #2 (ID 2: Andi [3] ke Rani [4])
(3, 'transfer', 'expense', 25000, 2, 'Transfer ke Rani Mulyani (Patungan Netflix)'),
(4, 'transfer', 'income', 25000, 2, 'Terima dari Andi Wijaya (Patungan Netflix)'),

-- Dari Transfer #6 (ID 6: Siti [2] ke Budi [1])
(2, 'transfer', 'expense', 10000, 6, 'Transfer ke Budi Santoso (Kembalian gorengan)'),
(1, 'transfer', 'income', 10000, 6, 'Terima dari Siti Aminah (Kembalian gorengan)');