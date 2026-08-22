-- Xom Data · Trend labels for the monthly report
-- Problem: https://xomdata.com/practice/medium-lag-004
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
with cte as(
select
    month,
    revenue,
    lag(revenue) over(ORDER BY month) as prev_rev
from monthly_revenue
)
select
    month,
    revenue,
    case when revenue-prev_rev>0 then 'Up'
    when revenue-prev_rev<0 then 'Down'
    when revenue-prev_rev=0 then 'Flat'
    else 'First' end as trend
from cte
order by month
