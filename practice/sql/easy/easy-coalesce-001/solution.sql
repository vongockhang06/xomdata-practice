-- Xom Data · Display names on profile pages
-- Problem: https://xomdata.com/practice/easy-coalesce-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    real_name,
    nickname,
    CASE WHEN nickname IS NULL THEN real_name
    ELSE nickname END AS display_name
FROM profiles
