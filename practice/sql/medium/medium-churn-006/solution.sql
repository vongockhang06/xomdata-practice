-- Xom Data · Bức ảnh tệp khách tại một thời điểm
-- Problem: https://xomdata.com/practice/medium-churn-006
-- Solved: 2026-09-02

with formatting as(
SELECT
    customer_id,
    substring(order_date,1,7) as month,
    order_date
FROM orders
)
, cte1 as(
    select
        customer_id,
        min(month) as first_month,
        julianday('2024-06-30') - julianday(max(order_date)) as silent_days
    from formatting
    group by customer_id
)
, gr as (
    select
        case when first_month='2024-06' then 'new'
        when silent_days>90 then 'churned'
        else 'active' end as segment
    from cte1
)
select
    segment,
    count(*) as customer_count
from gr
group by segment
