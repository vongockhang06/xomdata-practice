-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-08-19

WITH cte1 AS(
    SELECT
        a.employee_id,
        AVG(work_days) AS avg_work_days,
        AVG(overtime_hours) AS avg_overtime_hours,
        AVG(net_salary) AS avg_salary,
        ROUND(AVG(overtime_hours)/AVG(work_days),4) AS overtime_intensity
    FROM attendance a 
    JOIN payroll p ON a.employee_id=p.employee_id
    GROUP BY a.employee_id
    HAVING AVG(overtime_hours)>5 AND AVG(work_days)>=18
)
,cte2 AS(
    SELECT
        *
        ,RANK() OVER(ORDER BY overtime_intensity DESC) AS intensity_rank
        ,NTILE(4) OVER(ORDER BY overtime_intensity DESC) AS workload_quartile
    FROM cte1
)
SELECT
    e.full_name
    ,e.employee_code
    ,c.avg_work_days
    ,c.avg_overtime_hours
    ,c.avg_salary
    ,c.overtime_intensity
    ,c.intensity_rank
    ,c.workload_quartile
FROM cte2 c
JOIN employees e ON c.employee_id=e.id
