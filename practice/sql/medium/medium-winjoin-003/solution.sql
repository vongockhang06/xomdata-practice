-- Xom Data · Each aisle's best seller
-- Problem: https://xomdata.com/practice/medium-winjoin-003
-- Solved: 2026-08-29

-- Viết SQL của bạn ở đây
WITH ranking AS(
    SELECT
        category_name,
        product_name,
        units_sold,
        ROW_NUMBER() OVER(PARTITION BY category_name ORDER BY units_sold DESC,product_name) AS rank_product 
    FROM products p 
    JOIN categories c ON c.id=p.category_id
)
SELECT
    category_name,
    product_name,
    units_sold
FROM ranking
WHERE rank_product=1
ORDER BY category_name
