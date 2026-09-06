-- Xom Data · Cumulative revenue from successful transactions only
-- Problem: https://xomdata.com/practice/hard-conditional-001
-- Solved: 2026-09-06

SELECT
    date,
    status,
    amount,
    COALESCE(sum(case when status='success' then amount else 0 end) over(ORDER BY date,status,id rows between unbounded preceding and current row),0) as running_success_total
from transactions
