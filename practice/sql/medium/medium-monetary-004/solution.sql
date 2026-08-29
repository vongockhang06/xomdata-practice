-- Xom Data · Đơn hàng để đời của mỗi khách
-- Problem: https://xomdata.com/practice/medium-monetary-004
-- Solved: 2026-08-29

with ranking as(
    select
        customer_id,
        order_id,
        order_date,
        amount,
        ROW_NUMBER() over(PARTITION BY customer_id order by amount desc,order_date,order_id) as record
    from orders
)
select
    customer_id,
        order_id,
        order_date,
        amount
from ranking
where record=1
