-- Xom Data · Mã ba chữ số nói lên tất cả
-- Problem: https://xomdata.com/practice/hard-rfm-004
-- Solved: 2026-09-21

with cte as(
    select
        customer_id,
        max(order_date) as last_date,
        sum(amount) as total,
        count(*) as order_count
    from orders
    where order_date <='2024-06-30'
    GROUP BY customer_id
)
, cte1 as(
    select
        customer_id,
        6-NTILE(5) over(ORDER BY last_date desc, customer_id) as r,
        6-NTILE(5) over(ORDER BY order_count desc, customer_id) as f,
        6-NTILE(5) over(ORDER BY total desc, customer_id) as m
    from cte
)
select
    customer_id,
    concat(r::char,f::char,m::char) as rfm_code
from cte1 
ORDER BY rfm_code desc,customer_id
