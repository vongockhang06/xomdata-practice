-- Xom Data · First purchase date next to every order
-- Problem: https://xomdata.com/practice/medium-firstval-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    customer_name,
    order_date,
    amount,
    FIRST_VALUE(order_date) over(PARTITION BY customer_name order by order_date ) as first_order_date
from orders 
order by customer_name,order_date
