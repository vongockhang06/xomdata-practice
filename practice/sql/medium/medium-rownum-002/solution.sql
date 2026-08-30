-- Xom Data · Intake sequence per warehouse
-- Problem: https://xomdata.com/practice/medium-rownum-002
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
select
    warehouse,
    ROW_NUMBER() over(PARTITION BY warehouse ORDER BY entry_date,product) as entry_no,
    product,
    entry_date
from stock_entries
ORDER BY warehouse,entry_no
