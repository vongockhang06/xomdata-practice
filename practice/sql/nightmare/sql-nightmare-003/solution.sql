-- Xom Data · 3-month consecutive disbursement rate by department
-- Problem: https://xomdata.com/practice/sql-nightmare-003
-- Solved: 2026-08-23

WITH cte AS(
SELECT
    dept,
    month,
    budget,
    LAG(budget,1,0) OVER(PARTITION BY dept ORDER BY month) AS b_prev_month,
    LAG(budget,2,0) OVER(PARTITION BY dept ORDER BY month) AS b_2prev_month,
    LAG(actual,1,0) OVER(PARTITION BY dept ORDER BY month) AS a_prev_month,
    LAG(actual,2,0) OVER(PARTITION BY dept ORDER BY month) AS a_2prev_month,
    actual
FROM budgets
)
SELECT
    dept,
    month,
    budget + b_prev_month+b_2prev_month AS roll3_budget,
    actual + a_prev_month+a_2prev_month AS roll3_actual,
    ROUND((actual + a_prev_month+a_2prev_month)*1.0/(budget + b_prev_month+b_2prev_month)*100.0,2)  AS utilization_pct
FROM cte
ORDER BY dept,month
