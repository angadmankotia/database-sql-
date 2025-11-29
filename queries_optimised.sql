-- Optimized queries and index suggestions (checklist item 4)
-- Suggested indexes
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_order_items_order_id ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_products_category_price ON products(category, price);


-- Use covering index trick for frequent product queries
-- Example optimized product lookup
SELECT product_id, name, price
FROM products
WHERE category = 'Accessories' AND price < 2000;
-- With the composite index above, this will be faster for that filter.


-- Use EXPLAIN ANALYZE (example shown to run manually)
-- EXPLAIN ANALYZE SELECT p.product_id, p.name FROM products p WHERE category='Accessories' AND price<2000;