-- Xom Data · Sales division employees
-- Problem: https://xomdata.com/practice/easy-like-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    employee_code,
    full_name
FROM employees  
WHERE SUBSTRING(employee_code,1,4)='SAL-'
