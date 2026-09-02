-- Xom Data · Above or below the department norm
-- Problem: https://xomdata.com/practice/medium-winagg-007
-- Solved: 2026-09-02


-- Viết SQL của bạn ở đây
select
    department,
    full_name,
    salary,
    case when salary>avg_salary then 'Above'
    when salary=avg_salary then 'Equal'
    else 'Below' end as position_label
from(
select
    department,
    full_name,
    salary,
    avg(salary) over(PARTITION BY department) as avg_salary
from employees)
ORDER BY department, full_name
