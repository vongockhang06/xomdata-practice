-- Xom Data · Each category's slice of revenue
-- Problem: https://xomdata.com/practice/medium-winagg-009
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
select
    category,
    sum(amount) as total_revenue,
    round(  sum(amount)::NUMERIC/(select sum(amount) from sales)*100  ,2) as pct_share
from sales
GROUP BY category
order by total_revenue desc, category
