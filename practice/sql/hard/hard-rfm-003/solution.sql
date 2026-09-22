-- Xom Data · Điểm tươi mới cộng điểm chuyên cần
-- Problem: https://xomdata.com/practice/hard-rfm-003
-- Solved: 2026-09-22

with cte as(
    select
        customer_id,
        max(order_date) as recent,
        count(*) as total_order
    from orders
    GROUP BY customer_id
)
, cte2 as(
    select
        customer_id,
        6-ntile(5) over(ORDER BY recent desc,customer_id) as r_score,
        case when total_order>=8 then 3
        when total_order>=4 then 2
        else 1 end as f_score
    from cte 
)
, cte3 as(
    select
        *,
        r_score+f_score as total_score
    from cte2
)
select
    *,
    case when total_score>=7 then 'Gold'
    when total_score>=5 then 'Silver'
    else 'Bronze' end as label
from cte3
