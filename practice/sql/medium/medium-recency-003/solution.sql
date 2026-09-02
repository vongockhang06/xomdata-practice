-- Xom Data · Bảng xếp hạng độ tươi của khách
-- Problem: https://xomdata.com/practice/medium-recency-003
-- Solved: 2026-09-02

select
    customer_id,
    max(order_date) as last_order_date,
    RANK() over(ORDER BY max(order_date) desc) as freshness_rank
from orders
GROUP BY customer_id
ORDER BY freshness_rank, customer_id
