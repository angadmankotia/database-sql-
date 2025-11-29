stomers-- Basic retrieval and filtering (for checklist item 1)
-- 1. Select all cu
-- 2. Retrieve orders for a given customer (parameterized in app)
SELECT * FROM customers;


SELECT o.order_id, o.order_date, o.total
FROM orders o
WHERE o.customer_id = 1
ORDER BY o.order_date DESC;


-- 3. Filter products by category / price
SELECT product_id, name, price
FROM products
WHERE category = 'Accessories' AND price < 2000
ORDER BY price;