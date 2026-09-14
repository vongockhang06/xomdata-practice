-- Xom Data · Mất bao lâu để kéo được khách quay về
-- Problem: https://xomdata.com/practice/hard-winback-004
-- Solved: 2026-09-14

with cte as(
    SELECT  
        customer_id,
        order_date,
        lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id) as prev_order_date
    from orders
)
, cte2 as(
    select
        customer_id,
        julianday(order_date)-julianday(prev_order_date) as days_gap
    from cte
    where prev_order_date IS NOT NULL
)
select
    channel,
    count(*) as winback_count,
    round(avg(days_gap),2) as avg_absence_days
from cte2 c2 join customers c on c2.customer_id=c.customer_id
where days_gap>=60
GROUP BY channel
ORDER BY avg_absence_days,channel
