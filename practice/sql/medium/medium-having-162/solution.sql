-- Xom Data · Suppliers that deliver late frequently
-- Problem: https://xomdata.com/practice/medium-having-162
-- Solved: 2026-08-19

WITH cte AS(
SELECT
    *
    ,CAST(JULIANDAY(actual_receipt) - JULIANDAY(expected_receipt) AS INTEGER) AS days_difference
FROM purchase_orders
)
,cte2 AS(
    SELECT
        supplier_id
        ,COUNT(*) AS purchase_count
        ,SUM(total_value) AS total_purchase_value
        ,ROUND(AVG(days_difference),2) AS avg_late_days
        ,ROUND(SUM(CASE WHEN days_difference<=0 THEN 1 ELSE 0 END)*1.0/COUNT(*)*100 ,2) AS on_time_rate
    FROM cte 
    GROUP BY supplier_id
    HAVING ROUND(AVG(days_difference),2)>0 AND COUNT(*)>=3
)
,cte3 AS(
    SELECT
        *
        ,RANK() OVER(ORDER BY avg_late_days DESC) AS late_rank
        ,NTILE(4) OVER(ORDER BY avg_late_days DESC) AS risk_tier
    FROM cte2 
)
SELECT
    supplier_name
    ,material_type
    ,purchase_count
    ,total_purchase_value
    ,avg_late_days
    ,on_time_rate
    ,late_rank
    ,risk_tier
FROM cte3 c
JOIN suppliers s ON c.supplier_id=s.id
ORDER BY late_rank, supplier_name
