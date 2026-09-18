-- Xom Data · Xếp khách vào nhóm chăm sóc phù hợp
-- Problem: https://xomdata.com/practice/hard-rfm-002
-- Solved: 2026-09-18

with cte as(
    select
        customer_id,
        julianday('2024-06-30')-julianday(max(order_date)) as days_since,
        count(*) as order_count
    from orders
    where order_date<='2024-06-30'
    GROUP BY customer_id
)
select
    *,
    case when days_since<=60 and order_count>=3 then 'Champions'
    when days_since>60 and order_count>=3 then 'At Risk'
    when days_since<=60 and order_count<3 then 'Promising'
    else 'Hibernating' end as segment
from cte
