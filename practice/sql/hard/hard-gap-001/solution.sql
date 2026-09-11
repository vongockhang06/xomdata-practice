-- Xom Data · Nhịp mua hàng và tín hiệu rời bỏ
-- Problem: https://xomdata.com/practice/hard-gap-001
-- Solved: 2026-09-11

with cte as(
    select
        customer_id,
        julianday(order_date) - julianday(lag(order_date) over( PARTITION BY customer_id ORDER BY order_date,order_id)) as days_gap
    from orders
)
, cte2 as(
select
    customer_id,
    case when count(*)=1 then null
    else round(avg(days_gap),1) end as avg_gap_days
from cte 
GROUP BY customer_id)
select
    customer_id,
    avg_gap_days,
    case when avg_gap_days is null then 'single'
    when avg_gap_days<=30 then 'fast'
    else 'slow' end as pace
from cte2
