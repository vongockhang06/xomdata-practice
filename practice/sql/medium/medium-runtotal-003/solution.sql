-- Xom Data · Balance after each transaction
-- Problem: https://xomdata.com/practice/medium-runtotal-003
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
select
    txn_date,
    amount,
    sum(amount) over(ORDER BY txn_date rows between unbounded preceding and current row) as balance
from transactions
