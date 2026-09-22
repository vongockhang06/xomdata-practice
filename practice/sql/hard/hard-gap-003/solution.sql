-- Xom Data · Dự đoán ngày khách ghé tiếp theo
-- Problem: https://xomdata.com/practice/hard-gap-003
-- Solved: 2026-09-22

with cte as(
    select
        customer_id,
        max(order_date) as last_order_date,
        count(*) as count_order
    from orders
    GROUP BY customer_id
    having count(*)>=2
)
, cte2 as(
    select
        c.customer_id,
        last_order_date,
        julianday(order_date) - julianday(lag(order_date) over(PARTITION BY c.customer_id ORDER BY order_date,order_id)) as gap 
    from cte c
    join orders o on c.customer_id=o.customer_id
)
, cte3 as(
    select
        customer_id,
        last_order_date,
        floor(avg(gap)) as avg_gap_days
    from cte2
    GROUP BY customer_id, last_order_date
)
select
    *,
    date(last_order_date, '+'||avg_gap_days||' days') as predicted_next_date
from cte3
ORDER BY predicted_next_date, customer_id
