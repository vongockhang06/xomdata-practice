-- Xom Data · Product share within its store
-- Problem: https://xomdata.com/practice/medium-winagg-002
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
select
    store,
    product,
    amount,
    round( amount::NUMERIC/sum(amount) over(PARTITION BY store ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)*100,2) as pct_of_store
from store_sales
ORDER BY store,product
