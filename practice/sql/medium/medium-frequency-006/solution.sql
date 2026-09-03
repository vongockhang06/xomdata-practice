-- Xom Data · Trung bình mỗi khách của kênh mua mấy đơn
-- Problem: https://xomdata.com/practice/medium-frequency-006
-- Solved: 2026-09-03

select
    channel,
    count(DISTINCT o.customer_id) as customers,
    count(*) as total_orders,
    round(count(*)::numeric/count(DISTINCT o.customer_id),2) as orders_per_customer
from orders o 
join customers c on o.customer_id=c.customer_id
group by channel
order by orders_per_customer desc, channel
