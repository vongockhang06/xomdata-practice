-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
WITH cte as(
SELECT
    region,
    rep_name,
    sales_amount,
    ROW_NUMBER() over(PARTITION BY region order by sales_amount desc, rep_name) as ranking
from reps)
select
    region,
    rep_name,
    sales_amount
from cte 
where ranking=1
ORDER BY region
