-- Xom Data · Mỗi lần ghé, khách chi trung bình bao nhiêu
-- Problem: https://xomdata.com/practice/medium-monetary-002
-- Solved: 2026-08-31

SELECT DISTINCT
    customer_id,
    round(avg(amount) over(PARTITION BY customer_id),2) as avg_order_value
from orders
