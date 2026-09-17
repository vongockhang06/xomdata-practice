-- Xom Data · Đơn hàng trở lại có đậm đà hơn không
-- Problem: https://xomdata.com/practice/hard-winback-003
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        amount,
        julianday(order_date)-julianday(lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id)) as gap
    from orders
)
, cte1 as(
    select
        customer_id,
        amount,
        case when gap>=60 then 'win_back'
        else 'normal' end as seg
    from cte
)
select
    count(case when seg='win_back' then customer_id end) as winback_orders,
    round(avg(case when seg='win_back' then amount end),2) as avg_winback_amount,
    count(case when seg='normal' then customer_id end) as normal_orders,
    round(avg(case when seg='normal' then amount end),2) as avg_normal_amount
from cte1
