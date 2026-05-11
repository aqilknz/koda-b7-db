-- Active: 1778319885998@@127.0.0.1@5050
CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    pin VARCHAR(6) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    update_at TIMESTAMP
);


CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id),
    full_name VARCHAR(100),
    phone VARCHAR(20),
    photo TEXT DEFAULT 'https://i.pravatar.cc/150?img=0',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP 
);

ALTER TABLE profiles
ALTER COLUMN photo SET DEFAULT 'https://i.pravatar.cc/150?img=0';

CREATE TABLE wallets (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id),
    balance INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP 
);

CREATE TABLE transaction_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 6. Tabel Transaksi
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    sender_id INT REFERENCES users(id),
    receiver_id INT REFERENCES users(id),
    category_id INT REFERENCES transaction_categories(id),
    payment_method_id INT REFERENCES payment_methods(id),
    subtotal INT NOT NULL CHECK (subtotal >= 0),
    tax_amount INT DEFAULT 0 CHECK (tax_amount >= 0),
    total_amount INT NOT NULL CHECK (total_amount >= 0),
    transaction_type VARCHAR(10),
    status VARCHAR(20) DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP 

DROP TABLE users CASCADE;

table users;
table profiles;
table wallets;
table transaction_categories;
table payment_methods;
table transactions;