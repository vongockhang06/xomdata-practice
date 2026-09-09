-- Xom Data · Quay lại đúng hẹn tháng thứ n
-- Problem: https://xomdata.com/practice/hard-retention-007
-- Solved: 2026-09-09

with formatting as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        min(substring(order_date,1,7)) over(PARTITION BY customer_id ORDER BY order_date,order_id) as cohort_month
    FROM orders
)
, cte as(
    select
        customer_id,
        cohort_month,
        case when cast(substring(month,1,4) as integer)*12 +cast(substring(month,6,2) as integer) - cast(substring(cohort_month,1,4) as integer)*12 - cast(substring(cohort_month,6,2) as integer) = 1 then 1 else 0 end m1,
        case when cast(substring(month,1,4) as integer)*12 +cast(substring(month,6,2) as integer) - cast(substring(cohort_month,1,4) as integer)*12 - cast(substring(cohort_month,6,2) as integer) = 2 then 1 else 0 end m2,
        case when cast(substring(month,1,4) as integer)*12 +cast(substring(month,6,2) as integer) - cast(substring(cohort_month,1,4) as integer)*12 - cast(substring(cohort_month,6,2) as integer) = 3 then 1 else 0 end m3
    from formatting
)
, cte2 as(
    SELECT
        customer_id,
        cohort_month,
        sum(m1) as m1,
        sum(m2) as m2,
        sum(m3) as m3
    from cte 
    GROUP BY customer_id, cohort_month
)
select
    cohort_month,
    count(distinct customer_id) as cohort_size,
    count(DISTINCT case when m1!=0 then customer_id end) as m1,
    count(DISTINCT case when m2!=0 then customer_id end) as m2,
    count(DISTINCT case when m3!=0 then customer_id end) as m3
from cte2
GROUP BY cohort_month
ORDER BY cohort_month
