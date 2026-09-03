-- Xom Data · Chốt được đơn thứ hai trong một tháng
-- Problem: https://xomdata.com/practice/medium-repeat-004
-- Solved: 2026-09-03

with cte as(
    select
        customer_id,
        order_date,
        ROW_NUMBER() over(PARTITION BY customer_id ORDER BY order_date,order_id) as ranking
    from orders
)
, cte2 as(
    select
        customer_id,
        case when ranking=1 then order_date end as first_order_date,
        lead(order_date) over(PARTITION BY customer_id ORDER BY ranking) as second_order_date
    from cte
    where ranking<=2
)
, cte3 as(
    SELECT
        *,
        julianday(second_order_date)-julianday(first_order_date) as days_to_second
    from cte2 
)
SELECT
    *
from cte3 where days_to_second<=30
