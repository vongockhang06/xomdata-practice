-- Xom Data · Splitting deliveries into three shifts by order time
-- Problem: https://xomdata.com/practice/medium-ntile-002
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
select
    order_code,
    order_time,
    ntile(3) over(ORDER BY order_time,order_code) as delivery_shift
from morning_orders
