-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-08-22

with cte as(
SELECT 
    c.full_name,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_spending,
    ROUND(AVG(total_amount),0) AS avg_order_value
FROM customers c
JOIN orders o
ON c.id = o.customer_id
GROUP BY o.customer_id, c.full_name)
SELECT
    *,
    ROW_NUMBER() OVER(order by total_spending desc, full_name) as spending_rank
FROM cte 
ORDER BY spending_rank
