-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-08-17

WITH cte AS(
    SELECT
        st.id,
        ROUND(AVG(final_score),2) as avg_score
    FROM students st 
    JOIN scores sc ON st.id=sc.student_id
    GROUP BY st.id
)
SELECT DISTINCT
    full_name,
    student_code,
    avg_score,
    CASE WHEN avg_score>=9 THEN 'Excellent'
    WHEN avg_score>=8 THEN 'Good'
    WHEN avg_score>=7 THEN 'Fair'
    WHEN avg_score>=5 THEN 'Average'
    ELSE 'Poor'
    END AS grade,
    DENSE_RANK() OVER(ORDER BY avg_score DESC) AS class_rank
FROM students st
JOIN cte c ON st.id=c.id
ORDER BY avg_score DESC, student_code
LIMIT 20
