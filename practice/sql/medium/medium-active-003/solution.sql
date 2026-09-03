-- Xom Data · Tháng bùng nổ khách mới
-- Problem: https://xomdata.com/practice/medium-active-003
-- Solved: 2026-09-03

with cte as(
    select
        customer_id,
        min(substring(order_date,1,7)) as month
    from orders
    group by customer_id
)
select
    month,
    count(*) as new_customers
from cte group by month
order by new_customers desc, month
limit 1
