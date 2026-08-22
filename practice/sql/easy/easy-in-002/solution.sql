-- Xom Data · Dishes off this season's menu
-- Problem: https://xomdata.com/practice/easy-in-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    dish_name,
    category
FROM dishes
WHERE category NOT IN ('Grill','Hotpot')
