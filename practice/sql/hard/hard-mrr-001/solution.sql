-- Xom Data · Monthly recurring revenue (MRR) by subscription plan
-- Problem: https://xomdata.com/practice/hard-mrr-001
-- Solved: 2026-09-18

WITH RECURSIVE cte AS (
    SELECT
        user_id,
        mrr,
        SUBSTRING(started_at, 1, 7) AS started_month,
        SUBSTRING(ended_at, 1, 7) AS ended_month,
        CASE 
            WHEN SUBSTRING(ended_at, 6, 2) IN ('01','03','05','07','08','10','12') AND SUBSTRING(ended_at, 9, 2) = '31' THEN 1
            WHEN SUBSTRING(ended_at, 6, 2) IN ('04','06','09','11') AND SUBSTRING(ended_at, 9, 2) = '30' THEN 1
            WHEN SUBSTRING(ended_at, 6, 2) = '02' AND SUBSTRING(ended_at, 9, 2) IN ('28', '29') THEN 1 
            ELSE 0 
        END AS end_at_final_day
    FROM subscriptions
),
bound AS (
    SELECT
        MIN(started_at) AS start_date,
        SUBSTRING(MAX(started_at), 1, 7) AS max_month
    FROM subscriptions
),
-- Recursive CTE for sequence generation
seq_month AS (
    SELECT
        start_date AS curr_date,
        SUBSTRING(start_date, 1, 7) AS month
    FROM bound
    
    UNION ALL
    
    SELECT
        DATE(curr_date, '+1 month'),
        SUBSTRING(DATE(curr_date, '+1 month'), 1, 7)
    FROM seq_month, bound
    WHERE SUBSTRING(DATE(curr_date, '+1 month'), 1, 7) <= bound.max_month
),
cte2 AS (
    SELECT
        sm.month,
        COUNT(CASE 
            WHEN c.ended_month IS NULL 
              OR c.ended_month > sm.month 
            THEN c.user_id
        END) AS active_subs,
        COALESCE(SUM(CASE 
            WHEN c.ended_month IS NULL 
              OR c.ended_month > sm.month 
            THEN c.mrr 
        END),0) AS total_mrr
    FROM seq_month sm
    JOIN cte c ON c.started_month <= sm.month
    GROUP BY sm.month
)
SELECT * FROM cte2;
