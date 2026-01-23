# Database Schema

This folder contains database design for the project.
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','farmer','student') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE livestock (
  livestock_id INT AUTO_INCREMENT PRIMARY KEY,
  animal_type VARCHAR(50) NOT NULL,
  age INT,
  health_status VARCHAR(100),
  owner_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (owner_id) REFERENCES users(user_id)
);
CREATE TABLE milk_production (
  record_id INT AUTO_INCREMENT PRIMARY KEY,
  livestock_id INT NOT NULL,
  record_date DATE NOT NULL,
  session ENUM('morning','evening') NOT NULL,
  quantity DECIMAL(6,2) NOT NULL,
  FOREIGN KEY (livestock_id) REFERENCES livestock(livestock_id)
);
CREATE TABLE milk_sales (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  buyer_type ENUM('company','sweet_shop') NOT NULL,
  quantity DECIMAL(6,2) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  sale_date DATE NOT NULL
);
CREATE TABLE dairy_products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  quantity DECIMAL(6,2) NOT NULL,
  cost DECIMAL(8,2) NOT NULL,
  selling_price DECIMAL(8,2) NOT NULL,
  created_at DATE NOT NULL
);
CREATE TABLE vaikol (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(100) NOT NULL,
  quantity DECIMAL(6,2) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  purchase_date DATE NOT NULL
);
CREATE TABLE market_prices (
  price_id INT AUTO_INCREMENT PRIMARY KEY,
  item_type VARCHAR(50) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  updated_date DATE NOT NULL
);
CREATE TABLE student_deals (
  deal_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  item_type VARCHAR(50) NOT NULL,
  quantity DECIMAL(6,2) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  deal_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES users(user_id)
);

