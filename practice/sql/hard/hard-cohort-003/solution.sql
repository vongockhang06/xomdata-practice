-- Xom Data · Người mới và người quen mỗi tháng
-- Problem: https://xomdata.com/practice/hard-cohort-003
-- Solved: 2026-08-31

WITH cte as(
    select
        customer_id,
        substring(order_date,1,7) as month,
        min(substring(order_date,1,7)) over(PARTITION BY customer_id) as first_month
    from orders
)
, no_new_cust as(
    select
        first_month as month,
        count(DISTINCT customer_id) as new_customers
    from cte
    GROUP BY first_month
)
, no_return_cust as(
    select
        month,
        COUNT(DISTINCT CASE WHEN
        ((CAST(SUBSTR(month, 1, 4) AS INT) - CAST(SUBSTR(first_month, 1, 4) AS INT)) * 12 
        + (CAST(SUBSTR(month, 6, 2) AS INT) - CAST(SUBSTR(first_month, 6, 2) AS INT)))>0 THEN customer_id END) AS returning_customers
    from cte
    GROUP BY month
)
select
    COALESCE(n.month,r.month) as month,
    COALESCE(new_customers,0) as new_customers,
    COALESCE(returning_customers,0) as returning_customers
from no_new_cust n
FULL join no_return_cust r on n.month=r.month
ORDER BY COALESCE(n.month,r.month)
