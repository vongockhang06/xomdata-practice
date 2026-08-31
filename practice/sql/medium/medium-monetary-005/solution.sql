-- Xom Data · Miếng bánh doanh thu của từng khách
-- Problem: https://xomdata.com/practice/medium-monetary-005
-- Solved: 2026-08-31

SELECT
    customer_id,
    SUM(amount) as total_spent,
    ROUND(SUM(amount)::NUMERIC/(SELECT SUM(amount) FROM orders) *100,2) AS revenue_share_pct
FROM orders
GROUP BY customer_id
ORDER BY revenue_share_pct desc, customer_id
