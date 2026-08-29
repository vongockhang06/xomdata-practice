-- Xom Data · Tháng chào sân của từng khách
-- Problem: https://xomdata.com/practice/medium-cohort-003
-- Solved: 2026-08-29

select
    customer_id,
    SUBSTRING(MIN(order_date),1,7) as cohort_month 
from orders
GROUP BY customer_id
ORDER BY cohort_month,customer_id
