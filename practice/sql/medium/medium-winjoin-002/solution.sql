-- Xom Data · The customer's total next to every order
-- Problem: https://xomdata.com/practice/medium-winjoin-002
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
select
    customer_name,
    order_date,
    amount,
    sum(amount) over(PARTITION BY customer_id ORDER BY order_date rows between unbounded preceding and unbounded following) as customer_total
from orders o 
join customers c on o.customer_id=c.id
order by customer_name,order_date
