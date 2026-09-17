-- Xom Data · Giá trị trọn đời trung bình của mỗi thế hệ
-- Problem: https://xomdata.com/practice/hard-ltv-001
-- Solved: 2026-09-17

with cte as(
    select
        customer_id,
        min(substring(order_date,1,7)) over(PARTITION BY customer_id ORDER BY order_date) as cohort_month,
        sum(amount) as amount
    from orders
    GROUP BY customer_id
)
select
    cohort_month,
    count(DISTINCT customer_id) as cohort_size,
    round(avg(amount),2) as avg_ltv
from cte
GROUP BY cohort_month
