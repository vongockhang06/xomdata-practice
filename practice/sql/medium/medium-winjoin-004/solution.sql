-- Xom Data · The same customer's previous order
-- Problem: https://xomdata.com/practice/medium-winjoin-004
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
SELECT
    member_name,
    purchase_date,
    amount,
    lag(amount) over(PARTITION BY member_name ORDER BY purchase_date) as prev_amount
from purchases p
join members m on p.member_id=m.id
ORDER BY member_name,purchase_date
