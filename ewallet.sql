-- Active: 1778319885998@@127.0.0.1@5050
-- 1. Tabel Users 
CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    pin VARCHAR(6),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- 2. Tabel Profiles
CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id),
    full_name VARCHAR(100),
    phone VARCHAR(20),
    photo TEXT DEFAULT 'https://i.pravatar.cc/150?img=0',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP 
);

-- 3. Tabel Wallets
CREATE TABLE wallets (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id),
    balance INT DEFAULT 0 CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP 
);

-- 4. Tabel Payment Methods 
CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- 5. Tabel Topups
CREATE TABLE topups (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    payment_method_id INT REFERENCES payment_methods(id),
    amount INT NOT NULL CHECK (amount > 0),
    fee INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'success', 'failed')),
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- 6. Tabel Transfers
CREATE TABLE transfers (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL REFERENCES users(id),
    receiver_id INT NOT NULL REFERENCES users(id),
    amount INT NOT NULL CHECK (amount > 0),
    fee INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'success', 'failed')),
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CHECK (sender_id != receiver_id)
);

-- 7. Tabel Transactions
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    transaction_type VARCHAR(20) NOT NULL CHECK (transaction_type IN ('topup', 'transfer')),
    flow_type VARCHAR(10) NOT NULL CHECK (flow_type IN ('income', 'expense')),
    amount INT NOT NULL, 
    reference_id INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

DROP TABLE users CASCADE;

table users;
table profiles;
table wallets;
table transaction_categories;
table payment_methods;
table transactions;