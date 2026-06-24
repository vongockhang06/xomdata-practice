-- Xom Data · Top 10 highest-profit dishes
-- Problem: https://xomdata.com/practice/medium-agg-147
-- Solved: 2026-06-24

-- Viết SQL của bạn ở đây
WITH completed_order AS(
    SELECT
        id
    FROM orders
    WHERE status ='Completed'
),
food AS(
    SELECT
        dish_id,
        SUM(quantity*unit_price) AS revenue,
        SUM(quantity) AS total_sold
    FROM completed_order co
    JOIN order_items oi 
    ON co.id=oi.order_id
    GROUP BY dish_id
 ),
 sta AS (
    SELECT
        f.dish_id,
        f.revenue,
        f.total_sold,
        f.revenue - f.total_sold*d.cost_price AS profit,
        d.category_id,
        ROUND((f.revenue - f.total_sold*d.cost_price)*1.0/revenue*100,2) AS margin_pct,
        d.dish_name
    FROM food f JOIN dishes d ON f.dish_id=d.id
 )
 SELECT
    s.dish_name,
    c.category_name,
    s.total_sold,
    s.revenue,
    s.profit,
    s.margin_pct,
    RANK() OVER(ORDER BY  s.profit DESC) AS rank_by_profit,
    RANK() OVER(ORDER BY margin_pct DESC) AS rank_by_margin
 FROM sta s
 JOIN categories c ON s.category_id=c.id
 ORDER BY s.profit DESC, s.dish_name
 LIMIT 10
