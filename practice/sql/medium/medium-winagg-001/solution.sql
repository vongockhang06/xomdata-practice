-- Xom Data · Department total next to each person
-- Problem: https://xomdata.com/practice/medium-winagg-001
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
SELECT
    department,
    rep_name,
    revenue,
    sum(revenue) over(PARTITION BY department ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS dept_total
from deals
order by department,rep_name
