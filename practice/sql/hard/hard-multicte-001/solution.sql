-- Xom Data · Multi-level profit margin analysis
-- Problem: https://xomdata.com/practice/hard-multicte-001
-- Solved: 2026-09-04

WITH product_financials AS (
    SELECT
        p.id,
        p.category,
        p.name AS product_name,
        COALESCE(SUM(o.quantity * o.price), 0) AS revenue,
        COALESCE(SUM(o.quantity * p.unit_cost), 0) AS cost,
        COALESCE(SUM(o.quantity * o.price) - SUM(o.quantity * p.unit_cost), 0) AS profit
    FROM products p
    LEFT JOIN orders o ON p.id = o.product_id
    GROUP BY p.id, p.category, p.name
),
ranked_financials AS (
    SELECT
        id,
        category,
        product_name,
        revenue,
        cost,
        profit,
        CASE 
            WHEN revenue = 0 THEN 0.00
            ELSE ROUND((profit::NUMERIC / revenue) * 100, 2)
        END AS margin_pct,
        DENSE_RANK() OVER (PARTITION BY category ORDER BY profit DESC) AS rank_in_cat,
        MAX(profit) OVER (PARTITION BY category) AS leading_profit
    FROM product_financials
)
SELECT
    category,
    product_name,
    revenue,
    cost,
    profit,
    margin_pct,
    rank_in_cat,
    CASE 
        WHEN leading_profit = 0 THEN NULL
        ELSE ROUND((profit::NUMERIC / leading_profit) * 100, 2)
    END AS pct_of_top_in_cat
FROM ranked_financials
ORDER BY 
    category ASC, 
    rank_in_cat ASC, 
    product_name ASC, id
