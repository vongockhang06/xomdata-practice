-- Xom Data · Churned and returning customers
-- Problem: https://xomdata.com/practice/hard-churn-001
-- Solved: 2026-09-07

with cte as(
    select
    user_id,
    order_date,
    COALESCE(lead(order_date) over(PARTITION BY user_id ORDER BY order_date,id),order_date ) as next_order
    from orders
)
, cte2 as(
    select
        user_id,
        order_date,
        next_order,
        julianday(next_order)-julianday(order_date) as gap_days
    from cte 
)
select
    user_id,
    order_date as prev_order,
    next_order,
    gap_days
from cte2 where gap_days>=90
order by gap_days desc, user_id
