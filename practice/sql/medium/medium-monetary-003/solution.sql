-- Xom Data · Sổ chi tiêu quý hai, kể cả người im lặng
-- Problem: https://xomdata.com/practice/medium-monetary-003
-- Solved: 2026-09-03

with cte as(
    select
        customer_id,
        sum(amount) as q2_spent
    from orders
    where order_date BETWEEN '2024-04-01' and '2024-06-30'
    group by customer_id
)
select
    cu.customer_id,
    customer_name,
    COALESCE(q2_spent,0) as q2_spent
from cte c right join customers cu on c.customer_id=cu.customer_id  
order by q2_spent desc, cu.customer_id
