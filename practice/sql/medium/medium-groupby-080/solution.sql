-- Xom Data · Monthly income and expense report
-- Problem: https://xomdata.com/practice/medium-groupby-080
-- Solved: 2026-08-20

WITH transactions_temp AS(
    SELECT
      SUBSTRING(transaction_date,1,7) AS month,
      type,
      amount,
      description
    FROM transactions
)
,cte2 AS(
SELECT
  month,
  SUM(CASE WHEN type='Thu' THEN amount ELSE 0 END) AS total_income,
  SUM(CASE WHEN type='Chi' THEN amount ELSE 0 END) AS total_expense,
  SUM(CASE WHEN type='Thu' THEN amount ELSE -amount END) AS balance
FROM transactions_temp
GROUP BY month
)
SELECT
  *,
  SUM(balance) OVER(ORDER BY month) AS cumulative_balance,
  CASE WHEN balance>0 THEN 'Surplus'
  WHEN  balance<0 THEN 'Deficit'
  ELSE 'Balanced' END AS status
FROM cte2
