-- Xom Data · Accounts still missing a tax code
-- Problem: https://xomdata.com/practice/easy-count-011
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    COUNT(CASE WHEN tax_code IS NULL THEN 1 END ) AS missing_tax_code
FROM accounts
