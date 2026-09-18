-- Xom Data · Sau một tháng, còn lại bao nhiêu phần
-- Problem: https://xomdata.com/practice/hard-retention-002
-- Solved: 2026-09-18

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        substring(min(order_date) over(PARTITION BY customer_id),1,7) as cohort_month,
        substring(lead(order_date) over(PARTITION BY customer_id ORDER BY order_date),1,7) as next_order_month
    from orders
)
, cte2 as(
    select
        customer_id,
        cohort_month,
        cast(substring(next_order_month,1,4) as integer)*12+cast(substring(next_order_month,6,2) as integer)-cast(substring(month,1,4) as integer)*12-cast(substring(month,6,2) as integer) as month_diff
    from cte 
)
, cte3 as(
    select
        cohort_month,
        count(DISTINCT customer_id) as cohort_size,
        count(DISTINCT CASE WHEN month_diff=1 then customer_id end) as retained_m1
    from cte2
    GROUP BY cohort_month
)
select
    *,
    round(retained_m1*100.0/cohort_size,2) as retention_pct
from cte3
