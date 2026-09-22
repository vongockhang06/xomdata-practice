-- Xom Data · Chấm điểm công bằng khi nhiều khách ngang tài
-- Problem: https://xomdata.com/practice/hard-rfm-005
-- Solved: 2026-09-22

with cte as(
    select
        customer_id,
        sum(amount) as total_spent,
        rank() over(ORDER BY sum(amount) desc) as first_step,
        count(*) over() as total_customer
    from orders
    GROUP BY customer_id
)
, cte2 as(
    select
        customer_id,
        total_spent,
        case when total_customer=1 then 0
        else (first_step-1)*1.0/(total_customer-1) end as relative_rank
    from cte 
)
select
    customer_id,
    total_spent,
    case when relative_rank<0.2 then 5
    when relative_rank<0.4 then 4
    when relative_rank<0.6 then 3
    when relative_rank<0.8 then 2
    else 1 end as m_score
from cte2
