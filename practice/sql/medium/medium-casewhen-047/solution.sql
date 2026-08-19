-- Xom Data · Portfolio profit/loss
-- Problem: https://xomdata.com/practice/medium-casewhen-047
-- Solved: 2026-08-19

WITH cte AS(
    SELECT
        s.stock_code,
        c.stock_quantity,
        c.avg_cost_price,
        s.current_price,
        ROUND((s.current_price-c.avg_cost_price)*c.stock_quantity) AS profit_loss,
        ROUND((s.current_price-c.avg_cost_price)/c.avg_cost_price*100,2) AS profit_pct
    FROM stocks s JOIN categories c ON s.id=c.stock_id
)
SELECT
    *,
    CASE WHEN profit_pct >10 THEN 'Strong Gain'
    WHEN profit_pct >0 THEN 'Mild Gain'
    WHEN profit_pct =0 THEN 'Break Even'
    WHEN profit_pct >-10 THEN   'Mild Loss'
    ELSE 'Strong Loss' END AS status,
    RANK() OVER(ORDER BY profit_pct DESC) AS rank_by_pct,
    SUM(avg_cost_price*stock_quantity) OVER(ORDER BY profit_pct DESC , stock_code) AS cumulative_invested
FROM cte 
ORDER BY rank_by_pct , stock_code
