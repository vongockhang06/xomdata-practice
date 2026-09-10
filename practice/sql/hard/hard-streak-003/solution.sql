-- Xom Data · Chuỗi tuần ghé đều không nghỉ
-- Problem: https://xomdata.com/practice/hard-streak-003
-- Solved: 2026-09-10

with labeling_week as(
    select
        customer_id,
        cast((julianday(order_date)-julianday('2024-01-01')) as  integer)/7+1 as week
    from orders
)
, label_id as(
    select
        customer_id,
        week,
        week-ROW_NUMBER() over(PARTITION BY customer_id ORDER BY week) as grp_id
    from labeling_week
    GROUP BY customer_id,week
)
, label_rank as(
select 
    customer_id,
    count(*) as streak,
    DENSE_RANK() over(PARTITION BY customer_id ORDER BY count(*) desc) as ranking
from label_id
GROUP BY customer_id,grp_id
)
select
    customer_id,
    streak as longest_week_streak
from label_rank where ranking=1
ORDER BY longest_week_streak desc,customer_id
