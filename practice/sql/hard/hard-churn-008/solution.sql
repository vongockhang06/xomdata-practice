-- Xom Data · Sổ kế toán tăng trưởng tệp khách
-- Problem: https://xomdata.com/practice/hard-churn-008
-- Solved: 2026-09-18

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month ,
        substring(min(order_date) over(PARTITION BY customer_id),1,7) as first_month,
        substring(lag(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id),1,7) as prev_order,
        substring(lead(order_date) over(PARTITION BY customer_id ORDER BY order_date,order_id),1,7) as next_order,
        substring(date(order_date,'+1 month'),1,7) as next_month
    from orders
)
, cte2 as(
    select
        *,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)-cast(substring(prev_order,1,4) as integer)*12-cast(substring(prev_order,6,2) as integer) as month_diff
    from cte
)
, cte3 as(
    select
        month,
        count(DISTINCT case when month=first_month then customer_id end) as new_customers,
        count(DISTINCT CASE WHEN month_diff!=1 then customer_id end) as resurrected
    from cte2 GROUP BY month
)
, find_churn as(
select 
    c.next_month as month,
    count(DISTINCT case when next_month!=next_order or next_order is null then customer_id end) as churned
from cte c join cte3 c3 on c.next_month=c3.month GROUP BY c.next_month
)
, cte4 as(
    select
        c3.*,
        COALESCE(churned,0) as churned,
        new_customers+resurrected-COALESCE(churned,0) as net_change
    from cte3 c3 left join find_churn fc on c3.month=fc.month
)
SELECT * from cte4 ORDER BY month
