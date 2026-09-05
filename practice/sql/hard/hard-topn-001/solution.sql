-- Xom Data · Top 3 products by sales in each category
-- Problem: https://xomdata.com/practice/hard-topn-001
-- Solved: 2026-09-05

with cte as(
    select
        category,
        name as product_name,
        units_sold,
        DENSE_RANK() over(PARTITION BY category order by units_sold desc) as rank_in_cat
    from products
)
select
    *
from cte 
where rank_in_cat<=3
ORDER BY category,rank_in_cat,product_name
