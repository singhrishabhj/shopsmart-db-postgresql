
-- ShopSmart DB - Sample Data

-- Insert Sample Users

INSERT INTO users (name, email, phone) VALUES
('Rishabh Singh', 'rishabh@email.com', '9876543210'),
('Amit Sharma', 'amit@email.com', '9123456780'),
('Neha Verma', 'neha@email.com', '9988776655'),
('Priya Mehta', 'priya@email.com', '9001122334');


-- Insert Sample Products

INSERT INTO products (name, description, price, stock_quantity, category) VALUES
('iPhone 15', 'Apple smartphone', 79999, 5, 'Electronics'),
('Samsung S24', 'Samsung flagship phone', 69999, 8, 'Electronics'),
('Boat Headphones', 'Wireless headphones', 2999, 20, 'Accessories'),
('Dell Laptop', '14 inch business laptop', 55999, 4, 'Computers');


-- Insert Sample Orders

INSERT INTO orders (user_id, status, total_amount) VALUES
(1, 'DELIVERED', 79999),
(2, 'SHIPPED', 69999),
(3, 'PENDING', 2999);


-- Insert Sample Order Items

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 79999),
(2, 2, 1, 69999),
(3, 3, 1, 2999);