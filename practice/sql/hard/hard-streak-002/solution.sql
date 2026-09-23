-- Xom Data · Ai đang giữ phong độ đến tận hôm nay
-- Problem: https://xomdata.com/practice/hard-streak-002
-- Solved: 2026-09-23

with cte as(
    select
        customer_id
    from orders
    where substring(order_date,1,7)='2024-06'
)
, cte1 as(
    select
        customer_id,
        substring(order_date,1,7) as month
    from orders 
    GROUP BY customer_id,  substring(order_date,1,7)
)
, cte2 as(
    select
        o.customer_id,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)- ROW_NUMBER() over(PARTITION BY o.customer_id ORDER BY month) as grpid,
        month
    from cte1 o join cte c on o.customer_id=c.customer_id
)
, cte3 as(
select
    customer_id,
    grpid,
    max(month) over(PARTITION BY customer_id,grpid) as point
from cte2
)
, cte4 as(
    select
        customer_id,
        count(*) as streak
    from cte3 
    where point='2024-06'
    GROUP BY customer_id,grpid
)
select
    customer_id,
    max(streak) as current_streak
from cte4 GROUP BY customer_id ORDER BY current_streak desc,customer_id
