-- Xom Data · Nhóm khách nào thật sự nuôi cửa hàng
-- Problem: https://xomdata.com/practice/hard-ltv-006
-- Solved: 2026-09-13

with cte as(
    select
        customer_id,
        count(*) as total_order,
        max(order_date) as recent_order
    from orders
    where order_date<='2024-06-30'
    GROUP BY customer_id
)
, cte2 as(
    select
        customer_id,
        6- ntile(5) over(ORDER BY recent_order desc,customer_id) as r,
        6- ntile(5) over(ORDER BY total_order desc,customer_id) as f
    from cte 
)
, label as(
    select
        customer_id,
        case when r>=4 and f>=4 then 'Champions'
        when r>=4 then 'Recent'
        when f>=4 then 'At Risk'
        else 'Others' end as segment
    from cte2 
)
select
    l.segment,
    count(distinct o.customer_id) as customers,
    sum(amount) as total_revenue,
    ROUND(sum(amount)::numeric/count(distinct o.customer_id),2) as avg_ltv
from label l join orders o on l.customer_id=o.customer_id
GROUP BY segment
ORDER BY avg_ltv desc, segment
