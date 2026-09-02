-- Xom Data · Khách chuyên cần đủ bốn mùa
-- Problem: https://xomdata.com/practice/medium-repeat-006
-- Solved: 2026-09-02

SELECT
    customer_id,
    COUNT(*) AS orders_2024
FROM orders
WHERE order_date >= '2024-01-01' AND order_date <= '2024-12-31'
GROUP BY customer_id
HAVING COUNT(DISTINCT CASE 
    WHEN SUBSTR(order_date, 6, 2) IN ('01', '02', '03') THEN 1
    WHEN SUBSTR(order_date, 6, 2) IN ('04', '05', '06') THEN 2
    WHEN SUBSTR(order_date, 6, 2) IN ('07', '08', '09') THEN 3
    WHEN SUBSTR(order_date, 6, 2) IN ('10', '11', '12') THEN 4
END) = 4;
