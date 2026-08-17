-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-08-17

WITH product_sold AS(
    SELECT
        product_id AS id,
        SUM(quantity) AS total_sold
    FROM transactions
    GROUP BY product_id
)
, cat_sold AS(
    SELECT
        categories,
        SUM(quantity) AS total_cat
    FROM transactions t
    JOIN products p ON t.product_id=p.id
    GROUP BY categories
)
SELECT
    name,
    p.categories,
    total_sold,
    CASE 
        WHEN total_sold>=100 THEN 'Best Seller'
        WHEN total_sold>=50 THEN 'Average'
        ELSE 'Slow Mover'
    END AS classification,
    DENSE_RANK() OVER(PARTITION BY p.categories ORDER BY total_sold DESC) AS rank_in_cat,
    ROUND(total_sold::NUMERIC/total_cat*100,2) AS pct_of_cat_total
FROM products p
JOIN product_sold ps ON p.id=ps.id
JOIN cat_sold cs ON p.categories=cs.categories
ORDER BY categories,rank_in_cat,name
