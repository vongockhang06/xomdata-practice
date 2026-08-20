-- Xom Data · Top 2 salespeople by sales each month
-- Problem: https://xomdata.com/practice/expert-final-multi-007
-- Solved: 2026-08-20

WITH cte AS(
    SELECT
        employee_id,
        month,
        SUM(revenue) AS total_sales
    FROM sales
    GROUP BY month,employee_id
)
, interme AS(
SELECT
    month,
    DENSE_RANK() OVER(PARTITION BY month ORDER BY total_sales DESC) AS hang,
    employee_id,
    full_name,
    total_sales
FROM cte c
JOIN employees e ON c.employee_id=e.id
)
SELECT
    *
FROM interme
WHERE hang<=2
ORDER BY month,hang,employee_id
