-- Xom Data · Total sales by org branch
-- Problem: https://xomdata.com/practice/hard-hierarchical-001
-- Solved: 2026-09-05

with recursive cte as(
    select
        id as ancestor,
        id as descendant,
        direct_sales
    from agents 
    UNION ALL
    select
        c.ancestor,
        a.id,
        a.direct_sales
    from agents a join cte c on a.manager_id=c.descendant
)
select
    a.id as agent_id,
    a.name as agent_name,
    a.direct_sales,
    sum(c.direct_sales) as team_total
from agents a
join cte c on a.id = c.ancestor  
GROUP BY  a.id,
    a.name,
    a.direct_sales
ORDER BY team_total desc, id
