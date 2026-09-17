-- Xom Data · Tỷ lệ thất thoát khách theo từng tháng
-- Problem: https://xomdata.com/practice/hard-churn-003
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        substring(lead(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id),1,7) as next_month
    from orders
)
, cte2 as(
    select
        customer_id,
        month,
        -cast(substring(month,1,4) as integer)*12-cast(substring(month,6,2) as integer)
        +cast(substring(next_month,1,4) as integer)*12+cast(substring(next_month,6,2) as integer) as month_diff
    from cte 
    where month!=(select max(month) from cte)
)
,cte3 as(
    SELECT
        month,
        count(DISTINCT customer_id) as active_customers,
        count(DISTINCT customer_id)-count(DISTINCT CASE WHEN month_diff=1 then customer_id end) as churned_customers
    from cte2
    GROUP BY month
)
select
    *,
    round(churned_customers*100.0/active_customers,2) as churn_rate_pct
from cte3
ORDER BY month
