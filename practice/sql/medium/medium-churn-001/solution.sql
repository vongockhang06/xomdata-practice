-- Xom Data · Gắn nhãn khách còn gắn bó hay đã rời đi
-- Problem: https://xomdata.com/practice/medium-churn-001
-- Solved: 2026-08-30

with days_since as(
    select
        customer_id,
        max(order_date) as last_order_date,
        julianday('2024-06-30') - julianday(max(order_date)) as days
    from orders
    GROUP BY customer_id
)
select
    customer_id,
    last_order_date,
    case when days>90 then 'churned'
    else 'active' end as status
from days_since
