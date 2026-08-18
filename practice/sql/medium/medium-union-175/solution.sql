-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-08-18

WITH raw_data AS (
    SELECT 'Complaint' AS type, COUNT(*) AS quantity 
    FROM complaints WHERE status = 'Pending'
    UNION ALL
    SELECT 'Cancelled Order' AS type, COUNT(*) AS quantity 
    FROM orders WHERE status = 'Cancelled'
    UNION ALL
    SELECT 'Out of Stock Product' AS type, COUNT(*) AS quantity 
    FROM products WHERE status = 'Out of Stock'
),
metrics AS (
    SELECT 
        type,
        quantity,
        -- Tính % trước khi làm tròn để tránh mất mát độ chính xác khi tính cộng dồn
        quantity::NUMERIC / NULLIF(SUM(quantity) OVER (), 0) * 100 AS raw_pct,
        -- Xếp hạng theo số lượng giảm dần (bằng nhau cùng hạng, hạng sau bỏ trống -> RANK())
        RANK() OVER (ORDER BY quantity DESC) AS rank_pos
    FROM raw_data
)
SELECT 
    type,
    quantity,
    ROUND(raw_pct, 2) AS pct_of_total,
    rank_pos,
    -- Cộng dồn phần trăm chưa làm tròn, sau đó làm tròn kết quả ở bước cuối
    ROUND(
        SUM(raw_pct) OVER (
            ORDER BY rank_pos ASC, type ASC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS cumulative_pct
FROM metrics
ORDER BY rank_pos ASC, type ASC;
