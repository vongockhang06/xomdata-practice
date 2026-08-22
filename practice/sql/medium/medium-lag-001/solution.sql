-- Xom Data · Last month's revenue next to each month
-- Problem: https://xomdata.com/practice/medium-lag-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    substring(month, 1,7) as month,
    revenue,
    lag(revenue) over() as prev_revenue
from monthly_revenue
