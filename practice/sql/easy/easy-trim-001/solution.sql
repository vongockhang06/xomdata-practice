-- Xom Data · Cleaning whitespace in the lead list
-- Problem: https://xomdata.com/practice/easy-trim-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    full_name,
    TRIM(full_name) as clean_name,
    phone
from leads
