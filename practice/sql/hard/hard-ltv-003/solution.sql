-- Xom Data · Chín mươi ngày đầu đời đáng giá bao nhiêu
-- Problem: https://xomdata.com/practice/hard-ltv-003
-- Solved: 2026-09-11

with cte as(
    select
        customer_id,
        substring(min(order_date),1,7) as first_month,
        date(min(order_date),'+90 days') as bound
    from orders
    GROUP BY customer_id
)
, cte2 as(
    select
        o.customer_id,
        first_month,
        sum(amount) as rev
    from cte c join orders o on c.customer_id=o.customer_id
    where o.order_date<=c.bound
    group by o.customer_id,first_month
)
select
    first_month as cohort_month,
    count(*) as cohort_size,
    round(avg(rev),2) as avg_ltv_90d
from cte2 GROUP BY first_month
