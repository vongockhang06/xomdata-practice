-- Xom Data · Tháng này mất bao nhiêu khách của tháng trước
-- Problem: https://xomdata.com/practice/hard-churn-002
-- Solved: 2026-09-22

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        substring(lead(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id),1,7) as next_month_order,
        substring(date(order_date,'+1 months'),1,7) as next_month
    from orders
)
, cte2 as(
    select
        month,
        count(DISTINCT customer_id) as remain
    from cte
    where next_month=next_month_order
    GROUP BY month
)
, cte3 as(
    select
        month,
        count(DISTINCT customer_id) as total
    from cte 
    GROUP BY month
)
select
    c2.month,
    total-remain as churned_customers
from cte2 c2 join cte3 c3 on c2.month=c3.month
