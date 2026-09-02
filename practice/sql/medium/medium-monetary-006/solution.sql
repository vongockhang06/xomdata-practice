-- Xom Data · Sức chi mỗi tháng hoạt động
-- Problem: https://xomdata.com/practice/medium-monetary-006
-- Solved: 2026-09-02

SELECT
    customer_id,
    sum(amount) as total_spent,
    count(DISTINCT substring(order_date,1,7)) as active_months,
    round(sum(amount)*1.0/count(DISTINCT substring(order_date,1,7)),2) as spend_per_month
from orders
GROUP BY customer_id
ORDER BY spend_per_month desc, customer_id
