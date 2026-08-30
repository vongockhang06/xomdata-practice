-- Xom Data · Each branch's two slowest months
-- Problem: https://xomdata.com/practice/medium-topn-004
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with cte as(
    select
        branch,
        month,
        revenue,
        ROW_NUMBER() over(PARTITION BY branch ORDER BY revenue,month) as ranking
    from branch_monthly
)
select
    branch,
        month,
        revenue
from cte
where ranking<=2
order by branch,ranking
