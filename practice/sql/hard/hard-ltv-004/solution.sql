-- Xom Data · Tháng đầu chiếm bao nhiêu phần cuộc đời khách
-- Problem: https://xomdata.com/practice/hard-ltv-004
-- Solved: 2026-09-23

with cte as(
    select
        substring(order_date,1,7) as month,
        substring(min(order_date) over(PARTITION BY customer_id),1,7) as cohort_month,
        amount
    from orders
)
, cte1 as(
    select
        cohort_month,
        sum(case when month=cohort_month then amount else 0 end) as first_month_revenue,
        sum( amount ) as lifetime_revenue
    from cte
    GROUP BY cohort_month
)
select
    *,
    round(first_month_revenue*100.0/lifetime_revenue,2) as first_month_share_pct
from cte1 
ORDER BY cohort_month
