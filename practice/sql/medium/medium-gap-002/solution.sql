-- Xom Data · Bao lâu thì khách quyết định quay lại lần hai
-- Problem: https://xomdata.com/practice/medium-gap-002
-- Solved: 2026-09-01

with cte as (
    select
        customer_id,
        order_date,
        amount,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date,order_id) as ranking
    from orders
)
,cte2 as(
select
    customer_id,
    order_date,
    ranking
from cte
where ranking<=2
)
select 
    c.customer_id,
    c.order_date as first_order_date,
    c2.order_date as second_order_date,
    julianday(c2.order_date)-julianday(c.order_date) as days_between
from cte2 c
join cte2 c2 on c.customer_id=c2.customer_id and c.ranking<c2.ranking
order by days_between,c.customer_id
