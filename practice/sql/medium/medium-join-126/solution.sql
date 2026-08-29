-- Xom Data · Salary by department and title
-- Problem: https://xomdata.com/practice/medium-join-126
-- Solved: 2026-08-29

WITH cte AS(
    SELECT
        department_name,
        position_name,
        COUNT(*) AS employee_count,
        AVG(net_salary) AS avg_salary,
        MIN(net_salary) AS min_salary,
        MAX(net_salary) AS max_salary,
        MAX(net_salary) - MIN(net_salary) as salary_spread
    FROM employees e
    JOIN payroll pa ON e.id=pa.employee_id
    JOIN departments d ON d.id=e.department_id
    JOIN positions p ON p.id=e.position_id
    GROUP BY department_name,position_name
)
SELECT
    *,
    rank() over(PARTITION BY department_name ORDER BY avg_salary desc) as rank_in_dept
FROM cte
ORDER BY department_name,rank_in_dept,position_name
