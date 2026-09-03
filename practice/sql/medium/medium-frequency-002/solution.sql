-- Xom Data · Khách chạm mốc ba đơn một năm
-- Problem: https://xomdata.com/practice/medium-frequency-002
-- Solved: 2026-09-03

select
    customer_id,
    count(case when substring(order_date,1,4)='2024' then 1 end) as order_count
from orders 
group by customer_id
having count(case when substring(order_date,1,4)='2024' then 1 end) >=3
