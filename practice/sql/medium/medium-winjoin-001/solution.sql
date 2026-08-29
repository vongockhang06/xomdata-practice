-- Xom Data · Sales rankings with department names
-- Problem: https://xomdata.com/practice/medium-winjoin-001
-- Solved: 2026-08-29

-- Viết SQL của bạn ở đây
select
    dept_name,
    rank() over(PARTITION BY dept_name order by sales_amount desc) as dept_rank,
    staff_name,
    sales_amount
from staff s
join departments d on s.dept_id=d.id
ORDER BY dept_name,dept_rank,staff_name
