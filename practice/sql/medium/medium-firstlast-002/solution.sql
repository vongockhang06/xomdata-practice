-- Xom Data · Gương mặt ghé gần nhất của từng kênh
-- Problem: https://xomdata.com/practice/medium-firstlast-002
-- Solved: 2026-09-03

select
    channel,
    customer_id,
    order_date as last_order_date
from(
select
    channel,
    o.customer_id,
    order_date,
    ROW_NUMBER() over(PARTITION BY channel order by order_date desc, o.customer_id) as ranking
from orders o join customers c on o.customer_id=c.customer_id)
where ranking =1
order by channel
