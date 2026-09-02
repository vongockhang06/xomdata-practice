-- Xom Data · Quy mô và tiền tươi tháng đầu của mỗi thế hệ
-- Problem: https://xomdata.com/practice/medium-cohort-008
-- Solved: 2026-09-02

with cte as(
select
    customer_id,
    substring(order_date,1,7) as month,
    amount,
    substring(min(order_date) over(PARTITION BY customer_id order by order_date),1,7) as first_month
from orders 
)
select
    month as cohort_month,
    count(distinct customer_id) as cohort_size,
    sum(amount) as first_month_revenue
from cte
where month=first_month 
GROUP BY month
ORDER BY month
