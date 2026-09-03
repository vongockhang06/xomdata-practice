-- Xom Data · Đà tăng giảm lượng khách qua từng tháng
-- Problem: https://xomdata.com/practice/medium-active-005
-- Solved: 2026-09-03

select
    substring(order_date,1,7) as month,
    count(distinct customer_id) as active_customers,
    count(distinct customer_id) - lag(count(distinct customer_id)) over(ORDER BY substring(order_date,1,7)) as change_vs_prev
from orders 
group by substring(order_date,1,7)
order by substring(order_date,1,7)
