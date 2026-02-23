
-- 1. View complete order details with user & product info

SELECT 
    o.order_id,
    u.name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    oi.price_at_purchase,
    o.status,
    o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;


-- 2. Total Revenue Generated


SELECT 
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status IN ('SHIPPED', 'DELIVERED');


-- 3. Top Selling Products

SELECT 
    p.name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;


-- 4. Users Who Never Placed Any Order

SELECT 
    u.user_id,
    u.name,
    u.email
FROM users u
LEFT JOIN orders o 
    ON u.user_id = o.user_id
WHERE o.order_id IS NULL;


-- 5. Monthly Revenue

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status IN ('SHIPPED', 'DELIVERED')
GROUP BY month
ORDER BY month;