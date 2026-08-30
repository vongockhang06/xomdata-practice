-- Xom Data · Interview call numbers
-- Problem: https://xomdata.com/practice/medium-rownum-001
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
select
    ROW_NUMBER() OVER(ORDER BY score desc, candidate_name) as call_no,
    candidate_name,
    score
from candidates
ORDER BY call_no
