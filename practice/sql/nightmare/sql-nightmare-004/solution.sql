-- Xom Data · Frequently co-purchased product pairs
-- Problem: https://xomdata.com/practice/sql-nightmare-004
-- Solved: 2026-08-23

SELECT
    o1.product_id AS product_a,
    o2.product_id AS product_b,
    COUNT(*) AS co_buyers
FROM orders o1
JOIN orders o2 ON o1.order_id=o2.order_id AND o1.product_id<o2.product_id
GROUP BY o1.product_id, o2.product_id
ORDER BY co_buyers DESC, product_a,product_b
