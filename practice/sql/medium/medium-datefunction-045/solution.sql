-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-08-19

WITH stg AS(
    SELECT
        id,
        SUBSTRING(transaction_date,1,7) AS month,
        amount
    FROM transactions
)  
SELECT  
    month,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY month) as mom_delta
FROM stg
GROUP BY month
ORDER BY month
