-- Xom Data · Một con số tổng hợp cho từng khách
-- Problem: https://xomdata.com/practice/hard-rfm-008
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        max(order_date) as recent_date,
        count(*) as total_orders,
        sum(amount) as total
    from orders
    GROUP BY customer_id
)
, cte1 as(
    select
        customer_id,
        6- ntile(5) over(ORDER BY recent_date desc, customer_id) as r,
        6- ntile(5) over(ORDER BY total_orders desc, customer_id) as f,
        6- ntile(5) over(ORDER BY total desc, customer_id) as m
    from cte
)
select
    customer_id,
    r as r_score,
    f as f_score,
    m as m_score,
    r*100+f*10+m as weighted_score
from cte1
ORDER BY weighted_score desc, customer_id
