-- Xom Data · Each customer's latest contact number
-- Problem: https://xomdata.com/practice/medium-dedup-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
with cte as(
select
    customer_name,
    phone,
    updated_date,
    ROW_NUMBER() OVER(PARTITION BY customer_name ORDER BY updated_date desc) as min_date
from contact_updates
order by customer_name
)
select
    customer_name,
    phone,
    updated_date
from cte
where min_date = 1
