-- Xom Data · Những người quay về sau hai tháng im ắng
-- Problem: https://xomdata.com/practice/hard-winback-001
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        order_date,
        julianday(order_date)-julianday(lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id)) as gap_days
    from orders
)
select * from cte where gap_days>=60
