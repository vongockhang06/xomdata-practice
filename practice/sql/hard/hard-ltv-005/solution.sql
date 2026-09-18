-- Xom Data · Ước tính giá trị trọn đời bằng ba mảnh ghép
-- Problem: https://xomdata.com/practice/hard-ltv-005
-- Solved: 2026-09-18

WITH customer_metrics AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spend,
        COUNT(*) AS total_orders,
        COUNT(DISTINCT SUBSTRING(order_date, 1, 7)) AS active_months
    FROM orders
    GROUP BY customer_id
),
overall_averages AS (
    SELECT
        SUM(total_spend) * 1.0 / SUM(total_orders) AS aov,
        SUM(total_orders) * 1.0 / SUM(active_months) AS orders_per_active_month,
        AVG(active_months * 1.0) AS avg_active_months
    FROM customer_metrics
)
SELECT
    ROUND(aov, 2) AS aov,
    ROUND(orders_per_active_month, 2) AS orders_per_active_month,
    ROUND(avg_active_months, 2) AS avg_active_months,
    ROUND(aov * orders_per_active_month * avg_active_months, 2) AS estimated_ltv
FROM overall_averages;
