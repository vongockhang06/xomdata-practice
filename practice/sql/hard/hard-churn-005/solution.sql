-- Xom Data · Nhật ký vòng đời từng khách mỗi tháng
-- Problem: https://xomdata.com/practice/hard-churn-005
-- Solved: 2026-09-11

with cte as(
    select
        substring(order_date,1,7) as month,
        customer_id
    from orders
    GROUP BY substring(order_date,1,7),customer_id
)
, cte2 as(
    select
        month,
        customer_id,
        lag(month) over(PARTITION BY customer_id ORDER BY month) as prev_month
    from cte 
)
, cte3 as(
    select
        month,
        customer_id,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)
        -cast(substring(prev_month,1,4) as integer)*12-cast(substring(prev_month,6,2) as integer) as month_diff
    from cte2
)
select
        month,
        customer_id,
        case when month_diff is null then 'new'
        when month_diff=1 then 'retained'
        else 'resurrected' end as lifecycle
    from cte3
    ORDER BY month,customer_id
