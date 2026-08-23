-- Xom Data · Longest consecutive login streak
-- Problem: https://xomdata.com/practice/sql-nightmare-001
-- Solved: 2026-08-23

WITH cte AS(
SELECT
    user_id,
    login_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY login_date) -1 AS seq,
    FIRST_VALUE(login_date) OVER(PARTITION BY user_id ORDER BY login_date) AS first_day
FROM logins
)
, cte2 AS(
SELECT
    user_id,
    JULIANDAY(login_date) - JULIANDAY(first_day) - seq AS gr
FROM cte
)
, cte3 AS(
SELECT
    user_id,
    COUNT(*) AS streak
FROM cte2
GROUP BY user_id,gr
)
SELECT 
    user_id,
    MAX(streak) AS max_streak
FROM cte3 
GROUP BY user_id
ORDER BY user_id
