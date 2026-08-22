-- Xom Data · Last month per branch
-- Problem: https://xomdata.com/practice/medium-lag-003
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select branch,
       month,
       revenue,
       lag(revenue) over(PARTITION BY branch order by month) as prev_revenue
from branch_revenue
order by branch, month
