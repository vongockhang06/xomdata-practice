-- Xom Data · Opening order or returning order
-- Problem: https://xomdata.com/practice/medium-cohort-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
with cte as(
select
    customer_name,
    order_date,
    amount,
    min(order_date) over(PARTITION BY customer_name) as min_date
from orders 
)
select
    customer_name,
    order_date,
    amount,
    case when order_date=min_date then 'New' 
    else 'Returning' end as order_type
from cte
order by customer_name,order_date
