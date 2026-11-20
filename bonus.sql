-- Create a sample table

CREATE TABLE bonus_products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price NUMERIC(10, 2)
);

-- Insert records

INSERT INTO bonus_products (product_name, price)
VALUES
('Laptop', 55000),
('Mobile', 25000),
('Keyboard', 1500),
('Mouse', 800);

-- Find expensive products

SELECT *
FROM bonus_products
WHERE price > 10000;

-- Find average product price

SELECT AVG(price) AS average_price
FROM bonus_products;

-- Find maximum price

SELECT MAX(price) AS maximum_price
FROM bonus_products;

-- Sort products by price

SELECT *
FROM bonus_products
ORDER BY price DESC;

-- Create index

CREATE INDEX idx_bonus_price
ON bonus_products(price);

-- View query plan

EXPLAIN ANALYZE
SELECT *
FROM bonus_products
WHERE price > 10000;