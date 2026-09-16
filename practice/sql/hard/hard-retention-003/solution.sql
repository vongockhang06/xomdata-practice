-- Xom Data · Còn quay lại trong tuần kế tiếp không
-- Problem: https://xomdata.com/practice/hard-retention-003
-- Solved: 2026-09-16

with cte as(
    select
        customer_id,
        cast((julianday(order_date)-julianday('2024-01-01'))/7 +1 as integer) as week
    from orders
)
, cte2 as(
    select
        customer_id,
        min(week) as cohort_week
    from cte
    GROUP BY customer_id
)
, cte3 as(
    select
        c2.cohort_week,
        count(*) as retained_next_week
    from cte2 c2 join cte c on c2.customer_id=c.customer_id and c.week-c2.cohort_week=1
    GROUP BY c2.cohort_week
)
select
    c2.cohort_week,
    cohort_size,
    COALESCE(retained_next_week,0) as retained_next_week
from cte3 c3 right join (select cohort_week, count(DISTINCT customer_id) as cohort_size from cte2 GROUP BY cohort_week) c2 on c3.cohort_week=c2.cohort_week
ORDER BY c2.cohort_week
