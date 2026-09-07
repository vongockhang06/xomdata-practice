-- Xom Data · Còn sống sót tính từ tháng thứ hai trở đi
-- Problem: https://xomdata.com/practice/hard-retention-005
-- Solved: 2026-09-07

with stg as(
    select
        customer_id,
        substring(order_date,1,7) as month
    from orders
)
, first_month as(
    select
        customer_id,
        min(month) as cohort_month
    from stg
    GROUP BY customer_id
)
, cohort as(
    select
        cohort_month,
        count(DISTINCT customer_id) as cohort_size
    from first_month
    group by cohort_month
)
, find_survivor as(
    select
        f.cohort_month,
        count(DISTINCT s.customer_id) as survivors
    from first_month f join stg s on f.customer_id=s.customer_id
    where cast(substring(s.month,1,4) as integer) *12 - cast(substring(f.cohort_month,1,4) as integer) *12 + cast(substring(s.month,6,2) as integer) - cast(substring(f.cohort_month,6,2) as integer) >=2
    group by f.cohort_month
)
select
    c.cohort_month,
    c.cohort_size,
    case when survivors is null then 0 else survivors end as survivors,
    case when survivors is null then 0 else
    round(survivors*100.0/cohort_size,2) end as survival_pct
from find_survivor fs right join cohort c on fs.cohort_month=c.cohort_month
ORDER BY c.cohort_month
