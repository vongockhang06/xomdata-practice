-- Xom Data · Ai ghé đủ cả hai tháng liền nhau
-- Problem: https://xomdata.com/practice/medium-active-002
-- Solved: 2026-09-02

with cte as(
select
    customer_id,
    substring(order_date,1,7) as month
from orders
GROUP BY customer_id, month
)
, cte2 as(
select
    customer_id,
    case month
        when '2024-03' then 1
        when '2024-04' then 1
        else 0
        end as cond
from cte 
)
select
    customer_id
from cte2
GROUP BY customer_id HAVING SUM(cond)=2
