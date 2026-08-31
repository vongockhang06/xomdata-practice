-- Xom Data · Revenue rank of each category
-- Problem: https://xomdata.com/practice/medium-rank-003
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
SELECT
    category,
    sum(amount) as total_revenue,
    RANK() over(ORDER BY sum(amount) desc) as revenue_rank
FROM sales
GROUP BY category
ORDER BY revenue_rank,category
