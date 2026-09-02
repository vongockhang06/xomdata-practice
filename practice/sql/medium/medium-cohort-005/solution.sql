-- Xom Data · Quý khởi đầu của mỗi khách
-- Problem: https://xomdata.com/practice/medium-cohort-005
-- Solved: 2026-09-02

with cte as(
    select
        customer_id,
        substring(MIN(order_date),1,7) as first_month
    from orders
    GROUP BY customer_id
)
select
    customer_id,
    case when CAST(substring(first_month,6,7) as INT) in (1,2,3) then substring(first_month,1,4) || '-Q1'
    when CAST(substring(first_month,6,7) as INT) in (4,5,6) then substring(first_month,1,4) ||  '-Q2'
    when CAST(substring(first_month,6,7) as INT) in (7,8,9) then substring(first_month,1,4) ||  '-Q3'
    else substring(first_month,1,4) ||  '-Q4'
    end as first_quarter
from cte
