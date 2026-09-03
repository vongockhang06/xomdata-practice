-- Xom Data · Kênh nào tạo ra khách trung thành
-- Problem: https://xomdata.com/practice/medium-repeat-005
-- Solved: 2026-09-03

with cte as(
    select
        channel,
        o.customer_id,
        count(*) as total_orders
    from orders o join customers c on o.customer_id=c.customer_id
    group by channel,o.customer_id
)
select
    channel,
    count(customer_id) as customers,
    count(case when total_orders>=3 then 1 end) as loyal_customers,
    round(count(case when total_orders>=3 then 1 end)::numeric/count(customer_id)*100,2) as loyal_rate_pct
from cte 
group by channel
order by loyal_rate_pct desc, channel
