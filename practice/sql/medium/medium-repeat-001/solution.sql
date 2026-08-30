-- Xom Data · Khách một lần ghé và khách quay lại
-- Problem: https://xomdata.com/practice/medium-repeat-001
-- Solved: 2026-08-30

with cte as(
    select
        customer_id,
        count(*) as no_order
    from orders
    GROUP BY customer_id
)
,cte2 as(
    select
        case when no_order=1 then 'one-time'
        else 'repeat' end as gr
    from cte
)
select
    gr as customer_type,
    count(*) as customer_count
from cte2
GROUP BY gr
