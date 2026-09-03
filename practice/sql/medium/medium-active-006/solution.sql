-- Xom Data · So găng lượng khách giữa các quý
-- Problem: https://xomdata.com/practice/medium-active-006
-- Solved: 2026-09-03

with label as(
    select
    customer_id,
    case 
    when substring(order_date,6,2) in ('01','02','03') then substring(order_date,1,5) || 'Q1'
    when substring(order_date,6,2) in ('04','05','06') then substring(order_date,1,5) || 'Q2'
    when substring(order_date,6,2) in ('07','08','09') then substring(order_date,1,5) || 'Q3'
    else substring(order_date,1,5) || 'Q4' end as quarter
    from orders
)
, cte as(
    select
        quarter,
        count(DISTINCT customer_id) as active_customers
    from label
    group by quarter
)
select
   *,
   active_customers - lag(active_customers) over(ORDER BY quarter) as change_vs_prev
from cte 
order by quarter
