-- Xom Data · Chấm điểm khách hàng trên ba thước đo
-- Problem: https://xomdata.com/practice/hard-rfm-001
-- Solved: 2026-08-30

----Recency
WITH cte_for_rfm AS(
    select
        customer_id,
        date('2024-06-30') -date(max(order_date))as days_since,
        count(*) as order_count,
        sum(amount) as total
    from orders
    where order_date<='2024-06-30'
    GROUP BY customer_id
)
,find_rfm as(
select
    customer_id,
    6-ntile(5) over(ORDER BY days_since ,customer_id ) as r_score,
    6-ntile(5) over(ORDER BY order_count desc,customer_id ) as f_score,
    6-ntile(5) over(ORDER BY total desc,customer_id ) as m_score
from cte_for_rfm
)
select
    *,
    r_score+f_score+m_score as rfm_total
from find_rfm
order by rfm_total desc,customer_id
