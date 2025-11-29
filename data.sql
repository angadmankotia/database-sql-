NSERT INTO customers (name, email, city) VALUES
('Asha Patel','asha@example.com','Mumbai'),
('Rahul Sharma','rahul@example.com','Delhi'),
('Meena Rao','meena@example.com','Bangalore');
-- data.sql (small sample dataset)
I
INSERT INTO products (sku,name,category,price) VALUES
('SKU-001','Wireless Mouse','Accessories',499.00),
('SKU-002','Mechanical Keyboard','Accessories',3499.00),
('SKU-003','27" Monitor','Displays',15999.00);


INSERT INTO orders (customer_id,order_date,total) VALUES
(1,'2025-11-01',5498.00),
(2,'2025-11-03',15999.00);


INSERT INTO order_items (order_id,product_id,quantity,unit_price) VALUES
(1,1,1,499.00),
(1,2,1,4999.00),
(2,3,1,15999.00);