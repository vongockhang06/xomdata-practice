-- Xom Data · Employees paid above their department average
-- Problem: https://xomdata.com/practice/medium-subquery-110
-- Solved: 2026-08-18

WITH avg_sal AS(
    SELECT
        department_id,
        dept_name,
        AVG(salary) AS avg_salary
    FROM departments d
    JOIN employees e ON d.id=e.department_id
    GROUP BY department_id,dept_name
)
SELECT
    full_name,
    dept_name,
    salary,
    ROUND(avg_salary) AS dept_avg_salary,
    ROUND((salary-avg_salary)/avg_salary*100,2) AS premium_pct
FROM employees e JOIN avg_sal a ON e.department_id=a.department_id
WHERE salary>avg_salary
ORDER BY premium_pct DESC, dept_name,full_name
