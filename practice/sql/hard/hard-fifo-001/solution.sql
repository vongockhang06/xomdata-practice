-- Xom Data · Running inventory balance over time
-- Problem: https://xomdata.com/practice/hard-fifo-001
-- Solved: 2026-09-07

select
    sku,
    occurred_at,
    type,
    quantity,
    sum(case when type='IN' then quantity else -quantity end) over(PARTITION BY sku ORDER BY occurred_at,id) as running_balance
from inventory_movements
order by sku,occurred_at,id
