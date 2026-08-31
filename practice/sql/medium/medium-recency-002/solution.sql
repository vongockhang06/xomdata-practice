-- Xom Data · Ba mươi ngày vắng bóng
-- Problem: https://xomdata.com/practice/medium-recency-002
-- Solved: 2026-08-31

SELECT
    customer_id,
    max(order_date) as last_order_date
from orders
GROUP BY customer_id
having julianday('2024-06-30') -julianday(max(order_date))>30
