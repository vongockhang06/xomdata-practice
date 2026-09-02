-- Xom Data · Bức tranh phân bố mức độ gắn bó
-- Problem: https://xomdata.com/practice/medium-frequency-004
-- Solved: 2026-09-02

with cte as(
    select
        customer_id,
        count(*) as total_orders
    from orders
    GROUP BY customer_id
)
, cte2 as(
select
    customer_id,
    case when total_orders=1 then '1 order'
    when total_orders=2 then '2 orders'
    else '3+ orders' end as engagement_bucket
from cte
)
select
    engagement_bucket,
    count(*) as customer_count
from cte2 
group by engagement_bucket
order by  engagement_bucket
