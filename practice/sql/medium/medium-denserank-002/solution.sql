-- Xom Data · Salary bands within each department
-- Problem: https://xomdata.com/practice/medium-denserank-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    department,
    DENSE_RANK() over(PARTITION BY department ORDER BY salary desc) as salary_tier,
    full_name,
    salary
from employees e
order by department,salary_tier,full_name
