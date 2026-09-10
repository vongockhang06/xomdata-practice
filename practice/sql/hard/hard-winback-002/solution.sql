-- Xom Data · Đếm những sự trở lại mỗi tháng
-- Problem: https://xomdata.com/practice/hard-winback-002
-- Solved: 2026-09-10

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        substring(lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id),1,7) as prev_order
    from orders
)
, cte2 as(
    select
        month,
        cast(substring(month,1,4) as integer)*12 +cast(substring(month,6,2) as integer)
        - cast(substring(prev_order,1,4) as integer)*12 -cast(substring(prev_order,6,2) as integer) as month_difference
    from cte 
)
, cte3 as(
    select
        month,
        case when month_difference>2 then 1 else 0 end as resur
    from cte2
)
select
    month,
    COUNT(*) as resurrected_customers
from cte3
where resur=1
GROUP BY month 
ORDER BY month
