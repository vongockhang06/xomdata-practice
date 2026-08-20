-- Xom Data · Second-highest-paid employee per department
-- Problem: https://xomdata.com/practice/expert-final-subq-003
-- Solved: 2026-08-20

WITH cte AS(
    SELECT
        id,
        department,
        full_name,
        salary,
        DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_salary
    FROM employees
)
SELECT 
    department,
    full_name,
    salary
FROM cte 
WHERE rank_salary=2
ORDER BY department,full_name
