-- Xom Data · Dòng tiền tích luỹ theo tuổi thế hệ
-- Problem: https://xomdata.com/practice/hard-ltv-002
-- Solved: 2026-09-22

with cte as(
    select
        customer_id,
        substring(min(order_date) over(PARTITION BY customer_id), 1,7) as cohort_month,
        order_date,
        amount
    from orders
)
, cte1 as(
    select
        customer_id,
        cohort_month,
        cast(substring(order_date,1,4) as integer)*12+cast(substring(order_date,6,2) as integer)
        -cast(substring(cohort_month,1,4) as integer)*12-cast(substring(cohort_month,6,2) as integer) as month_age,
        amount
    from cte
)
select
    cohort_month,
    month_age,
    sum(amount) as revenue,
    sum(sum(amount)) over(PARTITION BY cohort_month ORDER BY month_age rows between unbounded preceding and current row) as cumulative_revenue 
from cte1
GROUP BY cohort_month,month_age
ORDER BY cohort_month,month_age
