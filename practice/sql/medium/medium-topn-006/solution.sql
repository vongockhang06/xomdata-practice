-- Xom Data · Valedictorian, salutatorian, and the score gap
-- Problem: https://xomdata.com/practice/medium-topn-006
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with cte as(
    select
        class_name,
        ROW_NUMBER() over(PARTITION BY class_name ORDER BY score desc, student_name) as position,
        student_name,
        score
    from students
)
select
    *,
    -score +COALESCE(lag(score) over(PARTITION BY class_name ORDER BY score desc, student_name),score) as  behind_top
from cte
where position<=2
