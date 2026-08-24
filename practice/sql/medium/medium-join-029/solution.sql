-- Xom Data · Instructor teaching load
-- Problem: https://xomdata.com/practice/medium-join-029
-- Solved: 2026-08-24

WITH cte AS(
    SELECT
        full_name,
        academic_degree,
        COUNT(*) AS subjects_taught
    FROM lecturers l
    JOIN subjects s ON l.id=s.lecturer_id
    GROUP BY full_name,academic_degree
)
SELECT
    *,  
    RANK() OVER(ORDER BY subjects_taught DESC) AS workload_rank,
    SUM(subjects_taught) OVER(ORDER BY subjects_taught DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_subjects
FROM cte
ORDER BY workload_rank, full_name
