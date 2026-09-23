-- Xom Data · Gương mặt vàng của từng kênh
-- Problem: https://xomdata.com/practice/hard-rfm-009
-- Solved: 2026-09-23

with cte as(
    select
        customer_id,
        max(order_date) as max_date,
        count(*) as count_order,
        sum(amount) as total_spent
    from orders
    GROUP BY customer_id
)
, cte1 as(
    select
        channel,
        cte.customer_id,
        6-ntile(5) over(ORDER BY max_date desc,cte.customer_id) as r,
        6-ntile(5) over(ORDER BY count_order desc,cte.customer_id) as f,
        6-ntile(5) over(ORDER BY total_spent desc,cte.customer_id) as m
    from cte join customers co on cte.customer_id=co.customer_id
)
, cte2 as(
    select
        channel,
        customer_id,
        ROW_NUMBER() over(PARTITION BY channel ORDER BY r+f+m desc, customer_id) as ranking,
        r+f+m as rfm_total
    from cte1
)
SELECT
    channel,
    customer_id,
    rfm_total
from cte2
where ranking=1
