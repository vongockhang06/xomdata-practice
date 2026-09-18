-- Xom Data · Chấm điểm khi tiền nằm trong giỏ hàng
-- Problem: https://xomdata.com/practice/hard-rfm-011
-- Solved: 2026-09-18

with cte as(
    select
        customer_id,
        count(DISTINCT o.order_id) as order_count,
        COALESCE(sum(quantity*unit_price),0) as total_spent
    from orders o left join order_items oi on o.order_id=oi.order_id
    where order_date<='2024-06-30'
    GROUP BY customer_id
)
select
    *,
    6-ntile(5) over(ORDER BY total_spent desc,customer_id) as m_score
from cte
