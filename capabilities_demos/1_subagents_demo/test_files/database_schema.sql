-- Database Schema
-- TODO: HIGH - Add foreign key constraints
-- TODO: MEDIUM - Add indexes for performance

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  -- TODO: LOW - Add created_at timestamp
  password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  -- TODO: HIGH - Add price validation
  price DECIMAL(10, 2),
  -- TODO: MEDIUM - Add category relationship
  stock_quantity INTEGER DEFAULT 0
);

-- TODO: HIGH - Create orders table