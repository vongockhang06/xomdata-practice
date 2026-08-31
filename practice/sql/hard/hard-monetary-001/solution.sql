-- Xom Data · Chia khách thành năm hạng chi tiêu
-- Problem: https://xomdata.com/practice/hard-monetary-001
-- Solved: 2026-08-31

select
    customer_id,
    sum(amount) as total_spent,
    ntile(5) over(ORDER BY sum(amount) desc, customer_id) as spend_rank
from orders
GROUP BY customer_id
