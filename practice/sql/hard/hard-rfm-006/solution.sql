-- Xom Data · Bản đồ tám nhóm khách hàng
-- Problem: https://xomdata.com/practice/hard-rfm-006
-- Solved: 2026-08-31

WITH statistic AS(
    SELECT
        customer_id,
        COUNT(*) AS total_order,
        julianday('2024-06-30')-julianday(MAX(order_date)) AS since_days
    FROM orders
    WHERE order_date<='2024-06-30'
    GROUP BY customer_id
)
, find_rf AS(
    SELECT
        customer_id,
        CASE 
            WHEN since_days<=30 THEN 4
            WHEN since_days<=60 THEN 3
            WHEN since_days<=120 THEN 2
            ELSE 1 END AS R,
        CASE 
            WHEN total_order>=10 THEN 4
            WHEN total_order>=5 THEN 3
            WHEN total_order>=2 THEN 2
        ELSE 1 END AS F
    FROM statistic
)
SELECT
    customer_id,
    R AS r_score,
    F AS f_score,
    CASE 
        WHEN R >= 3 AND F >= 3 THEN 'Champions'
        WHEN R >= 3 AND F = 2 THEN 'Potential Loyalist'
        WHEN R >= 3 AND F = 1 THEN 'New Customers'
        WHEN R = 2 AND F >= 3 THEN 'At Risk' 
        WHEN R = 2 AND F <= 2 THEN 'About To Sleep'
        WHEN R = 1 AND F >= 3 THEN 'Cannot Lose Them'
        WHEN R = 1 AND F = 2 THEN 'Hibernating'
        WHEN R = 1 AND F = 1 THEN 'Lost'
    END AS segment
FROM find_rf
