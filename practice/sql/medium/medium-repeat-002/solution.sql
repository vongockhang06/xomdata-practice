-- Xom Data · Cửa hàng giữ được bao nhiêu phần khách
-- Problem: https://xomdata.com/practice/medium-repeat-002
-- Solved: 2026-08-31

with cte as(
select
    customer_id,
    count(*) as total_order
from orders
GROUP BY customer_id
having count(*)>=2
)
select
    round(count(*)::NUMERIC/(select count(distinct customer_id) from orders)*100,2) as  repeat_rate_pct
from cte
