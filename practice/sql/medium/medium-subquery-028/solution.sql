-- Xom Data · Students above the subject average
-- Problem: https://xomdata.com/practice/medium-subquery-028
-- Solved: 2026-08-23

WITH cte AS(
    SELECT
        full_name,
        subject_name,
        final_score,
        ROUND(AVG(final_score) OVER(PARTITION BY g.subject_id),2) AS subject_avg
    FROM grades g
    JOIN students s ON g.student_id=s.id 
    JOIN subjects sub ON g.subject_id=sub.id 
)
SELECT
    *,
    ROUND(final_score-subject_avg,2) AS diff_from_avg
FROM cte
WHERE final_score>subject_avg
ORDER BY diff_from_avg DESC, full_name
