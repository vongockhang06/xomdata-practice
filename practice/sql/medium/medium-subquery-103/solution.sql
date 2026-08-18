-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-08-18

WITH avg_price AS(
    SELECT
        category,
        AVG(price) AS avg_price
    FROM products 
    GROUP BY category
)
SELECT
    product_name,
    p.category,
    price,
    ROUND(price-avg_price) AS diff_from_avg,
    ROUND((price-avg_price)/avg_price*100,2) AS pct_above
FROM products p
JOIN avg_price  a ON p.category=a.category 
WHERE price>avg_price
ORDER BY pct_above DESC, product_name
