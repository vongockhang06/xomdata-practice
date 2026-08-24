-- Xom Data · Investor trade summary
-- Problem: https://xomdata.com/practice/medium-agg-137
-- Solved: 2026-08-24

-- Summarize buy/sell totals per investor
WITH cte AS(
SELECT
    full_name,
    segment,
    COUNT(*) AS total_trades,
    SUM(CASE WHEN side='buy' THEN amount ELSE 0 END) AS total_bought,
    SUM(CASE WHEN side='sell' THEN amount ELSE 0 END) AS total_sold,
    SUM(CASE WHEN side='buy' THEN amount ELSE -amount END) AS net_position
FROM investors i 
JOIN trades t ON i.id=t.investor_id
GROUP BY full_name,segment
)
SELECT
  *,
  CASE WHEN net_position>0 THEN 'Bull'
  WHEN net_position=0 THEN 'Neutral'
  ELSE 'Bear' END AS stance,
  DENSE_RANK() OVER(PARTITION BY segment ORDER BY total_bought+total_sold DESC) AS rank_in_segment
FROM cte 
ORDER BY total_bought+total_sold DESC , full_name
