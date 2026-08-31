-- Xom Data · Khách phủ sóng nhiều tháng nhất
-- Problem: https://xomdata.com/practice/medium-frequency-005
-- Solved: 2026-08-31

select
    customer_id,
    count(DISTINCT substring(order_date,1,7)) as active_months,
    count(*) as total_orders
from orders
GROUP BY customer_id
ORDER BY active_months desc, customer_id
