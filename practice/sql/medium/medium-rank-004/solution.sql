-- Xom Data · National rank and province rank
-- Problem: https://xomdata.com/practice/medium-rank-004
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
SELECT
    student_name,
    province,
    exam_score,
    rank() over(ORDER BY exam_score desc) as national_rank,
    rank() over(PARTITION BY province ORDER BY exam_score desc) as province_rank
from students
order by national_rank,student_name
