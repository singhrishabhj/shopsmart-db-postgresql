-- ==========================================================
-- ShopSmart DB - Indexing Strategy
-- Purpose: Improve performance of JOINs, filtering & lookups
-- Author: Rishabh Singh
-- ==========================================================

-- ----------------------------------------------------------
-- 1. Index on users.email
-- Why?
-- Email is commonly used for login and user lookup.
-- Although UNIQUE creates an implicit index,
-- this documents the performance intent clearly.
-- ----------------------------------------------------------

CREATE INDEX idx_users_email
ON users(email);


-- ----------------------------------------------------------
-- 2. Index on orders.user_id
-- Why?
-- Orders are frequently fetched per user (Order History page).
-- Improves JOIN performance between users and orders.
-- ----------------------------------------------------------

CREATE INDEX idx_orders_user_id
ON orders(user_id);


-- ----------------------------------------------------------
-- 3. Index on order_items.order_id
-- Why?
-- Heavy JOIN column used in revenue and order detail queries.
-- Reduces cost of fetching items per order.
-- ----------------------------------------------------------

CREATE INDEX idx_order_items_order_id
ON order_items(order_id);


-- ----------------------------------------------------------
-- 4. Index on order_items.product_id
-- Why?
-- Used in product analytics and top-selling product queries.
-- Improves aggregation performance.
-- ----------------------------------------------------------

CREATE INDEX idx_order_items_product_id
ON order_items(product_id);



-- ----------------------------------------------------------
-- 5. Index on products.category
-- Why?
-- Useful for filtering products by category.
-- Example: WHERE category = 'Electronics'
-- -----------------------------------------------------------

CREATE INDEX idx_products_category
ON products(category);