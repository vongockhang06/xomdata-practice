-- Xom Data · Tam giác giữ chân dạng sổ cái
-- Problem: https://xomdata.com/practice/hard-retention-006
-- Solved: 2026-09-11

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        substring(min(order_date) over(PARTITION BY customer_id ORDER BY order_date),1,7) as cohort_month
    from orders
)
, cte2 as(
    select
        cohort_month,
        count(DISTINCT customer_id) as cohort_size
    from cte
    GROUP BY cohort_month
)
, cte3 as(
    select
        customer_id,
        cohort_month,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)
        -cast(substring(cohort_month,1,4) as integer)*12-cast(substring(cohort_month,6,2) as integer)
        as month_age
    from cte
)
, cte4 as(
    select
        cohort_month,
        month_age,
        count(DISTINCT customer_id) as retained
    from cte3
    GROUP BY cohort_month,month_age
)
select
    c4.cohort_month,
    month_age,
    cohort_size,
    retained,
    round(retained*100.0/cohort_size,2) as retention_pct
from cte4 c4 join cte2 c2 on c4.cohort_month=c2.cohort_month
ORDER BY c4.cohort_month,
    month_age
