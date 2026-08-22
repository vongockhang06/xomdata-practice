-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
WITH cte as (
select
    customer_name,
    sum(amount) as total_spent
from purchases
group by customer_name
)
select
    *,
    DENSE_RANK() over(ORDER BY total_spent desc) as spend_tier
from cte 
order by spend_tier, customer_name
