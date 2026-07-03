-- ===========================================
-- E-Commerce Platform Database Management System
-- Database Creation Script
-- ===========================================

-- Create Database
CREATE DATABASE EcommerceDB;

-- Use Database
USE EcommerceDB;

-- ===========================================
-- Customers Table
-- ===========================================

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(10) NOT NULL
);

-- ===========================================
-- Categories Table
-- ===========================================

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- ===========================================
-- Suppliers Table
-- ===========================================

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE
);

-- ===========================================
-- Products Table
-- ===========================================

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK(price > 0),
    stock INT NOT NULL CHECK(stock >= 0),
    description TEXT,

    CONSTRAINT fk_product_category
        FOREIGN KEY(category_id)
        REFERENCES Categories(category_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_product_supplier
        FOREIGN KEY(supplier_id)
        REFERENCES Suppliers(supplier_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ===========================================
-- Cart Table
-- ===========================================

CREATE TABLE Cart (

    cart_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL CHECK(quantity > 0),

    CONSTRAINT fk_cart_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cart_product
        FOREIGN KEY(product_id)
        REFERENCES Products(product_id)
        ON DELETE CASCADE
);

-- ===========================================
-- Orders Table
-- ===========================================

CREATE TABLE Orders (

    order_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    order_date DATE NOT NULL,

    total_amount DECIMAL(10,2) NOT NULL CHECK(total_amount >= 0),

    status VARCHAR(30) DEFAULT 'Pending',

    CONSTRAINT fk_order_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);

-- ===========================================
-- Order Items Table
-- ===========================================

CREATE TABLE Order_Items (

    order_item_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL CHECK(quantity > 0),

    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_item_order
        FOREIGN KEY(order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_item_product
        FOREIGN KEY(product_id)
        REFERENCES Products(product_id)
        ON DELETE CASCADE
);

-- ===========================================
-- Payments Table
-- ===========================================

CREATE TABLE Payments (

    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    payment_method VARCHAR(30),

    payment_status VARCHAR(30),

    payment_date DATE,

    CONSTRAINT fk_payment_order
        FOREIGN KEY(order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE
);

-- ===========================================
-- Shipping Table
-- ===========================================

CREATE TABLE Shipping (

    shipping_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    shipping_address VARCHAR(255),

    delivery_date DATE,

    shipping_status VARCHAR(30),

    CONSTRAINT fk_shipping_order
        FOREIGN KEY(order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE
);

-- ===========================================
-- Reviews Table
-- ===========================================

CREATE TABLE Reviews (

    review_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    product_id INT NOT NULL,

    rating INT CHECK(rating BETWEEN 1 AND 5),

    comment TEXT,

    CONSTRAINT fk_review_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_review_product
        FOREIGN KEY(product_id)
        REFERENCES Products(product_id)
        ON DELETE CASCADE
);