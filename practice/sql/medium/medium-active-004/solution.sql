-- Xom Data · Ai chuyên cần suốt cả quý
-- Problem: https://xomdata.com/practice/medium-active-004
-- Solved: 2026-09-01

with cte as(
SELECT
    customer_id,
    substring(order_date,1,7) as month
from orders 
GROUP BY customer_id, substring(order_date,1,7)
)
,cte2 as(
    select
    customer_id,
    case month
        when '2024-01' then 1
        when '2024-02' then 1
        when '2024-03' then 1
    end as condition
from cte 
)
select 
    customer_id
from cte2
GROUP BY customer_id
having SUM(condition)=3
