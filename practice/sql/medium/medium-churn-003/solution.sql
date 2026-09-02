-- Xom Data · Đồng hồ đếm ngược trước khi mất khách
-- Problem: https://xomdata.com/practice/medium-churn-003
-- Solved: 2026-09-02

with cte as(
    select
        customer_id,
        julianday('2024-06-30') - julianday(max(order_date)) as days_silent
    from orders
    GROUP BY customer_id
)
select
    *,
    90-days_silent as days_left
from cte
where days_silent<=90
ORDER BY days_left,customer_id
