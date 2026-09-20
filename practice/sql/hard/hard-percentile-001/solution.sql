-- Xom Data · Median and percentile salary by department
-- Problem: https://xomdata.com/practice/hard-percentile-001
-- Solved: 2026-09-20

WITH ranked AS (
    SELECT
        department,
        salary,
        -- PERCENT_RANK: (row-1)/(count-1), từ 0 đến 1
        PERCENT_RANK() OVER (
            PARTITION BY department
            ORDER BY salary
        ) AS pct_rank
    FROM employees
),
with_distance AS (
    SELECT
        department,
        salary,
        pct_rank,
        ABS(pct_rank - 0.25) AS dist_p25,
        ABS(pct_rank - 0.50) AS dist_p50,
        ABS(pct_rank - 0.75) AS dist_p75
    FROM ranked
),
p25 AS (
    SELECT DISTINCT ON (department)
        department,
        salary AS p25
    FROM with_distance
    ORDER BY department,
             dist_p25 ASC,    -- gần nhất
             salary   ASC     -- tie: chọn lương thấp hơn
),
p50 AS (
    SELECT DISTINCT ON (department)
        department,
        salary AS p50
    FROM with_distance
    ORDER BY department,
             dist_p50 ASC,
             salary   ASC
),
p75 AS (
    SELECT DISTINCT ON (department)
        department,
        salary AS p75
    FROM with_distance
    ORDER BY department,
             dist_p75 ASC,
             salary   ASC
)
SELECT
    p25.department,
    p25.p25,
    p50.p50,
    p75.p75
FROM p25
JOIN p50 USING (department)
JOIN p75 USING (department)
ORDER BY department;
