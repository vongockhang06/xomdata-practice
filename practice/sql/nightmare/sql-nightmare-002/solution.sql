-- Xom Data · Median salary per department
-- Problem: https://xomdata.com/practice/sql-nightmare-002
-- Solved: 2026-08-23

WITH cte AS(
    SELECT
        id,
        name,
        dept,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept ORDER BY salary) AS seq,
        COUNT(*) OVER(PARTITION BY dept) AS total
    FROM employees
)
, even AS(
    SELECT
        dept,
        SUM(salary)/2 as median_salary
    FROM cte
    WHERE total%2=0 and (seq=total/2 OR seq=total/2+1)
    GROUP BY dept
)
, odd AS(
    SELECT
        dept,
        SUM(salary) as median_salary
    FROM cte
    WHERE total%2=1 and seq=total/2+1
    GROUP BY dept
)
SELECT
    *
FROM odd
UNION ALL
SELECT
    *
FROM even
ORDER BY dept
