-- Xom Data · Top three sellers per category
-- Problem: https://xomdata.com/practice/medium-topn-002
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with cte as(
select
    category,
    product_name,
    units_sold,
    ROW_NUMBER() over(PARTITION BY category ORDER BY units_sold desc, product_name) as ranking
from menu_sales
)
select
category,
    product_name,
    units_sold
from cte
where ranking<=3
order by category,ranking
