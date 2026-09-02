-- Xom Data · Category price range next to each item
-- Problem: https://xomdata.com/practice/medium-winagg-008
-- Solved: 2026-09-02

-- Viết SQL của bạn ở đây
select
    category,
    product_name,
    price,
    MIN(price) over(PARTITION BY category) as cat_min,
    max(price) over(PARTITION BY category) as cat_max
from products
order by category, price, product_name
