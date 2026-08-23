-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-08-23

SELECT
    full_name,
    username,
    account_type,
    ROW_NUMBER() OVER(ORDER BY created_at, full_name) AS signup_order,
    NTILE(4) OVER(ORDER BY created_at) AS tenure_quartile
FROM users
WHERE id NOT IN (SELECT user_id FROM posts)
ORDER BY created_at
