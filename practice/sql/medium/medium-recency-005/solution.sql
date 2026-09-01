-- Xom Data · Kênh nào đang giữ được hơi ấm
-- Problem: https://xomdata.com/practice/medium-recency-005
-- Solved: 2026-09-01

with cte as(
    select
        o.customer_id,
        channel,
        julianday('2024-06-30') -julianday(max(order_date)) as silent_days
    from orders o
    join customers c on o.customer_id=c.customer_id
    GROUP BY o.customer_id,channel
)
select
    channel,
    count(*)  as customers,
    round(avg(silent_days),2) as avg_days_silent
from cte
GROUP BY channel
ORDER BY avg_days_silent,channel
