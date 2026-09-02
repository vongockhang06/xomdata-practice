-- Xom Data · Ai nhập hội đúng mùa khuyến mãi
-- Problem: https://xomdata.com/practice/medium-cohort-007
-- Solved: 2026-09-02

with cte as(
    select
        customer_id,
        min(order_date) as first_order_date
    from orders
    GROUP BY customer_id
    having substring(min(order_date),1,7)='2024-03'
)
, cte2 as(
SELECT 
    c.customer_id, 
    count(*) as campaign_orders
from orders o
join cte c on o.customer_id=c.customer_id
where substring(o.order_date,1,7)='2024-03' 
GROUP BY o.customer_id
)
select
    cte.customer_id,
    first_order_date,
    campaign_orders
from cte2 join cte on cte2.customer_id=cte.customer_id
