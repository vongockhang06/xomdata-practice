-- Xom Data · The current price of each product
-- Problem: https://xomdata.com/practice/medium-dedup-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
WITH cte as(
select
    product_name,
    price,
    effective_date,
    ROW_NUMBER() OVER(PARTITION BY product_name ORDER BY effective_date DESC) AS latest_date
from price_history
order by product_name
)
SELECT
    product_name,
    price,
    effective_date
FROM cte
WHERE latest_date = 1
ORDER BY product_name
