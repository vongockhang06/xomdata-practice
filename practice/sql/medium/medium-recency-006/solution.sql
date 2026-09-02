-- Xom Data · Hồ sơ ba chỉ số thô của từng khách
-- Problem: https://xomdata.com/practice/medium-recency-006
-- Solved: 2026-09-02

select
    customer_id,
    julianday('2024-06-30') - julianday(MAX(order_date)) as days_silent,
    count(*) as order_count,
    sum(amount) as total_spent
from orders 
where order_date<='2024-06-30'
GROUP BY customer_id
ORDER BY customer_id
