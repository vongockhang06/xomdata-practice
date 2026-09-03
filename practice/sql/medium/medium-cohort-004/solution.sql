-- Xom Data · Mỗi thế hệ khách đông cỡ nào
-- Problem: https://xomdata.com/practice/medium-cohort-004
-- Solved: 2026-09-03

with cte as(
    select
    customer_id,
    substring(min(order_date),1,7) as month
    from orders 
    group by customer_id
)
select
    month as cohort_month,
    count(*) as cohort_size
from cte 
GROUP BY month
order by month
