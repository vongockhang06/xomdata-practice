-- Xom Data · Phong độ khách lên hay xuống giữa hai mùa
-- Problem: https://xomdata.com/practice/hard-rfm-007
-- Solved: 2026-09-21

with cte as(
    select
        customer_id,
        count(case when order_date between '2024-01-01' and '2024-03-31' then order_id end) as p1_orders,
        count(case when order_date between '2024-04-01' and '2024-06-30' then order_id end) as p2_orders
    from orders
    GROUP BY customer_id
)
select
    *,
    case 
        when p1_orders=0 and p2_orders>0 then 'new'
        when p1_orders>0 and p2_orders=0 then 'lost'
        when p2_orders>p1_orders then 'up'
        when p1_orders>p2_orders then 'down'
        when p1_orders=p2_orders then 'flat' 
    end as trend
from cte 
where p1_orders!=0 or p2_orders!=0
