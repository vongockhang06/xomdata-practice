-- Xom Data · Máy dò rủi ro theo thói quen từng người
-- Problem: https://xomdata.com/practice/hard-churn-006
-- Solved: 2026-09-10

with find_days_silent as(
    select
        customer_id,
        julianday('2024-06-30')-julianday(max(order_date)) as days_silent
    from orders
    GROUP BY customer_id
)
,cte as(
    select
        customer_id,
        julianday(order_date)-julianday(lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id)) as days_gap
    from orders
)
, find_avg_gap as(
    select
        customer_id,
        case when count(*) =1 then null else
        round(avg(days_gap),2) end as avg_gap
    from cte 
    GROUP BY customer_id
)
select
    fag.customer_id,
    days_silent,
    avg_gap,
    case when avg_gap is null then 'unknown'
    when avg_gap*1.5<days_silent then 'at_risk'
    else 'healthy' end as risk
from find_avg_gap fag join find_days_silent fdl on fag.customer_id=fdl.customer_id
