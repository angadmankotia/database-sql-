-- Complex queries: joins, nested queries, aggregations (checklist item 2)


-- 1. Orders with customer info and aggregated total items
SELECT o.order_id, o.order_date, c.name AS customer_name,
SUM(oi.quantity) AS total_items, o.total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.order_date, c.name, o.total
ORDER BY o.order_date DESC;


-- 2. Top selling products (by quantity) using nested query
SELECT p.product_id, p.name, p.category, total_qty
FROM products p
JOIN (
SELECT product_id, SUM(quantity) AS total_qty
FROM order_items
GROUP BY product_id
) sub ON sub.product_id = p.product_id
ORDER BY total_qty DESC;


-- 3. Customers with orders above average order total (correlated subquery)
SELECT DISTINCT c.customer_id, c.name, c.email
FROM customers c
WHERE EXISTS (
SELECT 1 FROM orders o
WHERE o.customer_id = c.customer_id
AND o.total > (SELECT AVG(total) FROM orders)
);