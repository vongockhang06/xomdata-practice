-- Xom Data · Customers silent for 90 days
-- Problem: https://xomdata.com/practice/hard-anti-001
-- Solved: 2026-09-07

with cte as (
    select
        user_id,
        max(order_date) as last_order_date,
        max(order_date) over() as deal_day
    FROM orders
    GROUP BY user_id
)
, cte2 as(
select
    user_id,
    last_order_date,
    julianday(deal_day)-julianday(last_order_date) as days_since_last
from cte
)
select
    *
from cte2 where days_since_last>=90
ORDER BY days_since_last desc, user_id
