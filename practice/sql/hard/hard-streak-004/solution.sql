-- Xom Data · Kỷ lục gia chuyên cần của cửa hàng
-- Problem: https://xomdata.com/practice/hard-streak-004
-- Solved: 2026-09-09

with cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        ROW_NUMBER() over(PARTITION BY customer_id ORDER BY substring(order_date,1,7), order_id) as seq
    from orders
    GROUP BY customer_id, substring(order_date,1,7)
)
, cte2 as(
    select
        customer_id,
        month,
        cast(substring(month,1,4) as integer)*12+cast(substring(month,6,2) as integer) - seq as grpid
    from cte   
)
select
    customer_id,
    count(*) as record_streak,
    min(month) as streak_start,
    max(month) as streak_end
from cte2
GROUP BY customer_id, grpid
ORDER BY record_streak desc,customer_id
limit 1
