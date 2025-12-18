CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0) -- Количество на складе
);

CREATE TABLE order_history (
    log_id SERIAL PRIMARY KEY,
    product_id INT,
    quantity_changed INT,
    notes VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
--Задание 1
INSERT INTO products (product_id, name, quantity) VALUES
(1, 'Ноутбук', 20),
(2, 'Смартфон', 50);
BEGIN;
UPDATE products SET quantity = quantity - 5 WHERE product_id = 1;

INSERT INTO order_history (product_id, quantity_changed, notes) VALUES (1, -5, 'Продажа 5 единиц');
COMMIT;

-- Задание 2
BEGIN;
UPDATE products SET quantity = quantity - 100 WHERE product_id = 2;
ROLLBACK;
SELECT * FROM products WHERE product_id = 2;
SELECT * FROM order_history WHERE product_id = 2 AND quantity_changed = -100;
--Задание 3
BEGIN;
UPDATE products SET quantity = quantity - 2 WHERE product_id = 1;
ROLLBACK;
SELECT * FROM products WHERE product_id = 1;
--Задание 4
BEGIN;
UPDATE products SET quantity = quantity - 10 WHERE product_id = 2;
COMMIT;

SELECT * FROM products WHERE product_id = 2;
SELECT * FROM products WHERE product_id = 2;