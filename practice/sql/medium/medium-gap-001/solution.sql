-- Xom Data · Khoảng lặng giữa hai lần mua liền kề
-- Problem: https://xomdata.com/practice/medium-gap-001
-- Solved: 2026-09-03

with cte as(
    select
        customer_id,
        order_date,
        julianday(order_date) - julianday(lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id)) as days_since_prev
    from orders
)
select
*
from cte where days_since_prev not null
order by customer_id,
        order_date,days_since_prev
