-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-08-23

WITH cte as(
SELECT
    full_name,
    email,
    application_date,
    ROW_NUMBER() OVER(ORDER BY application_date, full_name) AS queue_position
FROM candidates c
WHERE id NOT IN (SELECT candidate_id FROM interviews)
)
SELECT
    *,
    COALESCE(ROUND((queue_position-1)/((SELECT COUNT(*) FROM cte)-1.0)*100.0,2),0) AS older_than_pct
FROM cte
ORDER BY queue_position
