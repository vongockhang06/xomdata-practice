-- Xom Data · Ba vòng tròn độ tươi của tệp khách
-- Problem: https://xomdata.com/practice/medium-recency-004
-- Solved: 2026-09-01

with cte as(
    select
        customer_id,
        julianday('2024-06-30')-julianday(MAX(order_date)) as since_days
    from orders
    GROUP BY customer_id
)
, cte1 as(
    select
        customer_id,
        case when since_days>=91 then 'cold'
        when since_days>=31 then 'warm'
        when since_days>=0 then 'hot'
        end as freshness_bucket
    from cte
)
select
    freshness_bucket,
    count(*) as customer_count
from cte1
GROUP BY freshness_bucket
order by case freshness_bucket
when 'hot' then 1
when 'warm' then 2
else 3 end asc
