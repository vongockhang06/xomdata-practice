-- Xom Data · Tháng vàng của từng khách
-- Problem: https://xomdata.com/practice/medium-frequency-003
-- Solved: 2026-09-02

WITH cte as(
select
    customer_id,
    substring(order_date,1,7) as month,
    count(*) as total_orders
from orders
GROUP BY customer_id,substring(order_date,1,7)
)
, cte2 as(
    SELECT
        customer_id,
        month,
        total_orders,
        ROW_NUMBER() over(PARTITION BY customer_id ORDER BY total_orders desc, month) as ranking
    from cte
)
select
    customer_id,
        month as best_month,
        total_orders as orders_in_month
from cte2 where ranking=1
ORDER BY customer_id
