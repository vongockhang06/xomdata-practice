-- Xom Data · Stock-in history by supplier
-- Problem: https://xomdata.com/practice/medium-join-014
-- Solved: 2026-08-24

WITH cte1 AS (
SELECT
    warehouse_name,
    COUNT(*) AS import_count,
    COUNT(DISTINCT product_id) AS distinct_product_count,
    COUNT(DISTINCT suppliers) AS distinct_supplier_count,
    MAX(import_date) AS last_import_date
FROM stock_imports s
JOIN warehouses w ON s.warehouse_id=w.id 
GROUP BY warehouse_id,warehouse_name
),
cte2 AS(
    SELECT
        *,
        RANK() OVER(ORDER BY import_count DESC) AS activity_rank
    FROM cte1
)
SELECT
    *,
    LAG(warehouse_name) OVER(ORDER BY activity_rank) AS prev_warehouse
FROM cte2 
ORDER BY activity_rank,warehouse_name
