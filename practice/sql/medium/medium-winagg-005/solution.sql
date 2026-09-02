-- Xom Data · Ward headcount next to each nurse
-- Problem: https://xomdata.com/practice/medium-winagg-005
-- Solved: 2026-09-02

-- Viết SQL của bạn ở đây
select
    ward,
    nurse_name,
    count(*) over(PARTITION BY ward) as team_size
from roster
ORDER BY ward, nurse_name
