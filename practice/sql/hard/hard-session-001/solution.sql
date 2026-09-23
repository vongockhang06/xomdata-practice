-- Xom Data · Sessionize logins with a 30-minute gap
-- Problem: https://xomdata.com/practice/hard-session-001
-- Solved: 2026-09-23

WITH cte AS (
    SELECT
        id,
        user_id,
        event_at,
        (
            unixepoch(event_at) - unixepoch(LAG(event_at) OVER (
                PARTITION BY user_id 
                ORDER BY event_at, id
            ))
        ) / 60.0 AS gap_minutes
    FROM events
),
cte1 AS (
    SELECT
        user_id,
        event_at,
        SUM(CASE WHEN gap_minutes IS NULL OR gap_minutes >= 30 THEN 1 ELSE 0 END) OVER (
            PARTITION BY user_id 
            ORDER BY event_at, id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS session_seq
    FROM cte
)
SELECT
    user_id,
    session_seq,
    COUNT(*) AS n_events,
    MIN(event_at) AS session_start,
    MAX(event_at) AS session_end,
    ROUND((unixepoch(MAX(event_at)) - unixepoch(MIN(event_at))) / 60.0, 1) AS duration_min
FROM cte1
GROUP BY 
    user_id,
    session_seq
ORDER BY 
    user_id,
    session_seq;
