-- Xom Data · Sales rank within each region
-- Problem: https://xomdata.com/practice/medium-rank-002
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
SELECT
    region,
    RANK() OVER(PARTITION BY region ORDER BY sales_amount DESC) AS region_rank,
    rep_name,
    sales_amount
FROM reps
ORDER BY region, region_rank, rep_name
