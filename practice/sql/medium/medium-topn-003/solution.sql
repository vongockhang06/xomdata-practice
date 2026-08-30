-- Xom Data · Shift bonus for every top performer
-- Problem: https://xomdata.com/practice/medium-topn-003
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with cte as(
select
    store,
    staff_name,
    orders_served,
    rank() over(PARTITION BY store ORDER BY orders_served desc) as ranking
from shift_stats
)
select
store,
    staff_name,
    orders_served
from cte
where ranking=1
