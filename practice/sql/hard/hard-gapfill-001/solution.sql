-- Xom Data · Daily revenue including zero-sale days
-- Problem: https://xomdata.com/practice/hard-gapfill-001
-- Solved: 2026-09-07

WITH bounds AS (
    SELECT 
        MIN(date) AS min_date, 
        MAX(date) AS max_date 
    FROM daily_revenue
),
cte AS (
    SELECT min_date AS date FROM bounds
    UNION ALL
    SELECT DATE(c.date, '+1 day')
    FROM cte c, bounds b
    WHERE c.date < b.max_date
)
SELECT 
    c.date,
    COALESCE(SUM(d.amount), 0) AS revenue
FROM cte c
LEFT JOIN daily_revenue d ON c.date = d.date
GROUP BY c.date
ORDER BY c.date ASC;
