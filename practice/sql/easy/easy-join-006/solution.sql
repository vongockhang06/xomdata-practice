-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT DISTINCT
    customer_name
FROM customers c JOIN purchases p ON c.id=customer_id
where category='Skincare'
