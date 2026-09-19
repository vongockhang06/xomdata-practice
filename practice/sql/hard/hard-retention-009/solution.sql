-- Xom Data · Kênh nào mua về khách bền nhất
-- Problem: https://xomdata.com/practice/hard-retention-009
-- Solved: 2026-09-19

with cte as(
    select
        c.customer_id,
        channel,
        substring(min(order_date) OVER(PARTITION BY c.customer_id),1,7) as cohort_month,
        substring(order_date,1,7) as month
    from orders o join customers c on o.customer_id=c.customer_id
)
, cte1 as(
    select
        customer_id,
        channel,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)-cast(substring(cohort_month,1,4) as integer)*12-cast(substring(cohort_month,6,2) as integer) as diff_month
    from cte
)
select
    channel,
    count(DISTINCT customer_id) as cohort_customers,
    count(DISTINCT case when diff_month=1  then customer_id end) as retained,
    round(count(DISTINCT case when diff_month=1  then customer_id end)*100.0/count(DISTINCT customer_id),2) as retention_pct
from cte1
GROUP BY channel
ORDER BY retention_pct DESC, channel
