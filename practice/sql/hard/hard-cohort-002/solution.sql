-- Xom Data · Bảng theo dõi khách quay lại theo thế hệ
-- Problem: https://xomdata.com/practice/hard-cohort-002
-- Solved: 2026-09-22

with cte as(
    select
        customer_id,
        substring(min(order_date) over(PARTITION BY customer_id),1,7) as cohort_month,
        substring(order_date,1,7) as month
    from orders
)
, cte2 as(
    select
        *,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)
        -cast(substring(cohort_month,1,4) as integer)*12-cast(substring(cohort_month,6,2) as integer) as month_diff
    from cte
)
select
    cohort_month,
    count(DISTINCT customer_id) as m0,
    count(DISTINCT CASE WHEN month_diff=1 then customer_id end) as m1,
    count(DISTINCT CASE WHEN month_diff=2 then customer_id end) as m2,
    count(DISTINCT CASE WHEN month_diff=3 then customer_id end) as m3
from cte2
GROUP BY cohort_month
ORDER BY cohort_month
