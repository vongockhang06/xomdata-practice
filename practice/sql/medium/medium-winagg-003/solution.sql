-- Xom Data · Distance from the class average
-- Problem: https://xomdata.com/practice/medium-winagg-003
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
select
    class_name,
    student_name,
    score,
    round(score-avg(score) over(PARTITION BY class_name),2) as diff_from_avg
from scores
order by class_name, student_name
