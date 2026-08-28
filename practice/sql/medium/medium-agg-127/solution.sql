-- Xom Data · Top 10 highest-paid employees and their leave days
-- Problem: https://xomdata.com/practice/medium-agg-127
-- Solved: 2026-08-28

WITH salary_person AS(
    SELECT
        employee_id,
        SUM(net_salary) AS total_received_salary
    FROM payroll
    GROUP BY employee_id
)
, leave AS(
    SELECT
        employee_id,
        COUNT(*) AS leave_count
    FROM leaves
    WHERE status='duyet'
    GROUP BY employee_id
)
, depart_salary AS(
    SELECT
        department_id,
        AVG(total_received_salary) as depart_avg
    FROM salary_person s
    JOIN employees e ON s.employee_id=e.id
    GROUP BY department_id
)
SELECT
    full_name,
    e.employee_code,
    department_name,
    total_received_salary,
    COALESCE(leave_count,0) AS leave_count,
    ROUND((total_received_salary-depart_avg)::NUMERIC/depart_avg*100,2) AS pct_above_dept_avg
FROM salary_person s
JOIN employees e ON s.employee_id=e.id
LEFT JOIN leave l ON s.employee_id=l.employee_id
JOIN depart_salary d ON e.department_id=d.department_id
JOIN departments d2 ON d.department_id=d2.id
ORDER BY total_received_salary desc, employee_code
LIMIT 10
