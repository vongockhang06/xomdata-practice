-- Xom Data · Ma trận tỷ lệ quay lại ba tháng đầu
-- Problem: https://xomdata.com/practice/hard-retention-004
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        min(substring(order_date,1,7)) over(PARTITION BY customer_id ORDER BY order_date) as cohort_month,
        substring(order_date,1,7) as month
    from orders
)
, cte1 as(
    select
        customer_id,
        cohort_month,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)-cast(substring(cohort_month,1,4) as integer)*12-cast(substring(cohort_month,6,2) as integer) as month_diff
    from cte 
)
select
    cohort_month,
    count(DISTINCT customer_id) as cohort_size,
    100 as m0_pct,
    round(count(DISTINCT CASE WHEN month_diff=1 then customer_id end)*100.0/count(DISTINCT customer_id),2) as m1_pct,
    round(count(DISTINCT CASE WHEN month_diff=2 then customer_id end)*100.0/count(DISTINCT customer_id),2) as m2_pct
from cte1 GROUP BY cohort_month
