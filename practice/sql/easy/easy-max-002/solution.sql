-- Xom Data · Peak-hour electricity record
-- Problem: https://xomdata.com/practice/easy-max-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    MAX(kwh) as peak_load
FROM power_readings
WHERE period='Peak'
