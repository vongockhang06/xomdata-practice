-- Xom Data · Xác suất sống sót sau ba cột mốc
-- Problem: https://xomdata.com/practice/hard-churn-007
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        order_date,
        min(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id) as first_order
    from orders
)
, cte2 as(
    select
        customer_id,
        julianday(order_date)-julianday(first_order) as days,
        substring(first_order,1,7) as cohort_month
    from cte
)
    select
        cohort_month,
        count(DISTINCT customer_id) as cohort_size,
        round(COUNT(DISTINCT CASE WHEN days>30 then customer_id end)*100.0/count(DISTINCT customer_id),2) as surv_30_pct,
        round(COUNT(DISTINCT CASE WHEN days>60 then customer_id end)*100.0/count(DISTINCT customer_id),2) as surv_60_pct,
        round(COUNT(DISTINCT CASE WHEN days>90 then customer_id end)*100.0/count(DISTINCT customer_id),2) as surv_90_pct 
    from cte2
    GROUP BY cohort_month
    ORDER BY cohort_month
