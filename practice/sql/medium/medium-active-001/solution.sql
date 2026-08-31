-- Xom Data · Nhịp khách ghé cửa hàng theo tháng
-- Problem: https://xomdata.com/practice/medium-active-001
-- Solved: 2026-08-31

SELECT
    substring(order_date,1,7) as month,
    count(DISTINCT customer_id) as active_customers
from orders
GROUP BY substring(order_date,1,7)
