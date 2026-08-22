-- Xom Data · Orders with customer names
-- Problem: https://xomdata.com/practice/easy-join-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    order_code,
    customer_name,
    amount
FROM customers c 
JOIN orders o on c.id=o.customer_id
