-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-08-19

WITH cte AS (
    SELECT
        s.subject_name,
        s.credits,
        COUNT(*) AS student_count,
        ROUND(AVG(g.final_score), 2) AS avg_score,
        ROUND(SUM(CASE WHEN g.final_score >= 5 THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS pass_rate
    FROM subjects s 
    JOIN grades g ON s.id = g.subject_id
    GROUP BY s.id, s.subject_name, s.credits
)
SELECT
    *,
    RANK() OVER (ORDER BY avg_score DESC) AS rank_by_avg,
    NTILE(4) OVER (ORDER BY avg_score DESC, subject_name) AS difficulty_quartile
FROM cte 
ORDER BY rank_by_avg, subject_name;
