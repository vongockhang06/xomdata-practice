-- Xom Data · Chuỗi tháng ghé đều dài nhất
-- Problem: https://xomdata.com/practice/hard-streak-001
-- Solved: 2026-09-10

with formatting as(
    select
        customer_id,
        substring(order_date,1,7) as month
    from orders
    GROUP BY customer_id,substring(order_date,1,7)
)
, cte as(
    select
        customer_id,
        month,
        ROW_NUMBER() over(PARTITION BY customer_id ORDER BY month) as seq
    from formatting
)
, cte2 as(
    select
        customer_id,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer)
        -seq as group_id
    from cte
)
, cte3 as(
select
    customer_id,
    count(*) as streak
from cte2 GROUP BY customer_id,group_id
)
select
    customer_id,
    max(streak) as longest_streak
from cte3 
GROUP BY customer_id
ORDER BY longest_streak desc, customer_id
