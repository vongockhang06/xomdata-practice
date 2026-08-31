-- Xom Data · Regional payroll with shares
-- Problem: https://xomdata.com/practice/medium-winagg-010
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
select
    region,
    staff_name,
    salary,
    sum(salary) over(PARTITION BY region rows BETWEEN unbounded preceding and unbounded following) as region_total,
    round(salary::NUMERIC/
    sum(salary) over(PARTITION BY region rows BETWEEN unbounded preceding and unbounded following)*100,2) as pct_of_region
from payroll
ORDER BY region,salary desc, staff_name
