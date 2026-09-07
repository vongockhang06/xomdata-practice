-- Xom Data · Total payroll by org branch
-- Problem: https://xomdata.com/practice/hard-recursive-001
-- Solved: 2026-09-07

with recursive cte as(
    select
        id as ancestor,
        id as descendant,
        salary
    from employees
    UNION ALL
    select
        c.ancestor,
        e.id,
        e.salary
    from employees e join cte c on e.manager_id=c.descendant
)
, cte2 as(
    select
        manager_id as id ,
        count(*) as direct_reports
    from employees
    GROUP BY manager_id
)
select
    e.id as manager_id,
    e.name as manager_name,
    direct_reports,
    count(*) as subtree_size,
    sum(c.salary) as subtree_salary
from cte c join employees e on c.ancestor=e.id
join cte2 c2 on e.id=c2.id
group by e.name,e.id,direct_reports
having count(*)>1
ORDER BY subtree_salary desc, manager_id
