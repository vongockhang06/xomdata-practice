-- Xom Data · Thứ bậc chi tiêu trong nội bộ mỗi kênh
-- Problem: https://xomdata.com/practice/medium-classify-002
-- Solved: 2026-08-31

select
    channel,
    o.customer_id,
    sum(amount) as total_spent,
    DENSE_RANK() over(PARTITION BY channel ORDER BY sum(amount) desc) as rank_in_channel
from orders o 
join customers c on o.customer_id=c.customer_id
GROUP BY channel,o.customer_id
ORDER BY channel, rank_in_channel, o.customer_id
