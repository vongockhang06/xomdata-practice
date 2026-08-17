-- Xom Data · Revenue from delivered orders
-- Problem: https://xomdata.com/practice/easy-sum-001
-- Solved: 2026-08-17

SELECT
    SUM(CASE WHEN status='Delivered' THEN total_amount END) AS total_revenue
FROM orders
