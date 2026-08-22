-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    p.product_name,
    s.quantity,
    s.quantity*p.price AS line_total
FROM products p
JOIN sale_items s
ON p.id=s.product_id
