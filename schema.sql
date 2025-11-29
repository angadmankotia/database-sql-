DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;


CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
email TEXT UNIQUE NOT NULL,
city TEXT
);


CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
sku TEXT UNIQUE NOT NULL,
name TEXT NOT NULL,
category TEXT,
price NUMERIC(10,2) NOT NULL
);


CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
customer_id INTEGER REFERENCES customers(customer_id),
order_date DATE NOT NULL,
total NUMERIC(10,2) NOT NULL
);


CREATE TABLE order_items (
order_item_id SERIAL PRIMARY KEY,
order_id INTEGER REFERENCES orders(order_id),
product_id INTEGER REFERENCES products(product_id),
quantity INTEGER NOT NULL,
unit_price NUMERIC(10,2) NOT NULL
);