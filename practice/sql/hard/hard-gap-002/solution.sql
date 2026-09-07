-- Xom Data · Quãng im lặng dài nhất của mỗi khách
-- Problem: https://xomdata.com/practice/hard-gap-002
-- Solved: 2026-09-07

with two_orders as(
    select
        customer_id
    from orders GROUP BY customer_id
    having count(*)>=2
)
, cte as(
    select
        order_id,
        t.customer_id,
        order_date,
        lead(order_date) over(PARTITION BY t.customer_id ORDER BY order_date) as next_order,
        julianday(lead(order_date) over(PARTITION BY t.customer_id ORDER BY order_date))-julianday(order_date) as gap_days
    from orders o join two_orders t on o.customer_id=t.customer_id
)
, cte2 as(
    select
        *,
        ROW_NUMBER() over(PARTITION BY customer_id ORDER BY gap_days desc,order_date,order_id) as ranking
    from cte
)
select
    customer_id,
    order_date as gap_start,
    next_order as gap_end,
    gap_days
from cte2 where ranking=1
order by gap_days desc,customer_id
