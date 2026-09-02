-- Xom Data · Tuổi đời mua sắm của khách
-- Problem: https://xomdata.com/practice/medium-cohort-006
-- Solved: 2026-09-02

select
    customer_id,
    substring(min(order_date),1,7) as first_month,
    substring(max(order_date),1,7) as last_month,
    cast(substring(max(order_date),1,4) as integer)*12 - cast(substring(min(order_date),1,4) as integer)*12 + cast(substring(max(order_date),6,2) as integer) - cast(substring(min(order_date),6,2) as integer) as tenure_months
from orders
group by customer_id
order by tenure_months desc, customer_id
