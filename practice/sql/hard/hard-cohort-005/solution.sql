-- Xom Data · Ma trận giữ chân sáu tháng hoàn chỉnh
-- Problem: https://xomdata.com/practice/hard-cohort-005
-- Solved: 2026-09-18

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        substring(min(order_date) over(PARTITION BY customer_id),1,7) as cohort_month
    from orders
)
, cte2 as(
    select
        customer_id,
        cohort_month,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)-cast(substring(cohort_month,1,4) as integer)*12-cast(substring(cohort_month,6,2) as integer) as month_diff
    from cte 
)
, cte3 as(
    select
        cohort_month,
        count(DISTINCT customer_id) as cohort_size,
        count(DISTINCT case when month_diff=1 then customer_id end) as m1,
        count(DISTINCT case when month_diff=2 then customer_id end) as m2,
        count(DISTINCT case when month_diff=3 then customer_id end) as m3,
        count(DISTINCT case when month_diff=4 then customer_id end) as m4,
        count(DISTINCT case when month_diff=5 then customer_id end) as m5
    from cte2 GROUP BY cohort_month
)
SELECT
    cohort_month,
    cohort_size,
    100 as m0,
    round(m1*100.0/cohort_size,2) as m1,
    round(m2*100.0/cohort_size,2) as m2,
    round(m3*100.0/cohort_size,2) as m3,
    round(m4*100.0/cohort_size,2) as m4,
    round(m5*100.0/cohort_size,2) as m5
from cte3
