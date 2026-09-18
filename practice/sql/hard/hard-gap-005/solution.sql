-- Xom Data · Bản đồ phân bố những khoảng lặng
-- Problem: https://xomdata.com/practice/hard-gap-005
-- Solved: 2026-09-18

with cte as(
    select
        customer_id,
        order_date,
        lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id) as prev_order
    from orders
)
,cte2 as(
    select
        customer_id,
        julianday(order_date)-julianday(prev_order) as gap
    from cte 
    where prev_order IS NOT NULL
)
, cte3 as(
    select
        customer_id,
        case when gap<=7 then '0-7d'
        when gap<=30 then '8-30d'
        when gap<=90 then '31-90d'
        else '90d+' end as bucket
    from cte2 
)
select
    bucket as gap_bucket,
    count(*) as gap_count,
    round(100.0*count(*)/(select count(*) from cte3),2) as share_pct
from cte3 GROUP BY bucket
ORDER BY case  gap_bucket 
        when '0-7d' then 1
        when '8-30d' then 2
        when '31-90d' then 3
        else  4 end
