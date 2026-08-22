-- Xom Data · The customer's joining month on every order
-- Problem: https://xomdata.com/practice/medium-cohort-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    customer_name,
    order_date,
    substring(MIN(order_date) over(PARTITION BY customer_name),1,7) as cohort_month
from orders
ORDER BY customer_name, order_date
