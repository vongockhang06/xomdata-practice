-- Xom Data · Each customer's cumulative spending
-- Problem: https://xomdata.com/practice/medium-runtotal-002
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
select
    customer_name,
    month,
    spend,
    sum(spend) over(PARTITION BY customer_name ORDER BY month rows between unbounded preceding and current row) as cumulative_spend
from wallet_monthly
