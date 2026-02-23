
-- 1. Orders with incorrect total amount

SELECT 
    o.order_id,
    o.total_amount AS stored_total,
    SUM(oi.quantity * oi.price_at_purchase) AS calculated_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total_amount
HAVING o.total_amount <> SUM(oi.quantity * oi.price_at_purchase);


-- 2. Products with negative stock

SELECT *
FROM products
WHERE stock_quantity < 0;


-- 3. Duplicate user emails

SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;


-- 4. Orphan order items (no matching order)

SELECT *
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;