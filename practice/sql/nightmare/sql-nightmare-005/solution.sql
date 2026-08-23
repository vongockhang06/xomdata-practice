-- Xom Data · Employee levels in the org chart
-- Problem: https://xomdata.com/practice/sql-nightmare-005
-- Solved: 2026-08-23

WITH RECURSIVE cte AS(
    SELECT
        id,
        name,
        1 depth
    FROM employees WHERE manager_id IS NULL

    UNION ALL
    SELECT
        e.id,
        e.name,
        depth+1
    FROM employees e JOIN cte c ON e.manager_id=c.id
)
SELECT
    *
FROM cte ORDER BY id
