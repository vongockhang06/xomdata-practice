-- Xom Data · Ấn tượng đầu tiên trị giá bao nhiêu
-- Problem: https://xomdata.com/practice/medium-firstlast-003
-- Solved: 2026-09-01

select
    customer_id,
    order_date as first_order_date,
    amount as first_amount
from(
select
    customer_id,
    order_date,
    amount,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date,order_id) as ranking
from orders)
where ranking=1
order by  customer_id
