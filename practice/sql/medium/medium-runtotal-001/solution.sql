-- Xom Data · Class fund running total by day
-- Problem: https://xomdata.com/practice/medium-runtotal-001
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
SELECT
    collect_date,
    amount,
    sum(amount) over(ORDER BY collect_date rows between unbounded preceding and current row) as running_total
from fund_log
