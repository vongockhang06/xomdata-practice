-- Xom Data · Lần vắng mặt dài bất thường
-- Problem: https://xomdata.com/practice/hard-gap-004
-- Solved: 2026-09-17

with cte as(
    select
        customer_id
    from orders
    GROUP BY customer_id
    having count(*)>=3
)
, cte1 as(
    select
        o.customer_id,
        order_date,
        lag(order_date) over(PARTITION BY o.customer_id ORDER BY order_date, order_id) as prev_order,
        julianday(order_date)-julianday(lag(order_date) over(PARTITION BY o.customer_id ORDER BY order_date, order_id)) as gap
    from cte c join orders o on c.customer_id=o.customer_id
)
, cte2 as(
    select
        customer_id,
        prev_order,
        order_date,
        gap,
        avg(gap) over(PARTITION BY customer_id) as avg_gap
    from cte1 
)
    select
        customer_id,
        prev_order as gap_start,
        order_date as gap_end,
        gap as gap_days,
        round(avg_gap,2) as avg_gap
    from cte2 
    where gap>2*avg_gap
